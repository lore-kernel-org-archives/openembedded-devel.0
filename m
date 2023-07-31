Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C226BC001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:09:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1204.1690780193699551762
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=eq+/8B9R;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1253B1BF204
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780192;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=nabaKnYyE/K7+JH94ZRp+1bdjTY4883GjJIrxhUcMX8=;
	b=eq+/8B9RLeI3fzKTL8ecGsyN03jWhpGRVpmTgB6yEsO8D4BzKarROCp+4bHV1schHzngl3
	rkN2XcR4djFQ909uBcSMMSx5RWDVYuliX7wiARoNkQBbNTAS0xpSYNawxXeEbwcJGuucJY
	+J0rHYde1LQ7RzeNTdgenQqMv7xsWFHlsz/LTvngWTQNT0zB970SUOBdCD4meC7YC1zWP9
	G8Y/GKEN5utRZj10QuuJulErx30zXOKlq5fTiNu25L8eZB3AYa4VXvYfuGKr/SMgVYhwuW
	2cksNtHEmvDFqsGw5iYO/7XyN+2VN4jF4WbT5wrYi7wIcXeFT2SWfeaev5lXeg==
Content-Type: multipart/mixed; boundary="===============0274783350655952204=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pylint: upgrading to 3.0.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104121
Message-Id: <20230731050954.C226BC001DC@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:09:54 +0000 (UTC)

--===============0274783350655952204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pylint* to *3.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pylint failed.
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12625 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
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
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
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
meta-perl            = "tmp-auh-upgrades:9d4ce13d23c371beb8b9cd020b6eebed19c0d793"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 10 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0a805f88671eda9820be5b75590db5f4199fc6ba
WARNING: Command 'git rebase 0a805f88671eda9820be5b75590db5f4199fc6ba' failed:
First, rewinding head to replay your work on top of it...
Applying: Don't use removed function from ``astroid`` (#8525) (#8526)
Applying: [pyreverse] Bugfix: strip "/" at the end of the file  (#8517) (#8528)
Applying: Upgrade astroid to 2.15.2 (#8530) (#8532)
Using index info to reconstruct a base tree...
M	pyproject.toml
M	requirements_test_min.txt
Falling back to patching base and 3-way merge...
Auto-merging requirements_test_min.txt
CONFLICT (content): Merge conflict in requirements_test_min.txt
Auto-merging pyproject.toml
CONFLICT (content): Merge conflict in pyproject.toml
Patch failed at 0003 Upgrade astroid to 2.15.2 (#8530) (#8532)
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /scratch1/auh/build-auh/workspace/sources/python3-pylint
INFO: New recipe is /scratch1/auh/build-auh/workspace/recipes/python3-pylint/python3-pylint_3.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0274783350655952204==--

