Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F1DC25B63
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.62991.1699041170566810194
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q0ulQLDj;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=NCUZa2Dn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96bedf21-23b954dc-a927-4efe-aabd-c95eb15ff140-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=luvE0rE0V/k4Bd+MgMVlouwu85LiY6vKsttCh9BiKXc=;
	b=Q0ulQLDjwRp7DYYPjGkEcZlMqEauQULn9do9Qdric1/Sii4WEkHW4BpD4wEf6iEA
	yNybOMxEC7k0DbNLrndmUJF2ltBv7jm2xtsvpg3rS4DH2v6XAydiOi7ry5mRaxJCW2h
	qIZK/Tdo3NOtseyKHyhADoJcWstKQrp6Oxmabs1o=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=luvE0rE0V/k4Bd+MgMVlouwu85LiY6vKsttCh9BiKXc=;
	b=NCUZa2DnVBsYGFsm6WvuYvCjtxnGJuR9czV4t8dbPyNw7863nUkt5Xx4V4o1E2gx
	hjc3dXZBELzqZehDOeWU31SPavMAyJvBuQXYAQccefPJxGetwrMAQh7GtpfhV4ILS6Q
	n1EIS6bu0gWWj6WSPvxZ2HR/UBbDe6KuJP3jY7Gc=
Content-Type: multipart/mixed; boundary="===============2612140478200965755=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] protobuf: upgrading to 25.0 FAILED
Message-ID: <0101018b96bedf21-23b954dc-a927-4efe-aabd-c95eb15ff140-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106007

--===============2612140478200965755==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *protobuf* to *25.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe protobuf failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5033 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:71347aff28bf1d0da9fed848dd998b67066468d7"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 6b5d8db01fe47478e8d400f550e797e6230d464e
WARNING: Command 'git rebase 6b5d8db01fe47478e8d400f550e797e6230d464e' failed:
Auto-merging .github/workflows/test_cpp.yml
CONFLICT (content): Merge conflict in .github/workflows/test_cpp.yml
Auto-merging src/google/protobuf/port_def.inc
CONFLICT (content): Merge conflict in src/google/protobuf/port_def.inc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-mips onto 6b5d8db01fe47478e8d400f550e797e6230d464e
WARNING: Command 'git rebase 6b5d8db01fe47478e8d400f550e797e6230d464e' failed:
Auto-merging .github/workflows/test_cpp.yml
CONFLICT (content): Merge conflict in .github/workflows/test_cpp.yml
Auto-merging src/google/protobuf/port_def.inc
CONFLICT (content): Merge conflict in src/google/protobuf/port_def.inc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-mipsel onto 6b5d8db01fe47478e8d400f550e797e6230d464e
WARNING: Command 'git rebase 6b5d8db01fe47478e8d400f550e797e6230d464e' failed:
Auto-merging .github/workflows/test_cpp.yml
CONFLICT (content): Merge conflict in .github/workflows/test_cpp.yml
Auto-merging src/google/protobuf/port_def.inc
CONFLICT (content): Merge conflict in src/google/protobuf/port_def.inc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-toolchain-clang onto 6b5d8db01fe47478e8d400f550e797e6230d464e
WARNING: Command 'git rebase 6b5d8db01fe47478e8d400f550e797e6230d464e' failed:
Auto-merging .github/workflows/test_cpp.yml
CONFLICT (content): Merge conflict in .github/workflows/test_cpp.yml
Auto-merging src/google/protobuf/port_def.inc
CONFLICT (content): Merge conflict in src/google/protobuf/port_def.inc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/protobuf
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/protobuf/protobuf_25.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2612140478200965755==--

