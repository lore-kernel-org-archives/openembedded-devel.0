Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EF8FC5B56A
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28552.1786364495861805233
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=i7/lHNK5;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7424F14BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0CFDD3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364495; bh=5DH1i8ZV5aN3r5YPh3B6TWjT6Zxbdx3FqiKBAD+Ls3E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i7/lHNK5vY/Mc13iT9CIdjJeiiJ5Llid7D8h4qTBR/BEhz62ftnLyDak50yIGmBen
	 dl9smsiJA4exO0gY/rrtUXg8FjAiwsz/xqWF7Ta1tdf2SzyzvcefKsCqkxiiltZE5D
	 0vOLgQCxtZMEzGl0PZPS7hNB8xgHJD0U3Ex3k2E4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 05/24] python3-requests-unixsocket: remove python3-pbr-native dependency
Date: Mon, 10 Aug 2026 13:21:11 +0100
Message-ID: <20260810122130.633299-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128885

This was removed in 0.3.1[1].

[1] https://github.com/msabramo/requests-unixsocket/commit/87180708025022=
0c810dab0a3244b342a7a3c6d7

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-requests-unixsocket_0.4.1.bb                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-requests-unixsoc=
ket_0.4.1.bb b/meta-python/recipes-devtools/python/python3-requests-unixs=
ocket_0.4.1.bb
index 4485b89de7..bf199e75b7 100644
--- a/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4=
.1.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-unixsocket_0.4=
.1.bb
@@ -9,5 +9,5 @@ PYPI_PACKAGE =3D "requests_unixsocket"
=20
 inherit pypi python_setuptools_build_meta
=20
-DEPENDS +=3D "python3-pbr-native python3-setuptools-scm-native"
+DEPENDS +=3D "python3-setuptools-scm-native"
 RDEPENDS:${PN} =3D "python3-requests python3-urllib3"
--=20
2.43.0


