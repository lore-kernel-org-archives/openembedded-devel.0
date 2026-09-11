Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAEF6C88E4C
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 11:21:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37349.1789125705927660423
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Sep 2026 04:21:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XrfPOO1M;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B404143D
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 04:21:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D92753F59E
	for <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 04:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789125705; bh=fG0aXrtdwyBXv+17/mFA1OojywrLSfjSlfNSg4clwqU=;
	h=From:To:Subject:Date:From;
	b=XrfPOO1Mv/pD+zeOBjSa0KdclzlaP+BikHxyEtBQsow23yPsTWAZ5pF0kai6+Yzm1
	 JJFHqIue4XDFD15S3DjE32ghhgJdBl3+UWMdV4iB0uenKLegg4M4fBNwzbObQkxg6T
	 ZOEffQdk3b+7jmJzCKEimOLJWXG818mZXwAaLZhI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] tomcli: add new recipe
Date: Fri, 11 Sep 2026 12:21:41 +0100
Message-ID: <20260911112141.2673836-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Sep 2026 11:21:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129962

tomcli is a CLI for working with TOML files.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../include/ptest-packagelists-meta-python.inc    |  1 +
 .../recipes-devtools/python/tomcli_0.10.1.bb      | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/tomcli_0.10.1.bb

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc =
b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 6904b5b3d9..e4eae4ef43 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -129,6 +129,7 @@ PTESTS_FAST_META_PYTHON =3D "\
     python3-xmltodict \
     python3-xxhash \
     python3-yarl \
+    tomcli \
 "
=20
 PTESTS_SLOW_META_PYTHON =3D "\
diff --git a/meta-python/recipes-devtools/python/tomcli_0.10.1.bb b/meta-=
python/recipes-devtools/python/tomcli_0.10.1.bb
new file mode 100644
index 0000000000..d219f820dd
--- /dev/null
+++ b/meta-python/recipes-devtools/python/tomcli_0.10.1.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "CLI for working with TOML files"
+HOMEPAGE =3D "https://tomcli.gtmx.me"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3c5eb6b1eb58832012789763a45d0=
51f"
+
+SRC_URI[sha256sum] =3D "0a27c685620b10a0f389b1d55dc66ea904054b178176d414=
40de55d296e1109d"
+
+inherit pypi python_flit_core ptest-python-pytest
+
+RDEPENDS:${PN} =3D "python3-click python3-tomlkit"
+
+# NOTE: There are lots of skips in the ptest from tomli and tomli_w
+# but we only care about the tomlkit backend.
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.43.0


