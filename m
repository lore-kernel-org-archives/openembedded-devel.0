Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0126C04A94
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 05:08:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1175.1690780129671016442
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jul 2023 22:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=faXNc1Sm;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.201, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE5EB1BF205
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1690780128;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=Up4WHPZMmFtbEBcP9fi16oHZprzQw7MIqfmkxOxfJjg=;
	b=faXNc1Sm0aPaA1NwxLHgnsiiVQwWSdo9L7b5TypMsHk9dvuTqony+jAhQBTTnsNj+mzJDE
	XNvpIExHLLYTJHa3+x4ndfPhlOPs/bPAL60/EDnwZVuInQF+u/WXWpNvZot+O5Bo2Gevut
	fCAx2p3MNn3t2ZIVuIt5shIriSTDQOj2QqM1KQZNgDQxjFBrPb9waQzaUSA2Fx/9P31Muv
	fq811HdYzcSsAXLbgcnc8oBw2XBGON+0OQDcKzJ1FtgZEw+9TlSjj+zZEvsbdh9Y2M0l2k
	Nd37FLQol/tZ6U4TbtnNkL7M42GKRzQ9hkj/GlgqQOKy25ZwjvpnMDKifC0Tug==
Content-Type: multipart/mixed; boundary="===============1832160070508655267=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cvxopt: upgrading to 1.3.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Jul 2023 05:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104089
Message-Id: <20230731050854.D0126C04A94@smtp.lore.kernel.org>
Date: Mon, 31 Jul 2023 05:08:54 +0000 (UTC)

--===============1832160070508655267==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cvxopt* to *1.3.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cvxopt' failed
Loading cache...done.
Loaded 12624 entries from dependency cache.
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
--===============1832160070508655267==--

