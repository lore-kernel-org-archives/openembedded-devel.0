Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1Ltpbo-0007bN-1K
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 22:52:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id 0A1905010902
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 17:56:06 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n9-FldugTiFu
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 17:56:01 -0300 (BRT)
Received: from [192.168.15.105] (unknown [189.102.204.146])
	by mail.2mi.com.br (Postfix) with ESMTP id 0063150277F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 17:56:00 -0300 (BRT)
Message-ID: <49E4F683.6090706@2mi.com.br>
Date: Tue, 14 Apr 2009 17:48:03 -0300
From: "Jader H. Silva" <jader@2mi.com.br>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1237835454.6521.9.camel@northpole>
	<grg0jf$sem$1@ger.gmane.org>	<49DB935B.3000907@2mi.com.br>	<20090407183328.GH2195@smtp.west.cox.net>	<49DBA326.4060401@2mi.com.br>	<20090407195639.GI2195@smtp.west.cox.net>	<49DBC0A7.7040406@2mi.com.br>
	<20090407213020.GJ2195@smtp.west.cox.net>
In-Reply-To: <20090407213020.GJ2195@smtp.west.cox.net>
X-SA-Exim-Connect-IP: 208.51.207.131
X-SA-Exim-Mail-From: jader@2mi.com.br
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: libxml2-native build against host zlib.h
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 14 Apr 2009 20:52:01 -0000
Content-Type: multipart/mixed; boundary="------------010905080805080606080600"

--------------010905080805080606080600
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Tom Rini escreveu:
> On Tue, Apr 07, 2009 at 06:07:51PM -0300, Jader H. Silva wrote:
> [snip]
>   
>> I'm using ubuntu 8.04, zlib1g-dev package is installed.
>> I can compile it without problems in a machine where zlib1g-dev is not  
>> installed.
>>
>> Attached there's the log.do_compile and config.log.nok originated from a  
>> failed compilation and config.log from a successful compilation after my  
>> patch was applied.
>>     
>
> On the failing machine can you either do CCACHE="" or ccache -C to dump
> the cache and try again?
>
>   
Alright, nothing worked (setting --with-zlib=${STAGING_INCDIR} included) 
so I decided to look deeper and found out that problem is caused by 
BUILD_CPPFLAGS in GCC's preprocessing stage of xmlIO.c.

BUILD_CPPFLAGS use "-isystem" to include ${STAGING_INCDIR}.

openembedded/conf/bitbake.conf:429:export BUILD_CPPFLAGS = 
"-isystem${STAGING_INCDIR_NATIVE}"

Both CFLAGS and CPPFLAGS use BUILD_CPPFLAGS:

CFLAGS=-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include 
-O2
CPPFLAGS=-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include 
-O2 -fpermissive

When building xmlIO.o, the preprocessor is called as follow:

 /usr/lib/gcc/i486-linux-gnu/4.2.4/cc1 -E -quiet -v -I. -I./include 
-I./include -MD xmlIO.d -MF .deps/xmlIO.Tpo -MP -MT xmlIO.lo -H -isystem 
/usr/include -DHAVE_CONFIG_H -D_REENTRANT -DPIC 
-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include 
-isystem/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include 
xmlIO.c -mtune=generic -pedantic -W -Wunused -Wimplicit -Wreturn-type 
-Wswitch -Wcomment -Wtrigraphs -Wformat -Wchar-subscripts 
-Wuninitialized -Wparentheses -Wshadow -Wpointer-arith -Wcast-align 
-Wwrite-strings -Waggregate-return -Wstrict-prototypes 
-Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls -fPIC -O2

As you can see, gcc includes the standard host include directory 
"-isystem /usr/include" in the command line.

All "-isystem" directories are searched after "-I" directories but, as 
stated in GCC's manual, if a directory is referenced both with "-I" and 
"-isystem", gcc will use only "-isystem".

If I compile with --with-zlib=${STAGING_INCDIR}, there will be an 
additional flag: "-I ${STAGING_INCDIR}"  and the preprocessor will mark 
this include dir as a duplicated of "-isystem ${STAGING_INCDIR}" and 
ignore it. If I do not include it, it simply won't be ignored

ignoring duplicate directory 
"/home/jader/thinstation/build/tmp/staging/i686-linux/usr/include" <-- 
this ${is STAGING_INCDIR}
ignoring nonexistent directory "/usr/local/include/i486-linux-gnu"
ignoring nonexistent directory 
"/usr/lib/gcc/i486-linux-gnu/4.2.4/../../../../i486-linux-gnu/include"
ignoring nonexistent directory "/usr/include/i486-linux-gnu"
ignoring duplicate directory "/usr/include"
ignoring duplicate directory "./include"
#include "..." search starts here:
#include <...> search starts here:
 .
 ./include
 /usr/include
 /home/jader/thinstation/build/tmp/staging/i686-linux/usr/include
 /usr/local/include
 /usr/lib/gcc/i486-linux-gnu/4.2.4/include

As "-isystem /usr/include" is the first "-isystem" flag, it will be 
looked up first and if you have zlib.h there, then your libxml2-native 
will be compile against it. I don't know if this is a GCC's version 
issue tough. Here I use: gcc (GCC) 4.2.4 (Ubuntu 4.2.4-1ubuntu3)

Maybe 3.x won't insert "-isystem /usr/include" as first "-isystem" when 
preprocessing.

It's possible this problem happens with many recipes that use 
preprocessed files against headers in ${STAGING_INCDIR} and don't 
override BUILD_CPPFLAGS properly.

Setting BUILD_CPPFLAGS inside 
openembedded/recipes/libxml/libxml2-native.inc fixed it. There's a patch 
attached.

Att.

Jader H. Silva
jader@2mi.com.br
Depto. de desenvolvimento
2MI Tecnologia

--------------010905080805080606080600
Content-Type: text/x-patch;
 name="0001-Fix-libxml2-native-compilation-against-host-zlib.h.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename*0="0001-Fix-libxml2-native-compilation-against-host-zlib.h.patc";
 filename*1="h"

From 9ac98f6ab76256a469bac67ae3a64dc8b7a53b65 Mon Sep 17 00:00:00 2001
From: Jader <jader@.2mi.com.br>
Date: Tue, 14 Apr 2009 17:36:18 -0300
Subject: [PATCH] Fix libxml2-native compilation against host zlib.h

---
 recipes/libxml/libxml2-native.inc |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/libxml/libxml2-native.inc b/recipes/libxml/libxml2-native.inc
index 3f67152..74a3a78 100644
--- a/recipes/libxml/libxml2-native.inc
+++ b/recipes/libxml/libxml2-native.inc
@@ -7,6 +7,8 @@ S = "${WORKDIR}/libxml2-${PV}"
 
 inherit autotools native pkgconfig distutils-native-base
 
+BUILD_CPPFLAGS = "-I${STAGING_INCDIR}"
+
 do_configure_prepend () {
 	EXTRA_LIBXML2_OECONF="\
 	--with-python=${PYTHON_DIR} \
-- 
1.5.4.3


--------------010905080805080606080600--
