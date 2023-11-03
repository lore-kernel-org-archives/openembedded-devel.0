Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A98C27C62
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:08 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.63876.1699041166657281340
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J932hXaP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Nruhy51X;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96bee5ff-825bece7-dc54-45b9-8048-4726772929c5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n25EBQTpqZlGDUlsB95NEiqW/aNWZlv2zR+olxrtw/c=;
	b=J932hXaPc6n63Uqs0d9fAov2bRwMtjiiPx5C/gUvhPCnmSMeBzVWNKMmi/yu1pMQ
	Ey+EbzULlG3v28SrP+fFsJBZyztYWHoNtc8wSCR9Dkzi7hNO0ZEuYoEfnarli4TCsX8
	cMMEUDz4z/aiDMtf3BkLHpJG43SOmQO/h1Sgw5/E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n25EBQTpqZlGDUlsB95NEiqW/aNWZlv2zR+olxrtw/c=;
	b=Nruhy51XK77aEp8/+29k4HquEk4CQ3eddRuvEvQaq5rjswBS3ClsuYnS/cCmdUi2
	n2R5Mn1f8HK+QMsnOz8PLNBZSBovS2chcsmJZnGfj/ScIH+73Iwb+Cs55lzo4KK1mQI
	egGj5QO0ZlM7Ij3TPbptyPUyPO6Wvv25QS6WWwkY=
Content-Type: multipart/mixed; boundary="===============4700695580028856506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] thin-provisioning-tools: upgrading to 1.0.7 FAILED
Message-ID: <0101018b96bee5ff-825bece7-dc54-45b9-8048-4726772929c5-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106020

--===============4700695580028856506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *thin-provisioning-tools* to *1.0.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe thin-provisioning-tools failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5049 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ef0ca3e79f3ef0b9161f8fea58392f5f62c7cea8"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 76a8174c9a16647837977344598ad1beabb1a1a9
INFO: Rebasing devtool-override-libc-musl onto 76a8174c9a16647837977344598ad1beabb1a1a9
WARNING: Command 'git rebase 76a8174c9a16647837977344598ad1beabb1a1a9' failed:
Auto-merging src/file_utils.rs
CONFLICT (content): Merge conflict in src/file_utils.rs
Auto-merging src/thin/trim.rs
CONFLICT (content): Merge conflict in src/thin/trim.rs

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/thin-provisioning-tools
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/thin-provisioning-tools/thin-provisioning-tools_1.0.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4700695580028856506==--

