Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AE1C07208
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3553.1699067574298265018
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N2QAm915;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gJtcDWH8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b9851b4d8-247d9a76-2037-4e7b-9055-65d0b83be5a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GJ2a8SiRuRqHVzaZZBh7NoraEmUjecAxrJg4X1hi8TI=;
	b=N2QAm915SXTYj2s/JwAwSqMLNaij6ltOZyMZT+sBuh47cF/f+EXubACNhfi04v0+
	QEj+N5+vx8pJObhfZBGoZ2sX8k03+ZtaGx9L3sC84y6U4OafA4CQXmE3D3Gknp7FgpB
	zMhZ9sH4x7bXz5sMUAv8sv+1gkW8l8rI/ZzxrIyw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067573;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GJ2a8SiRuRqHVzaZZBh7NoraEmUjecAxrJg4X1hi8TI=;
	b=gJtcDWH8PNwRJZQTWjMISsWJVOjNSa91L5SrbrdBSBfHmWod/NA7iiJ1eptu46Hu
	+NAr1W+RH2DVf13+3ZqrAc23H9ffBq0qDgfnQRvbhoDyCe7ODI2szHhpaundragqq1A
	+GBA4sbjQ+oT/AwitwCZDrU2B7OeVdL4mgOG8/uM=
Content-Type: multipart/mixed; boundary="===============4094749122660371684=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] freeradius: upgrading to 3.2.3 FAILED
Message-ID: <0101018b9851b4d8-247d9a76-2037-4e7b-9055-65d0b83be5a3-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106199

--===============4094749122660371684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *freeradius* to *3.2.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe freeradius failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4888 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:bc321736b97ea68814607226c414dbbdfe8ced28"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto db3d1924d9a2e8d37c43872932621f69cfdbb099
WARNING: Command 'git rebase db3d1924d9a2e8d37c43872932621f69cfdbb099' failed:
Auto-merging VERSION
CONFLICT (content): Merge conflict in VERSION
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog
Auto-merging doc/ChangeLog
CONFLICT (content): Merge conflict in doc/ChangeLog
Auto-merging redhat/freeradius.spec
CONFLICT (content): Merge conflict in redhat/freeradius.spec
Auto-merging suse/freeradius.spec
CONFLICT (content): Merge conflict in suse/freeradius.spec

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/freeradius
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/freeradius/freeradius_3.2.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4094749122660371684==--

