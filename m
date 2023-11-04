Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C3CAC4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.3571.1699067576367119727
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YoWDV4U0;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=V84IZszs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b9851b95f-aa698ea2-7276-4c3c-81b3-1205968a00c3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=17XO1cjftn/Fz8LSag1ZKJgGZJapUQXevwgJ5Bbw7xs=;
	b=YoWDV4U0Fz8A1sRla026rkk2zHJWk7y3rD1WKrTyzLNCag3ZR+W3zNBa+4sxV48O
	Pym8CSPa8h/zHndM5ZKAXINeA00rSXFMq1RcTDyayz9OpZ+1Izp6u4/mbMU2oE0gg+q
	MKOmTnaaQBwqzQuRgf1xmhIR1G020KC/Mopq7XzA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=17XO1cjftn/Fz8LSag1ZKJgGZJapUQXevwgJ5Bbw7xs=;
	b=V84IZszsJYjWZB3rRAngeocVgSUPZUvouOP2l5GR1hjaXGg77KFqwf6j31nNMW/i
	VKdFeumXM+2hijGFiHxcDLdXnZSl2Pul+MpauwJnlBLU5YHC//i+FwdxO0bzHOuZcQZ
	mi/reLN9sL6ewEMcBy7lVMdwU1kbJ4kTP505Osak=
Content-Type: multipart/mixed; boundary="===============7993253791503305356=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ot-br-posix: upgrading to 20230710 FAILED
Message-ID: <0101018b9851b95f-aa698ea2-7276-4c3c-81b3-1205968a00c3-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106232

--===============7993253791503305356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ot-br-posix* to *20230710* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ot-br-posix -V 20230710 -S 790dc775144e33995cd1cb2c15b348849cacf737
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
meta-webserver       = "tmp-auh-upgrades:52c12a76b270e77480565839706ccd9990bfe5b7"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104024707.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104024707.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
ERROR: Applying patch '0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/ot-br-posix/0.3.0+git/devtooltmp-0vzbl6jq/workdir/git'
CmdError('sh -c \'PATCHFILE="0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmpoq3y8xlv --author="Peter Korsgaard <peter@korsgaard.com>" --date="Mon, 27 Aug 2018 22:50:57 +0200"\'', 0, 'stdout: On branch devtool-orig
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
\tmodified:   third_party/openthread/repo (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

stderr: ')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/ot-br-posix/0.3.0+git/devtooltmp-0vzbl6jq/temp/log.do_patch.701010
ERROR: Extracting source for ot-br-posix failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7993253791503305356==--

