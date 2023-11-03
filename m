Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C40C25B58
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62977.1699041166149435499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QUZjVr8N;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=lz5uwBEo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96beca2e-069070b3-cec9-40ea-a4f1-f1d99a5d8911-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OebBaK5WjZcAm8smQdA6pnrTNKjdBeELqvimuccJSrk=;
	b=QUZjVr8NqR1VUuBHlXOzmegZ3/qBUW1ngDqcreZQJO5Eupty+z09Ntrw/tf1quXJ
	z97GkrZd9ghGK1oay7SEO/TXcWoWD9FE8yymAqqOVGby/c4a6b3RIJqI1wetiAcJsX1
	mUs/wz5Nr2hKwJtXzIzpJCC4FW3el2fmuQ0Hvqpk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OebBaK5WjZcAm8smQdA6pnrTNKjdBeELqvimuccJSrk=;
	b=lz5uwBEoruMyvuxosX7/WTibEALEbyrKKGLV0IZXW66UxmE76u8/J5SYdLDTPseQ
	fE/6VSDrU9moMdUnxcRwIY3O528vZJfNe6NLwDi2bXU8/a/ETZYrR/EI+yZvHXQhdbN
	o/rGBb+I3BDC7LpHi5gb62x+vI+BTmZSwQYX6e5A=
Content-Type: multipart/mixed; boundary="===============1626674541891137198=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] inotify-tools: upgrading to 4.23.9.0 FAILED
Message-ID: <0101018b96beca2e-069070b3-cec9-40ea-a4f1-f1d99a5d8911-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105942

--===============1626674541891137198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *inotify-tools* to *4.23.9.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe inotify-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4959 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:af578c0118d90ae3dcd85dfdd847d9b12139c6bd"
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
INFO: Rebasing devtool onto 5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7
WARNING: Command 'git rebase 5c2ab772338bcbe516306bf8cf1059ddf2fa6bb7' failed:
Auto-merging libinotifytools/src/inotifytools.cpp
CONFLICT (content): Merge conflict in libinotifytools/src/inotifytools.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/inotify-tools
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/inotify-tools/inotify-tools_4.23.9.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1626674541891137198==--

