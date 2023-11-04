Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9296BC05021
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.4516.1699074742682218967
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=LUEsSGNU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=M/KaBuLt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b98bf172d-681bc147-aad7-44e8-bbd6-a098a9a9407c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=TdYdup4upNRwcD4ikN5kk1m9yDh7Y4bfJORESGb+UDM=;
	b=LUEsSGNUwnnDPuPQ3oAn7sqNmiJXEahSCpB1lRzygOBnyA/ThgluUMHLFPT0OUWj
	rDtSjjL8BbKvoEWxtnlIOJqmAcWiZGK/JkwZUFip2EpUbCYwWf1VtxKTikhfucKH6Vc
	Wp/Dp7imY80BTdfgVsHEujTHMuqabkuPsljK6X6Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074742;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=TdYdup4upNRwcD4ikN5kk1m9yDh7Y4bfJORESGb+UDM=;
	b=M/KaBuLto9s5+cHaE5RQ/jfUZEv4+mMIhw88XejEr21/x8EzfjOR/LA1g/Cw5vr7
	yDcGqjWzWqy5OLXsxc4di8NHjZjsbWwfrw1/ZzBUugISZuSpXGiK+RH4/voY5x8Nonu
	j2yfddBWrbtHFKYUcLaK5RItG4JxhILwpOsrnZU8=
Content-Type: multipart/mixed; boundary="===============7651913302285178233=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] mypaint-brushes-1.0: upgrading to 2.0.2 FAILED
Message-ID: <0101018b98bf172d-681bc147-aad7-44e8-bbd6-a098a9a9407c-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106287

--===============7651913302285178233==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mypaint-brushes-1.0* to *2.0.2* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe mypaint-brushes-1.0 failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4905 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:5f45245fc81263f18c0ae4ddc90a8737f5af8af4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0df6d130152a94c3bd67709941978074a1303cc5
WARNING: Command 'git rebase 0df6d130152a94c3bd67709941978074a1303cc5' failed:
Auto-merging SConscript
CONFLICT (content): Merge conflict in SConscript
Auto-merging SConstruct
CONFLICT (content): Merge conflict in SConstruct
Auto-merging pkgconfig.pc.in
CONFLICT (content): Merge conflict in pkgconfig.pc.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/mypaint-brushes-1.0
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/mypaint-brushes-1.0/mypaint-brushes-1.0_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7651913302285178233==--

