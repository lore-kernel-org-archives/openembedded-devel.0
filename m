Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8385C4708E
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63871.1699041166188751429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K6N0iS11;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=nH2I9Xxy;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bec688-9cbbb8e1-3743-4cd9-86eb-bd51ac30f9a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Q2Co29fJJUOHFCsdck/BZPGF3Mgw4S+ylpf6tpkmqbY=;
	b=K6N0iS11RmyLW3eKTzM5ZWUsJB4e74YxGk5ZolSq2W0Fna8REUDBd4AaiqELaAcL
	nKYwEkOdcOCbc9WJoJhRidC/VrB3b4eChGYUH/hHcBiDFiQrnKbojcaw2bvYlCizaNZ
	sdlpbmQnbrcjh8GQY+Jdc+xJVZ7Pft2847F5VxPU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Q2Co29fJJUOHFCsdck/BZPGF3Mgw4S+ylpf6tpkmqbY=;
	b=nH2I9XxyqZDRQhoQVzvr3XJDJM7kcDAClvfqhhpqaJ/siR36LDkDM/K36iwDaaBr
	c9STZ/fobU5ToXjLCgokdIrSmXH0IFb8PVxF80ACiXKh/pm4qeosEyM1Ze4gFFAJjdK
	PduOaqZEYWFBRf/us25h8nj69bC/Kj+osH+Dp544=
Content-Type: multipart/mixed; boundary="===============1587598850408995958=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] fwupd-efi: upgrading to 1.4 FAILED
Message-ID: <0101018b96bec688-9cbbb8e1-3743-4cd9-86eb-bd51ac30f9a6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105931

--===============1587598850408995958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *fwupd-efi* to *1.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe fwupd-efi failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4930 entries from dependency cache.
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
meta-yocto-bsp       = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"
meta-oe              
meta-python          
meta-perl            
meta-networking      
meta-multimedia      
meta-gnome           
meta-xfce            
meta-filesystems     
meta-initramfs       
meta-webserver       = "tmp-auh-upgrades:cd1667adcdd9a2e0834675ebf825ef4728b88664"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto eb79ba8d3c35549f023a9d5fd2fe4c1c70c084d2
WARNING: Command 'git rebase eb79ba8d3c35549f023a9d5fd2fe4c1c70c084d2' failed:
Auto-merging efi/generate_sbat.py
CONFLICT (content): Merge conflict in efi/generate_sbat.py
Auto-merging efi/meson.build
CONFLICT (content): Merge conflict in efi/meson.build
Auto-merging meson_options.txt
CONFLICT (content): Merge conflict in meson_options.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/fwupd-efi
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/fwupd-efi/fwupd-efi_1.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1587598850408995958==--

