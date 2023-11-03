Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B23FC25B61
	for <webhook@archiver.kernel.org>; Fri,  3 Nov 2023 19:52:54 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.62970.1699041164984076417
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Nov 2023 12:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N9tE/+Rc;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=T2E+8+w+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018b96bed5de-44de656c-7d90-4486-9607-ba99a8798584-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OaN7IfTMga8aMpsV9Tl61SUFqJcYLxl+uh6BYb7ZT/Y=;
	b=N9tE/+RcCJYgj1cL4F22dIa49nZiIgr9qT+lCdO9wSttUrS7Jecos2oFPurXi2Cb
	bfXSMhOleFAxwLznf2WSInPvessH2pudZzxH3zqNUr4lf1+4vEzR/PzEGOMlzlE+E0I
	5ANZMVzWsY4t/CY4f9cOvTAk/zNgb0yR6eGjAtGw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1699041171;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OaN7IfTMga8aMpsV9Tl61SUFqJcYLxl+uh6BYb7ZT/Y=;
	b=T2E+8+w+/IYOJyyzBt9lqtyo+TRZDlUXmotMWFpu7QjVrOZZqE1pZywUDWPtIUED
	T3MNjkxAEyg5eBXKcucbpPJYFFS2yJlNKJaWWoSICh83Kc1H+Zxg60URCciSSOdG9Ef
	3YHvLOqR3WnVw9xO4CpbEvtioA5go+ccqL3nGBic=
Content-Type: multipart/mixed; boundary="===============6643988344167320314=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Forced@yoctoproject.org, maintainer@yoctoproject.org, 
	for@yoctoproject.org, AUH@yoctoproject.org
Cc: openembedded-devel@lists.openembedded.org
Subject: [AUH] octave: upgrading to 8.3.0 FAILED
Message-ID: <0101018b96bed5de-44de656c-7d90-4486-9607-ba99a8798584-000000@us-west-2.amazonses.com>
Date: Fri, 3 Nov 2023 19:52:50 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.03-54.240.27.29
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Nov 2023 19:52:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106001

--===============6643988344167320314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *octave* to *8.3.0* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake octave' failed
NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 5008 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'libgfortran' (but /home/pokybuild/yocto-worker/auh-meta-oe/build/meta-openembedded/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb DEPENDS on or otherwise requires it)
libgfortran was skipped: libgfortran needs fortran support to be enabled in the compiler
ERROR: Required build target 'octave' has no buildable providers.
Missing or unbuildable dependency chain was: ['octave', 'lapack', 'libgfortran']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============6643988344167320314==--

