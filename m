Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66BAC5AC82
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 12:21:35 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28551.1786364494446522096
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Aug 2026 05:21:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=CbgDsVA3;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0673714BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:30 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8F4BE3F86F
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 05:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786364494; bh=FG2baYGHYhd+2xmA9hKjWkVkXDUzqzEvWTm8iAZHt2I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CbgDsVA3hCipJa61U4W6N7MMPdXh+NIBDLiGsBxVbj1ZvnFq4jH83bk5G55uDNf4U
	 TzmxeUP3WzxAKKigXIX/nE2DM+xfUK77WPAzFZvwAezlSiL8SVlvUZhn9nZJ7m6890
	 jLJyiRDkZ6877ilEDszL8VsOa6Aze+4NGkO4fNL4=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 03/24] python3-stevedore: remove obsolete RDEPENDS
Date: Mon, 10 Aug 2026 13:21:09 +0100
Message-ID: <20260810122130.633299-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810122130.633299-1-ross.burton@arm.com>
References: <20260810122130.633299-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Aug 2026 12:21:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128883

pbr was removed as an accidental runtime dependency in 5.5.0[1], and six
was removed in 2.0[2].

[1] stevedore 7c2740e ("Remove explicit pbr dependency")
[2] stevedore 1aca4bc ("Drop Python 2.7 support")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.=
bb b/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
index 6549551ae0..225e36dd9f 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_5.9.0.bb
@@ -9,6 +9,4 @@ DEPENDS +=3D "python3-pbr-native"
=20
 inherit pypi python_setuptools_build_meta
=20
-RDEPENDS:${PN} +=3D "python3-pbr python3-six"
-
 BBCLASSEXTEND =3D "native"
--=20
2.43.0


