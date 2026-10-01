Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF18CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 11:26:31 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8873.1790853984147949041
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 04:26:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Qt4jhkRn;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DDD3497
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 04:26:20 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3685A3F86F
	for <openembedded-devel@lists.openembedded.org>; Thu,  1 Oct 2026 04:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790853983; bh=4v2IDaVUR3zzpd8aRdCSAXlEGLtCPYcYEOOteAa34kg=;
	h=From:To:Subject:Date:From;
	b=Qt4jhkRnhMkzmhLXpEkugh6n2zLk4PhfoX0Qwe+MArHGiet8+jlkOjcBgYFrHH7G+
	 GpUjAXKjMU+ZZNQHL+/vf8tfvYqpKhMAWw85n91X0qHIEsySUg3SGSwtoq4RcARNE1
	 RNSfqaoTDNBiqmk/8lM0UpihmoLI3XIqNDdTK/so=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-pytz: add recipe (from oe-core)
Date: Thu,  1 Oct 2026 12:26:19 +0100
Message-ID: <20261001112619.3271931-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 11:26:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130579

This recipe is being removed from core as it is now deprecated and no
longer needed with Python 3.9 onwards, which integrated the zoneinfo
module.

All users of pytz in meta-python should be reviewed as the dependencies
may be obsolete.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../python/python3-pytz_2026.4.bb             | 25 +++++++++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytz_2026=
.4.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 4435556b2c..92183897c7 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -89,6 +89,7 @@ PTESTS_FAST_META_PYTHON =3D "\
     python3-pytest-picked \
     python3-pytest-sugar \
     python3-pytoml \
+    python3-pytz \
     python3-pyyaml-include \
     python3-pydbus \
     python3-pyzmq \
diff --git a/meta-python/recipes-devtools/python/python3-pytz_2026.4.bb b=
/meta-python/recipes-devtools/python/python3-pytz_2026.4.bb
new file mode 100644
index 0000000000..4a2eda07a6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytz_2026.4.bb
@@ -0,0 +1,25 @@
+SUMMARY =3D "World timezone definitions, modern and historical"
+HOMEPAGE =3D "http://pythonhosted.org/pytz"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D1a67fc46c1b596cce5d21209b=
be75999"
+
+inherit pypi setuptools3 ptest-python-pytest
+
+PTEST_PYTEST_DIR =3D "pytz/tests"
+
+SRC_URI[sha256sum] =3D "464303645bafafd72418898368b2429458f709cf1eb6a153=
72fbcc396b64da63"
+
+RDEPENDS:${PN}:class-target +=3D "\
+    python3-datetime \
+    python3-doctest \
+    python3-io \
+    python3-pickle \
+    python3-pprint \
+    python3-threading \
+"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+do_install_ptest:append() {
+	cp -f ${S}/README.rst ${D}${PTEST_PATH}/
+}
--=20
2.43.0


