Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3109C25B6A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.63872.1699041166191524446
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NEEsuPOd;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=orqDR+gi;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bed697-0624fa75-6057-4959-9735-dca484619eee-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=WM1AOk+gcl1f+OCsu8ptav449DtlA948i3OyqvxirQw=;
	b=NEEsuPOdb/DIBGH83E6lRrAd4HQSHcVtfodzM7/KH87qfMTOHSM6tjRq8OlFOiNa
	mtRMOHeaT6oz9BPG1NrYv5o3mUldVmV/PoV4tGitgalfo1vc55Zo/ZqB7UUKnSxv3Tt
	6JBgkC7tEiAuoh8ZS/1CjxAkrUPTUKK6OD8u7Ov0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=WM1AOk+gcl1f+OCsu8ptav449DtlA948i3OyqvxirQw=;
	b=orqDR+giQe8WMjgnwN8UM5Y7mUoZsN/WCV6QfDsa8GG3I/FOWs9HZaOqj3b7vLEg
	IqQkh2+WwiAYyFdOw5wAnj0o2Hqrob5KMm3uoluN4E1Sx6irqJpV+Hy+oTaqM8mcDg/
	OQLBmmg/UTDFPfAsHmOYZjTmeh/J497XwZRcXrsw=
Content-Type: multipart/mixed; boundary="===============5031436454089407126=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] opencv: upgrading to 4.8.1 FAILED
Message-ID: <0101018b96bed697-0624fa75-6057-4959-9735-dca484619eee-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106004

--===============5031436454089407126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *opencv* to *4.8.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade opencv -V 4.8.1 -S 5199850039ad23f1f0e6cccea5061a9fea5efca6
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5013 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:a1dbc55905e764117f9d4842c6a0e22a8e2fb370"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 104 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 5199850039ad23f1f0e6cccea5061a9fea5efca6' failed with exit code 128:
fatal: reference is not a tree: 5199850039ad23f1f0e6cccea5061a9fea5efca6



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5031436454089407126==--

