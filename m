Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77C6AC001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.993.1689139854772315390
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=iplyhSlw;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 23839FF802
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139853;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=rsuaismWJkAqBTdHD/isCfXLqGxwjl+PBGpBIgcwb70=;
	b=iplyhSlw+z4dqWHU1dlPr1PPauQNQb8i/AYaKqhOQaeMXDiehJ9CMcnGTGMek/TqY2Wq5r
	tEbvH5HUZqg1bprT0L50qrn6Jwte/ubgItgO3rXwHYY5xNLkiL0guoiLEYLE3zE25mGW/0
	MHuBiyx2TpuCgO4cu/zcrci6y/4r22wRTIa7OkGzFLoApBIZrCOMZ3WQhM5Pghc/foQuuF
	D1Tw4EpDc5GF0v7p1bM/BsypNbh0DaLzXq6VR5iFBZKUoZpI3H6gPU1zfhaa3exjIDakw0
	ckmsXHVbnZIrMaeRGpsP2D+H/qSiqul0zv9ldeJne1ttAO66G9jPWnrq64sQTA==
Content-Type: multipart/mixed; boundary="===============0522214879017118528=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-m2crypto: upgrading to 0.39.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103777
Message-Id: <20230712053100.77C6AC001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:00 +0000 (UTC)

--===============0522214879017118528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-m2crypto* to *0.39.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-m2crypto failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12731 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:42744ee5174ce18112072099dc8402f6cb3ebdef"
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
meta-perl            = "tmp-auh-upgrades:42744ee5174ce18112072099dc8402f6cb3ebdef"
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
meta-perl            = "tmp-auh-upgrades:42744ee5174ce18112072099dc8402f6cb3ebdef"
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
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 12731 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:42744ee5174ce18112072099dc8402f6cb3ebdef"
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
meta-perl            = "tmp-auh-upgrades:42744ee5174ce18112072099dc8402f6cb3ebdef"
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
meta-perl            = "tmp-auh-upgrades:42744ee5174ce18112072099dc8402f6cb3ebdef"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/M/M2Crypto/M2Crypto-0.39.0.tar.gz;downloadfilename=M2Crypto-0.39.0.tar.gz...
INFO: Rebasing devtool onto 087f329c7ead6daafd953e46da6eb6a72451f7d7
WARNING: Command 'git rebase 087f329c7ead6daafd953e46da6eb6a72451f7d7' failed:
First, rewinding head to replay your work on top of it...
Applying: setup.py: link in sysroot, not in host directories
Applying: python-m2crypto: Upgrade to 0.26.0
Applying: Filter out '/usr/include' for swig to avoid host contamination issue.
Applying: setup.py: address openssl 3.x build issue
Applying: Mitigate the Bleichenbacher timing attacks in the RSA
Using index info to reconstruct a base tree...
M	src/SWIG/_m2crypto_wrap.c
M	src/SWIG/_rsa.i
M	tests/test_rsa.py
Falling back to patching base and 3-way merge...
Auto-merging tests/test_rsa.py
CONFLICT (content): Merge conflict in tests/test_rsa.py
Auto-merging src/SWIG/_rsa.i
Auto-merging src/SWIG/_m2crypto_wrap.c
Patch failed at 0005 Mitigate the Bleichenbacher timing attacks in the RSA
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /scratch1/auh/build-auh/workspace/sources/python3-m2crypto
INFO: New recipe is /scratch1/auh/build-auh/workspace/recipes/python3-m2crypto/python3-m2crypto_0.39.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0522214879017118528==--

