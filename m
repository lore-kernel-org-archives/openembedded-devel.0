Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF18EB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:30:30 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.940.1689139821221763415
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:30:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=grOGWqNP;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.197, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E4A871C0009
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1689139819;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=cb3ox0/4e2Cm4dpccTPy22qlwhygJ28kcZl86sD7Prk=;
	b=grOGWqNPsgnY3VcE2rOWIOLg80tLSiSo0ui8ihoAyaBtkSWT9bl4bsda+////h7V/dOmX3
	3j1RGluwVY7yo95hKK/MjCaCJPzY65NyyWE4Y5iEQijJ4nKEhcU1/mvMt4KQoQCT+eT7Dx
	B9LidmREdL/qIFzpUwgsvZ3i4Ozfxs2+P/TfETPEcgjxWMz6mY7Gh1IWrc/kJ7aG7lFSDu
	tJc8kIanLcapexzXJ0DBUia9dKDXb3scN5a0YKXbfqaqhDmIziTw9KtkAu9vRTQdBQwdS1
	vmoQi08CjECCGg+1yt2wonnvcZVk9ehHBz8xPd+ZveJEX4uB+z8aauBQo2zRVQ==
Content-Type: multipart/mixed; boundary="===============7094956546892685350=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cvxopt: upgrading to 1.3.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:30:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103757
Message-Id: <20230712053030.5DF18EB64D9@smtp.lore.kernel.org>
Date: Wed, 12 Jul 2023 05:30:30 +0000 (UTC)

--===============7094956546892685350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cvxopt* to *1.3.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cvxopt' failed
Loading cache...done.
Loaded 12654 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Summary: There were 2 ERROR messages, returning a non-zero exit code.

ERROR: Nothing PROVIDES 'libgfortran' (but /home/auh/Projects/meta-openembedded/meta-oe/recipes-devtools/lapack/lapack_3.10.1.bb DEPENDS on or otherwise requires it)
libgfortran was skipped: libgfortran needs fortran support to be enabled in the compiler
ERROR: Required build target 'python3-cvxopt' has no buildable providers.
Missing or unbuildable dependency chain was: ['python3-cvxopt', 'lapack', 'libgfortran']


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============7094956546892685350==--

