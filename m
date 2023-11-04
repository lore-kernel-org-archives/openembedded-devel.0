Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D41C4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:53:53 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5706.1699084423700641338
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AHIXPseI;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZCcVgDuh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b9952ce8c-43ba7e4d-684e-482b-ab63-bf3a0babcb91-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699084423;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=MmOfAAeiQAC+ojNx9Twyyoc8Hr7AOwdODyIH8dTLNzY=;
	b=AHIXPseIuBEAere8aSkrv/OLWv/YUr3lKE6llaC/niZi30O5g/5yw9uSgfP6CZSw
	RIPuDMw63tIXspfkLhmse+8jslT0ijBq0HqGjYoZc/jPJP0QXBei9C85vdpLwnvFim/
	MXYdsxm91arH6iHG3xmWv10qzJdbWbeUxqrd5bfs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699084423;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=MmOfAAeiQAC+ojNx9Twyyoc8Hr7AOwdODyIH8dTLNzY=;
	b=ZCcVgDuhDrJFUqE+oQuMHTaMMdlNxoJJCOjrHCgv/jdm+1usz4D519HB8I2OEcjs
	UkWUHqyFZQ+7rlipolaLmK9Y3wSO2YglodxcBuiJ83HlpQ6VkkLHC+fl8lU0xQ1kOZZ
	f7yBUrneZTiVUvFE0v60l8KN3qd6LxbqYlDgWjW0=
Content-Type: multipart/mixed; boundary="===============0341362122787888359=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ubi-utils-klibc: upgrading to 2.1.6 FAILED
Message-ID: <0101018b9952ce8c-43ba7e4d-684e-482b-ab63-bf3a0babcb91-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 07:53:42 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106365

--===============0341362122787888359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ubi-utils-klibc* to *2.1.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ubi-utils-klibc failed.
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
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 219e741f40f4801bae263e0b581b64888d887b4a
WARNING: Command 'git rebase 219e741f40f4801bae263e0b581b64888d887b4a' failed:
Auto-merging include/libmissing.h
CONFLICT (content): Merge conflict in include/libmissing.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/ubi-utils-klibc
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/ubi-utils-klibc/ubi-utils-klibc_2.1.6.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0341362122787888359==--

