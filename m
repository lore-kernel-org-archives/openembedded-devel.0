Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D43DEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:39:19 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.2165.1691221156286509115
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=Yed7Ti2E;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.200, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A4A3A20005
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221154;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=am+6iP28CcPXfxKIWZ24xQklKrrdvOjZw/meLdGp+y8=;
	b=Yed7Ti2EhW31lnm1bXGsX7i562PcxtGIzrNynzpg4PgRxfgmedC2693JGEURdDxuAkwubf
	ZWwis+ODP9tUJ5U3fw+/w5ndKKW5mst84Qfy7uFKaTkPYzecM1eE/rG/Q0pWk/liTWyuoZ
	Mwgo5LQYsg4eJcRBEfvyn9agDat1u8UUHD81jUb2ULHD8BtxfT68/pZibjI/rLKIcNxhjE
	30qz5eOBS9GTX9LRBsuG2r3CWQ5nuyuiysblev0emD/Y8zK/c+4NuofHQ0lDP83PtD7U6z
	vSYy9UjnSAGQOYj+brRzydkRsqmqeUGu+Iv0IAwrtqhfFL+aHD9wBe2tUn+Dkw==
Content-Type: multipart/mixed; boundary="===============5370075618485147026=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pybind11: upgrading to 2687. FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:39:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104259
Message-Id: <20230805073919.9D43DEB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:39:19 +0000 (UTC)

--===============5370075618485147026==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pybind11* to *2687.* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-pybind11 -V 2687. -S 0c395cfe1fb6cabbaa429a96d20039861fc71524
NOTE: Starting bitbake server...
Loading cache...done.
Loaded 12715 entries from dependency cache.
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
meta-perl            = "heads/origin/master-next:25cdd9324acab67e8d237b5ec87c0577dd79b4fb"
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
meta-perl            = "heads/origin/master-next:25cdd9324acab67e8d237b5ec87c0577dd79b4fb"
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
meta-perl            = "heads/origin/master-next:25cdd9324acab67e8d237b5ec87c0577dd79b4fb"
workspace            = "<unknown>:<unknown>"

Initialising tasks...done.
Sstate summary: Wanted 10 Local 0 Mirrors 10 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 0c395cfe1fb6cabbaa429a96d20039861fc71524 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5370075618485147026==--

