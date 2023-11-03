Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7BFC05021
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:07 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.62986.1699041168460482837
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AAwjHttR;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=BRsamlrE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018b96bee791-e5054e81-1a41-4223-b97e-9b705bf4b818-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=tbDm12aCuEDq0q3WFi58hnCa+i4aG3alls5dL+127JU=;
	b=AAwjHttRINKjQhSy+BPzYCyyXFWX3lKpjUloLYfdE20sGPW5nDRcvoZ/imkYRQ/M
	YXVMHvgf5cfQXaXnYA8ayMhAQUCYvnD+2J53O77pZ1yT0ylXR9J7m+Q5quqSs0HSIhE
	GMp6KEbDC1NqRcLw/L30VCyGVwpyPQFN/YvMri0k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041175;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=tbDm12aCuEDq0q3WFi58hnCa+i4aG3alls5dL+127JU=;
	b=BRsamlrE2SQLOSGW0FgpwQ7+2i3+e5+R0urAuOV37mpfHTqe71MlYq9bnKcEbkaO
	Qlk08pF5LIO0Rl0Cp9npFX324PnXepj0B1u+iDeKZLU7TQynnIZX4x3k63gFAG+8EUq
	m63yP/HbTlhkGB0TPm7+dKoJBHcvMtiY+ok6qSbk=
Content-Type: multipart/mixed; boundary="===============2575950538648726118=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] ttf-droid: upgrading to 341027030 FAILED
Message-ID: <0101018b96bee791-e5054e81-1a41-4223-b97e-9b705bf4b818-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.191
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106023

--===============2575950538648726118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ttf-droid* to *341027030* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ttf-droid -V 341027030 -S 9718a554feb77c300e7642585d1adad2fcaefa87
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5054 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:1e3ac4e1a3927b4621b54b9460c466433ba0d727"
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
ERROR: Execution of 'git checkout 9718a554feb77c300e7642585d1adad2fcaefa87' failed with exit code 128:
fatal: reference is not a tree: 9718a554feb77c300e7642585d1adad2fcaefa87



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2575950538648726118==--

