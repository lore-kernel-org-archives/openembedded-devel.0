Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE480C87FD1
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 21:18:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7479.1754342290009179458
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 14:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F90E1E4D
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:01 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 39C513F673
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 14:18:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 02/20] python3-a2wsgi: use correct Python build backend class
Date: Mon,  4 Aug 2025 22:17:46 +0100
Message-ID: <20250804211804.344751-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250804211804.344751-1-ross.burton@arm.com>
References: <20250804211804.344751-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 21:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118855

oe-core master now has a python_pdm build class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-a2wsgi_1.10.10.bb      | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.b=
b b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.bb
index 699fc2daa2..5833b13401 100644
--- a/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.bb
+++ b/meta-python/recipes-devtools/python/python3-a2wsgi_1.10.10.bb
@@ -3,15 +3,10 @@ HOMEPAGE =3D "https://github.com/abersheeran/a2wsgi"
 LICENSE =3D "Apache-2.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De10d05d29ec6d8be8bfc503683f1b=
c9a"
=20
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_pdm ptest
=20
 SRC_URI[sha256sum] =3D "a5bcffb52081ba39df0d5e9a884fc6f819d92e3a42389343=
ba77cbf809fe1f45"
=20
-DEPENDS +=3D " \
-        python3-pdm-native \
-        python3-pdm-backend-native \
-"
-
 SRC_URI +=3D " \
         file://run-ptest \
 "
--=20
2.43.0


