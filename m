Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <trevorhickey3@gmail.com>) id 1RlQE8-0000Dj-GW
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Jan 2012 20:22:20 +0100
Received: by qcol42 with SMTP id l42so399018qco.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2012 11:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=OTFFqJ8AEGKFJiCQ7ErCjrIPZi6ip10w3E+icQBYciU=;
	b=HmWfnGpEUWjkz3W3VE+KCzj8kG9ycZ3BEIcZOEwOo2/6mSPXAxLA8B8WjaTGbwZ0ED
	H/2tjJDXPJS0ZRzENfsYK7cZpS2LEfaGmVUWPqCBdKAwRMjnOBLE3M0u3twz/Yx0tuiO
	JKdHdITk+E6ljwptSEhNM5nyWV/5kZo5RNUJs=
MIME-Version: 1.0
Received: by 10.224.183.81 with SMTP id cf17mr7497601qab.48.1326395688899;
	Thu, 12 Jan 2012 11:14:48 -0800 (PST)
Received: by 10.229.87.19 with HTTP; Thu, 12 Jan 2012 11:14:48 -0800 (PST)
Date: Thu, 12 Jan 2012 14:14:48 -0500
Message-ID: <CAHPA9DpV__ak869U+fDBh_eFnooTLZpxVKv3FOtG1aEKtHT-Hg@mail.gmail.com>
From: Trevor Hickey <trevorhickey3@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: meta-toolchain-qte failing on gcc-cross-sdk_4.5.bb for mini6410
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
X-List-Received-Date: Thu, 12 Jan 2012 19:22:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I have been trying to bitbake meta-toolchain-qte for the mini6410 and have
been stuck on this linker problem.

Here is my build configuration.

Build Configuration:
BB_VERSION        = "1.10.2"
METADATA_BRANCH   = "master"
METADATA_REVISION = "8e7ed36"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "mini6410"
DISTRO            = "angstrom"
DISTRO_VERSION    = "v2012.01"
TARGET_FPU        = "hard"

I followed the instructions on
http://www.openembedded.org/wiki/Getting_started to set up my OpenEmbedded
environment.

Here is the error:

/home/balute/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld:
error: emutls_s.o uses VFP register arguments, ./libgcc_s.so.1.tmp does not

/home/balute/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld:
failed to merge target specific data of file emutls_s.o

/home/balute/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld:
error:
/home/balute/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi/gcc-cross-sdk-4.5-r38.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/crtendS.o
uses VFP register arguments, ./libgcc_s.so.1.tmp does not

/home/balute/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld:
failed to merge target specific data of file
/home/balute/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi/gcc-cross-sdk-4.5-r38.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/crtendS.o

collect2: ld returned 1 exit status
make[2]: *** [libgcc_s.so] Error 1
make[2]: Leaving directory
`/home/balute/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi/gcc-cross-sdk-4.5-r38.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm-angstrom-linux-gnueabi/arm-angstrom-linux-gnueabi/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory
`/home/balute/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi/gcc-cross-sdk-4.5-r38.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm-angstrom-linux-gnueabi'
make: *** [all] Error 2
FATAL: oe_runmake failed
ERROR: Function do_compile failed

Full output is here: http://pastebin.com/bbZtFQkp

The "VFP register arguments" and "failed to merge target" errors occur
repeatedly.

I've tried adding -mfpu=vfp -mfloat-abi=softfp to the configuration, as
well as --with-float=soft. I have tried everything else I can think of, but
to no avail. I am new to using OpenEmbedded and could really use some help
with this error.

Trevor Hickey

