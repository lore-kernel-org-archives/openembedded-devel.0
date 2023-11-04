Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3BFDC0723F
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.3551.1699067574100915429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=dwn0Ipq0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=o36iY0FR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018b9851b460-5befc522-9ae3-4181-a066-69bd8508c863-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=U/W5MGynd10enrnb6rO8/2ZCzFNDRJhtnFtJp+A9STo=;
	b=dwn0Ipq00WUoUtuyYipVdQ5a8ha0cYVVH8Av35Ntzq23airqm94V/IaxRjFiIycy
	NovHzSBeII26uZbtvRtNQTtoIvTcBldmOAPWiUmYeRrbErrSVAonYeTVyvz8ewIM1WA
	r2i+4tpnnhARtFZK7SFQv16JZCUtp/lk6DFflR5c=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=U/W5MGynd10enrnb6rO8/2ZCzFNDRJhtnFtJp+A9STo=;
	b=o36iY0FRhZlsFvRy/4dP0r184ilDPkm4Vtvc0XnuiKykownS7lD5nRZQio5AZkfy
	NotdjTXT7+bGUk6m0lSCMia3g9f1eV5TjcMwS5RgJ42JF0STjfbCs6OB8w9hjFfg94C
	PxFrlqpgYUxzLjl9Mpnmz+GMAqMEbDXvm9h2iBjw=
Content-Type: multipart/mixed; boundary="===============3448611346236627750=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] drbd-utils: upgrading to 9.26.0 FAILED
Message-ID: <0101018b9851b460-5befc522-9ae3-4181-a066-69bd8508c863-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.23
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106200

--===============3448611346236627750==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *drbd-utils* to *9.26.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade drbd-utils -V 9.26.0 -S fd0904f7bf256ecd380e1c19ec73c712f3855d40
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4888 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:bc321736b97ea68814607226c414dbbdfe8ced28"

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
ERROR: Execution of 'git fetch' failed with exit code 1:
From https://github.com/LINBIT/drbd-utils
 * [new branch]        9.23.1     -> origin/9.23.1
   bf393b9c..fd0904f7  master     -> origin/master
 * [new tag]           v9.23.1    -> v9.23.1
 * [new tag]           v9.26.0    -> v9.26.0
 * [new tag]           v9.23.0      -> v9.23.0
 * [new tag]           v9.23.0-rc.1 -> v9.23.0-rc.1
 * [new tag]           v9.23.1-rc.1 -> v9.23.1-rc.1
 * [new tag]           v9.24.0      -> v9.24.0
 * [new tag]           v9.24.0-rc.1 -> v9.24.0-rc.1
 * [new tag]           v9.25.0      -> v9.25.0
 * [new tag]           v9.25.0-rc.1 -> v9.25.0-rc.1
 * [new tag]           v9.25.0-rc.2 -> v9.25.0-rc.2
 * [new tag]           v9.26.0-rc.1 -> v9.26.0-rc.1
 * [new tag]           v9.26.0-rc.2 -> v9.26.0-rc.2
Fetching submodule drbd-headers
From https://github.com/LINBIT/drbd-headers
   9a0f151..9c9c59e  master     -> origin/master
fatal: remote error: upload-pack: not our ref 465daf9940f70a61762e8488c7cf1b1925d163be
Errors during submodule fetch:
	drbd-headers



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3448611346236627750==--

