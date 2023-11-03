Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86152C41535
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62974.1699041165700227562
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=F4urZXIK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=mUo07TXa;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96befa35-4f245055-0bc2-45ed-a2a7-8f23dc95394e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WLbpx6OgIeuEdgJdd4vgftNaqFzsMrJuoYfGcC7rKg4=;
	b=F4urZXIKyUNnEjJHBXHl6dlw4rXov4c0BHFvXFnOKkv1zm0N/AsZ/MM+VdaMh5cw
	Oz0HGT/7c6UAke3p0PzJJOilpTFESQ9XP3YR3xMIVnPocoIui4Oh0KbUXOGT2k8Kx/9
	3y5AdOcjuVQ0IldjDWinBm6tNpAUcN7G92Rxst10=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041180;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WLbpx6OgIeuEdgJdd4vgftNaqFzsMrJuoYfGcC7rKg4=;
	b=mUo07TXaXj93Vz1YrWFR/vSg0ckiLdq5EXOhwwVaYHBZ30qLC+BrcECBG38WXwUg
	0MaNm2uTFD8ueKTmbYvHIu/I5N7NHOZccO6sWOzmVIy6gjyD0D9nQC3pdBwFiKSZESl
	3u4kVucDCMDjpdKXidZrSgA7lWVeggWgdb8IwiYs=
Content-Type: multipart/mixed; boundary="===============8473057844848467902=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] zbar: upgrading to 1.3.1 FAILED
Message-ID: <0101018b96befa35-4f245055-0bc2-45ed-a2a7-8f23dc95394e-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:53:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106047

--===============8473057844848467902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zbar* to *1.3.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade zbar -V 1.3.1 -S 0100c738992c7e829b1dc804815a64483299617d
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5080 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:908c14296bd89c67c8ae271dfd1542a901f850e5"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 0100c738992c7e829b1dc804815a64483299617d was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8473057844848467902==--

