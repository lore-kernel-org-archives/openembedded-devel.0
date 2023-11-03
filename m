Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB64C04A92
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.63862.1699041165508911707
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Y76JRLPT;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jOwcuX2w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b96bec77c-db297f01-7aa6-42ec-88ad-99bf9a6ddf39-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PygKElJ9YUpNzbJWWGlSp4eenpNC6CYdphXmDOdXLes=;
	b=Y76JRLPT8rVIe2QVZgGGr45j2s9zDO15D9PocItXKQTV81LgzRNZPIaAXvK8L6R6
	grCvoMQYZxQbh4ORgmSEC8CSR8FDqCo6HlVBFVZrJ8McfK3ElsFcz1x+0sj24tb8uPk
	1mjS/A9AjXc0I7L3qZGsxwLx6IFatCoJ/ZDX/lG4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PygKElJ9YUpNzbJWWGlSp4eenpNC6CYdphXmDOdXLes=;
	b=jOwcuX2wa9dw5JAZ57vAIKHOViSCUphz/XIffUsyv4KQdUidIAoUV6/mF9wbGX4g
	JTuCCVImHPOeAjnetmec/jmat2T0g83G/wSPi+aCkzfVX64teskzgooXxdojqEvT87y
	ntG5Br6LXm4r9Xlq/BFCHKY0pa61YaIIh173Xs+k=
Content-Type: multipart/mixed; boundary="===============8230318346794817984=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gperftools: upgrading to 2.13 FAILED
Message-ID: <0101018b96bec77c-db297f01-7aa6-42ec-88ad-99bf9a6ddf39-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105928

--===============8230318346794817984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gperftools* to *2.13* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gperftools -V 2.13 -S dffb4a2f284700b814e2c3aa1f9263fd14e836f8
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4945 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:b8216e1438525b902db7208851063a189c6d3996"
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
INFO: Rebasing devtool onto dffb4a2f284700b814e2c3aa1f9263fd14e836f8
WARNING: Command 'git rebase dffb4a2f284700b814e2c3aa1f9263fd14e836f8' failed:
CONFLICT (modify/delete): src/base/atomicops.h deleted in HEAD and modified in 4f384e3 (Support Atomic ops on clang).  Version 4f384e3 (Support Atomic ops on clang) of src/base/atomicops.h left in tree.

INFO: Rebasing devtool-override-libc-musl onto dffb4a2f284700b814e2c3aa1f9263fd14e836f8
ERROR: Execution of 'git checkout devtool-override-libc-musl' failed with exit code 1:
error: you need to resolve your current index first
src/base/atomicops.h: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8230318346794817984==--

