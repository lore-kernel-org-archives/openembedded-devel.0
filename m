Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B2EC15504
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63881.1699041168181611255
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gXLXgkt8;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RG1myEEo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bed3b4-470112c6-e7bd-4c4a-b39e-8851d5b06353-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3Gv7v8/g7MAlzk2LC5y5tsuaP8nCAxVDat23z50lyZs=;
	b=gXLXgkt8evZ8jxx6VTqDULhiiwdmM+AgzWUEibwu3GeyIF4e662/1K2Jrfo8cZ2+
	aJVXX67zhcGmfESkRNHq5wmjjBJq3S2W4vhVzllmCxSvtOKUhxPfJNtnzBFqTfY7DRQ
	Gmj+d1dUGsCGlKPCxiKXLSlvTA4RV0N5mrkGAMMo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3Gv7v8/g7MAlzk2LC5y5tsuaP8nCAxVDat23z50lyZs=;
	b=RG1myEEoeW0Aj2WKQvVvtxDoZ8M9X3mpua9IQY9FIVx3ecpJ5MS0bDmSM7PcPy7N
	e8kkZD7NI/uLE0QqiYjdVBWCtCAGgfLeHEJVLPtItnjkBTvS6Hhm83RGNtWy+gaJuZh
	XwWXPsuCwscMD5Er0V1qmzN8a9vjWGxL/1JBAxP0=
Content-Type: multipart/mixed; boundary="===============6530270072791687849=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mongodb: upgrading to 7.1.0 FAILED
Message-ID: <0101018b96bed3b4-470112c6-e7bd-4c4a-b39e-8851d5b06353-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105990

--===============6530270072791687849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mongodb* to *7.1.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade mongodb -V 7.1.0 -S 217c5457facb15bc89e4d76cec1da9ceedafc347
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5004 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a283c6480618a2f3dfac2e815f8f9c6fcc6be931"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 19 Local 19 Mirrors 0 Missed 0 Current 32 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 174 tasks of which 170 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103164411.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103164411.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Applying patch '0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/mongodb/4.4.24/devtooltmp-rz6d4dq9/workdir/git'
BBHandledException("Applying '0001-IntelRDFPMathLib20U1-Check-for-__DEFINED_wchar_t.patch' failed:
stdout: checking file src/third_party/IntelRDFPMathLib20U1/LIBRARY/src/bid_functions.h
Hunk #1 FAILED at 43 (different line endings).
1 out of 1 hunk FAILED

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/mongodb/4.4.24/devtooltmp-rz6d4dq9/temp/log.do_patch.2751197
ERROR: Extracting source for mongodb failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6530270072791687849==--

