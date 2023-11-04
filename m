Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E0CC05021
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 01:38:20 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.2286.1699061895185393105
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 18:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JXDeZBcm;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ivjKVto0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018b97fb0dc0-1cf101a4-cf73-4e11-85f9-30fc8b379e59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PBulu38I1ujTuED5EvSzNNPHpQizBswVY1DCPnRZxF4=;
	b=JXDeZBcmXSquetVf1cPEtm9qUVonuowZzI0OWDJxuY1skHeL94Z3TC3tF+kQETpw
	R/S+fC4jRHvzLqBG83/D0LA4qjLnE7OfpC6B72QlutI0qxBk0Leq1rLVpnd41RjYitI
	bhgoYnHDZ7qD+wqBgDmMSGKlOK88vl7jfyFNbiqI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699061894;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PBulu38I1ujTuED5EvSzNNPHpQizBswVY1DCPnRZxF4=;
	b=ivjKVto0ZXAzy9KsN1gGCai3lUhw96JKlIhMQaXv0B4OltJX3NfVOFCKKd12R9wh
	ts85R7di4aumvXXp4B6dsKFdxt2FiDLl05X7K6OM8xzO9d7z0QWohE9qquELh8ItXDa
	vwZg40kQvnbSOO8onR4U6Jr61499/W97J0o9DqkQ=
Content-Type: multipart/mixed; boundary="===============4107249537940194986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-flask-wtf: upgrading to 1.2.1 FAILED
Message-ID: <0101018b97fb0dc0-1cf101a4-cf73-4e11-85f9-30fc8b379e59-000000@us-west-2.amazonses.com>
Date: Sat, 4 Nov 2023 01:38:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.04-54.240.27.33
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 01:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106120

--===============4107249537940194986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-flask-wtf* to *1.2.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade python3-flask-wtf -V 1.2.1
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4966 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e5334d71a368d2d0d093c5333169a5d54e31ecdd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
Loading cache...done.
Loaded 4966 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:e5334d71a368d2d0d093c5333169a5d54e31ecdd"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 1 Local 0 Mirrors 0 Missed 1 Current 0 (0% match, 0% complete)
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://files.pythonhosted.org/packages/source/F/Flask-WTF/Flask-WTF-1.2.1.tar.gz;downloadfilename=Flask-WTF-1.2.1.tar.gz, attempting MIRRORS if available
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103211629.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103211629.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/F/Flask-WTF/Flask-WTF-1.2.1.tar.gz;downloadfilename=Flask-WTF-1.2.1.tar.gz...
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export SSL_CERT_FILE="/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export GIT_SSL_CAINFO="/home/pokybuild/yocto-worker/auh-meta-oe/build/buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/certs/ca-certificates.crt"; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/scripts:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/recipe-sysroot-native/usr/sbin:/hom
 e/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/bitbake/bin:/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp -O /srv/autobuilder/autobuilder.yocto.io/current_sources/Flask-WTF-1.2.1.tar.gz.tmp -P /srv/autobuilder/autobuilder.yocto.io/current_sources 'https://files.pythonhosted.org/packages/source/F/Flask-WTF/Flask-WTF-1.2.1.tar.gz' --progress=dot -v failed with exit code 8, no output
ERROR: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'https://files.pythonhosted.org/packages/source/F/Flask-WTF/Flask-WTF-1.2.1.tar.gz;downloadfilename=Flask-WTF-1.2.1.tar.gz')
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/recipetool-mlhq6ftb/work/temp/log.do_fetch.3108019
ERROR: Failed to fetch URL https://files.pythonhosted.org/packages/source/F/Flask-WTF/Flask-WTF-1.2.1.tar.gz;downloadfilename=Flask-WTF-1.2.1.tar.gz


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4107249537940194986==--

