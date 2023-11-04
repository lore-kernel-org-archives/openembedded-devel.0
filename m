Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81821C07208
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.2290.1699061896004242802
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MZLMjLqU;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iZ0wZ88n;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b97fb15e2-d64ee8d0-6c36-4341-94a4-0ad809525af3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HeKX1C5VMcUYkxXX0ha3uR9Gz/y349bZUXHXw0dyrXg=;
	b=MZLMjLqU1HdSnvOsNduotDe5DyRsLnWMu27uYhYZQ3PZcqpxpRDc+nY/U5I5ldxh
	wqNtNZvJsi42N0sOfFkdaLZdG1OGYC+BjqYPvMzxSj46CQ3qe/wCMYFOZt+KwzaYuuK
	Lkw70AifmYlrtUfPhMGLdHqQkFE+D2MxIJXlCvE0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061896;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HeKX1C5VMcUYkxXX0ha3uR9Gz/y349bZUXHXw0dyrXg=;
	b=iZ0wZ88nuJnOhj+lK4aOwzTv0CtZmYNiiFALVxNZxKnmQGTt5JHIBkbJRgW2Pxr1
	g5TID7ohMrf1nOmzChd/kv+iozO5N7FJ+ngv4/LM8kTj8KBQvl0s2dQhZj2+PkY/VO9
	YoiaQqG9+XU/DEe34Dqdr9OSZ15j1XfLM202T684=
Content-Type: multipart/mixed; boundary="===============2887460627368220632=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-pybind11: upgrading to 2687. FAILED
Message-ID: <0101018b97fb15e2-d64ee8d0-6c36-4341-94a4-0ad809525af3-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106147

--===============2887460627368220632==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pybind11* to *2687.* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-pybind11 -V 2687. -S 0c395cfe1fb6cabbaa429a96d20039861fc71524
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5038 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:41887af7fed02484ad74e91bfd92474b24910d98"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
ERROR: Revision 0c395cfe1fb6cabbaa429a96d20039861fc71524 was found on multiple branches: 
  
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2887460627368220632==--

