Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PFXlz-0005QO-Ve
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Nov 2010 20:53:01 +0100
Received: by wwb31 with SMTP id 31so47940wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Nov 2010 11:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=SNmJAvqO+a9HAZnGLHb+yNPQwbww9R3PqVR/wYW+aK4=;
	b=m7RyqWOFl5ulAArsZqcj4rUGrxvP9BF8TM+yiXx8p7UqotXIwBEJCbmtJIjNXSQMxu
	N5GRFD0i/EHa4uXFx5jXNoorS7wAYpGQI4EXpiASX2nNDrKomUYti0dEWRpO2lUnDRdq
	xBDQtp0DZE6PXD003ywHMnSnbWmpNcDocHA2Q=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=FDyEWYVwNsyJ66DwNSAViONdI//E/MwJZmYbv2DpH+oZrO+Hdg+C/Q6MtN26uQX8C2
	hBPSy0uHKKo4AloxsiltFzEDmMzRbvCuHptky+5+6+YNbYU0Kdlav2d1Ae9662e9Yhp9
	GiMJJdxlvr+5cOFHcR6s4Xb70krabTPQhgyn4=
MIME-Version: 1.0
Received: by 10.227.154.7 with SMTP id m7mr5733755wbw.211.1289245923289; Mon,
	08 Nov 2010 11:52:03 -0800 (PST)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Mon, 8 Nov 2010 11:52:03 -0800 (PST)
Date: Mon, 8 Nov 2010 14:52:03 -0500
X-Google-Sender-Auth: AnRsRPyxD4lU8XOTdFh2TKXMz6U
Message-ID: <AANLkTinnGqbxaJrF=-6OSJ1N=FsDaAcbvDNuYV5SiA2q@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: gcc-cross-intermediate-4.5-r18.0+svnr166342 build failure after today's pull
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
X-List-Received-Date: Mon, 08 Nov 2010 19:53:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I'm seeing the following failure after updating to latest:


| make[2]: Entering directory
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc'
| # If this is the top-level multilib, build all the other
| # multilibs.
|
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi/./gcc/xgcc
-B/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi/./gcc/
-march=armv7-a -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp
-mthumb-interwork -mno-thumb
-isystem/home/PHOENIX/frey/OE/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-B/home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/armv7a/arm-angstrom-linux-gnueabi/bin/
-B/home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/armv7a/arm-angstrom-linux-gnueabi/lib/
-isystem
/home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/armv7a/arm-angstrom-linux-gnueabi/include
-isystem
/home/PHOENIX/frey/OE/build/tmp/sysroots/x86_64-linux/usr/armv7a/arm-angstrom-linux-gnueabi/sys-include
--sysroot=/home/PHOENIX/frey/OE/build/tmp/sysroots/armv7a-angstrom-linux-gnueabi
-g -Os -O2  -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE  -W -Wall
-Wwrite-strings -Wcast-qual -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition  -isystem ./include  -fPIC -Wno-missing-prototypes
-g  -DIN_LIBGCC2 -D__GCC_FLOAT_NOT_NEEDED   -I. -I. -I../.././gcc
-I/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc
-I/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc/.
-I/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc/../gcc
-I/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc/../include
-DHAVE_CC_TLS  -o _muldi3.o -MT _muldi3.o -MD -MP -MF _muldi3.dep -DL_muldi3
-c
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc/../gcc/libgcc2.c
\
|       -fvisibility=hidden -DHIDE_EXPORTS
| In file included from
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc/../gcc/libgcc2.c:29:0:
|
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/libgcc/../gcc/tsystem.h:87:19:
fatal error: stdio.h: No such file or directory
| compilation terminated.
| make[2]: *** [_muldi3.o] Error 1
| make[2]: Leaving directory
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc'
| make[1]: *** [all-target-libgcc] Error 2
| make[1]: Leaving directory
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/gcc-cross-intermediate-4.5-r18.0+svnr166342/gcc-4.5/build.x86_64-linux.arm-angstrom-linux-gnueabi'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package gcc-cross-intermediate-4.5-r18.0+svnr166342: task do_compile:
Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/PHOENIX/frey/OE/openembedded/recipes/gcc/
gcc-cross-intermediate_4.5.bb do_compile failed
ERROR: Task 659 (/home/PHOENIX/frey/OE/openembedded/recipes/gcc/
gcc-cross-intermediate_4.5.bb, do_compile) failed with 256
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gcc/
gcc-cross-intermediate_4.5.bb' failed
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gcc/
gcc-cross-intermediate_4.5.bb' failed


Build host: Ubuntu 8.04
DISTRO = "angstrom-2010.x"
MACHINE = "omapzoom2"

Any ideas?  Any more information that would be helpful to collect?


Thanks,
Zach Frey

