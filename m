Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E48CC624DE
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 15:53:08 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1524.1788537178899006658
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 08:52:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=icEzWVvP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E134152B
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:54 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B84E73F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 08:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788537178; bh=X/T3eWejgvtrxbiRC9LdxQKzQhWLDj0ksWBNe+Q6yDE=;
	h=From:To:Subject:Date:From;
	b=icEzWVvP4565raYo6WnmvshTW9Mk5sCW5l41fNNPLc+9DqyMrycy5i27u0skcFcXO
	 8Hs4F4PQBqfqOUpfvjP4E6Ci/Le07Tthczq0zibefCkUlrwGiz/lYXVrqjJ54qTu/b
	 R7h1tU3bObPi0FvHU+REMsKwPfCBLv9dy7MW/73U=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] python3-arpeggio: remove obsolete DEPENDS
Date: Fri,  4 Sep 2026 16:52:47 +0100
Message-ID: <20260904155251.1373817-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 15:53:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129768

These dependencies are no longer needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-arpeggio_2.0.3.bb       | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.b=
b b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
index 01739adf86..906fbfdc0b 100644
--- a/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-arpeggio_2.0.3.bb
@@ -9,10 +9,4 @@ PYPI_PACKAGE =3D "Arpeggio"
=20
 inherit pypi setuptools3
=20
-# setup.py of Arpeggio needs this.
-DEPENDS +=3D "\
-    python3-pytest-runner-native \
-    python3-wheel-native \
-"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


