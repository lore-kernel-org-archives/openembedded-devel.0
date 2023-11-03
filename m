Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C65BC04FDE
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.62971.1699041165185365512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=T4I+AqRR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dPDwLtnb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bec699-b44d4c12-06bd-4735-8f72-561706ba8344-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jRHj66H4ckrkUXmxGIlj8HdcLNNi4C4T8dPofL3SOeg=;
	b=T4I+AqRRCPzMQno5Igo1lFkLAJE9Jobh8KheT2BeoO4fJughJ9IU4gUZ/Ezig7k/
	DOOQ54aP69U5Qs+7j4d8fRWXRiTcs+swJYq0rVKMzchG3zoSjPv0ijqXOttJ0HBauYG
	55e2WnarrXmuiGc7ZP/tfYdR+tMrZzvClhpfhe/U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jRHj66H4ckrkUXmxGIlj8HdcLNNi4C4T8dPofL3SOeg=;
	b=dPDwLtnbUyGAr2J9hZIcBuSrlxJXvbMCRFrAIteOChj7H+2feUc3hGEfjBz0QcRX
	D/KT8WNpXDcQmwPt0cEq6jzcMGFUEAU1YA8K1M/CLZN5LBY43mcKJRhxKxriCCR3n4R
	jzEqIgfr5rXdvN6Usk78VwfwViY3Xke+OdZlVB9Q=
Content-Type: multipart/mixed; boundary="===============8612292960420567018=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] glm: upgrading to 214 FAILED
Message-ID: <0101018b96bec699-b44d4c12-06bd-4735-8f72-561706ba8344-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105924

--===============8612292960420567018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glm* to *214* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe glm failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4943 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:47e4cc307039c79eb44374d90fb828c435af3b38"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 7fe8a1944c66fb9acf3aa2930966cfafa4ee9e09
WARNING: Command 'git rebase 7fe8a1944c66fb9acf3aa2930966cfafa4ee9e09' failed:
Auto-merging glm/detail/intrinsic_geometric.inl
CONFLICT (content): Merge conflict in glm/detail/intrinsic_geometric.inl
Auto-merging glm/detail/setup.hpp
CONFLICT (content): Merge conflict in glm/detail/setup.hpp
Auto-merging glm/detail/type_vec4.hpp
Auto-merging test/gtx/gtx_simd_vec4.cpp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/glm
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/glm/glm_0.9.9.8.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8612292960420567018==--

