Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 059CDC19F2B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62979.1699041166407724722
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=PGzy1rld;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Cz0mQyYs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96becc67-ee2bc8bf-60a7-4718-bd7a-54b152dd20c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9HTmzwkjm/QzdkL0cjR78Ifo0kEK9Udp3+hsGuLUijs=;
	b=PGzy1rldCcqq1gNFX3R/S50BduVNCShdYEhmLZKfwr6qMxZWE+KmETq6HoOGg914
	TYWhc3NWckWJMh/hxLX3sBCObmMgpZxRfZkWda5W0PcbBjNzXzwaav1sE3+RL/H+SZ0
	ZmVpmPiI1y0RFQUmZfcTveIpmp2DWKMEs36glUsA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9HTmzwkjm/QzdkL0cjR78Ifo0kEK9Udp3+hsGuLUijs=;
	b=Cz0mQyYsjw2hTw3+aXvppl+GwUPBf1OJHEiBJbJYCR0OMI68EEdpuNy0Y5vTa3cs
	KVHucvvo521Hg56mhlcVzgEi5xQY6LX3vYas5KikWuZO2iPd7d0TBOD1QZYom6IlK6/
	lctleqvP3fkVv+LS5BB0t+lWd9xxnvJT6NNkJRwM=
Content-Type: multipart/mixed; boundary="===============0387468610161628276=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libharu: upgrading to 2.4.4 FAILED
Message-ID: <0101018b96becc67-ee2bc8bf-60a7-4718-bd7a-54b152dd20c9-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105953

--===============0387468610161628276==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libharu* to *2.4.4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libharu -V 2.4.4 -S 0c598becaadaef8e3d12b883f9fc2864a118c12d
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4971 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:942696509537c45e0643cdf17aaf516d8159e4df"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 17 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0c598becaadaef8e3d12b883f9fc2864a118c12d
WARNING: Command 'git rebase 0c598becaadaef8e3d12b883f9fc2864a118c12d' failed:
CONFLICT (modify/delete): configure.in deleted in HEAD and modified in 4ae1d5f (get ready for 2.3.0 release).  Version 4ae1d5f (get ready for 2.3.0 release) of configure.in left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
configure.in: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0387468610161628276==--

