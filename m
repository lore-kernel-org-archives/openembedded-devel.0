Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035F3C4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:12:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.3425.1699067573648469004
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c15hL1v6;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=G8Fxg4+U;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b9851b22a-b44410a6-26fe-4d03-815d-11b42902625e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aoF826OdMn671PL9YdoZuBIAqy0Hd6wOcVkGxd1FUU8=;
	b=c15hL1v6VsRQ5D9jZy8rlmLrIFAdHwIh1EFGTuSFF5ivoBTdha2qangWY02KC2vC
	ExQ/b0z6Ci6eqTBVnmRThPq47J2saoqRdQ3n0/I44GwSqZZ9jFPfo20HpGe3c/ebOy0
	8WbvGod0FR/mczP93qY6alCp0/WMWgjZuhdXUlnk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aoF826OdMn671PL9YdoZuBIAqy0Hd6wOcVkGxd1FUU8=;
	b=G8Fxg4+UZArefapUufZxys1v76o71lghS1jjhT8h88MMX02dQA6yNxX4brmu3n1L
	NvgQay57gBXeIqVkM/DMjf2Gh7DgNJ9JbSeCJpw+QGZynSceqf8ve8pXwZkdXAIe/Tj
	iS9jnZUta7MuTSURjpUM85ZzYcBwGsonzhqCBc0E=
Content-Type: multipart/mixed; boundary="===============8547948137407908590=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] celt051: upgrading to 0.11.3 FAILED
Message-ID: <0101018b9851b22a-b44410a6-26fe-4d03-815d-11b42902625e-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:52 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:12:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106195

--===============8547948137407908590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *celt051* to *0.11.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe celt051 failed.
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
meta-webserver       = "tmp-auh-upgrades:5d31c82493584b315bf51585af1d548ac4b205a4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6c28805c56d562bec56cc0b31c0d5905ebb5a6ac
WARNING: Command 'git rebase 6c28805c56d562bec56cc0b31c0d5905ebb5a6ac' failed:
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
Auto-merging libcelt/Makefile.am
CONFLICT (content): Merge conflict in libcelt/Makefile.am
Auto-merging libcelt/celt.c
CONFLICT (content): Merge conflict in libcelt/celt.c
Auto-merging libcelt/celt.h
CONFLICT (content): Merge conflict in libcelt/celt.h
Auto-merging libcelt/celt_header.h
CONFLICT (content): Merge conflict in libcelt/celt_header.h
Auto-merging libcelt/dump_modes.c
CONFLICT (content): Merge conflict in libcelt/dump_modes.c
Auto-merging libcelt/header.c
CONFLICT (content): Merge conflict in libcelt/header.c
Auto-merging libcelt/modes.c
CONFLICT (content): Merge conflict in libcelt/modes.c
Auto-merging libcelt/testcelt.c
CONFLICT (content): Merge conflict in libcelt/testcelt.c
Auto-merging tests/Makefile.am
CONFLICT (content): Merge conflict in tests/Makefile.am
Auto-merging tools/Makefile.am
CONFLICT (content): Merge conflict in tools/Makefile.am
Auto-merging tools/celtclient.c
CONFLICT (content): Merge conflict in tools/celtclient.c
Auto-merging tools/celtdec.c
CONFLICT (content): Merge conflict in tools/celtdec.c
Auto-merging tools/celtenc.c
CONFLICT (content): Merge conflict in tools/celtenc.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/celt051
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/celt051/celt051_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8547948137407908590==--

