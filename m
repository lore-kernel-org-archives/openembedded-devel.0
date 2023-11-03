Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6AFDC0723F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62981.1699041166671979951
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HR1C8cuP;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AlyPKx/t;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bec27d-11d28c69-49f3-4bd6-b69c-2bc1816229a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nSzgfDROs3x5Nqy253Wu+r7Oceh3g5S9rd3brgMWm+w=;
	b=HR1C8cuP1b9+OrUL/JKfYjDnD11ieG80ymOTEYpHyopOf1NGfaa+J+WU2Z5DU3Zd
	Zf7Ni5aLBla2TGojxHz4XnUJurvF44d9aoG0bV+HFgP8FQ5N0DLFqSgtd14VNURf/Zk
	rxl9M1PUNdjz2wTQ+56VsNJx12FnrwaE98WXT8yY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nSzgfDROs3x5Nqy253Wu+r7Oceh3g5S9rd3brgMWm+w=;
	b=AlyPKx/tI8jUk0Tbc0b66HgBWep9RrQV23nQQbdjAUFTHiMj2+3/kA+/74QKm3q6
	YRwmgduw6dztgS/SH9387ckxxl6JkDNHookAbH+JXzwUmMTNXnRiP2T+XPtJwK4cKuj
	8L3POw9ztDbYxHiBxvGgnsWm0XTNOonQOHZ2nAFk=
Content-Type: multipart/mixed; boundary="===============9082845463902412061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] dool: upgrading to 1.3.0 FAILED
Message-ID: <0101018b96bec27d-11d28c69-49f3-4bd6-b69c-2bc1816229a6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105911

--===============9082845463902412061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dool* to *1.3.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade dool -V 1.3.0 -S 9520f48687f5bf7528ab1b0c064ecf928fc31c28
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4916 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:fb780a423997d74cfa5f16cfe81ffd10a29527d7"
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
INFO: Rebasing devtool onto 9520f48687f5bf7528ab1b0c064ecf928fc31c28
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/devtool", line 349, in <module>
    ret = main()
          ^^^^^^
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/devtool", line 336, in main
    ret = args.func(args, config, basepath, workspace)
          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/lib/devtool/upgrade.py", line 568, in upgrade
    new_licenses = _extract_licenses(srctree_s, (rd.getVar('LIC_FILES_CHKSUM') or ""))
                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts/lib/devtool/upgrade.py", line 476, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/dool/COPYING'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============9082845463902412061==--

