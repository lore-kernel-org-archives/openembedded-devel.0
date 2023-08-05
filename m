Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD8DEB64DD
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:39 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.2148.1691221116982178282
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=J0z1vtWW;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1AAE61C0005
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221115;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=StOsS76zTehQe8fiV9ygNpuonC9a+jJl47IYNKhK9ok=;
	b=J0z1vtWWKd0nWLFnhsCnaxyddoxSD0YpDf1ikNYnaKe52jvjc/ic3cNDgJPTIsJ0Jef8fu
	va4oe408H2I920dUgirNzwXYenHZPnZf+WP29BPWKOZmOGTRNL2ioEYifT7AnOTGZPQGxk
	NCTS9I9PWwybzUx/DQlcibHNIeCRGO2nJeTsxD+PTMDOZ6z/WwiCfk8CqMQpoY/rDfW+Eh
	8wdo1tXKtccD5fxU6gKFoEVDuY1CLqm8eOflWqIPvzEu7a0nYIquNAe7+d1c3YR6w5OICN
	hUXxJnwC+shYR1jTCHXeMETK8c8C8G+BKprlDo8VCa1S5C+dFMSRVNHgjn8ITA==
Content-Type: multipart/mixed; boundary="===============2497345407446477197=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-configshell-fb: upgrading to 1.5 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104240
Message-Id: <20230805073839.9CD8DEB64DD@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:39 +0000 (UTC)

--===============2497345407446477197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-configshell-fb* to *1.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-configshell-fb -V 1.5 -S 730208e81c71e4419b69f5ec049da6b63dc523a7
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
meta-perl            = "heads/origin/master-next:1e9d5ded4e4afa3682ebbbe04c0a91ed83f778fc"
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
meta-perl            = "heads/origin/master-next:1e9d5ded4e4afa3682ebbbe04c0a91ed83f778fc"
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
meta-perl            = "heads/origin/master-next:1e9d5ded4e4afa3682ebbbe04c0a91ed83f778fc"
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
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 730208e81c71e4419b69f5ec049da6b63dc523a7 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2497345407446477197==--

