Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 527CBC25B5A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63871.1699041166188751429
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FTjkIgJb;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=IvdAnRI9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bede74-ebc2f971-f615-4b11-b860-ff6661c18283-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Neby8KMadKVIJTml/FcTxVC2g7gO2sI1qiZww7tpWsM=;
	b=FTjkIgJb1l+XgjW6R2StJtY2Bmxd23vT6sAyTVJWHzzP60tZLXzwR2WM+7gVJLFG
	2Y9dC+Rj7BxKtNz3hDVgEScQy6eEg9IhVHEsA1vJccuAq6EZY4g45DVoueLMPqZE41k
	JJZmpFGF6P0bu1ujVVwG4TyyvMV73WeLxwzGvCRY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Neby8KMadKVIJTml/FcTxVC2g7gO2sI1qiZww7tpWsM=;
	b=IvdAnRI9z+GIvpg9jCWW685RH8C9DS+txAQySy60IGeIxBOQtG6R/uA4OIvfmZJn
	LgpqkQBrHh4hVRe6gmSNh5F5dP77GAcbEbhdNGyIJihVQvHzdYGE2vSpCX3pjRFtZzE
	Rl1ChmQakeZ7eF0u3VsXPq7oIS84viMF6Whz2DRc=
Content-Type: multipart/mixed; boundary="===============8094718835176023509=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] rocksdb: upgrading to 8.6.7 FAILED
Message-ID: <0101018b96bede74-ebc2f971-f615-4b11-b860-ff6661c18283-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106005

--===============8094718835176023509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rocksdb* to *8.6.7* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rocksdb failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5036 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:f5d126ab0935bc49ee32524380746c2739851f91"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto cb7a5e02edeb883193eb5b4901d5943f58e9add9
WARNING: Command 'git rebase cb7a5e02edeb883193eb5b4901d5943f58e9add9' failed:
Auto-merging HISTORY.md
Auto-merging db/db_test2.cc
CONFLICT (content): Merge conflict in db/db_test2.cc
Auto-merging db/version_edit_handler.cc
CONFLICT (content): Merge conflict in db/version_edit_handler.cc
Auto-merging db/version_edit_handler.h
Auto-merging db/version_set.cc
CONFLICT (content): Merge conflict in db/version_set.cc
Auto-merging db/version_set.h
CONFLICT (content): Merge conflict in db/version_set.h
Auto-merging include/rocksdb/options.h
CONFLICT (content): Merge conflict in include/rocksdb/options.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-mips onto cb7a5e02edeb883193eb5b4901d5943f58e9add9
WARNING: Command 'git rebase cb7a5e02edeb883193eb5b4901d5943f58e9add9' failed:
Auto-merging HISTORY.md
Auto-merging db/db_test2.cc
CONFLICT (content): Merge conflict in db/db_test2.cc
Auto-merging db/version_edit_handler.cc
CONFLICT (content): Merge conflict in db/version_edit_handler.cc
Auto-merging db/version_edit_handler.h
Auto-merging db/version_set.cc
CONFLICT (content): Merge conflict in db/version_set.cc
Auto-merging db/version_set.h
CONFLICT (content): Merge conflict in db/version_set.h
Auto-merging include/rocksdb/options.h
CONFLICT (content): Merge conflict in include/rocksdb/options.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-powerpc onto cb7a5e02edeb883193eb5b4901d5943f58e9add9
WARNING: Command 'git rebase cb7a5e02edeb883193eb5b4901d5943f58e9add9' failed:
Auto-merging HISTORY.md
Auto-merging db/db_test2.cc
CONFLICT (content): Merge conflict in db/db_test2.cc
Auto-merging db/version_edit_handler.cc
CONFLICT (content): Merge conflict in db/version_edit_handler.cc
Auto-merging db/version_edit_handler.h
Auto-merging db/version_set.cc
CONFLICT (content): Merge conflict in db/version_set.cc
Auto-merging db/version_set.h
CONFLICT (content): Merge conflict in db/version_set.h
Auto-merging include/rocksdb/options.h
CONFLICT (content): Merge conflict in include/rocksdb/options.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-riscv32 onto cb7a5e02edeb883193eb5b4901d5943f58e9add9
WARNING: Command 'git rebase cb7a5e02edeb883193eb5b4901d5943f58e9add9' failed:
Auto-merging HISTORY.md
Auto-merging db/db_test2.cc
CONFLICT (content): Merge conflict in db/db_test2.cc
Auto-merging db/version_edit_handler.cc
CONFLICT (content): Merge conflict in db/version_edit_handler.cc
Auto-merging db/version_edit_handler.h
Auto-merging db/version_set.cc
CONFLICT (content): Merge conflict in db/version_set.cc
Auto-merging db/version_set.h
CONFLICT (content): Merge conflict in db/version_set.h
Auto-merging include/rocksdb/options.h
CONFLICT (content): Merge conflict in include/rocksdb/options.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/rocksdb
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/rocksdb/rocksdb_8.6.7.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============8094718835176023509==--

