Return-Path: <auh@moto-timo.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DE3BC0015E
	for <webhook@archiver.kernel.org>; Sat,  5 Aug 2023 07:38:39 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.2149.1691221118647020483
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Aug 2023 00:38:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@moto-timo.dev header.s=gm1 header.b=GnzoMfSg;
 spf=pass (domain: moto-timo.dev, ip: 217.70.183.198, mailfrom: auh@moto-timo.dev)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CF16CC0002
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Aug 2023 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=moto-timo.dev;
	s=gm1; t=1691221117;
	h=from:from:reply-to:subject:subject:to:to:cc:mime-version:mime-version:
	 content-type:content-type; bh=kXPnvFJmV1udi2ExAlYK8ebrUb9XYgjOHyORapjl5Ak=;
	b=GnzoMfSg8WumPGkdHCEii0WtUs8/lCJKWI8HkRyq/RTdcOorh7iLjhLwgAi+SEoO+znALB
	c0tUW8OE58m7ELedpgvNZlYW7Niv55SbSc+w/y0GmGM8iCpQt+dqGJ4zBEuG0vXTVoKQ05
	nDXaiBhtC73Rkur4/q2OEcU1HA8z8Wwf+31325cxEmbJhs0ZM9sYjfleAS9aqR19/CW/tb
	tIZlp1Sf1kZMaB3Uf8tXySrqd5FWxmMiYiBCcyEGezETlS0sIu6Sbu6sHC7JH2eqpfxHMP
	2yI5nGpRcOIqEDg5yKG2qaA6PHDnjVx+DqDVQJIqVP4HNm/Rsz3qo3yRkcW4ZA==
Content-Type: multipart/mixed; boundary="===============3393451354536058620=="
MIME-Version: 1.0
From: auh@moto-timo.dev
To: openembedded-devel@lists.openembedded.org
Subject: [AUH] python3-cvxopt: upgrading to 1.3.1 FAILED
X-GND-Sasl: auh@moto-timo.dev
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Aug 2023 07:38:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104241
Message-Id: <20230805073839.9DE3BC0015E@smtp.lore.kernel.org>
Date: Sat,  5 Aug 2023 07:38:39 +0000 (UTC)

--===============3393451354536058620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-cvxopt* to *1.3.1* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86-64 bitbake python3-cvxopt' failed
Loading cache...done.
Loaded 12639 entries from dependency cache.
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
--===============3393451354536058620==--

