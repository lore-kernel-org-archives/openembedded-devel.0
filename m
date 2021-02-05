Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.5933.1612517089716073833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 01:24:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CEC61D6E
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 01:24:42 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6F9E63F73B
	for <openembedded-devel@lists.openembedded.org>; Fri,  5 Feb 2021 01:24:42 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-ruamel-yaml: add native and nativesdk class extension
Date: Fri,  5 Feb 2021 09:24:36 +0000
Message-Id: <20210205092437.3099545-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16=
.12.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.=
bb
index 406da80f40..7593ce7f54 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.16.12.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] =3D "076cc0bc34f1966d920a49f18b52b6a=
d559fbe656a0748e3535cf7b3f2
 do_install_prepend() {
     export RUAMEL_NO_PIP_INSTALL_CHECK=3D1
 }
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.25.1

