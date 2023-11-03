Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E6CC001B2
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.63863.1699041165611404386
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=XqnTUKvv;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ExV3o0ln;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bee58c-2f4bc130-506d-4784-9a8e-677420c52ab9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tQsn9uB7BBVTkpBFS6RlMpDV26J5lfJgJxmj2Ydva8c=;
	b=XqnTUKvv+rBnICqwsrfl881UWxyKhLxEH1QEd2E08KmWUofHOF6G2fKi2kbm8/h2
	LXY/uhy94WVxkjeSIbmSFwDU//MsPZnqMefK+zjAqH5MTD+4H+9LH9V5+/8P3GgAFs7
	3PyECyKU90zqOuGB0IbZzzCOEqE82zzY80UUFyns=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tQsn9uB7BBVTkpBFS6RlMpDV26J5lfJgJxmj2Ydva8c=;
	b=ExV3o0lnNxevFrHj22BjMXOHB7Li0n3MBsMNlLx3bg5eTw6aEzS3KindC1PiSP2P
	NZi/21xApXwPi11K/0dCN5FTc3qKYsoY7u6ptJ+y4SFuLmbbaGhY2EIec1yfbJu1o1s
	irKAf8oOBU9vSDYNgLYXqSTrC2jyFpb7qxwexito=
Content-Type: multipart/mixed; boundary="===============6641346420210569402=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] tipcutils: upgrading to 3.0.4 FAILED
Message-ID: <0101018b96bee58c-2f4bc130-506d-4784-9a8e-677420c52ab9-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106018

--===============6641346420210569402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *tipcutils* to *3.0.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe tipcutils failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5051 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:61ae2fbda92ae09376af305a2266eb79abb39458"
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
INFO: Rebasing devtool onto 63d1d465a7c27d661f29d11803c354bda10df53c
WARNING: Command 'git rebase 63d1d465a7c27d661f29d11803c354bda10df53c' failed:
Auto-merging demos/benchmark/benchmark_client.c
CONFLICT (content): Merge conflict in demos/benchmark/benchmark_client.c
Auto-merging demos/benchmark/benchmark_server.c
CONFLICT (content): Merge conflict in demos/benchmark/benchmark_server.c
Auto-merging demos/benchmark/common_tipc.h
Auto-merging demos/inventory_sim/inventory_sim.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/tipcutils
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/tipcutils/tipcutils_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6641346420210569402==--

