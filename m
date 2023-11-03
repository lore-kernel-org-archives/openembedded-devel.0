Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29115C05022
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.63228.1699041739479540363
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BrnRPNtB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ThQkoq6K;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96c78074-bc573dce-249e-475d-8e86-9ab1affa7e23-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FwuAug/o26qC7BPF8km5PcYOyR9TnYj+jfuWTjJI0Q4=;
	b=BrnRPNtBaIS8+dgO4aOSl13KMrX16K388VM8XxTf2t9P4xnJ8J723FT+mZDruwfQ
	InVP+7h3/FzNoFYSPdkZ3JlFAOlKVcabk9IBnd0LDwG6ddwdJWgfWu+1HpG+/2xvVm3
	LKV82W92SxNAw5gHpD8Hadu5QhFfw4N9QLBLFy50=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041739;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FwuAug/o26qC7BPF8km5PcYOyR9TnYj+jfuWTjJI0Q4=;
	b=ThQkoq6KRvbIrUgP8DFwl8MrRo2vzLm6JkQILFQYI3qhGkU3KqNa9hiAFiU6Ap2g
	88vTE37GhFz/445MdnzZvZ6cueAuTa3968YDbfqO6KEWc4fv9yts4rxZRzrU/IHmfQ7
	AAytqoRKpNa3n6tzsJUwTTfR7owlYpjVq0rpH7yg=
Content-Type: multipart/mixed; boundary="===============8213133990907903542=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] squashfs-tools-ng: upgrading to 1.2.0 FAILED
Message-ID: <0101018b96c78074-bc573dce-249e-475d-8e86-9ab1affa7e23-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106074

--===============8213133990907903542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *squashfs-tools-ng* to *1.2.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade squashfs-tools-ng -V 1.2.0 -S f2a3ad56e40c9711b23371238f9fa07dd24245f1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5047 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a62dad90dd97c50c8b6b45fc64467df0832c29b6"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto f2a3ad56e40c9711b23371238f9fa07dd24245f1
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
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/squashfs-tools-ng/licenses/zlib.txt'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8213133990907903542==--

