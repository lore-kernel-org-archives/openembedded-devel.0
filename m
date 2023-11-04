Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 384FCC001DB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.4058.1699071647810537104
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R+si+GeS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=PIapPD9k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b988fdd8a-f7d6d6b7-6004-43d7-ae32-d80b51ee8644-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/IEt7TIaiiKNNboQD7+0Spo5+nAWdaXuu5PJlHOwS60=;
	b=R+si+GeSItC9MEnXJZxmyFQY20Bq95I+mmRA4YwYTyUlV2iPgpq7zOh4XYSveJiU
	uGl3z8sh8xAUaefY56YYA6DwUGnKxPSXXTyDy4pduMsSF/JZItp5es/vd7oCKOq6qZF
	ytbHI129bBqzSB+j3mqhfQ3F0w71m3rinwgxm+2A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/IEt7TIaiiKNNboQD7+0Spo5+nAWdaXuu5PJlHOwS60=;
	b=PIapPD9k0YSHB6eLveHK4iIy3z4UugUJeS4drFPmSS5PxPdUs8wbJmtg1p1s4wSp
	MsHpRH7hY8B/bwqR3ZJia4QOr/ePKHhx1cs6QZt2UJD/TEscVm0pexEfd62AUI6C/PH
	c6CdqAOA6DytRtvaKKGOnLhJV24+xnO46A5brDDY=
Content-Type: multipart/mixed; boundary="===============7870044764095967940=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] openal-soft: upgrading to 1.23.1 FAILED
Message-ID: <0101018b988fdd8a-f7d6d6b7-6004-43d7-ae32-d80b51ee8644-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106263

--===============7870044764095967940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *openal-soft* to *1.23.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe openal-soft failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4908 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:4dfc7c0e4c772c176b474b9e9a78e8c52e89f9dd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto d3875f333fb6abe2f39d82caca329414871ae53b
WARNING: Command 'git rebase d3875f333fb6abe2f39d82caca329414871ae53b' failed:
Auto-merging CMakeLists.txt
CONFLICT (content): Merge conflict in CMakeLists.txt

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/openal-soft
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/openal-soft/openal-soft_1.23.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7870044764095967940==--

