Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C762EC25B55
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:53 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.62973.1699041165526848112
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GS8tgbLK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ZSwUOG2w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018b96beca01-4c848d39-e8fc-4cef-9331-a35a34307481-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YjooI0cAmT83VQ+uUJpXaqKqnBZWegRq0E7m7YzIwEo=;
	b=GS8tgbLKOSfBog+cDFspJO0pCacC6fHzKua+9V35dG7NQoeUi+182CDGyPm+SuG1
	rYmgMGVfqrcxiTT9XDqwXvdZQG55axq+bv8cJIzMBBd8azVDqd8n2ZtQgpzCAQWEEPN
	r1TFrQORhexL0DeIQQwr6mB3yndMfJ+HIf8Jmbak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041168;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YjooI0cAmT83VQ+uUJpXaqKqnBZWegRq0E7m7YzIwEo=;
	b=ZSwUOG2wuYSc1/7slYQBaawc1cgaeBRR7/TwNMZ7T23u0YvELpX8sCpbpD4QY/E3
	Sio5t5XN1heBDjUkEHCEcGdP6ImEM/9HjP5DZ+MYohnnCosfqusgwvUrg+SyfvDCEIi
	ZhC/w484BriaZnWkO5XFaJuQuPy3BWNf2ujOlxYA=
Content-Type: multipart/mixed; boundary="===============2247158418934560433=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] influxdb: upgrading to 2.7.3 FAILED
Message-ID: <0101018b96beca01-4c848d39-e8fc-4cef-9331-a35a34307481-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:47 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.192
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105950

--===============2247158418934560433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *influxdb* to *2.7.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade influxdb -V 2.7.3 -S ed645d9216af16b49f8c6a49aee84341ea168180
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4959 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:af578c0118d90ae3dcd85dfdd847d9b12139c6bd"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103131459.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/log/error-report/error_report_20231103131459.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
ERROR: Applying patch '0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch' on target directory '/home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/influxdb/1.8.10/devtooltmp-a8ub0cvd/workdir/influxdb-1.8.10/src/github.com/influxdata/influxdb'
BBHandledException("Applying '0001-Use-v2.1.2-xxhash-to-fix-build-with-go-1.17.patch' failed:
stdout: checking file go.mod
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored
checking file go.sum
Reversed (or previously applied) patch detected!  Assume -R? [n] 
Apply anyway? [n] 
Skipping patch.
1 out of 1 hunk ignored

stderr: ")
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh-meta-oe/build/build/tmp/work/core2-64-poky-linux/influxdb/1.8.10/devtooltmp-a8ub0cvd/temp/log.do_patch.727218
ERROR: Extracting source for influxdb failed


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============2247158418934560433==--

