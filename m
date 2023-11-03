Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8053C25B6B
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62982.1699041167393020758
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Q8By0Htz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=afrpMP9Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bee111-02697d42-2e38-4faa-b44f-afa043a09e46-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=SBgHYSDJqhWReybty85qpFMUIZhE7ot3242YFOSbxbM=;
	b=Q8By0Htz4CVnJOiBMUo55+ZnaAx5GEcCEkLIOkd467H203xhHQkGLGIAhMsZVIi2
	vkQcc0n4NbaUqqMT1WVhI+GQjOzBg7r/ZcT0/CV4074iii0blBOYPWCcJ+AoumsPhQF
	3Ew3H05VHq/QjW5oMEvmSiXFv+U5L+FS8L5Su6RQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=SBgHYSDJqhWReybty85qpFMUIZhE7ot3242YFOSbxbM=;
	b=afrpMP9ZY8TBDZYbSVLT5s7HH7HTnrBzJ/Iq6hPDHSDE31OuMLgf9eXckiRStAMA
	9XebL1dnz5kWGGiHcHlaxM/wXtVR4P4rLVKG1z6pAvgI8DegHwmz844wea4XiCqH8E0
	+Lts+22bk+ovmVwv5l2efeSFIcYIfsQKGzDcsB9g=
Content-Type: multipart/mixed; boundary="===============7576251105308225641=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] snappy: upgrading to 1.1.10 FAILED
Message-ID: <0101018b96bee111-02697d42-2e38-4faa-b44f-afa043a09e46-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106015

--===============7576251105308225641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *snappy* to *1.1.10* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe snappy failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5042 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:971cac256facef2a29de1658bed6042f18b6fa15"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto dc05e026488865bc69313a68bcc03ef2e4ea8e83
WARNING: Command 'git rebase dc05e026488865bc69313a68bcc03ef2e4ea8e83' failed:
Auto-merging snappy.cc
CONFLICT (content): Merge conflict in snappy.cc

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/snappy
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/snappy/snappy_1.1.10.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7576251105308225641==--

