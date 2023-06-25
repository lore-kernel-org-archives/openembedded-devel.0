Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECD12C001B0
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 21:42:37 +0000 (UTC)
Received: from mx.walter.deinstapel.de (mx.walter.deinstapel.de [62.176.232.99])
 by mx.groups.io with SMTP id smtpd.web11.20611.1687729307225217797
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jun 2023 14:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fancydomain.eu header.s=mail header.b=Z1lKmEn1;
 spf=pass (domain: fancydomain.eu, ip: 62.176.232.99, mailfrom: jasper@fancydomain.eu)
From: "Jasper Orschulko" <jasper@fancydomain.eu>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fancydomain.eu;
	s=mail; t=1687729304;
	bh=oCUQpAuEMv57O7SZ6MqQWHCCVAqmSAPBCimuE5JbFYo=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=Z1lKmEn1JmTQjexOf2TGuFxH0lMDZI/XKad0VUisyfWFMLjXjk/IgJikMu3HBAKn8
	 8N4LQEqQ60EH7H7RE45RHuy61uBRZ8c1xczqKFpRFdwfH9be2EKvozs0GFevlpNb5n
	 QHrOI4RXO2ZZSCkCk4nb6eq3Cc/ZJWcK0OcReW/TRZSdT3onMnYQXCniL7ut3giSMU
	 gjVrMSY78zFODrmPoBMiKnLTQLieBxStEsu6vikJ0UssU4Uj9npU7xC0Op32tlneNe
	 GA8stMS3CweTcPl16uoBZRMhh7XVohlWABp7FKiBiYz1Y98cZzHDRLr9R6xq9BJguh
	 UR0CnmwgVJdRw==
To: openembedded-devel@lists.openembedded.org
Cc: Jasper Orschulko <jasper@fancydomain.eu>
Subject: [meta-python][PATCH 2/3] python3-covdefaults: Add initial recipe 2.3.0
Date: Sun, 25 Jun 2023 23:39:58 +0200
Message-ID: <20230625213959.2791472-2-jasper@fancydomain.eu>
In-Reply-To: <20230625213959.2791472-1-jasper@fancydomain.eu>
References: <20230625213959.2791472-1-jasper@fancydomain.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Jun 2023 21:42:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103567

Dependency for python3-platformdirs 3.6.0 ptest

Signed-off-by: Jasper Orschulko <jasper@fancydomain.eu>
---
 .../python/python3-covdefaults/run-ptest      |  3 ++
 .../python/python3-covdefaults_2.3.0.bb       | 31 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-covdefaul=
ts/run-ptest
 create mode 100644 meta-python/recipes-devtools/python/python3-covdefaul=
ts_2.3.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-covdefaults/run-=
ptest b/meta-python/recipes-devtools/python/python3-covdefaults/run-ptest
new file mode 100644
index 0000000000..3385d68939
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-covdefaults/run-ptest
@@ -0,0 +1,3 @@
+#!/bin/sh
+
+pytest -o log_cli=3Dtrue -o log_cli_level=3DINFO | sed -e 's/\[...%\]//g=
'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPED/SK=
IP/g'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" ||=
 $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS"){printf "%s: %s\n", $NF, $0}else{pr=
int}}'| awk '{if ($NF=3D=3D"PASS" || $NF=3D=3D"FAIL" || $NF=3D=3D"SKIP" |=
| $NF=3D=3D"XFAIL" || $NF=3D=3D"XPASS") {$NF=3D"";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-covdefaults_2.3.=
0.bb b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
new file mode 100644
index 0000000000..b7709aa1ca
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-covdefaults_2.3.0.bb
@@ -0,0 +1,31 @@
+SUMMARY =3D "A coverage plugin to provide sensible default settings"
+HOMEPAGE =3D "https://github.com/asottile/covdefaults"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Da3da826da635201a80d2fb40f3034=
929"
+
+# Use GitHub SRC_URI, as pypi package does not include tests
+SRC_URI +=3D " \
+    git://github.com/asottile/covdefaults.git;branch=3Dmain;protocol=3Dh=
ttps \
+    file://run-ptest \
+"
+
+SRCREV =3D "007f5aff5d1c817883385a5f61f742dd11776dc6"
+
+S =3D "${WORKDIR}/git"
+
+inherit setuptools3 ptest
+
+RDEPENDS:${PN} +=3D " \
+    ${PYTHON_PN}-coverage \
+"
+
+RDEPENDS:${PN}-ptest +=3D " \
+    ${PYTHON_PN}-pytest \
+"
+
+do_install_ptest() {
+        install -d ${D}${PTEST_PATH}
+        cp -rf ${S}/tests ${D}${PTEST_PATH}
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.41.0


