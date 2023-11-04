Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 025C1C4332F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:12:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3424.1699067573478079919
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=IIGqv9/T;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=oBwlFI/T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b9851b206-b744b31e-354e-41a5-91ab-e46be2a80f71-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tDhvVQ8Nc6Pmj5All6AtYLN6ILb7IcrKGn6vPi6q66Y=;
	b=IIGqv9/TwXCk9MpmEaN5s0gwkvt5i2TA87ClRh0JZcLceLXXPibaZwqKATeHxJFi
	sDGAdPkvHiVpbqQElKfj/IVjL4W9XFSC2fWxbelYrLOBblCOcbvfPqWDYIWtM8pK9gH
	ScYHGWLvXfKY0wovPKoxiRlRDssyw3PPNRw2U/bg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tDhvVQ8Nc6Pmj5All6AtYLN6ILb7IcrKGn6vPi6q66Y=;
	b=oBwlFI/TxVrSTJbwH1XGCIk6XSUFvQ19ZVm7+p6YRES144K3Urh3PkPJSY2sIOhU
	hzd3QMuUdel8Y/SClmiZhLh2jIVJeWIiAk9fdbhEVxwSR9fKMSXBJCt6gMa9JJgcAgl
	lICRlRC+HfbLOM+MdaNJ/2/vf6wLhT073mDQw2dE=
Content-Type: multipart/mixed; boundary="===============0483301155024225712=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] cannelloni: upgrading to 20170601 FAILED
Message-ID: <0101018b9851b206-b744b31e-354e-41a5-91ab-e46be2a80f71-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106194

--===============0483301155024225712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cannelloni* to *20170601* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade cannelloni -V 20170601 -S dabaa0228892bfed8a20d049c76ab44db17cdee3
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4886 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5d31c82493584b315bf51585af1d548ac4b205a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision dabaa0228892bfed8a20d049c76ab44db17cdee3 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0483301155024225712==--

