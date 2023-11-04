Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E958C0018A
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 03:13:04 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.3570.1699067576352973356
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 20:12:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ROLoTC3D;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Iywgv7Bg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b9851bb36-1545120e-c9eb-416b-96e8-04feebb069d9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/TsZPtftP4TeTAUgrIbtlTB2J1ycOTvyKvG8MoY9EOs=;
	b=ROLoTC3Db+fi61AUrLOnXZppMIg/boIJiuDoJPoDgkRU61b5fEN4QGQA1rrLThIU
	/KlaFATJ+nKY/AVPcLy24LZcwYFhvyYkRx2OYfzZHN+0PfFoIwiwqCOe8CwqgaVVw9q
	yenqVF0NCdJiKTQxotlgXGzGYYP2yRsMjldulddI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699067575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/TsZPtftP4TeTAUgrIbtlTB2J1ycOTvyKvG8MoY9EOs=;
	b=Iywgv7Bgsk47rWQwyl1ZORjT8dL43/oajUNAdm+XemxiW8aP6CBgWQAXbGoZD3dR
	JL4AjtNS91AssM4IdRrshbRw1tXbHCpTLbhKoZ5MlPs1AEWDxAPFwoODKq/Np3NiNiN
	aQsLf++FW+c7Tg9F5qog4F3LCPtrLOdTVMsJj0AQ=
Content-Type: multipart/mixed; boundary="===============7894988961056855782=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xl2tpd: upgrading to 1.04 FAILED
Message-ID: <0101018b9851bb36-1545120e-c9eb-416b-96e8-04feebb069d9-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 03:12:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 03:13:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106231

--===============7894988961056855782==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xl2tpd* to *1.04* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe xl2tpd failed.
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4921 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:169e542dae382c947cf373a8a2a4b5cb0304c0f4"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto 0a37905eb246fe1661fc76c159667ec79d375cd4
WARNING: Command 'git rebase 0a37905eb246fe1661fc76c159667ec79d375cd4' failed:
Auto-merging packaging/suse/xl2tpd.spec
CONFLICT (content): Merge conflict in packaging/suse/xl2tpd.spec

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/sources/xl2tpd
INFO: New recipe is /home/pokybuild/yocto-worker/auh-meta-oe/build/build/workspace/recipes/xl2tpd/xl2tpd_1.04.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7894988961056855782==--

