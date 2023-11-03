Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D53F2C27C57
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.63884.1699041169953094075
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Um5XcdHS;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AqkfNv2k;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bef4a2-799f4b8f-fbdd-4d5c-90cf-482367e4c917-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041178;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ggU2XOMuG9m8xFCIW1EQq6hKTzbHX21nDEbFe/gG874=;
	b=Um5XcdHSM8nXNhlaD4xD4fUAQ4aGVA3dwBLWv5+EUWy8riEVNyN8k4KJJlkyLyOa
	mdWeqKAit07tsWoo1xx7lGp3DhzlAGzx+ANCI9U1tdy+9VELcLp5YUfqBEgcN0ovxPM
	S+AXStQs2NnvTlN0JCIjpEutP6QMMybejrRhqzW4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041178;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ggU2XOMuG9m8xFCIW1EQq6hKTzbHX21nDEbFe/gG874=;
	b=AqkfNv2kwqqR1sMY4H+cRg3WJac/mTMfKV7sSo7ryD6gTugMVtSgwFRoRVLLcyNR
	yZO6Gr5jPIE3C93rfBlDHReUDAMt75oW64lgATwexqcR2iKCNu56BaYLx/kwBhZgNTn
	OBAbztABS5IoYfiWuORyV7U3PDMBZ+awBgoMVSdQ=
Content-Type: multipart/mixed; boundary="===============0135726330115146390=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] serial-forward: upgrading to 0710 FAILED
Message-ID: <0101018b96bef4a2-799f4b8f-fbdd-4d5c-90cf-482367e4c917-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:58 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106033

--===============0135726330115146390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *serial-forward* to *0710* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe serial-forward failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5040 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:81123b9f2daaf672917b464b0e080c5b54922a75"
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
INFO: Rebasing devtool onto 89b1988b0ecaff1059cfbbb1545c0bd44fce87d8
WARNING: Command 'git rebase 89b1988b0ecaff1059cfbbb1545c0bd44fce87d8' failed:
Auto-merging fsoaudiod/configure.ac
CONFLICT (content): Merge conflict in fsoaudiod/configure.ac
Auto-merging fsodatad/configure.ac
CONFLICT (content): Merge conflict in fsodatad/configure.ac
Auto-merging fsodeviced/configure.ac
CONFLICT (content): Merge conflict in fsodeviced/configure.ac
Auto-merging fsogsmd/configure.ac
CONFLICT (content): Merge conflict in fsogsmd/configure.ac
Auto-merging fsonetworkd/configure.ac
CONFLICT (content): Merge conflict in fsonetworkd/configure.ac
Auto-merging fsosystemd/configure.ac
CONFLICT (content): Merge conflict in fsosystemd/configure.ac
Auto-merging fsotdld/configure.ac
CONFLICT (content): Merge conflict in fsotdld/configure.ac
Auto-merging fsousaged/configure.ac
CONFLICT (content): Merge conflict in fsousaged/configure.ac
Auto-merging libfsobasics/configure.ac
CONFLICT (content): Merge conflict in libfsobasics/configure.ac
Auto-merging libfsoframework/configure.ac
CONFLICT (content): Merge conflict in libfsoframework/configure.ac
Auto-merging libfsoresource/configure.ac
CONFLICT (content): Merge conflict in libfsoresource/configure.ac
Auto-merging libfsosystem/configure.ac
CONFLICT (content): Merge conflict in libfsosystem/configure.ac
Auto-merging libfsotransport/configure.ac
CONFLICT (content): Merge conflict in libfsotransport/configure.ac
Auto-merging libgsm0710mux/configure.ac
CONFLICT (content): Merge conflict in libgsm0710mux/configure.ac

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/serial-forward
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/serial-forward/serial-forward_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0135726330115146390==--

