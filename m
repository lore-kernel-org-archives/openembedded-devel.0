Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57C3C05027
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.4511.1699074742345376524
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fYH3mJJF;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rK9MsuLG;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b98bf15e0-3a9216c6-7f84-493b-89ba-366d07b658d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WrW3zjDaYbcHEkVnsgt4RLO4mzmQp2gN1tR2Z91B7is=;
	b=fYH3mJJF3KbIiyYP0z0Q7tEEZ7XVVusn/ZympXsHQOSQjiGeOoOfe36/ALoU+ZKW
	kE0gfXkFayYyUKIBKfSq8XI/J0psS8A5ue5xAV1L3V0x+R6jL85ETtsGXxfvwGvDAoF
	/NulL3lXbHCGSwRB8KEkH0vHoGU51hG6TqujrcyI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WrW3zjDaYbcHEkVnsgt4RLO4mzmQp2gN1tR2Z91B7is=;
	b=rK9MsuLGdVpSWrt0/euqxL7JXNLYvwLI1ovSmVj1EORLaOIaiOyL7BalPwVjEktL
	T91N5J1Qa5VRN1hCzO9rl57EEvJAkXK9bTG2ii14TdO1LDaXOdnuYcaBO8p61HH9o18
	2Ba9bJUZUChQSfijM0NVCnEOFlOXW9XD+kl+WVNQ=
Content-Type: multipart/mixed; boundary="===============2175560617415732164=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ibus: upgrading to 20080901 FAILED
Message-ID: <0101018b98bf15e0-3a9216c6-7f84-493b-89ba-366d07b658d0-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106278

--===============2175560617415732164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ibus* to *20080901* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ibus failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4897 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ed1b0105db76a9c757124e20a25aaf29cd608970"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 17eeeb8dd2ba385b1a9e67beb386abc83852a7c1
WARNING: Command 'git rebase 17eeeb8dd2ba385b1a9e67beb386abc83852a7c1' failed:
Auto-merging util/IMdkit/Xi18n.h
Auto-merging util/IMdkit/i18nX.c
CONFLICT (content): Merge conflict in util/IMdkit/i18nX.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/ibus
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/ibus/ibus.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2175560617415732164==--

