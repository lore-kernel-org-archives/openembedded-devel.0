Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08BBCC05020
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 20:02:29 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.63220.1699041738673952994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 13:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=huVBSReE;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rYA8vNzi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96c77d93-3968e885-9bb0-43bb-b3a0-f269e69e181b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dMakh4W+jComyalzTpMrlC2NDsaVVuf/DL/wqFivjxw=;
	b=huVBSReEGd2/epjxu2E13xqu/S19Z35/tWjXTRAwzGzi2ccklGwxIij/j3OGRJOz
	i8ne86oI79hagJb+5Zlk7RoznK+gcY04Fv8K5TCvLCelfsxDlNuAPNcsRyLgko8ic8W
	0kpVbz8s4DyOvYg/VypGVZr+40JJV3SFo/QFikf4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041738;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dMakh4W+jComyalzTpMrlC2NDsaVVuf/DL/wqFivjxw=;
	b=rYA8vNziZVNOLtd8Tz6QlODBs0Ur29OxDy+ppzSvPcQNRP2OGGKwlKXyBLkzG0FO
	8PjoJjyDq34B0ncMKtJ2fGX2EyIwGtcMtTIqHyl8T9KMKBLFVn1xzgUIDrpYtFMQIxe
	QVkr5qUqf7/6SfhX4JmvlG+kQx4IH215l2y+5vto=
Content-Type: multipart/mixed; boundary="===============4444247626302850530=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] poco: upgrading to 1.12.5 FAILED
Message-ID: <0101018b96c77d93-3968e885-9bb0-43bb-b3a0-f269e69e181b-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 20:02:18 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 20:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106056

--===============4444247626302850530==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *poco* to *1.12.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe poco failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5026 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:d427cd5f1636031920196e45fcf22fc7b124dde8"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c51a5679b51fc1c128ddd25bf74b0fe7883a1690
WARNING: Command 'git rebase c51a5679b51fc1c128ddd25bf74b0fe7883a1690' failed:
Auto-merging .github/workflows/ci.yml
Auto-merging CHANGELOG
CONFLICT (content): Merge conflict in CHANGELOG
Auto-merging Crypto/include/Poco/Crypto/OpenSSLInitializer.h
Auto-merging Crypto/src/OpenSSLInitializer.cpp
Auto-merging DLLVersion.rc
CONFLICT (content): Merge conflict in DLLVersion.rc
Auto-merging Data/MySQL/src/ResultMetadata.cpp
Auto-merging Data/MySQL/testsuite/src/MySQLTest.cpp
Auto-merging Data/MySQL/testsuite/src/SQLExecutor.cpp
Auto-merging Foundation/include/Poco/Event_POSIX.h
CONFLICT (content): Merge conflict in Foundation/include/Poco/Event_POSIX.h
Auto-merging Foundation/include/Poco/Platform.h
Auto-merging Foundation/include/Poco/Version.h
CONFLICT (content): Merge conflict in Foundation/include/Poco/Version.h
Auto-merging Foundation/src/MD4Engine.cpp
CONFLICT (content): Merge conflict in Foundation/src/MD4Engine.cpp
Auto-merging Foundation/src/MD5Engine.cpp
CONFLICT (content): Merge conflict in Foundation/src/MD5Engine.cpp
Auto-merging Foundation/src/SHA1Engine.cpp
CONFLICT (content): Merge conflict in Foundation/src/SHA1Engine.cpp
Auto-merging Net/Net_vs170.vcxproj
CONFLICT (content): Merge conflict in Net/Net_vs170.vcxproj
Auto-merging Net/src/PollSet.cpp
Auto-merging Net/testsuite/TestSuite_vs170.vcxproj
CONFLICT (content): Merge conflict in Net/testsuite/TestSuite_vs170.vcxproj
Auto-merging Net/testsuite/src/PollSetTest.cpp
Auto-merging VERSION
CONFLICT (content): Merge conflict in VERSION
Auto-merging doc/99100-ReleaseNotes.page
Auto-merging libversion
CONFLICT (content): Merge conflict in libversion

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/poco
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/poco/poco_1.12.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4444247626302850530==--

