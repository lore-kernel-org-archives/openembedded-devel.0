Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C718DC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:09:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.1186.1690780155097924348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@moto-timo.dev header.s=gm1 header.b=IG8BpZoH;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.195, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 725B160005
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780153;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=HiscfQEanR6nLKw4KM+CVCPRBOFjmUqUs5oI9rLs3bA=;
	b=IG8BpZoH5lZuGccPWoNAw4mNEO4ATz18KYAbQTytE/NK4KsUScsP9ljNXlC9d79jQpi3gE
	9NIjQmBr8K5dBbt9R6bfVw/4C8fvcYD2y2RdZnM8+87uuw3htYXY86+kIAnWtyjdN56Mw8
	81NoqRuns3mY3SJANPKQ9q0nhlPT6cs59StQ2YcFh1yfygadklsv0REzL+g9hFT1t34kI+
	AcH0whEyXPBkXn5wx2qUw2Ye3N5PpLYL5LoYmTGRx6tSJ+nV35i4ngSSxAOW9uSgmRfowl
	oLSf5dLpZ/3adK0n+iEvY4LfujGMsc2AkvNUHVTDEWezhJjHBAquTcOu/bpUQA==
Content-Type: multipart/mixed; boundary="===============3139467401966023024=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-jsonrpcclient: upgrading to 4.0.3 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104104
Message-Id: <20230731050924.C718DC001DF@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:09:24 +0000 (UTC)

--===============3139467401966023024==
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
Loaded 12619 entries from dependency cache.
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:0d7775c89ee6cd09e317f75ef112fbba6e5df05f"
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:0d7775c89ee6cd09e317f75ef112fbba6e5df05f"
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:0d7775c89ee6cd09e317f75ef112fbba6e5df05f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 10 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 12619 entries from dependency cache.
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:0d7775c89ee6cd09e317f75ef112fbba6e5df05f"
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:0d7775c89ee6cd09e317f75ef112fbba6e5df05f"
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
meta-yocto-bsp       = "master:5dd5f0f5348594a0b636ef05a87381b997db4fb5"
meta-oe              
meta-python          
meta-perl            = "tmp-auh-upgrades:0d7775c89ee6cd09e317f75ef112fbba6e5df05f"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export PATH="/scratch1/auh/build-auh/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/auh/Projects/poky/scripts:/scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/recipe-sysroot/usr/bin/crossscripts:/scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/recipe-sysroot-native/usr/sbin:/scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/recipe-sysroot-native/usr/bin:/scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/recipe-sysroot-native/sbin:/scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/recipe-sysroot-native/bin:/home/auh/Projects/poky/bitbake/bin:/scratch1/auh/build-auh/tmp/hosttools"; export HOME="/home/auh"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /scratch1/auh/DOWNLOADS/jsonrpcclient-4.0.3.tar.gz.tmp -P /scratch1/auh/DOWNLOADS 'https://files.pythonhosted.org/packages/sourc
 e/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz')
ERROR: Logfile of failure stored in: /scratch1/auh/build-auh/tmp/work/recipetool-1933zfnd/work/temp/log.do_fetch.3354346
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/j/jsonrpcclient/jsonrpcclient-4.0.3.tar.gz;downloadfilename=jsonrpcclient-4.0.3.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3139467401966023024==--

