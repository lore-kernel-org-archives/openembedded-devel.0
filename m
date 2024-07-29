Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BB81C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:38:38 +0000 (UTC)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
 by mx.groups.io with SMTP id smtpd.web10.56240.1722260312036315667
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:38:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@g0hl1n.net header.s=key1 header.b=UEYS+6g6;
 spf=pass (domain: g0hl1n.net, ip: 91.218.175.172, mailfrom: dev@g0hl1n.net)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1722260309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2xuHRe5ubgmQ2T+eUi/JitOV51Abhq2JxqkWxPU5wWc=;
	b=UEYS+6g6dAgO6OKivloXmcjAUJythCqu76c46bFBD6QG3dIcEj0o+X1PpgvVxvl59NmrVJ
	TBhS2oSJtvlpvJDfsxpnRbBUCZDTcf7VygBgmskqYNz+dXsf0hxbsjKHb+Gb7fTo75qrEt
	D+vYtD6u0UNmuk8d/eMCg8h6MArsPto=
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Richard Leitner <dev@g0hl1n.net>
Subject: [meta-python][scarthgap][PATCH] python3-email-validator: upgrade 2.1.0 -> 2.1.1
Date: Mon, 29 Jul 2024 15:37:41 +0200
Message-ID: <20240729133741.166233-1-dev@g0hl1n.net>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Jul 2024 13:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111457

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Fixed typo 'marking' instead of 'marketing' in case-insensitive mailbox=
 name list.
- When DNS-based deliverability checks fail, in some cases exceptions are=
 now
  thrown with raise ... from for better nested exception tracking.
- Fixed tests to work when no local resolver can be configured.
- This project is now licensed under the Unlicense (instead of CC0).
- Minor improvements to tests.
- Minor improvements to code style.

License-Update: Relicense under the Unlicense (instead of CC0)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0dd1264a9499b213ff9edd3618ea2a3e8fae9c56)
Signed-off-by: Richard Leitner <dev@g0hl1n.net>
---
 ...il-validator_2.1.0.bb =3D> python3-email-validator_2.1.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-email-validator_2.1.=
0.bb =3D> python3-email-validator_2.1.1.bb} (59%)

diff --git a/meta-python/recipes-devtools/python/python3-email-validator_=
2.1.0.bb b/meta-python/recipes-devtools/python/python3-email-validator_2.=
1.1.bb
similarity index 59%
rename from meta-python/recipes-devtools/python/python3-email-validator_2=
.1.0.bb
rename to meta-python/recipes-devtools/python/python3-email-validator_2.1=
.1.bb
index 7daf548cb..90a22e5a0 100644
--- a/meta-python/recipes-devtools/python/python3-email-validator_2.1.0.b=
b
+++ b/meta-python/recipes-devtools/python/python3-email-validator_2.1.1.b=
b
@@ -1,9 +1,9 @@
 SUMMARY =3D "A robust email address syntax and deliverability validation=
 library."
 SECTION =3D "devel/python"
 LICENSE =3D "CC0-1.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D65d3616852dbf7b1a6d4b53b00626=
032"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2890aee62bd2a4c3197e2059016a3=
97e"
=20
-SRC_URI[sha256sum] =3D "5f511cca8856bb03251d6292ba59e7f98978aae13fa5823d=
dd8bf885c56a6260"
+SRC_URI[sha256sum] =3D "200a70680ba08904be6d1eef729205cc0d687634399a5924=
d842533efb824b84"
=20
 PYPI_PACKAGE =3D "email_validator"
=20
--=20
2.43.0


