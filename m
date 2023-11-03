Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5E5C07D5A
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:50 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.63869.1699041166068823599
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AI1BXS/9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Cp1FGowg;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101018b96bec030-ac564e78-327d-4e1e-81f8-d0ad85386cd4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5yjuQDJojY4toRzpAlJB7hauDY7HFABbB8TkjjRLlW8=;
	b=AI1BXS/9TJYigcQ79gcgKexuBsyzwTuBcOFls/jnMI34mxx+6zxG09wVVeN8QTrS
	rsflFCuX4PRlivdHrGQLY8gU+HB+EASC7CJ+Dl1dgAVXDXvvbDvtbxYHdUSr67mSjfC
	Eno4huUtsQrqXaWlP6FFNx1SjUC1rQnnP9YLGMGI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041165;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5yjuQDJojY4toRzpAlJB7hauDY7HFABbB8TkjjRLlW8=;
	b=Cp1FGowgWieK80pd6R5SVbFihtNzga1ea7hrBQUIpzVWXXDQGs5L2mjB6YstzrmC
	HSrn0joASb4dqre4fk5Vx+TMxMVlck0MramJoasmM3Da7qBmlqFHYiigP5C1PoQLJyU
	bJZuVzrbrNPm8cqwRDL4uKDkHRWPg06ugMGva4kE=
Content-Type: multipart/mixed; boundary="===============5367360471917355514=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] crash: upgrading to 8.0.3 FAILED
Message-ID: <0101018b96bec030-ac564e78-327d-4e1e-81f8-d0ad85386cd4-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:45 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.31
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105895

--===============5367360471917355514==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *crash* to *8.0.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade crash -V 8.0.3 -S faed0502187315bfcc444b300568980207d5722a
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 4911 entries from dependency cache.
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
meta-webserver       = "tmp-auh-upgrades:9a1a717062d2072ede68804b88b57c01aeae8250"
workspace            = "master:e575f59b82eae78fb1ac8df7198eaa4a7a963259"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 10 Local 10 Mirrors 0 Missed 0 Current 20 (100% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 103 tasks of which 100 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

INFO: Extracting current version source...
INFO: Extracting upgraded version source...
INFO: Rebasing devtool onto faed0502187315bfcc444b300568980207d5722a
ERROR: Could not decode SRC_URI: The URL: '${GNU_MIRROR}/gdb/gdb-10.2.tar.gz;name=gdb;subdir=git' is invalid and cannot be interpreted


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============5367360471917355514==--

