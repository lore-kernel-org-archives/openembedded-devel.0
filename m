Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A01C04E69
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:09:04 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.1178.1690780139460763650
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:08:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=KQm/Smcx;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CD7C01C0003
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780138;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=eB3Eii72eU6w9qpGHZOBUGwSNRQOpyR35FzeQozlZLc=;
	b=KQm/SmcxtrqCwY8cqQrqvVzpf+JUVA1tHOfXgneEjx/SJMnQzDh84eUOcNRbBOQIdNGogI
	/iJwnKb+0fey/IZHr3iueVyHUgnBXTtxgfcJp4q3hRulegtm3W0TJ2TjSmjrCA5jNWCVzp
	8Gwp75dILG4XHkq9hDz4Nt2C2Gx+0Vms1gBQgxCrpOwO946K+EHKYOVKe42qsVC6uNBmYc
	93POoMWo86Fh86Y92MaSssgENmAY0uoaBpI8Yrk87kM1a2NNvK55M8q5UMV45UOvhEFo9i
	3f5yfzDWqTTQih9UQyu3cZKVnggDhJi2NC15xOgVlOkqLTj4kXS8hadAOX4jag==
Content-Type: multipart/mixed; boundary="===============4667758389361290791=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-flask-socketio: upgrading to 5.3.5 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104095
Message-Id: <20230731050904.D7A01C04E69@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:09:04 +0000 (UTC)

--===============4667758389361290791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flask-socketio* to *5.3.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-flask-socketio -V 5.3.5
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (20:13:01.922606)
NOTE: Directory listing: ['tmp-qemux86-musl', 'tmp-qemuarm64', 'tmp', 'conf', 'tmp-qemux86-64', 'weeklyjob.sh', 'auto_upgrade_helper', 'tmp-qemux86', 'auto-upgrade-helper', 'upgrade-helper', 'cache', 'workspace', 'pokyjob.sh', 'buildhistory', 'perljob.sh', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (20:13:02.048736)
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
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
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
INFO: Fetching https://files.pythonhosted.org/packages/source/F/Flask-SocketIO/Flask-SocketIO-5.3.5.tar.gz;downloadfilename=Flask-SocketIO-5.3.5.tar.gz...
INFO: Rebasing devtool onto 3017ee08cfe410d8f68e3a798d961d030960a465
Traceback (most recent call last):
  File "/home/auh/Projects/poky/scripts/devtool", line 349, in <module>
    ret = main()
  File "/home/auh/Projects/poky/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/auh/Projects/poky/scripts/lib/devtool/upgrade.py", line 565, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/home/auh/Projects/poky/scripts/lib/devtool/upgrade.py", line 473, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
FileNotFoundError: [Errno 2] No such file or directory: '/scratch1/auh/build-auh/workspace/sources/python3-flask-socketio/LICENSE'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4667758389361290791==--

