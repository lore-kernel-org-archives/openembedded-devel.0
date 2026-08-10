Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16677C5AD55
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28550.1786364493158199277
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qdvV8wlM;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89F5B14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:28 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1C4A53F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364492; bh=SHrd7MDNpbOTxWooHuaEayuJJGr14YcWLvtJOGkNaoY=;
	h=From:To:Subject:Date:From;
	b=qdvV8wlMAWLcihtVUpJNZDxNzSTHSen5srmKUpHyBwRNRIYDQ0u4Z2i6P/IkjauOP
	 tq7LEmA0kXb26j237/tO9ruYaN1rGLlPqBGNXRUZmZeuIdChe5rOrNejVmKoVDOjw2
	 qfd6ns89juNa1QinNzxYxncJxsB6Q2TJa7pa/Hp0=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 01/24] python3-pycups: put PV into the filename
Date: Mon, 10 Aug 2026 13:21:07 +0100
Message-ID: <20260810122130.633299-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128881

Put the PV in the filename as this is the idiomatic style.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../cups/{python3-pycups.bb =3D> python3-pycups_2.0.1.bb}         | 2 --
 1 file changed, 2 deletions(-)
 rename meta-oe/recipes-printing/cups/{python3-pycups.bb =3D> python3-pyc=
ups_2.0.1.bb} (95%)

diff --git a/meta-oe/recipes-printing/cups/python3-pycups.bb b/meta-oe/re=
cipes-printing/cups/python3-pycups_2.0.1.bb
similarity index 95%
rename from meta-oe/recipes-printing/cups/python3-pycups.bb
rename to meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb
index 6968170d93..35b78890e6 100644
--- a/meta-oe/recipes-printing/cups/python3-pycups.bb
+++ b/meta-oe/recipes-printing/cups/python3-pycups_2.0.1.bb
@@ -6,6 +6,4 @@ RDEPENDS:${PN} =3D "python3"
=20
 inherit setuptools3 pypi
=20
-PV =3D "2.0.1"
-
 SRC_URI[sha256sum] =3D "e880d7d7147959ead5cb34764f08b97b41385b36eb8256e8=
af1ce163dbcccce8"
--=20
2.43.0


