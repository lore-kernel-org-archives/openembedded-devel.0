Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FD1C18E19
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:52 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.63877.1699041166970464217
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=f1cx1xhY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EeAUZ4Me;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101018b96bed103-59154fa8-20f3-49ec-bd03-c0b81269389d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I52zcHMWOqCo6chK2qEzjDrQMCE/lwC01yA8sYtjDOA=;
	b=f1cx1xhYbD84Fd1xEIpXTbbVJ2htQ6EUX1CaH7gTDCVVBCerykB4uNXBg3HVJcDL
	8JBjdfyGSGu91DtN009iRZsASVMFqrJOv/3NYm5U+dt1wnFHliDCh7JRTcFLI0SwsRq
	hVd8oLNwXwZf0V+0KogjX9ESDhbpIJOumlzbxnEc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041169;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I52zcHMWOqCo6chK2qEzjDrQMCE/lwC01yA8sYtjDOA=;
	b=EeAUZ4MeaC2XDX1Y5QBAF7wSXslrRMW1iJ/ICT0TdVy7hUcwGLPDw4UuNmKthXws
	fM5DioYCnXNHFxhxB5FhV7Auw/wZE7axJdMncblfI7Ua07TwJSxSWOFmoKx3zRa85aF
	n+Gixv4Jz65gyloNHKKPPAAM+/LJuzHxQrxAHg8Y=
Content-Type: multipart/mixed; boundary="===============0150962229784249034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libyui: upgrading to 43018 FAILED
Message-ID: <0101018b96bed103-59154fa8-20f3-49ec-bd03-c0b81269389d-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:49 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.45
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105979

--===============0150962229784249034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libyui* to *43018* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libyui failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4991 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e6aafd983f502f5b30478e415ed9628450cf2174"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee
WARNING: Command 'git rebase 7009e514ecafb1e25e0cc5a4ec1e731ff8af30ee' failed:
Auto-merging libyui/resource/template.spec.in
CONFLICT (content): Merge conflict in libyui/resource/template.spec.in

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libyui
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libyui/libyui_43018.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0150962229784249034==--

