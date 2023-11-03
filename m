Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72507C07CA9
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63868.1699041166053805877
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=c9+6XGX7;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eTJZJO42;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bec027-3764aa00-d3ba-4d9b-a2c2-d935e5a88527-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/y8F2wUSnBfDdXlo+Ig6AV58ZmJLUMo1x46pa6l8TOM=;
	b=c9+6XGX7fYGdVK9Uo65v0+V/uqp9O6IXCA6IHrbOMjiTImicsxjpgjQdhI9T/52N
	V5kWk36r2MsdvNbIkpJ0cbN9OksOFZ1e3dQzXseOYUsBX42uueCXWOaHTAoHmqzn35R
	yjIWzcaK6jd0hkGqaa9NtcY2Mn9bZdk5u8i2UvKI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/y8F2wUSnBfDdXlo+Ig6AV58ZmJLUMo1x46pa6l8TOM=;
	b=eTJZJO42P4JJ9fGH6OHpolfMyicxNN+trKPTjZJnlMwZVkF6suQHENUnmvFrHMV1
	dLsBKtNyfnGKpB05yzrU0FuHIKgcRi7bZicZqpFfVsceFZwy1hB7JRZorPiy9+AGkig
	htuVkgvlbLUGlXMAnk9Q/ZhAVMr99E5Ke/XGaTac=
Content-Type: multipart/mixed; boundary="===============1065706792376896203=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] crucible: upgrading to 2023.11.02 FAILED
Message-ID: <0101018b96bec027-3764aa00-d3ba-4d9b-a2c2-d935e5a88527-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105894

--===============1065706792376896203==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *crucible* to *2023.11.02* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade crucible -V 2023.11.02 -S 358b5e7adb7f101f870f2b42fe5371460a3cccb6
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4911 entries from dependency cache.
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
ERROR: Execution of 'git checkout 358b5e7adb7f101f870f2b42fe5371460a3cccb6' failed with exit code 128:
fatal: reference is not a tree: 358b5e7adb7f101f870f2b42fe5371460a3cccb6



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============1065706792376896203==--

