Return-Path: <mike.looijmans@topic.nl>
Received: from smtp04.mail.online.nl (smtp04.mail.online.nl [194.134.25.74])
	by mail.openembedded.org (Postfix) with ESMTP id 3795877030
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 12:39:14 +0000 (UTC)
Received: from [192.168.1.5] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp04.mail.online.nl (Postfix) with ESMTP id 02D2F2800D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  5 Sep 2015 14:39:14 +0200 (CEST)
Message-ID: <55EAE272.5010904@topic.nl>
Date: Sat, 05 Sep 2015 14:39:14 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: "krb" fails to build, suspect GCC bug
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 05 Sep 2015 12:39:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I got this weird build failure from the "krb" package:

| make[3]: Entering directory 
'/TOPDIR/build/tmp/work/mips32el-oe-linux/krb5/1.13.2-r0/krb5-1.13.2/src/lib/krb5/ccache'
| mipsel-oe-linux-gcc  -mel -mabi=32 -mhard-float -march=mips32 
--sysroot=/TOPDIR/build/tmp/sysroots/formuler1 -fPIC -DSHARED 
-DHAVE_CONFIG_H  -I../../../include -I../../../include -I./ccapi -I. -I. 
  -DKRB5_DEPRECATED=1 -DKRB5_PRIVATE  -Os -pipe -g 
-feliminate-unused-debug-types -DDESTRUCTOR_ATTR_WORKS=1 
-I/TOPDIR/build/tmp/sysroots/formuler1/usr/include/et -Wall -Wcast-align 
-Wshadow -Wmissing-prototypes -Wno-format-zero-length -Woverflow 
-Wstrict-overflow -Wmissing-format-attribute -Wmissing-prototypes 
-Wreturn-type -Wmissing-braces -Wparentheses -Wswitch -Wunused-function 
-Wunused-label -Wunused-variable -Wunused-value -Wunknown-pragmas 
-Wsign-compare -Werror=uninitialized -Werror=pointer-arith 
-Werror=declaration-after-statement 
-Werror-implicit-function-declaration -pthread -c cc_file.c -o 
cc_file.so.o && mv -f cc_file.so.o cc_file.so
| cc_file.c: In function 'fcc_next_cred':
| cc_file.c:368:9: error: 'maxsize' may be used uninitialized in this 
function [-Werror=maybe-uninitialized]
|      ret = load_data(context, id, maxsize, buf);
|          ^
| cc_file.c:1091:12: note: 'maxsize' was declared here
|      size_t maxsize;
|             ^
| cc1: some warnings being treated as errors

Looking at the source, this doesn't make any sense at all. The 
declaration of the variable isn't even in the same method body. And the 
line it complains about is about the fifth time it passes that variable 
to another method.

And working around it by initializing maxsize=0 just makes the compiler 
choke on a similar situation elsewhere:
| packet.c:50:67: error: 'id' may be used uninitialized in this function


I suspect the problem here is GCC and not the krb code. Anyone seen this?

-- 
Mike Looijmans

