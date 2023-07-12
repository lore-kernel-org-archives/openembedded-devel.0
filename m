Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74888EB64DD
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:31:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.1018.1689139883355334166
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:31:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=nL7S6xrv;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7D34FF805
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139882;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=+xEbw8ramkZdi6dwG3MIQwlauCAKAAoImae8nlmziQk=;
	b=nL7S6xrvX1sULwiOK0ZDkIwwoPvXjF/c+0oEra0Si0SevTHYQ0yx6mfXfZ//MN68hMbTj9
	/SbQpxKZrKIXv1i2nBjlr+BYf023EbAsVkNIhrdQcD10jCL/SEKfpXpPWtJoLn1sqETTMo
	a6lJoRF9R1pKEo0wjkQHM9bZVwMh6jhW9THa9kcIvNJG9dpTcH1ZwO+T/XRVXZOe17PQcy
	0XQMZO6SkGO6K4KunE8vv/ufDIWuIyuF5FWyVASoabBacaJu4p5yUb4GIq16HNwv1xOs1K
	7E9Hf2erqg8zvtZ/5GHSMEvWjuUXgAuYYCwelyJHR4G1NuCedlZghOswXd8E0Q==
Content-Type: multipart/mixed; boundary="===============3929141478103493846=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pylint: upgrading to 3.0.0 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103794
Message-Id: <20230712053130.74888EB64DD@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:31:30 +0000 (UTC)

--===============3929141478103493846==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pylint* to *3.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pylint failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (21:49:03.946381)
NOTE: Directory listing: ['tmp-qemux86-musl', 'tmp-qemuarm64', 'tmp', 'conf', 'tmp-qemux86-64', 'weeklyjob.sh', 'tmp-qemux86', 'auto-upgrade-helper', 'upgrade-helper', 'cache', 'workspace', 'buildhistory', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (21:49:04.061964)
Loading cache...done.
Loaded 12791 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:8a70abd936f26c76dda3292e4a53e67e3060031e"
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
meta-perl            = "tmp-auh-upgrades:8a70abd936f26c76dda3292e4a53e67e3060031e"
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
meta-perl            = "tmp-auh-upgrades:8a70abd936f26c76dda3292e4a53e67e3060031e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 9 Missed 1 Current 10 (90% match, 95% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
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
--===============3929141478103493846==--

