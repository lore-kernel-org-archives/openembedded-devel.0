Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837EFC04E88
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.4517.1699074743063784511
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=a9BPQJ46;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VCWhA+93;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b98bf18a5-06f3ddf0-607f-4a51-88a9-f2e9cf312764-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=kNP8WH/ZGFMNirBi4o/HKLecNIXsSvs4qbn/RjVGAxc=;
	b=a9BPQJ46uK3DDZchPxCmWpcTVgIlCNDUGDD9/RlVYhN9TGWDx8Dj+ypjZad9YV4D
	Yq20JsYtanQc4H2ETY5vG7RmUjKK3RNiyoBVW7rap+O0dKaWOOZo1/bPJWq4uGDIqgW
	E3u4ACO1lTaQ9eWmb+jC2IjhfOw0UisLUfXHU+uk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=kNP8WH/ZGFMNirBi4o/HKLecNIXsSvs4qbn/RjVGAxc=;
	b=VCWhA+93e0DSVmMiZwXzy1TTGVxp7P79bKVOUVKVldiqDEVvesa9etdNDBbbp61M
	Qnf3vGGv/gS22LVpa44fMcHV6ZOYg8o1QgodD31neVLZRIu9Ot2KXCKbRW4uk9d1bMx
	avErpcVdBm/kKVYpZIniuVdj4ADx2SGQGLxf6Pkw=
Content-Type: multipart/mixed; boundary="===============5351659859679373879=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] zenity: upgrading to 3.99.2 FAILED
Message-ID: <0101018b98bf18a5-06f3ddf0-607f-4a51-88a9-f2e9cf312764-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106290

--===============5351659859679373879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *zenity* to *3.99.2* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade zenity -V 3.99.2
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4913 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:071be1eec48e80d13fe149b8116c9b71d40811ad"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 4913 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:071be1eec48e80d13fe149b8116c9b71d40811ad"

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
Adding changed files: 100% |####################################| Time: 0:00:00

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//zenity/3.99/zenity-3.99.2.tar.xz;name=archive...
INFO: Rebasing devtool onto d2e04dc5e4aded964a591383118963d02dcdadc2
WARNING: Command 'git rebase d2e04dc5e4aded964a591383118963d02dcdadc2' failed:
CONFLICT (modify/delete): src/gdialog.in deleted in HEAD and modified in ac2faef (Harcode shebang to avoid pointing to build system's perl).  Version ac2faef (Harcode shebang to avoid pointing to build system's perl) of src/gdialog.in left in tree.

ERROR: Execution of 'git checkout devtool' failed with exit code 1:
error: you need to resolve your current index first
src/gdialog.in: needs merge



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5351659859679373879==--

