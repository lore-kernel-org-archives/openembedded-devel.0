Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF8AAC169C2
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63857.1699041164726183513
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=BayhlNCC;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=VTohKL23;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bed2f6-2951fe15-85c6-4bf0-8b73-3b1c25b5e0d6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=AAwmxCShuqHWdDh1iDlWDOCFQVkvcrt/xAd2uASkbvw=;
	b=BayhlNCC8c6zdsMWIRdk6ZcgnrEmerzu0lt3sCdnH0IF9RiQAky1fLVlKrPJOn+L
	Z1TAAt8FpKxJbOn3P/P11XgUe6AOec4tx4jefVyqxYpKT9P3LcWcVzU7vNblfRL64xu
	SQ6U1XBz4AFDvjZJ9ROt+k1pfHkhO/cKMZYZ1KeA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041170;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=AAwmxCShuqHWdDh1iDlWDOCFQVkvcrt/xAd2uASkbvw=;
	b=VTohKL23sG28SamPjHcAJj46HPXeltMS3WLzZqwYU7oBMmWe33r6jr2vTGotG5Z+
	M0d1C1rxhNehpBU1IZMWBnkGb4pAtgwq0uzcd1Udhk3UrZ6k2LwV522p7Oaq6rhYLVT
	fJv25h+ZMm68gW6oTPekU7F7RRqyDz5YlvPuffK4=
Content-Type: multipart/mixed; boundary="===============1522328183290157424=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] minio: upgrading to 2023 FAILED
Message-ID: <0101018b96bed2f6-2951fe15-85c6-4bf0-8b73-3b1c25b5e0d6-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105991

--===============1522328183290157424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *minio* to *2023* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade minio -V 2023 -S 9f2fb2b6a9f86684cbea0628c5926dafcff7de28
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5000 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d7c196aeffa0020f8ecf0450c9b811a5687cbeb0"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['virtual:native:/home/pokybuild/yocto-worker/auh-meta-oe/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: ['patch-native', 'libtool-native', 'attr-native', 'texinfo-dummy-native', 'gettext-minimal-native']
| NOTE: Skipping as already exists in sysroot: []
| DEBUG: sed -e 's:^[^/]*/:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/minio/01b87ecc02ffad47dfe13c2154ac31db3e3115df/devtooltmp-saijd4o1/workdir/recipe-sysroot-native/:g' /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/sysroots-components/x86_64/libtool-native/fixmepath | xargs sed -i -e 's:FIXMESTAGINGDIRTARGET:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/minio/01b87ecc02ffad47dfe13c2154ac31db3e3115df/devtooltmp-saijd4o1/workdir/recipe-sysroot:g; s:FIXMESTAGINGDIRHOST:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/minio/01b87ecc02ffad47dfe13c2154ac31db3e3115df/devtooltmp-saijd4o1/workdir/recipe-sysroot-native:g' -e 's:FIXME_PSEUDO_SYSROOT:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/sysroots-components/x86_64/pseudo-native:g' -e 's:FIXME_HOSTTOOLS_DIR:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools:g' -e 's:FIXME_PKGDATA_DIR:/home/pok
 ybuild/yocto-worker/auh-meta-oe/build/build/tmp/pkgdata/qemux86-64:g' -e 's:FIXME_PSEUDO_LOCALSTATEDIR:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/minio/01b87ecc02ffad47dfe13c2154ac31db3e3115df/devtooltmp-saijd4o1/workdir/pseudo/:g' -e 's:FIXME_LOGFIFO:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/minio/01b87ecc02ffad47dfe13c2154ac31db3e3115df/devtooltmp-saijd4o1/temp/fifo.2923621:g'
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing python function devtool_pre_patch
| DEBUG: Python function devtool_pre_patch finished
| DEBUG: Executing python function patch_task_patch_prefunc
| DEBUG: Python function patch_task_patch_prefunc finished
| DEBUG: Executing python function do_patch
| DEBUG: Executing python function patch_do_patch
| DEBUG: Searching for modules.txt in paths:
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio-01b87ecc02ffad47dfe13c2154ac31db3e3115df/poky
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio/poky
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/files/poky
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio-01b87ecc02ffad47dfe13c2154ac31db3e3115df/qemux86-64
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio/qemux86-64
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/files/qemux86-64
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio-01b87ecc02ffad47dfe13c2154ac31db3e3115df/qemuall
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio/qemuall
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/files/qemuall
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio-01b87ecc02ffad47dfe13c2154ac31db3e3115df/x86-64
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio/x86-64
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/files/x86-64
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio-01b87ecc02ffad47dfe13c2154ac31db3e3115df/
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio/
|     /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/files/
| DEBUG: Using /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-extended/minio/minio/modules.txt for modules.txt
| DEBUG: Python function patch_do_patch finished
| DEBUG: Python function do_patch finished
| DEBUG: Executing python function do_qa_patch
| DEBUG: Python function do_qa_patch finished
| DEBUG: Executing python function patch_task_postfunc
| DEBUG: Python function patch_task_postfunc finished
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103154412.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103154412.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: ExecutionError('git add .; git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -a -m "Committing changes from do_patch\n\n%% ignore - from do_patch"', 1, 'On branch devtool-orig\nnothing to commit, working tree clean\n', '')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/minio/01b87ecc02ffad47dfe13c2154ac31db3e3115df/devtooltmp-saijd4o1/temp/log.do_patch.2923621
ERROR: Extracting source for minio failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1522328183290157424==--

