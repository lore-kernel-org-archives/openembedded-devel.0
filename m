Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44995C001DD
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.4236.1699071647780940315
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=QSx7s1cL;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=C1SXUkJH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b988fdde8-82b79160-6274-4728-96b6-91fb0aa6dcc1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tbZabcZIg/7lVZwsIqBrWV/gP8InyzXNgQ6QM2upFKY=;
	b=QSx7s1cL+S87a0F1DNRfzHZye4/ywWA/sNhZyfC15Cb04oD8986DAnKDHanDeXfa
	36eBbk0tpDzYTwsaKTAPV1rLB3ODBHEecYGY8LGmbLUUYUmf3SzqFjgI4Zye5CKcN33
	eS2zQ7ZMyOVzFf6iXVwo9QmAHfalex27Qc2o799M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tbZabcZIg/7lVZwsIqBrWV/gP8InyzXNgQ6QM2upFKY=;
	b=C1SXUkJH0YwC9Ubuv0DwJ8HOMtDv7dGYhZjvtxjmD9GWX0h/+ZKpyca6zqwcwUHG
	+L265oQejYWptYgZCMn+GAxt6PfXGmU9yI7oRiMDAVeSjGassNDPoq9So9D+Skwuw8N
	AE/9Pku/sMgiqoQl7oFprpa6QuZjfNtkf06Tq+xw=
Content-Type: multipart/mixed; boundary="===============2597449358332774537=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] minidlna: upgrading to 1.3.3 FAILED
Message-ID: <0101018b988fdde8-82b79160-6274-4728-96b6-91fb0aa6dcc1-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106260

--===============2597449358332774537==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *minidlna* to *1.3.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe minidlna failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4907 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:855474765bca413d1eddc35d821e9fe34f2656ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 1a9b32ee7a1c89e54e9f148199b73f9b33ad45ba
WARNING: Command 'git rebase 1a9b32ee7a1c89e54e9f148199b73f9b33ad45ba' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/minidlna
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/minidlna/minidlna_1.3.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2597449358332774537==--

