Return-Path: <openembedded-devel@urbanec.net>
X-Greylist: delayed 589 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 01 Oct 2014 04:00:02 UTC
Received: from mail12.tpgi.com.au (smtp-out12.tpgi.com.au [220.244.226.122])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7786FD16
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Oct 2014 04:00:02 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Wed, 1 Oct 2014 13:37:30 +1000
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail12.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id s913bR19006435
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 1 Oct 2014 13:37:30 +1000
Received: from beep.urbanec.net ([192.168.42.2])
	by gw.urbanec.net with esmtpsa (TLS1.2:DHE_RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80.1) (envelope-from <openembedded-devel@urbanec.net>)
	id 1XZAjF-0008Up-Vk for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2014 13:37:26 +1000
Message-ID: <542B76F5.80100@urbanec.net>
Date: Wed, 01 Oct 2014 13:37:25 +1000
From: Peter Urbanec <openembedded-devel@urbanec.net>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: mozjs fails with autoconf related QA errors
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
X-List-Received-Date: Wed, 01 Oct 2014 04:00:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This one has me stumped, I wonder if anyone can figure it out and even 
better, explain how to go about tracking down the source of the problem.

I can see that it boils down to gcc being given |"-L/usr/lib|" , but I 
can't figure out how it gets there.

$ bitbake -b mozjs_17 -c configure

results in:

ERROR: This autoconf log indicates errors, it looked at host include 
and/or library paths while determining system capabilities.
Rerun configure task after fixing this. The path was 
'/T3/builds/beyonwiz/inihdx/tmp-glibc/work/mips32el-oe-linux/mozjs/mozjs-17.0.0-r0/build'
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in: 
/T3/builds/beyonwiz/inihdx/tmp-glibc/work/mips32el-oe-linux/mozjs/mozjs-17.0.0-r0/temp/log.do_configure.9412
ERROR: Task 3 
(/T3/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_17.0.0.bb, 
do_configure) failed with exit code '1'


I am using meta-oe master:e997f028f7076fbac9c741ec77bfda0b65257d10

Digging through the logs, this seems like the most likely cause
(found in 
tmp-glibc/work/mips32el-oe-linux/mozjs/mozjs-17.0.0-r0/build/config.log)

configure:5494: checking for IceConnectionNumber in -lICE
configure:5513: mipsel-oe-linux-gcc -mel -mabi=32 -mhard-float 
-march=mips32 
--sysroot=/T3/builds/beyonwiz/inihdx/tmp-glibc/sysroots/inihdx -o 
conftest -Os -pipe -g -feliminate-unused-debug-types -Wl,-O1 
-Wl,--as-needed -L/usr/lib conftest.c -lICE 1>&5
/T3/builds/beyonwiz/inihdx/tmp-glibc/sysroots/i686-linux/usr/libexec/mipsel-oe-linux/gcc/mipsel-oe-linux/4.9.1/ld: 
warning: library search path "/usr/lib" is unsafe for cross-compilation
/T3/builds/beyonwiz/inihdx/tmp-glibc/sysroots/i686-linux/usr/libexec/mipsel-oe-linux/gcc/mipsel-oe-linux/4.9.1/ld: 
skipping incompatible /usr/lib/libICE.so when searching for -lICE
/T3/builds/beyonwiz/inihdx/tmp-glibc/sysroots/i686-linux/usr/libexec/mipsel-oe-linux/gcc/mipsel-oe-linux/4.9.1/ld: 
skipping incompatible /usr/lib/libc.so when searching for -lc
/T3/builds/beyonwiz/inihdx/tmp-glibc/sysroots/i686-linux/usr/libexec/mipsel-oe-linux/gcc/mipsel-oe-linux/4.9.1/ld: 
skipping incompatible /usr/lib/libc.a when searching for -lc


Help with this would be very much appreciated.

Best regards,

     Peter Urbanec


