Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D91C27C58
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:06 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63872.1699041166191524446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fDhQSt/u;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pD/UXLaf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96beea62-069633f9-2752-4c0f-92ac-13abf34970be-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041176;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wnfuv7VK39jfV8c4YuMDpirOQTtAPdlRi/nZmsWFcm0=;
	b=fDhQSt/uCK4wHz7q7Vn8AMoFMsXh5vMWfHbk5VyoW77aeHMLHmDdVYv/nDXwF5lv
	Itmyo4z06QV8lLYYaMFQtMGObbs4Yv7uEJ0FB9p0dXFzEGdsUyN3Mb/QgnFVbmmFwCY
	JDCkCLVu3LOJ5od9COqBrs5zvtSHYP3e80yqD3CM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041176;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wnfuv7VK39jfV8c4YuMDpirOQTtAPdlRi/nZmsWFcm0=;
	b=pD/UXLaf/0evguCYAcrMDFTpgZ+AwRCt3me+C78TxtqLYirJsKjm7J1fLTTokWsh
	Tc+63L037f4RujoQnqPwdlqjzuWEJWYw4FH6pzo5OOObeMDJ2LH0b9ehYYywesP5pFY
	sBfrMuo7Kr6jbp4HYrJTI7nRqCh0zvtL/0QgK+Yc=
Content-Type: multipart/mixed; boundary="===============6942029744828801016=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] vulkan-cts: upgrading to 4.6.3.3 FAILED
Message-ID: <0101018b96beea62-069633f9-2752-4c0f-92ac-13abf34970be-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106031

--===============6942029744828801016==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-cts* to *4.6.3.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-cts -V 4.6.3.3 -S 99aa8522cbcb3ad319d35af360df9a59cd22e6ac
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5058 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:1a608d5832f4c537063e680037052daa85ea607f"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103191051.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103191051.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Applying patch 'fix-clang-private-operator.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/vulkan-cts/1.3.3.1/devtooltmp-imig_0e0/workdir/git'
CmdError('sh -c \'PATCHFILE="fix-clang-private-operator.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmpqle2lhs_ --author="Dmitry Baryshkov <dmitry.baryshkov@linaro.org>" --date="Thu, 16 Jul 2020 01:05:56 +0300"\'', 0, 'stdout: On branch devtool-override-toolchain-clang
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
\tmodified:   external/glslang/src (modified content)

Untracked files:
  (use "git add <file>..." to include in what will be committed)
\tpatches/

no changes added to commit (use "git add" and/or "git commit -a")

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/vulkan-cts/1.3.3.1/devtooltmp-imig_0e0/temp/log.do_patch.2494734
ERROR: Extracting source for vulkan-cts failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6942029744828801016==--

