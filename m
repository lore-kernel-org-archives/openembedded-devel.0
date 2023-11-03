Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C9EC25B4D
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.62971.1699041165185365512
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TfBG3BmY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZUpqxQwK;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96becd6f-ede1f9c6-de7f-47f9-b828-fd287ce400d7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=8JXtBqWRRpJ1EpJKli86Qxwje3iRo3gCg7tEhXFEUw4=;
	b=TfBG3BmYaPDof1TGx8DWvK2IDhEnQcYzyOlqPNgFsbkMwUt34Fs3IIhJH4bE42BZ
	Wb/mThdt1RbEU3GyTo0RuPsVOxZiiMNVQnu1K1ETWgu8TgH3RxQI294JzqmwyBFSoFa
	CNt1y2+i19P6i0/1rhXpXRYGBsWJn61vmaKNlVSQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=8JXtBqWRRpJ1EpJKli86Qxwje3iRo3gCg7tEhXFEUw4=;
	b=ZUpqxQwKGHQZWT8rtZgNv8MVggvWZIg1Cez2FZTzxylaEUjmYXUJYNcl9vYUSpVk
	QFaMEtXBvsiEvUdsvYctb507ZyomgbkNb9Prn+6RT95C+09O0Sj3r35GeG4fhftj0WX
	1KgbYBA4OyEoXvf6q2lbKu7AZFSHMIMvfyYhBZys=
Content-Type: multipart/mixed; boundary="===============1494713649825070613=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libpeas: upgrading to 2.0.0 FAILED
Message-ID: <0101018b96becd6f-ede1f9c6-de7f-47f9-b828-fd287ce400d7-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:48 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105956

--===============1494713649825070613==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libpeas* to *2.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libpeas failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4973 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e3651a0232daf8d53dfc21789e28ef9db54ccd03"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
Loading cache...done.
Loaded 4973 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e3651a0232daf8d53dfc21789e28ef9db54ccd03"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.gnome.org/sources//libpeas/2.0/libpeas-2.0.0.tar.xz;name=archive...
INFO: Rebasing devtool onto 486abc18da830c8fc52f1abb2f93962f2fdf5784
WARNING: Command 'git rebase 486abc18da830c8fc52f1abb2f93962f2fdf5784' failed:
CONFLICT (modify/delete): peas-demo/meson.build deleted in HEAD and modified in 735e33f (Remove builddir and srcdir paths from test binaries).  Version 735e33f (Remove builddir and srcdir paths from test binaries) of peas-demo/meson.build left in tree.
CONFLICT (modify/delete): tests/libpeas-gtk/testing/meson.build deleted in HEAD and modified in 735e33f (Remove builddir and srcdir paths from test binaries).  Version 735e33f (Remove builddir and srcdir paths from test binaries) of tests/libpeas-gtk/testing/meson.build left in tree.
Auto-merging tests/libpeas/testing/meson.build
CONFLICT (content): Merge conflict in tests/libpeas/testing/meson.build
Auto-merging tests/testing-util/meson.build
CONFLICT (content): Merge conflict in tests/testing-util/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libpeas
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libpeas/libpeas_2.0.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1494713649825070613==--

