Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF19C07CB1
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.62977.1699041166149435499
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YHXfJjwd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DSHahwf0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bec000-39f8f48c-3a7a-4eb1-a83e-1d13af273cbc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RNBqXpA7cg9/b+zp8viHaklye7TrDVmveGb8UuMFGDw=;
	b=YHXfJjwdkLdDi1u822ndyaa56E23H65k9mebEHcXkuoez/FHC/5E2ri5gViWp4E5
	ieybgL7HiZz+g2q4gDJ4eLFM47fc/PVV4D1UM0mDqmazHDZd/YtvYhKHpOuyKSQYdLH
	ohraLQK4OXGBrzPQhbGyqGuduVe573OmQ/ylyQh8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RNBqXpA7cg9/b+zp8viHaklye7TrDVmveGb8UuMFGDw=;
	b=DSHahwf0Tn2D6f1/ddgvh99+0pCP/UvXwegcl8pHWIw3D6CxM9Jv76ipCheKlLH6
	/ltoAG3ylyCjSZaGLmqdxsT9w/qFc6bYeWqJEu/zUI2HRxr3sU3DmnU6osvta1biQAf
	rNIgYiw3fl/1pC1Hd1hyIsb5Dhb7hvePIMaz65xY=
Content-Type: multipart/mixed; boundary="===============3431449073972501499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] cpp-netlib: upgrading to 505122 FAILED
Message-ID: <0101018b96bec000-39f8f48c-3a7a-4eb1-a83e-1d13af273cbc-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105897

--===============3431449073972501499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *cpp-netlib* to *505122* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe cpp-netlib failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4910 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:9a1a717062d2072ede68804b88b57c01aeae8250"
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
INFO: Rebasing devtool onto cf505122d72d7ca3376d2a2a160105cffbf64bcf
WARNING: Command 'git rebase cf505122d72d7ca3376d2a2a160105cffbf64bcf' failed:
Auto-merging boost/network/protocol/http/client/connection/async_normal.hpp
Auto-merging boost/network/protocol/http/client/connection/normal_delegate.hpp
CONFLICT (content): Merge conflict in boost/network/protocol/http/client/connection/normal_delegate.hpp
Auto-merging boost/network/protocol/http/client/connection/normal_delegate.ipp
CONFLICT (content): Merge conflict in boost/network/protocol/http/client/connection/normal_delegate.ipp
Auto-merging boost/network/protocol/http/client/connection/ssl_delegate.ipp
CONFLICT (content): Merge conflict in boost/network/protocol/http/client/connection/ssl_delegate.ipp

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/cpp-netlib
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/cpp-netlib/cpp-netlib_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============3431449073972501499==--

