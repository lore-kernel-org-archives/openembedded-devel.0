Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2871FC4167D
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:53:53 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.5553.1699084423550394435
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NEUhel3S;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=atfsScYh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b9952ce3f-9dc0c47f-e616-4409-a98f-62a315211b6e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084422;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IFNBb+if+bgzwx+PmtyQaOmTSZEAh+lr9dVtQ5CTPhM=;
	b=NEUhel3Sj9rZEnVEYMsfEvicH2+ka6nD/1Su8cjA7H+nBVjvr0p2euMTBuGiJX+h
	38Ck9u0BcYzLuCebp1RWLN2hv+BjHa21hF40+6S0OjUThtxUelbZMdwGKpripUgud+S
	/6CDmqGYfuAWJLlSLhq1s6SJIFPOJ2GgMDgXCg8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084422;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IFNBb+if+bgzwx+PmtyQaOmTSZEAh+lr9dVtQ5CTPhM=;
	b=atfsScYhPDSI7nq87KWTv+ZQn0z8PDHDpg/RSSWHiK9K+JXPeXcPqo8pciHOthJa
	2Vby33JXViYqU7U9x0PNX4woiNPPEHbQtcIlzneIjr3m9WXWJyb3wCGJZoxbWTt4Nm7
	KorYVfWl9AeWQjesxIK/LM02aPkodRtuEgca+l1o=
Content-Type: multipart/mixed; boundary="===============8473701040124979003=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] kexec-tools-klibc: upgrading to 20080324 FAILED
Message-ID: <0101018b9952ce3f-9dc0c47f-e616-4409-a98f-62a315211b6e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:53:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106364

--===============8473701040124979003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kexec-tools-klibc* to *20080324* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade kexec-tools-klibc -V 20080324 -S ec7651a039cff12008e94183a1e7be3de722e4be
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4886 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:ab1463cd31c53afbff4015f9642e3b38607948c8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-aarch64 onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-arm onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-mips onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-mipsel onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-powerpc onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-x86 onto ec7651a039cff12008e94183a1e7be3de722e4be
INFO: Rebasing devtool-override-x86-64 onto ec7651a039cff12008e94183a1e7be3de722e4be
ERROR: Could not decode SRC_URI: The URL: '${BUILD_PATCHES}' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8473701040124979003==--

