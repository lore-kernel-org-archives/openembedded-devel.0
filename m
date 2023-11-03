Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A6EC25B67
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.63876.1699041166657281340
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=bqVNwxqH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=bQrtTOp+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b96bee108-a833ba84-dc06-4f7a-9e9d-911e2d25cd43-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SvcLgKcmnjkqRcvvKdc2C5nOC1NaMLgd7yTe6sh1iko=;
	b=bqVNwxqH0rZkQdMLcWzs7mUBUOJrQzJaDCp9IN/fEa9Cr2PIktR1ldMG/CiKWCde
	K52CJ3y9E45GrFavcGDedvxQcTqCIVcWyiFj+0JdbIXc2WwdTya/4kOz8SxbJ6x4W5R
	PNbm6hPhqYK4C8RQJ8FQrHCycxuebPMHOIapITwg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SvcLgKcmnjkqRcvvKdc2C5nOC1NaMLgd7yTe6sh1iko=;
	b=bQrtTOp+bqcOczT7Zo3ECB+U6bX8htKUu8NkK0PqeTFhHqP9GfMkTfIAhsnJ6WwQ
	UJ8tBmvqfEe85oyPPmpiPwwksw/CyXXwDC+zsikaf4KbjWvpGcRY4VkNqzNZXCiGn/y
	/wtTwMcA89QvFGeNQeZc8+4q6CEpjPrM5GHZQ3Gs=
Content-Type: multipart/mixed; boundary="===============4906152366861453626=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] sdbus-c++-tools: upgrading to 1.4.0 FAILED
Message-ID: <0101018b96bee108-a833ba84-dc06-4f7a-9e9d-911e2d25cd43-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106010

--===============4906152366861453626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sdbus-c++-tools* to *1.4.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade sdbus-c++-tools -V 1.4.0 -S b482cd6d0890e3f9ae141b4aeb07d3724e48b3db
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5038 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:b6885a3b105389b9ead3faaf64f18206d45f8828"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

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
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/sdbus-c++-tools/1.3.0/tools/COPYING'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4906152366861453626==--

