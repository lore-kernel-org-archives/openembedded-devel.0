Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E09C19774
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62979.1699041166407724722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LMeZPG3K;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dxhBSvcn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bed091-7b987e4d-32bb-4cb5-a22c-9fe437a438de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4Q6D5Y1kA7z8chxdN5+m2ZVz6dyt3XkjIsGWOjGYfO4=;
	b=LMeZPG3KhFsMml43WR0XXGwfwoDSDe8N4M0gQqnXsRumhHkrRIzHifcqQqwTe/BF
	BG6ztFK6B1c2HYa/h1bO2Lb7OIuPhrrJMd74xyor5PmWswAp/lYZABWA7wdvhMLDVVy
	fiAXL29+OKLCaESeigsHcwbP/ZIPJh2y954O5yls=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4Q6D5Y1kA7z8chxdN5+m2ZVz6dyt3XkjIsGWOjGYfO4=;
	b=dxhBSvcnHq18JzPypHLYL/0t72Ok/HKVCdBQudMJKv9Yz7z38rLYUc25t0Ure4dl
	XysY0DNTtuBZ+yN35K0cQtAbkZU9ireyovt7h6GjrdH1dLTVAS6jc1/GXUIRFHkLSS+
	9H1Xk/6uA6rii9Pe9rZZyL7r9yqekbCvoSbZA+d0=
Content-Type: multipart/mixed; boundary="===============4820569196426909483=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libvncserver: upgrading to 11 FAILED
Message-ID: <0101018b96bed091-7b987e4d-32bb-4cb5-a22c-9fe437a438de-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105976

--===============4820569196426909483==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libvncserver* to *11* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libvncserver failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4990 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e6aafd983f502f5b30478e415ed9628450cf2174"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 8bef644d17f62ea6daf7459b863f05de187966fe
WARNING: Command 'git rebase 8bef644d17f62ea6daf7459b863f05de187966fe' failed:
Auto-merging libvncserver/websockets.c
CONFLICT (content): Merge conflict in libvncserver/websockets.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libvncserver
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libvncserver/libvncserver_11.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4820569196426909483==--

