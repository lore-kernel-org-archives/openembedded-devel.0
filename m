Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10BEAC072AB
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:06 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3556.1699067574633156780
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LDg1mvG+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=i/jAfRN8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b9851b685-333c352a-b449-4e54-b81c-f35963b6a5c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=14zcJez/1YN9LifCEaxYhoqLX3ZRTHqtF9iC/aPTsoA=;
	b=LDg1mvG+ZHOLXhTeF9M0yoEHRJQYWCN0egKOJ0eMO8cINcOiQiER8BvgXNQX9svm
	Yn608cPCmPRt82Yltdmo7oI0tN1mGgna4buoevVdlayXftjDQtDwPiWKb5tXSrYgBE2
	GLyJ3eAH9+eZChjLw83+BJijT1TxSFTLH4UxRpTQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=14zcJez/1YN9LifCEaxYhoqLX3ZRTHqtF9iC/aPTsoA=;
	b=i/jAfRN8xlxm+BSyHuPDmtDXNe0e4+pmV/gMUgNyRliouTfzY6ZWbMrY5t+oKJxT
	T5T3sm08kP2/ploSBgtpAYufXxYw/I67ZAfx+71nwSS+AKm2htpv0k1DGsU6fhbGzs8
	kSvIZvoaDp+LNxlYVSQNKlXjE1i7vK119ixl9dVs=
Content-Type: multipart/mixed; boundary="===============0354798335113190890=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libldb: upgrading to 2.8.0 FAILED
Message-ID: <0101018b9851b685-333c352a-b449-4e54-b81c-f35963b6a5c9-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106203

--===============0354798335113190890==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libldb* to *2.8.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libldb failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4892 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:94f9a00138770904008444e59a3bfffd77f05d31"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 4892 entries from dependency cache.
Parsing recipes...done.
Parsing of 3056 .bb files complete (3054 cached, 2 parsed). 4887 targets, 92 skipped, 0 masked, 0 errors.
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
meta-webserver       = "tmp-auh-upgrades:94f9a00138770904008444e59a3bfffd77f05d31"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 3 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching http://samba.org/ftp/ldb/ldb-2.8.0.tar.gz...
INFO: Rebasing devtool onto 053a4a926e10cb3a0384d5dbeb0e8f243f10efe1
WARNING: Command 'git rebase 053a4a926e10cb3a0384d5dbeb0e8f243f10efe1' failed:
Auto-merging lib/replace/wscript
CONFLICT (content): Merge conflict in lib/replace/wscript
Auto-merging wscript

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libldb
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libldb/libldb_2.8.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0354798335113190890==--

