Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5B0C88E77
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 10:01:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11383.1789552864448454156
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Sep 2026 03:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=fEtFIpwP;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5DED1152B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 03:01:00 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 97DF63F86F
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 03:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789552864; bh=90NbaF8B5Y8ejoaURmx0RHt3pGlW1Ny/Fm2H73Kp7XE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fEtFIpwP9CnhPKwTlc6+4EcmC6WOKyAg4P+J2/rTVPR5rcDctZURbsuHoKY4vAfRq
	 5/aKdatfJHAWvf3eXvZrT+w7NX0JD7BBWngMhGpZP0TfvC5fuZg6ZQwzmyYl1/hLhB
	 YbwJ/7N3YqWgEe5pgnt0U3wQqujqGn6cgjFQgydw=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/5] python3-six: add (from oe-core)
Date: Wed, 16 Sep 2026 11:00:55 +0100
Message-ID: <20260916100056.1512426-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916100056.1512426-1-ross.burton@arm.com>
References: <20260916100056.1512426-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Sep 2026 10:01:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130084

Python 2 was end-of-lifed six years ago now, so move the python3-six
recipe from oe-core to meta-python.  Plenty of recipes still claim to
depend on it, but reviewing these is both a good way to review the
dependencies and potentially identify unmaintained packages.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../ptest-packagelists-meta-python.inc        |  1 +
 .../recipes-devtools/python/python-six.inc    | 11 +++++++++
 .../python/python3-six_1.17.0.bb              | 23 +++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-six.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-six_1.17.=
0.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index e4eae4ef436..3605026ff3e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -102,6 +102,7 @@ PTESTS_FAST_META_PYTHON =3D "\
     python3-service-identity \
     python3-setproctitle \
     python3-simpleeval \
+    python3-six \
     python3-smpplib \
     python3-soupsieve \
     python3-sqlparse \
diff --git a/meta-python/recipes-devtools/python/python-six.inc b/meta-py=
thon/recipes-devtools/python/python-six.inc
new file mode 100644
index 00000000000..f7a62b60688
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-six.inc
@@ -0,0 +1,11 @@
+SUMMARY =3D "Python 2 and 3 compatibility library"
+HOMEPAGE =3D "https://pypi.org/project/six/"
+SECTION =3D "devel/python"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3De50fab7e9501f3dfc920eafeb24b4=
6ea"
+
+inherit pypi
+
+RDEPENDS:${PN} =3D "python3-io"
+
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-six_1.17.0.bb b/=
meta-python/recipes-devtools/python/python3-six_1.17.0.bb
new file mode 100644
index 00000000000..ca120e03086
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-six_1.17.0.bb
@@ -0,0 +1,23 @@
+inherit setuptools3 ptest-python-pytest
+require python-six.inc
+
+SRC_URI[sha256sum] =3D "ff70335d468e7eb6ec65b95b99d3a2836546063f63acc517=
1de367e834932a81"
+
+PTEST_PYTEST_DIR =3D "."
+
+# test_six.py exercises the six.moves mappings, which import these stdli=
b
+# modules that are packaged separately in oe-core.
+RDEPENDS:${PN}-ptest +=3D " \
+    python3-html \
+    python3-netclient \
+    python3-xmlrpc \
+"
+
+do_install_ptest:append() {
+    # six ships its test at the sdist root; keep only test_six.py plus t=
he
+    # generated run-ptest, and drop the packaged library sources / bytec=
ode.
+    rm -f  ${D}${PTEST_PATH}/six.py
+    rm -f  ${D}${PTEST_PATH}/setup.py ${D}${PTEST_PATH}/setup.cfg ${D}${=
PTEST_PATH}/MANIFEST.in
+    rm -f  ${D}${PTEST_PATH}/CHANGES ${D}${PTEST_PATH}/README.rst ${D}${=
PTEST_PATH}/PKG-INFO ${D}${PTEST_PATH}/LICENSE
+    rm -rf ${D}${PTEST_PATH}/build ${D}${PTEST_PATH}/documentation ${D}$=
{PTEST_PATH}/six.egg-info ${D}${PTEST_PATH}/__pycache__
+}
--=20
2.43.0


