Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06262C04FDE
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:53:06 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62981.1699041166671979951
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NW3Svx+a;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=eo2UJ7Si;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96bef7b1-d7d10864-7af5-4c22-aef0-c07914fba9ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qFh7MBwkFamn4wBHb583YwnSabGr+LmqeRor4OIx7rI=;
	b=NW3Svx+aTjCsVAC+uZk4TJ5Jt+b4uXYOQAZ5/IfZyJLdbTwBaIgl1680z+1IL/g0
	fczIX/MsCiVW4w2dYRjOhiKyDF0NJbKnlu4HFlPrfHSq5fwjZw0Dx7Y/gR65w+XOEn1
	s+WEsYD/D9I60r7uWktzgpYgN2FRLGHut7rWoSPY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041179;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qFh7MBwkFamn4wBHb583YwnSabGr+LmqeRor4OIx7rI=;
	b=eo2UJ7SifMIEat4Ja3Bv1IbPMGVzcGp/VUCttJUsalyvi99wyCW9d8V1YNlOzEml
	nWRdq86qZzEXUcNeMvcGAVC15LeBrUXj7Fu+9YqyN+shfOjG7esUVydxOW8WNOUiYD6
	Mck9dR/JC22fkwDjz1VFaMbFA/2tjQ+GBX7jqIY0=
Content-Type: multipart/mixed; boundary="===============5639451735173524754=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] xkbevd: upgrading to 1.1.5 FAILED
Message-ID: <0101018b96bef7b1-d7d10864-7af5-4c22-aef0-c07914fba9ff-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106040

--===============5639451735173524754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xkbevd* to *1.1.5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade xkbevd -V 1.1.5
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5067 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:8667b0d03e24c6e92338573692c9667934232125"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
Loading cache...done.
Loaded 5067 entries from dependency cache.
Parsing recipes...done.
Parsing of 3056 .bb files complete (3054 cached, 2 parsed). 4887 targets, 92 skipped, 0 masked, 0 errors.
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
meta-webserver       = "tmp-auh-upgrades:8667b0d03e24c6e92338573692c9667934232125"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://www.x.org/releases//individual/app/xkbevd-1.1.5.tar.bz2, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103192914.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103192914.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/app/xkbevd-1.1.5.tar.bz2...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/recipe-sysroot-native/usr/sbin:/hom
 e/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/bitbake/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /srv/autobuilder/autobuilder.yocto.io/current_sources/xkbevd-1.1.5.tar.bz2.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://www.x.org/releases//individual/app/xkbevd-1.1.5.tar.bz2' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://www.x.org/releases//individual/app/xkbevd-1.1.5.tar.bz2')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-7wakt44_/work/temp/log.do_fetch.2594764
ERROR: Failed to fetch URL https://www.x.org/releases//individual/app/xkbevd-1.1.5.tar.bz2


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5639451735173524754==--

