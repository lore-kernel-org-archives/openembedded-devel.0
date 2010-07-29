Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rtovo.dsp@gmail.com>) id 1OeZcH-0002tV-Q9
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 22:22:16 +0200
Received: by wyb38 with SMTP id 38so539628wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 13:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=PNg47tu9bHzM+3Ml+AtR+e6T48SgFJ/orFV5H6p1rVY=;
	b=lANokDRuItfMcmpVK3DXk7YAOSdvzjedQ7k2EevaahG0FPpZ6otnN+X/lWusH2nuhK
	OI5I8CypC4Fzg2ZqXxzUi5jj0LOWSfwkgb2zyIKutbDasnipR4cDIW3CmKdI7XkuFrUU
	CnpHEVyDJu+P73RVJUSlUd8du10yNJsb5RaJU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=tCjGMv+r3AZMMIoZeDyMEy2/tIMeHLp3cbuiDBmhOtE3TvcUjtBrXm4aSkwYVm3+hU
	O4GwhA9C90c6X7Ycd7yNBEDdWNeoxGX3IPYkUTyoZb4BzXn/MsJ6cnDaZkRd21XSD/Z1
	3FzBWxeL18CkOrffgh95H05f8vg5JAoGnkUHY=
MIME-Version: 1.0
Received: by 10.227.148.18 with SMTP id n18mr614648wbv.207.1280434908703; Thu, 
	29 Jul 2010 13:21:48 -0700 (PDT)
Received: by 10.216.69.65 with HTTP; Thu, 29 Jul 2010 13:21:48 -0700 (PDT)
Date: Thu, 29 Jul 2010 17:21:48 -0300
Message-ID: <AANLkTimjMO8TfDDyJGA4+pKToawicMe6hyXEjYVEEFsH@mail.gmail.com>
From: RTovo DSP <rtovo.dsp@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: rtovo.dsp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake error when do_compile alsa_utils_1.0.20.bb
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
X-List-Received-Date: Thu, 29 Jul 2010 20:22:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to build angstrom for mx31ads but it fails when trying to build
alsamixer by not finding libtinfo:

| make[1]: Entering directory `/home/robson/work/
freescale.net/oe/stuff/tmp/work/armv6-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/alsamixer
'
| arm-angstrom-linux-gnueabi-gcc -march=armv6j -mtune=arm1136jf-s -mfpu=vfp
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -DHAVE_CONFIG_H -I.
-I../include   -isystem/home/robson/work/
freescale.net/oe/stuff/tmp/sysroots/armv6-angstrom-linux-gnueabi/usr/include-DCURSESINC="<ncurses.h>"
-isystem/home/robson/work/
freescale.net/oe/stuff/tmp/sysroots/armv6-angstrom-linux-gnueabi/usr/include-fexpensive-optimizations
-frename-registers -fomit-frame-pointer -O2 -ggdb3
-MT alsamixer.o -MD -MP -MF .deps/alsamixer.Tpo -c -o alsamixer.o
alsamixer.c
| mv -f .deps/alsamixer.Tpo .deps/alsamixer.Po
| arm-angstrom-linux-gnueabi-gcc -march=armv6j -mtune=arm1136jf-s -mfpu=vfp
-mfloat-abi=softfp -mthumb-interwork -mno-thumb -DCURSESINC="<ncurses.h>"
-isystem/home/robson/work/
freescale.net/oe/stuff/tmp/sysroots/armv6-angstrom-linux-gnueabi/usr/include-fexpensive-optimizations
-frename-registers -fomit-frame-pointer -O2
-ggdb3  -L/home/robson/work/
freescale.net/oe/stuff/tmp/sysroots/armv6-angstrom-linux-gnueabi/usr/lib-Wl,-rpath-link,/home/robson/work/
freescale.net/oe/stuff/tmp/sysroots/armv6-angstrom-linux-gnueabi/usr/lib-Wl,-O1
-Wl,--hash-style=gnu -o alsamixer alsamixer.o -lncurses -ltinfo
-lasound -lm -ldl -lpthread
| /home/robson/work/
freescale.net/oe/stuff/tmp/sysroots/i686-linux/usr/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld:
cannot find -ltinfo
| collect2: ld returned 1 exit status
| make[1]: *** [alsamixer] Error 1
| make[1]: Leaving directory `/home/robson/work/
freescale.net/oe/stuff/tmp/work/armv6-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/alsa-utils-1.0.20/alsamixer
'
| make: *** [all-recursive] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed: /home/robson/work/
freescale.net/oe/stuff/tmp/work/armv6-angstrom-linux-gnueabi/alsa-utils-1.0.20-r2/temp/log.do_compile.21326
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/robson/work/
freescale.net/oe/stuff/openembedded/recipes/alsa/alsa-utils_1.0.20.bbdo_compile
failed
ERROR: Task 483 (/home/robson/work/
freescale.net/oe/stuff/openembedded/recipes/alsa/alsa-utils_1.0.20.bb,
do_compile) failed
NOTE: Waiting for 1 active tasks to finish
NOTE: 1: /home/robson/work/
freescale.net/oe/stuff/openembedded/recipes/dropbear/dropbear_0.51.bb,
do_compile (21319)
NOTE: Tasks Summary: Attempted 2466 tasks of which 919 didn't need to be
rerun and 1 failed.
ERROR: '/home/robson/work/
freescale.net/oe/stuff/openembedded/recipes/alsa/alsa-utils_1.0.20.bb'
failed


(and yes, I have the latest git pull)

