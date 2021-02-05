Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.5997.1612517093801124007
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 01:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60413106F
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 01:24:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B06A3F73B
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 01:24:42 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 2/2] python3-pykwalify: fix RDEPENDS
Date: Fri,  5 Feb 2021 09:24:37 +0000
Message-Id: <20210205092437.3099545-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210205092437.3099545-1-ross.burton@arm.com>
References: <20210205092437.3099545-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Version 1.8.0 dropped pyyaml and moved to ruamel, so update the RDEPENDS
so that this package continues to work.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.=
bb b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
index aa14cdd4b6..4d4d2b79cf 100644
--- a/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pykwalify_1.8.0.bb
@@ -13,7 +13,7 @@ inherit setuptools3 pypi
 RDEPENDS_${PN} =3D "\
     ${PYTHON_PN}-docopt \
     ${PYTHON_PN}-dateutil \
-    ${PYTHON_PN}-pyyaml \
+    ${PYTHON_PN}-ruamel-yaml \
 "
=20
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

