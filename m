Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF2EC10DC3
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:51 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.63860.1699041165375197203
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=U24APTll;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rUgyw+fY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018b96bebcd0-83770c7b-866f-4020-a611-94f7236fd54c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=umxXikS9cXQ+1IrkvNSaZuAVKB/3zlf61eKz9CO7TIg=;
	b=U24APTllsb1MaQQXhHUkvSjtrZAJz9RardqKboNtw1ao/feCWG7dqoWrSY0JN2cy
	nQmQwgkaibHurtK+fniuMvFkbNjxxViqABIFwpF1l5eRwjaNpOwVpCOSBt/WQkDJHrB
	v+vifK31pV1Xr+04k8TuCA0MqfDt7owGpjOaeJjU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041164;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=umxXikS9cXQ+1IrkvNSaZuAVKB/3zlf61eKz9CO7TIg=;
	b=rUgyw+fYX53UhdNNk7NNZWOPkYra6vSsKOi60oqQ+CkKVCLn4BBr0JK4e23iOD5u
	GAjkj9XS9TeQEAM0gEHAAQnBD/I+lWJjSz5jyXz691J8lBxPy8esXVWAxXESEcrE8+J
	D1axPhC+qJAp7+kz7V7/oVEwLbrC2yZkZ4rpqQs8=
Content-Type: multipart/mixed; boundary="===============6121905121899769346=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] broadcom-bt-firmware: upgrading to 12.0.1.1105. SUCCEEDED
Message-ID: <0101018b96bebcd0-83770c7b-866f-4020-a611-94f7236fd54c-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:44 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.30
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105880

--===============6121905121899769346==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *broadcom-bt-firmware* to *12.0.1.1105.* has Succeeded.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6121905121899769346==--

