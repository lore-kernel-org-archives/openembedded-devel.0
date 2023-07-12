Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A587C001B0
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:30 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.973.1689139828918828877
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=YEqKYXd8;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.199, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4EAF5FF807
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139827;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=BAI+aLprNz9VzSTp2O6UMN39u6eDiPoWZolvoTNBvjc=;
	b=YEqKYXd8qeTEgJxFTNPWJGEASHWs8Y3yu8FbEg3EU4jg38GyZqjOk+jMOYPBlbPUjk9tLM
	ilmVCRwFMECAfpdl0nSURGU0kXsL24rLSBO8sSlisAp3s1W3U0JuBhKhIsaYTTlxIHLK3h
	9WdaIxLuN0m+tsdJeKuj+yBKs0wyyNZJybJ487ia8n3y30Z0fsTdfrzzVhZGKeD+/hIFf2
	49dIgAeCNGh2lUzoKtPguIHmGCPRzKxGIJXBPX1I5MOKLztRdxu2vcUhy+W+vrBe5nCHeZ
	pFoiGcC4Myy1TzBRVS1AXJBypz7OM5aelxCkB/oLr/tf+p9cY/IQXMd4z0m5uA==
Content-Type: multipart/mixed; boundary="===============1449907364016066116=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-fastjsonschema: upgrading to 2.17.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103762
Message-Id: <20230712053030.6A587C001B0@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:30 +0000 (UTC)

--===============1449907364016066116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-fastjsonschema* to *2.17.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-fastjsonschema -V 2.17.1 -S aa7be271c233278c43096ed0a401dcb3c4a12708
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12704 entries from dependency cache.
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
meta-perl            = "tmp-auh-upgrades:012971fe7e3b24c1a574c56e699c499244111ad1"
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
meta-perl            = "tmp-auh-upgrades:012971fe7e3b24c1a574c56e699c499244111ad1"
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
meta-perl            = "tmp-auh-upgrades:012971fe7e3b24c1a574c56e699c499244111ad1"
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

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto aa7be271c233278c43096ed0a401dcb3c4a12708
ERROR: Could not decode SRC_URI: The URL: '${PYPI_SRC_URI}' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1449907364016066116==--

