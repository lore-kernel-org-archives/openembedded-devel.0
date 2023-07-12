Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DB1EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 07:33:21 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.2123.1689147199438899891
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 00:33:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=O15IOVBq;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.194, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5B9C140006
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689147197;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=mMtD6s4YbLyPoF2zSC7eYpdjow58T4/NUfzPOsa/jSs=;
	b=O15IOVBqLueQGwGl5jIJIIZpGaDMESgACqP/hr27NkPuU0CRP8gNdlxX+2Kd3R+eagSqlX
	Rev42RyB9bk83iEsSqK7JyzFOwhw8XPPot7AdwT+l5zLPjwKHTNpphSRwoF//G5EMpoazI
	0p3MpBLVQAKyfPppD1c8NLxIzMxsaTA7PfZ4FnFVwsr6T4/ory9u4x0/0Jg3TCpSlVEV+c
	1xOaFfAw5zGJAkt0C+xX8pskfxOe1eb9+Hprwmey9csHicqxDl9NPrmnH89/pPfSFWrR0d
	ICerrgpr/DkO06fxFf6gjCkJZ/DyQqCInXV1x6bs9DLOAOhjUIMvWnIIDjrZxQ==
Content-Type: multipart/mixed; boundary="===============0961182594537047183=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] libcurses-perl: upgrading to 1.44 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 07:33:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103829
Message-Id: <20230712073321.19DB1EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 07:33:21 +0000 (UTC)

--===============0961182594537047183==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcurses-perl* to *1.44* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libcurses-perl failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (02:12:23.287383)
NOTE: Directory listing: ['tmp-qemux86-musl', 'tmp-qemuarm64', 'tmp', 'conf', 'tmp-qemux86-64', 'weeklyjob.sh', 'tmp-qemux86', 'auto-upgrade-helper', 'upgrade-helper', 'cache', 'workspace', 'buildhistory', 'perljob.sh', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (02:12:23.404208)
Loading cache...done.
Loaded 12587 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
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
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
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
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 9 Missed 1 Current 10 (90% match, 95% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 12587 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
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
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
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
meta-perl            = "tmp-auh-upgrades:3ec20e2423c72f3df68b1748e7d0aedb551a0d20"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Mirrors 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://www.cpan.org/authors/id/G/GI/GIRAFFED/Curses-1.44.tar.gz...
INFO: Rebasing devtool onto fbf2b1cd124178abdae0bd05d97e056ef7eec14e
WARNING: Command 'git rebase fbf2b1cd124178abdae0bd05d97e056ef7eec14e' failed:
First, rewinding head to replay your work on top of it...
Applying: testtyp.c: Use proper prototype for main function
Using index info to reconstruct a base tree...
M	testtyp.c
Falling back to patching base and 3-way merge...
Auto-merging testtyp.c
CONFLICT (content): Merge conflict in testtyp.c
Patch failed at 0001 testtyp.c: Use proper prototype for main function
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /scratch1/auh/build-auh/workspace/sources/libcurses-perl
INFO: New recipe is /scratch1/auh/build-auh/workspace/recipes/libcurses-perl/libcurses-perl_1.44.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0961182594537047183==--

