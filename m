Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9155BC04E85
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4714.1699074743004648353
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RGEblhWv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CLHVR3W3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b98bf1809-82d33f33-1a2b-46b5-bd14-381f6ebc0022-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8zNiTziBcnIIHxugR0VuoZ3gUp30I4MLn2KJDCMMeS0=;
	b=RGEblhWv7LgtFsAVK/uM8QNf+QH/a8G/6fVJAm4dw8ErXSJRzQldhF32m1YMLjzz
	ZfWemltnVE8RB5WLp+Pl/Jf/q4U24sCLbm+/JOHTVg81oDBFreAjjgoqDFXyyB76Pr9
	JpCN7iqNkK6R6XUzs0oO7z1OkmWKtvjDQ/IOCpNU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8zNiTziBcnIIHxugR0VuoZ3gUp30I4MLn2KJDCMMeS0=;
	b=CLHVR3W394X+N5Ar2a+p228gmHQiUCcaEsvKGMMmg+ZTkCjopibXZcnWtRswUdNn
	4wjZK4gr4VMwA2gayobN7FbynKDEC2R9QiwPMeUfhO1wuZPgneheAATwRsCcbz21AQ+
	6pqJfcLUHlIQCZPxdfCCscvy8EyMfMUUruc4FAtA=
Content-Type: multipart/mixed; boundary="===============5449387213364742185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] sysprof: upgrading to 3.48.0 FAILED
Message-ID: <0101018b98bf1809-82d33f33-1a2b-46b5-bd14-381f6ebc0022-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106289

--===============5449387213364742185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sysprof* to *3.48.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe sysprof failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4909 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:7dedd2ee0716a9621f78bac7f3d96c25675b26c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 4909 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:7dedd2ee0716a9621f78bac7f3d96c25675b26c4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  56% |####################                | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//sysprof/3.48/sysprof-3.48.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 924ce57ceb398d60f8f3634e440ee6b4f7d13778
WARNING: Command 'git rebase 924ce57ceb398d60f8f3634e440ee6b4f7d13778' failed:
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/sysprof
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/sysprof/sysprof_3.48.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5449387213364742185==--

