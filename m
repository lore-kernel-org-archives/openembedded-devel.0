Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90626C25B68
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.62980.1699041166512237170
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=auQ7iSOk;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=T3WomCgm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101018b96bedf4f-856e36fa-6a89-4c6c-889d-3650ceba4d2d-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=9GbcyfDbi163Obr3Q6TNyw30oxhTyPq4tnUBLUkQFe0=;
	b=auQ7iSOkHQjR2UBCYL/9iH/HK9KPcBCRssVCmi1lJtUyaUFxzvra+REZ0rHNGLak
	OMjIc39/sB/q5RADyFk7fm+P6HqCi1A3vaMedvriNtjXr3RdTy4zH5xHEuB3o6fFsPL
	s3Dq2Fi12/8i2e+JvFmTyDn5DAdEETqU3WNSMTj0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041173;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=9GbcyfDbi163Obr3Q6TNyw30oxhTyPq4tnUBLUkQFe0=;
	b=T3WomCgmYFQBdxnWUcaeVCovILIqc+9RGe9Qs4eR/eftmF7BsVvrK4LYnggucPVe
	6HDb46RaYtBGuDdcVb79pI38Wcgnp//CwnG5BlFdNem07aMsK3DS4e6qvhTIn5BOqmV
	vaHZSH1eAbl86CHziHeQJ/oh2FlJJfx3QlrbVZm4=
Content-Type: multipart/mixed; boundary="===============0230293635300664304=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] sdbus-c++-libsystemd: upgrading to 254.5 FAILED
Message-ID: <0101018b96bedf4f-856e36fa-6a89-4c6c-889d-3650ceba4d2d-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.193
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106009

--===============0230293635300664304==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *sdbus-c++-libsystemd* to *254.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe sdbus-c++-libsystemd failed.
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
meta-webserver       = "tmp-auh-upgrades:b6885a3b105389b9ead3faaf64f18206d45f8828"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto ef6c2daf9947d23e2ba6d50c42e4a0d79fe8d32c
WARNING: Command 'git rebase ef6c2daf9947d23e2ba6d50c42e4a0d79fe8d32c' failed:
Auto-merging src/boot/efi/boot.c
CONFLICT (content): Merge conflict in src/boot/efi/boot.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Rebasing devtool-override-libc-musl onto ef6c2daf9947d23e2ba6d50c42e4a0d79fe8d32c
WARNING: Command 'git rebase ef6c2daf9947d23e2ba6d50c42e4a0d79fe8d32c' failed:
Auto-merging src/boot/efi/boot.c
CONFLICT (content): Merge conflict in src/boot/efi/boot.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/sdbus-c++-libsystemd
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/sdbus-c++-libsystemd/sdbus-c++-libsystemd_254.5.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============0230293635300664304==--

