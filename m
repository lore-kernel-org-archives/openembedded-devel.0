Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E2FC04FDF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:08:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.1174.1690780127293018724
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:08:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=mlkAYnSR;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.196, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1C63AE0004
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780125;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=0dX9E84Nf6r/gsN3V4npotsHst08G3uWGn9YwPmE6dc=;
	b=mlkAYnSRuac8gjUb/yjpAbBISuCGofjhwuhqBixtz/b7yK9f/QacSE0ADpYcjrmr3CuVb8
	PxcsD8Nocxylk/23h0gYEfzP7lOdAXq5reIywHUQWaeun+X7bozmXj3YfeNlEsDg1yezx6
	03SlFVJzjRaQQQ8vv2vPNUwl3YUEYNpd1CvpCmpS2PTsXmqvvdGWSGSxUHZaUC+BO6vFJN
	miVCIWsds4fkAYdDSkyfGke5waCJcBomCoH+f1Hw/mVKwoxMnK4AZGVI1Ju0pd23iasHC5
	jlkpZNL7dxyEorHmNMVUiknPuavLCNqjhgl+FruXsqbk8MyM3DtLsgQ6zNRSWQ==
Content-Type: multipart/mixed; boundary="===============6315048589720242563=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-configshell-fb: upgrading to 1.5 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104088
Message-Id: <20230731050854.D1E2FC04FDF@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:08:54 +0000 (UTC)

--===============6315048589720242563==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-configshell-fb* to *1.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-configshell-fb -V 1.5 -S 730208e81c71e4419b69f5ec049da6b63dc523a7
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry... (19:46:41.327550)
NOTE: Directory listing: ['tmp-qemux86-musl', 'tmp-qemuarm64', 'tmp', 'conf', 'tmp-qemux86-64', 'weeklyjob.sh', 'auto_upgrade_helper', 'tmp-qemux86', 'auto-upgrade-helper', 'upgrade-helper', 'cache', 'workspace', 'pokyjob.sh', 'buildhistory', 'perljob.sh', 'bitbake-cookerdaemon.log']
NOTE: Retrying server connection (#1)... (19:46:41.443817)
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
NOTE: Writing buildhistory took: 26 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 730208e81c71e4419b69f5ec049da6b63dc523a7 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6315048589720242563==--

