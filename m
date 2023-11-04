Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B42C072A2
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:06 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.3557.1699067574652257919
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=B44MGhoe;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZR6c8pmh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b9851b67e-e739aeab-110d-43f2-8ff6-15c0830256d1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=KHEydJ9rUsjCdJ10GlSCMveaPEu5QfgcShn6i+9ftns=;
	b=B44MGhoejU+DE+ejDNxp9CuejrnYoToMz4Zr7cGJn27Wq5XkAyJRGUv/rlpzNELJ
	cWbedvUk1CF5hTMq/AjnsnavRzJeQdbL/LclE3OduiQpc0+S9UukdUPQnR+Vtj+BV4G
	fNiifcRyHsK+Na0ClHr4Nk2Bm32/yTgHaoyF4Gjg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067574;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=KHEydJ9rUsjCdJ10GlSCMveaPEu5QfgcShn6i+9ftns=;
	b=ZR6c8pmhZhNA/GoyXqdn2KqF9+g6Od3Trsf+P4tztMwd83VMherFhcotv383NhDV
	XNqydHp/RXIcUGamIgrsWCMZxCE8kVgPE3wA7JmnR/sJecbPAw+ypNgrX6s3ifuQcBY
	3acQuLXpxGSqXHZxM4xbrf9edYzGhbjAELneKrUY=
Content-Type: multipart/mixed; boundary="===============1306940947683008148=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libowfat: upgrading to 0.33 FAILED
Message-ID: <0101018b9851b67e-e739aeab-110d-43f2-8ff6-15c0830256d1-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106204

--===============1306940947683008148==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libowfat* to *0.33* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libowfat failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4893 entries from dependency cache.
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
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 4893 entries from dependency cache.
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
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  49% |#################                   | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.fefe.de/libowfat/libowfat-0.33.tar.xz...
INFO: Rebasing devtool onto 6116f2a23f465f0f6992634663c8babd209c6d49
WARNING: Command 'git rebase 6116f2a23f465f0f6992634663c8babd209c6d49' failed:
Auto-merging byte.h
CONFLICT (content): Merge conflict in byte.h
Auto-merging critbit.h
CONFLICT (content): Merge conflict in critbit.h
Auto-merging fmt.h
CONFLICT (content): Merge conflict in fmt.h
Auto-merging scan.h
CONFLICT (content): Merge conflict in scan.h
Auto-merging scan/scan_httpdate.c
CONFLICT (content): Merge conflict in scan/scan_httpdate.c
Auto-merging scan/scan_iso8601.c
CONFLICT (content): Merge conflict in scan/scan_iso8601.c
Auto-merging str.h
CONFLICT (content): Merge conflict in str.h
Auto-merging stralloc.h
CONFLICT (content): Merge conflict in stralloc.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libowfat
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libowfat/libowfat_0.33.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1306940947683008148==--

