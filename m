Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1562.1602174329624502271
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 09:25:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B0DED6E
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Oct 2020 09:25:29 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB2B33F70D
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Oct 2020 09:25:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] glmark2: no need to patch waf
Date: Thu,  8 Oct 2020 17:25:25 +0100
Message-Id: <20201008162525.3098928-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Now that waf.bbclass in oe-core uses Python 3 explictly we don't need to
patch glmark.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-benchmark/glmark2/glmark2/python3.patch  | 12 ------------
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb     |  3 +--
 2 files changed, 1 insertion(+), 14 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/glmark2/glmark2/python3.pat=
ch

diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2/python3.patch b/me=
ta-oe/recipes-benchmark/glmark2/glmark2/python3.patch
deleted file mode 100644
index df208cf87..000000000
--- a/meta-oe/recipes-benchmark/glmark2/glmark2/python3.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Use Python 3 instead of Python 2.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-diff --git a/waf b/waf
-index 6ce2a24..de3c898 100755
---- a/waf
-+++ b/waf
-@@ -1 +1 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/r=
ecipes-benchmark/glmark2/glmark2_git.bb
index 82821ad63..2e727a01c 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -14,8 +14,7 @@ PV =3D "20191226+${SRCPV}"
=20
 COMPATIBLE_HOST_rpi  =3D "${@bb.utils.contains('MACHINE_FEATURES', 'vc4g=
raphics', '.*-linux*', 'null', d)}"
=20
-SRC_URI =3D "git://github.com/glmark2/glmark2.git;protocol=3Dhttps \
-           file://python3.patch"
+SRC_URI =3D "git://github.com/glmark2/glmark2.git;protocol=3Dhttps"
 SRCREV =3D "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
=20
 S =3D "${WORKDIR}/git"
--=20
2.28.0

