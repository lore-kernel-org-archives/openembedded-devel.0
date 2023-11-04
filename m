Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04712C05054
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 04:20:58 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.4232.1699071647693662660
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 21:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ADCGjiq+;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=DxyKEdQF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b988fdcba-333f0620-b5a2-4010-b614-cd2a927faaf5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Wtkztvk+sP2Gp+sYg0D+yHsPyrpKlCkUyl0ZS5TUh1A=;
	b=ADCGjiq+SQHRoLBm80EvZPaMYNYRw6a7HZzDhi6IkT0nV2fmIVTihoqMu3Y6iKPR
	KQsaE8d81bpTSe9ADGMZRri2Jk2wSWdFe8QK27SEw2VRtPfRFnbsPeqKev8KQaSHeZD
	CjAO6t49wC4VVuIze79/VvRd2n1ll4S2gdhYaFbA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699071647;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Wtkztvk+sP2Gp+sYg0D+yHsPyrpKlCkUyl0ZS5TUh1A=;
	b=DxyKEdQFQqWlJpLLKXx0gFjQdilj8dZfUuKlgYX8EMiF+heTwIP862cCxGoiwlyJ
	UFM33rnUF04XLGPt+MCiy4h7+ieTy+3thE8WSz4UD9ZDBt/yQgpE8ZOn2nhNpYp6TZ9
	Mbz0qBgkBgHn4bBDGiJpwXGGevcXo3cyKUbgsWpM=
Content-Type: multipart/mixed; boundary="===============7988525975400568204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] libupnp: upgrading to 1.14.18 FAILED
Message-ID: <0101018b988fdcba-333f0620-b5a2-4010-b614-cd2a927faaf5-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 04:20:46 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 04:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106257

--===============7988525975400568204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libupnp* to *1.14.18* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libupnp failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4907 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:df96c37cf20973cc015e73a0ef1e48b28a86559a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto c540ce2431bdeac73359029d4592b45790e1d154
WARNING: Command 'git rebase c540ce2431bdeac73359029d4592b45790e1d154' failed:
Auto-merging upnp/inc/ithread.h
CONFLICT (content): Merge conflict in upnp/inc/ithread.h

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/libupnp
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/libupnp/libupnp_1.14.18.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7988525975400568204==--

