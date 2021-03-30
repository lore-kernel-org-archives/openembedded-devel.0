Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.1692.1617124161751019419
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Mar 2021 10:09:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B752D6E
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 10:09:21 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC65F3F719
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Mar 2021 10:09:20 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] openjpeg: add native/nativesdk class extension
Date: Tue, 30 Mar 2021 18:09:16 +0100
Message-Id: <20210330170916.2555087-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-o=
e/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index 8e264bf71b..62aa4b43db 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -19,3 +19,5 @@ inherit cmake
 EXTRA_OECMAKE +=3D "-DOPENJPEG_INSTALL_LIB_DIR=3D${@d.getVar('baselib').=
replace('/', '')}"
=20
 FILES_${PN} +=3D "${libdir}/openjpeg*"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

