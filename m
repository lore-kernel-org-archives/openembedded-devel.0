Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00C90C4708E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:48:13 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5665.1699084092493736262
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GcWxMd/D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=GHG83szW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b994dc128-3f87313d-40f6-46f3-a1e1-033a4b24e902-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=j28BuYC0K5xCPXIX3PitShH8n4dZQofSW/EoKYqeQXg=;
	b=GcWxMd/DqB1xmUyjm/Vf0B/b2KN3oZNMURLG7qO/wBZ2OyHrWWKovsR8Uo8ycYQP
	e3BtSWs5j4pnZuKNcNUtKRz6E7AtBCczHJ6rDLujZpGysIqfSJwWIJVgoQ2zaQLGIl7
	H+ZRXSZAcM0Ux/0e83CphS9F5AKbi1Q5IJKfzirY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084091;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=j28BuYC0K5xCPXIX3PitShH8n4dZQofSW/EoKYqeQXg=;
	b=GHG83szWttLw2hakOFxBIri0td0HAfcG4bxPqMei9WAt19hrlXm1WtoXY1Evh8ZE
	8cbCKjcXzhXlyqZiGnFkna4+AOvKtFD6XCesidDcwPP4AimUUSqiO5gOfXVBYAdIR4Y
	vf4aKiLifJ4FZF3VtN34ylTJsOfPLEB3EX7Hzbks=
Content-Type: multipart/mixed; boundary="===============5810143676150775413=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] zfs: upgrading to 2.2.99 FAILED
Message-ID: <0101018b994dc128-3f87313d-40f6-46f3-a1e1-033a4b24e902-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:48:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:48:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106358

--===============5810143676150775413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zfs* to *2.2.99* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe zfs failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4894 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e575f59b82eae78fb1ac8df7198eaa4a7a963259"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:ab1463cd31c53afbff4015f9642e3b38607948c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ca960ce56ce1bfe207e4d80ba6e5ab67ea41b32f
WARNING: Command 'git rebase ca960ce56ce1bfe207e4d80ba6e5ab67ea41b32f' failed:
Auto-merging META
CONFLICT (content): Merge conflict in META

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/zfs
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/zfs/zfs_2.2.99.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5810143676150775413==--

