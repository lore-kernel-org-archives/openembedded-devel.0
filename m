Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB93DC07EBB
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.63859.1699041165176728042
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BM40l1tg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=M2sFVIIP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bebc44-ca55b125-b3c2-49e8-a424-f6f58d1c4f2f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=eG5+0TQczLersd/tgKiIqZvDqKtoBnje3lEhA7HHnlM=;
	b=BM40l1tgKQ1sVfioqNFCpeM/jmviHD52D7ETmL/zEnf5I168MLIty4/tcvebxI4Z
	2gvsW6/qLM9Cwn9gRTseE1lQRyb04hnoGIgCkilU2LmiovUJ6zZF3rnlZkn+AWhMJZb
	Rvq5by+6pnfL5wzUzdFNCSDdgPqXBkSMamOGGBJ0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=eG5+0TQczLersd/tgKiIqZvDqKtoBnje3lEhA7HHnlM=;
	b=M2sFVIIPsMgjKLXT0RTGQEtPwWRiHm3D2RYWJ6K7PhfRHDKCs50aIB+pZ0XxLRXW
	zOQtPmG5YjvB88e7R8om5k7uIrM+nJ/TdF0vYyL1jeMEMcT7PIRdHx2a7mvhWIWO4PA
	jz/CY/2KalGFb4dA/6rHoOmmqYk9OFoMfgGi/bp0=
Content-Type: multipart/mixed; boundary="===============5514186947529730234=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] boinc-client: upgrading to 20120110 FAILED
Message-ID: <0101018b96bebc44-ca55b125-b3c2-49e8-a424-f6f58d1c4f2f-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105878

--===============5514186947529730234==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *boinc-client* to *20120110* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade boinc-client -V 20120110 -S 8af68eb7391f3b1a3e0a4eef5a41f9887a5502bf
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4890 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e41f5cf73d4ce5d79301b64d31a5b3391fb32ca7"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 14 Local 14 Mirrors 0 Missed 0 Current 16 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 8af68eb7391f3b1a3e0a4eef5a41f9887a5502bf was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5514186947529730234==--

