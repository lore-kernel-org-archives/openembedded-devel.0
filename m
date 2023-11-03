Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F569C18E1A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.62970.1699041164984076417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RVzEX4Z1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QdrZHjLa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96bed101-15ceb14e-35e6-4f58-9b8b-fe0b8c7fc066-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8W6nr202o5N+nCwkjcguq0zVG3QbAnuLZN/NqFrgWjI=;
	b=RVzEX4Z18oyQKuzQjx988URuLOL21Pje13cwb8v1LOSBvDDx+lGBlSAWohCGuiOr
	bWpXRpwjQl0zHDdi8qRxkkPnyrkiBiJ6CIk8IeA6F+JV+i+cR6VTh6wENDUCGz/pCt8
	yn4pV077lVGyrLoU7lnLo0lCq4Jp/wh4tpzwRieU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8W6nr202o5N+nCwkjcguq0zVG3QbAnuLZN/NqFrgWjI=;
	b=QdrZHjLaENLXWbG/c5k1SA+e9F8RNXERUEaw+u1FyFlp8pnqvcztcqTbpfM1taQr
	gh+xeuDtDHNSnjOk8VTtBHOavyu0Xq4WwCZs838sxeC4fptqvdGman5l3iaX1ZRMjzU
	4qx9/CX77vpdliBClPbeD1Y08jerlEJTFI/Ykn68=
Content-Type: multipart/mixed; boundary="===============9076241635659249921=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libyui-ncurses: upgrading to 43018 FAILED
Message-ID: <0101018b96bed101-15ceb14e-35e6-4f58-9b8b-fe0b8c7fc066-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105980

--===============9076241635659249921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libyui-ncurses* to *43018* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libyui-ncurses failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4991 entries from dependency cache.
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
NOTE: Writing buildhistory took: 9 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee
WARNING: Command 'git rebase 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee' failed:
Auto-merging libyui/resource/template.spec.in
CONFLICT (content): Merge conflict in libyui/resource/template.spec.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-class-target onto 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee
WARNING: Command 'git rebase 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee' failed:
Auto-merging libyui/resource/template.spec.in
CONFLICT (content): Merge conflict in libyui/resource/template.spec.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libyui-ncurses
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libyui-ncurses/libyui-ncurses_43018.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9076241635659249921==--

