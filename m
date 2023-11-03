Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DF5C4167B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62979.1699041166407724722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=enCM+xAL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SosNF1ic;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bec93d-5e736a7a-9c4f-49d7-b26c-3c6c9c14956e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Xg04JqViG8tUWhIkswmY60wYtQL93pVyQEbmZ4pIjZI=;
	b=enCM+xALifGPWoM7PFwBGnkMEjSI6MWxq3N1K3IV7ML05PenTXJ9nwsEKz7bsgsW
	eK3NE6Lmb+upItAFPjGUxL+OqylEQb/uy/jZ88533uQr6h+Qzo8GD1cBOMarT/sTKBA
	ABMGKVal/D/p/wG/AsWc0B4QDFVqzIB1gV1I0ve4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Xg04JqViG8tUWhIkswmY60wYtQL93pVyQEbmZ4pIjZI=;
	b=SosNF1iczYJ5/Rpx3hlCmLBjsy5kIhgW7lNh+xCGn34eImcIaZL6p1xrE5P7dY4o
	6aYTd+9MQzgu6P0qzmS0a2FcJeyRHAPJwkhDIdSLW2s+bJFinXek5FdJfBemOKK0U7D
	M4lQJrXqYJAjd2TG3+lVErT5rR7YyvLGKAlchpnc=
Content-Type: multipart/mixed; boundary="===============0442566676886301212=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] heaptrack: upgrading to 1.5.0 FAILED
Message-ID: <0101018b96bec93d-5e736a7a-9c4f-49d7-b26c-3c6c9c14956e-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105938

--===============0442566676886301212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *heaptrack* to *1.5.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe heaptrack failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4957 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:fbadf275df46eac0fd4784cc2a07490702224693"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto b54e92e88b0895f910a5b107f499d1155a086b80
WARNING: Command 'git rebase b54e92e88b0895f910a5b107f499d1155a086b80' failed:
Auto-merging src/track/heaptrack_inject.cpp
CONFLICT (content): Merge conflict in src/track/heaptrack_inject.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/heaptrack
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/heaptrack/heaptrack_1.5.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0442566676886301212==--

