Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BA7C4332F
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:48 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62968.1699041164665655841
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=J6YFckAY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=X+/tT0Uo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96beb995-72923ec2-4c26-4416-a7af-ae9301fd58de-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9VvQFjNW6ip4fqZ4ai1Yqx4DmsGPxs6cS2sCY+MXqDM=;
	b=J6YFckAYLDv1TE9AofNjN5885xjPrD8/lxAuzdsXGa6ZRtPD8uUmas8KK73+2N42
	+MHCVYL6KmS3qstjfJ1dpbH1oXb+q/LG/8UhNRj44K2pfRzkr4PHuwnOG+pZ29ZuMlQ
	wrTt/kV4BU3VbbHHdSD0VwXhmF4eS4itp/YtJbqQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9VvQFjNW6ip4fqZ4ai1Yqx4DmsGPxs6cS2sCY+MXqDM=;
	b=X+/tT0UoYyfHAiU4Bzm467qiS9oQ7p0WgOFJVJ0W+fgLRmCqNy+/JrW92WqvmykF
	j0gfEZnqMA2DD4lMSLa0pGGn1ctjJG3xGq6crpNI4Dc/24U1wVBdxvvgvjABW4H/k2E
	T/Uig3Rj/x2FEqSHkrzsRJqqlZuXPwpcphs17iXQ=
Content-Type: multipart/mixed; boundary="===============5287549601274477474=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] android-tools: upgrading to 341027030 FAILED
Message-ID: <0101018b96beb995-72923ec2-4c26-4416-a7af-ae9301fd58de-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:43 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105873

--===============5287549601274477474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *android-tools* to *341027030* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade android-tools -V 341027030 -S 77f95fb890620c2b2bd6059a0125c8acd824a64a
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
meta-webserver       = "tmp-auh-upgrades:167fd570683b8ba9510405ba4a66cde1544522f3"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 20 Local 20 Mirrors 0 Missed 0 Current 10 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 77f95fb890620c2b2bd6059a0125c8acd824a64a' failed with exit code 128:
fatal: reference is not a tree: 77f95fb890620c2b2bd6059a0125c8acd824a64a



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5287549601274477474==--

