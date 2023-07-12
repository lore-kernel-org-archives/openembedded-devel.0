Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FCEEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:50 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web10.956.1689139849806070787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@moto-timo.dev header.s=gm1 header.b=PGlwsscM;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.193, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2276F240004
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139848;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=sGT7dBwNKCsFOPBpCiLCQJ943kg7NIQdfNnTphxI4rI=;
	b=PGlwsscM3AX3/hGenHjvCQqmsU6N4h8bz4B3WC764vo0aBpJcZft6J9Nci+EjH9QFxJUkk
	B8fo+25DtkIDZ2kN6EZCexd522Fvf9j+nGkBZOPW7GgkalmJbplMGRtm5vFCEcm6GHENwI
	o1aiZFgSgIQgaqXmxYBchbJp/LhBo58I8pD/pKeOMS3my9n5SepQ0ZpyI9eLCqUTy1HHuo
	LUTOjZWLvx35UEqPOjKj2GJ20W6v9kRh9Y4hT4Yp7q0owRLqXWMjY+gPzfuGchtIYJ4zPX
	xI1qFMehKt3tZknibmg7OIxBF4XPsVwucqCzcNj/eTfoqCL/Duf/2v370E2WMA==
Content-Type: multipart/mixed; boundary="===============0110030299380750832=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-jsonrpcclient: upgrading to 4.0.3 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103774
Message-Id: <20230712053050.65FCEEB64DA@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:50 +0000 (UTC)

--===============0110030299380750832==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonrpcclient* to *4.0.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-jsonrpcclient -V 4.0.3
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12728 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:b1fd8861eba2c1178967f332f86a2bc9abd17dfa"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:b1fd8861eba2c1178967f332f86a2bc9abd17dfa"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:b1fd8861eba2c1178967f332f86a2bc9abd17dfa"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 9 Missed 1 Current 10 (90% match, 95% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 12728 entries from dependency cache.
Parsing recipes...done.
Parsing of 7308 .bb files complete (7302 cached, 6 parsed). 12569 targets, 338 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies
NOTE: Resolving any missing task queue dependencies

Build Configuration (mc:default):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:b1fd8861eba2c1178967f332f86a2bc9abd17dfa"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemux86-musl):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:b1fd8861eba2c1178967f332f86a2bc9abd17dfa"
workspace            = "<unknown>:<unknown>"


Build Configuration (mc:qemuarm64):
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "aarch64-poky-linux"
MACHINE              = "qemuarm64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "aarch64 armv8a crc cortexa57"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "master:a43fa36614977745fcbd6441d1c3c20321a8201d"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:b1fd8861eba2c1178967f332f86a2bc9abd17dfa"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export PATH="/scratch1/auh/build-auh/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/auh/Projects/poky/scripts:/scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/recipe-sysroot/usr/bin/crossscripts:/scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/recipe-sysroot-native/usr/sbin:/scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/recipe-sysroot-native/usr/bin:/scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/recipe-sysroot-native/sbin:/scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/recipe-sysroot-native/bin:/home/auh/Projects/poky/bitbake/bin:/scratch1/auh/build-auh/tmp/hosttools"; export HOME="/home/auh"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /scratch1/auh/DOWNLOADS/jsonrpcclient-4.0.3.tar.gz.tmp -P /scratch1/auh/DOWNLOADS 'https://files.pythonhosted.org/packages/sourc
 e/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz')
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/recipetool-e8sqdkse/work/temp/log.do_fetch.903691
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0110030299380750832==--

