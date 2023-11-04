Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B401C3DA6E
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 05:12:29 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.4510.1699074741979792779
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 22:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L+Ye/JgY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=dOdgzmFU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b98bf1445-77170357-6623-4cdb-95f7-ef1684fd58a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=42GUaEroltEUnkqBy5c4vPVy5j4Z1q1AbkXbOz61vxs=;
	b=L+Ye/JgYkJSLywuL+a80ohydZdFwseppAUhdIlpr4bLiu8PzgIQjA2Dz5Ey29zU3
	hTwnLaIc3x6It+nPWcRsX8weZ1Y1mBW5mEUt4p5QGYZS8vN2ikFbZIY/aPwoFxWnB51
	FLNovrMKHChCHAtMQJvqMtLIm/vpCdgbl8RUjWiQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699074741;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=42GUaEroltEUnkqBy5c4vPVy5j4Z1q1AbkXbOz61vxs=;
	b=dOdgzmFUbxbHfloHdTBC5OkFcCWkQDOeQB8WIyQYm79L6V/8UwdPBzOuDVk2hbpV
	tyaKjEm1ERMxsU5cnUx0p/GQpMnnkmKpHzEip2STnP+rwzgRdENFYxJyKlzJ0Gi1xul
	d4ZR2VPj23FSGGou/P0zQSMQUdkEJiKU0/6UDLrQ=
Content-Type: multipart/mixed; boundary="===============5761490510873616155=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] gtksourceview3: upgrading to 5.10.0 FAILED
Message-ID: <0101018b98bf1445-77170357-6623-4cdb-95f7-ef1684fd58a6-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 05:12:21 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 05:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106276

--===============5761490510873616155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtksourceview3* to *5.10.0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gtksourceview3 -V 5.10.0
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4892 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:c725b43eb12749f3247a5bdddcc98f94e1cd1287"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 11 Local 11 Mirrors 0 Missed 0 Current 22 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 113 tasks of which 110 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
Loading cache...done.
Loaded 4892 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:c725b43eb12749f3247a5bdddcc98f94e1cd1287"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 9 Mirrors 0 Missed 1 Current 18 (90% match, 96% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-5.10.0.tar.xz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 92 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104043405.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231104043405.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-5.10.0.tar.xz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/recipe-sysroot-native/usr/sbin:/hom
 e/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/bitbake/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /srv/autobuilder/autobuilder.yocto.io/current_sources/gtksourceview-5.10.0.tar.xz.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-5.10.0.tar.xz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-5.10.0.tar.xz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-zcqthy2u/work/temp/log.do_fetch.1449728
ERROR: Failed to fetch URL http://ftp.gnome.org/pub/gnome/sources/gtksourceview/3.24/gtksourceview-5.10.0.tar.xz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5761490510873616155==--

