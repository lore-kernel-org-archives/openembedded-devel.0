Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59E16C00A5A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:57 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.4235.1699071647746486408
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Xko/12EX;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=QjYyApSP;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b988fdd5b-951b7cf1-c4f6-4eaf-a262-5b009973ab66-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=QTvgxf75EKwV5RmBoqOiUq7ufY36ogGXgKN74d/zIvY=;
	b=Xko/12EXCMO3T5R+2e5gEYUggpYmfmgtmHluuTWbBRi9S4E7Qepn6dFf8IZuRPcS
	2He8JiDU7JGbpeF3AP2ZbeY03YVtOg0iYtWoPAANQzqwR67GJbENgmHWwHujEpav6Cz
	PhypJiX7Nu7fRRYFfNRgfM1FwlgRCB7IlxJ5Zxbw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=QTvgxf75EKwV5RmBoqOiUq7ufY36ogGXgKN74d/zIvY=;
	b=QjYyApSPv672YiG/2rm/QvBc8HpZcF7xC/yxWJp0YG5MgYLIaDboVKbO9FmTjcQB
	lZ4/EgPWN0h24bV8CtUEbE5laYOEHi7E60s401e/NWCYEG5KZ5ajRCYxTVJREZoWrXd
	HM6INPVUL9Id8mafIiukN13kYUKVN2Rlj+Qb3Cck=
Content-Type: multipart/mixed; boundary="===============8580196366345512360=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] nv-codec-headers: upgrading to 12.1.14.0 FAILED
Message-ID: <0101018b988fdd5b-951b7cf1-c4f6-4eaf-a262-5b009973ab66-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106259

--===============8580196366345512360==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nv-codec-headers* to *12.1.14.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade nv-codec-headers -V 12.1.14.0 -S 1889e62e2d35ff7aa9baca2bceb14f053785e6f1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4908 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:4dfc7c0e4c772c176b474b9e9a78e8c52e89f9dd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/lib/devtool/upgrade.py", line 563, in upgrade
    old_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/lib/devtool/upgrade.py", line 476, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/nv-codec-headers/12.0.16.0/git/include/ffnvcodec/dynlink_cuda.h'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8580196366345512360==--

