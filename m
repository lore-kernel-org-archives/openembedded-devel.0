Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B780EC001DE
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:39 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.2144.1691221113384323944
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@moto-timo.dev header.s=gm1 header.b=aXX8s73L;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BB1EB1BF204
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221111;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=T9ccMJs4Jb4f/j6tgXCER/vnNA4rm4Pf4/T/NNPJrA8=;
	b=aXX8s73LUVY4A2ClCiNNhCS8OsCSJL7X97mlUm9xiyPuqvMGBL8iPRhYhITolSif0xsY3d
	TWSOzgAy8FV/3N4zvEtmLYAOZYrGWk3LOOT3tM4iyg1lxVoHm6VH3mVXyXwEavPFg9I7Ur
	2dw7yoYOe9azkm/X3mbwKBDPQi7Q8xK9NI9OowKmIYuICwLD4AEHLaH7+UK5wPTjwFhNz+
	BK2Qzvs7Bsi0V6B/KhRe02vDfbmRGnocQvbA3G8GrD769U+1y1LtgP6e/DPg4y2CXEOU0F
	/LoAohPvVEJBDUP4XlMVtDKv2TZtMIrhyvLl8cQclc70pRZwTWo8vlZ19vURSQ==
Content-Type: multipart/mixed; boundary="===============7361999334002459944=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cachecontrol: upgrading to 0.13.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104238
Message-Id: <20230805073839.B780EC001DE@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:39 +0000 (UTC)

--===============7361999334002459944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cachecontrol* to *0.13.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-cachecontrol -V 0.13.1
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12640 entries from dependency cache.
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 14 Local 4 Mirrors 10 Missed 0 Current 16 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 12640 entries from dependency cache.
Parsing recipes...done.
Parsing of 7344 .bb files complete (7338 cached, 6 parsed). 12619 targets, 353 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
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
meta-yocto-bsp       = "master:058a44165ce375f405063e73a9fcd1b2757ef8da"
meta-oe              
meta-python          
meta-perl            = "heads/origin/master-next:2b2436df1afb38a1920b26c4d9db2723d0d8cebb"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/C/CacheControl/CacheControl-0.13.1.tar.gz;downloadfilename=CacheControl-0.13.1.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/C/CacheControl/CacheControl-0.13.1.tar.gz;downloadfilename=CacheControl-0.13.1.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export PATH="/scratch1/auh/build-auh/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/auh/Projects/poky/scripts:/scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/recipe-sysroot/usr/bin/crossscripts:/scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/recipe-sysroot-native/usr/sbin:/scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/recipe-sysroot-native/usr/bin:/scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/recipe-sysroot-native/sbin:/scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/recipe-sysroot-native/bin:/home/auh/Projects/poky/bitbake/bin:/scratch1/auh/build-auh/tmp/hosttools"; export HOME="/home/auh"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /scratch1/auh/DOWNLOADS/CacheControl-0.13.1.tar.gz.tmp -P /scratch1/auh/DOWNLOADS 'https://files.pythonhosted.org/packages/sourc
 e/C/CacheControl/CacheControl-0.13.1.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/C/CacheControl/CacheControl-0.13.1.tar.gz;downloadfilename=CacheControl-0.13.1.tar.gz')
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/recipetool-evivv3z1/work/temp/log.do_fetch.2927407
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/C/CacheControl/CacheControl-0.13.1.tar.gz;downloadfilename=CacheControl-0.13.1.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7361999334002459944==--

