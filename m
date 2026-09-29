Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A0AC9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 15:30:19 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22.1790695815616761385
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 08:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=qOwILPVS;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A83A61516
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 08:30:11 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C034C3F85F
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 08:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790695815; bh=4MxanXfE23SN+BipeUnNLjLUNUvrVD3XplvVgyxrPmY=;
	h=From:To:Subject:Date:From;
	b=qOwILPVSJWkwRXdOQ22cCJeDGLf4LVb/QLposbhKJtbBA5+7dOriufY7zRTRF0GPH
	 P+0MUivFKJRs2Ns9YnRjrJPWU8mgz38iluY9fIAPEvfSGFsRJVziCsopqkX8ZKQEGG
	 Aco5jbtizkZ+EFExymChTcw/x6nREo/OHQnc3mD8=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] python3-cheetah: upgrade 3.2.6.post1 -> 3.4.0.post5
Date: Tue, 29 Sep 2026 16:30:05 +0100
Message-ID: <20260929153005.255468-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:30:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130484

The package name changed from Cheetah3 to ct3[1], so we didn't get any
upgrade notices from AUH.  Update the PYPI_PACKAGE, and upgrade to the
latest release.

Remove the RDEPENDS on legacy-cgi, this is no longer needed[2].

License-Update: Copyright years updated.

[1] cheetah3 673259b ("The project is renamed to ``CT3`` at PyPI")
[2] cheetah3 02a4076 ("Fix(webInput): Use `parse_qs` instead of `cgi`")

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../python/python3-cheetah_3.2.6.post1.bb         | 15 ---------------
 .../python/python3-cheetah_3.4.0.post5.bb         | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 15 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-cheetah_3=
.2.6.post1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-cheetah_3=
.4.0.post5.bb

diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.po=
st1.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.=
bb
deleted file mode 100644
index 252ec4cd89..0000000000
--- a/meta-python/recipes-devtools/python/python3-cheetah_3.2.6.post1.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-SUMMARY =3D "Python template engine and code generation tool"
-HOMEPAGE =3D "https://cheetahtemplate.org/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D15e13a4ed0e5880e3e55ec88b0921=
181"
-
-PYPI_PACKAGE =3D "Cheetah3"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} =3D "python3-pickle python3-pprint"
-RDEPENDS:${PN}:class-native =3D "python3-legacy-cgi-native"
-
-BBCLASSEXTEND =3D "native nativesdk"
-
-SRC_URI[sha256sum] =3D "58b5d84e5fbff6cf8e117414b3ea49ef51654c02ee887d15=
5113c5b91d761967"
diff --git a/meta-python/recipes-devtools/python/python3-cheetah_3.4.0.po=
st5.bb b/meta-python/recipes-devtools/python/python3-cheetah_3.4.0.post5.=
bb
new file mode 100644
index 0000000000..0a990624c4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-cheetah_3.4.0.post5.bb
@@ -0,0 +1,14 @@
+SUMMARY =3D "Python template engine and code generation tool"
+HOMEPAGE =3D "https://cheetahtemplate.org/"
+LICENSE =3D "MIT"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6c8d05debf9d3d283931051ce5232=
fe7"
+
+PYPI_PACKAGE =3D "ct3"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} =3D "python3-pickle python3-pprint"
+
+BBCLASSEXTEND =3D "native nativesdk"
+
+SRC_URI[sha256sum] =3D "1c5f2000d52d591703c74f6f5f7ef427ed1b6501be28e3f1=
634f62c3a5d792e1"
--=20
2.43.0


