Return-Path: <esa.jaaskela@suomi24.fi>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DF2C43458
	for <webhook@archiver.kernel.org>; Sat, 11 Jul 2026 19:22:33 +0000 (UTC)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2243.1783797744661468618
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Jul 2026 12:22:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: key syntax error: illegal base64 data at input byte 231" header.i=@suomi24.fi header.s=MBO0001 header.b=NwRUDjje;
 spf=pass (domain: suomi24.fi, ip: 80.241.56.161, mailfrom: esa.jaaskela@suomi24.fi)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gyJVj3Qc8zKn8g;
	Sat, 11 Jul 2026 21:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suomi24.fi; s=MBO0001;
	t=1783797741;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9rZyx698QsEHS5z9m4xpzOAhIIu/TmPH6ziHgNlRvUY=;
	b=NwRUDjjemC5Vr/nclugOqj5QsTQXBXbV/n/3xu/cO0WOdnj+d2z7KJTbLlArNlyVnjfnTT
	FENWHU+wJE+WsdQIJxYC/gd8W12ZD5f3DtC1l1GOEj+uhadrd/eXiZ7IbN9+dtXOz4gmFb
	gn0SD+82Spmm4LJrjpD81qIa363S6Qj9CcmnjDSZO/DYeubqhRZRBMl5jNjRCiRTl3kf6i
	5/6pQACFTes8zZKEer5OKhK9ypUmbmAQwOzm91tUXj0Ryy29+rvSxg8Q1B7MlO/lcTJwQ4
	0OHBo1q1jGtCP3085/l88ieLNoVIXOTCD9kDamym1wDW7tmV6hFRiLnnLTHMNA==
From: Esa Jaaskela <esa.jaaskela@suomi24.fi>
To: openembedded-devel@lists.openembedded.org
Cc: Esa Jaaskela <esa.jaaskela@suomi24.fi>
Subject: [meta-oe][scarthgap][PATCH 0/2] Fix uutils-coreutils warnings
Date: Sat, 11 Jul 2026 22:22:01 +0300
Message-ID: <20260711192203.2343958-1-esa.jaaskela@suomi24.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Jul 2026 19:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128137

Currently, building uutils-coreutils prints the following warnings:

WARNING: uutils-coreutils-0.0.28-r0 do_package_qa: QA Issue: File /usr/bi=
n/coreutils in package uutils-coreutils contains reference to TMPDIR [bui=
ldpaths]
WARNING: uutils-coreutils-0.0.28-r0 do_package_qa: QA Issue: File /usr/bi=
n/.debug/coreutils in package uutils-coreutils-dbg contains reference to =
TMPDIR [buildpaths]

Despite being the same warning, the root causes for these issues are
different. The first warning is fixed in Walnascar branch with a patch.
I cherry picked this patch, it had to be renamed as 0001 patch already
exists in Scarthgap.

The second warning is not fixed in other branches of meta-openembedded,
but python3-maturin recipe in openembedded-core seems to have a similar
issue, so I based the fix on that.

Esa Jaaskela (1):
  uutils-coreutils: fix buildpaths QA warning

Etienne Cordonnier (1):
  uutils-coreutils: disable stdbuf compilation

 .../files/0002-do-not-compile-stdbuf.patch    | 39 +++++++++++++++++++
 .../uutils-coreutils_0.0.28.bb                |  5 ++-
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-core/uutils-coreutils/files/0002-do-n=
ot-compile-stdbuf.patch

--=20
2.47.3


