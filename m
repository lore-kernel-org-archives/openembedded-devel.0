Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED4EC79F8E
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 11:22:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11626.1788520955258163016
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Sep 2026 04:22:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gGlnNZTJ;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1F1B01570
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:31 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 755BD3F7D8
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Sep 2026 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788520954; bh=rTe2ZzBCPdat0ZARSh0iaUyGQut4zOUdUqCjJ6f9z9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gGlnNZTJmPoRpJKkailxBqKc/V4dXnO5oyIilYfV0C1n01uqcI0f97AS0FnxGyi73
	 6nuiD7adfVvZEpicSniy2j9lLW7DkVORYjx545fUsjspJxSr4z941Mv701DtmsoQDp
	 x2bd4YzorDjtD8FGDDJzsTjIjmXqGRw+evHbP7tk=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 8/9] python3-icu: remove redundant S assignment
Date: Fri,  4 Sep 2026 12:22:21 +0100
Message-ID: <20260904112222.114451-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904112222.114451-1-ross.burton@arm.com>
References: <20260904112222.114451-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Sep 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129762

This is the default value, so there's no need to set it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-icu_2.16.2.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb b/=
meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
index a2ebc407583..f700aafbb89 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.16.2.bb
@@ -17,7 +17,4 @@ inherit pkgconfig pypi python_setuptools_build_meta
=20
 DEPENDS +=3D "python3-wheel-native"
=20
-# it's lowercase pyicu instead of ${PYPI_PACKAGE} in this version
-S =3D "${UNPACKDIR}/pyicu-${PV}"
-
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


