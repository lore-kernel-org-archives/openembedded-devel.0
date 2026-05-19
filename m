Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71761CD4F3C
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 14:49:54 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.478.1779202186210997134
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 May 2026 07:49:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=ybmmwJxY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 12E564E42CEF
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 14:49:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DC7665FFC8
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 14:49:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F573107E8E00;
	Tue, 19 May 2026 16:49:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779202183; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=CZo+jGN5qpc3dpSdnnoxs0dNTaldUBZ/ecV968nbkNE=;
	b=ybmmwJxY3MIUTMmQ5Uigqr1q3Z1EdKYo9EC/d2eqmEHnfV33mciL1q2lBv7aGcMgBjWVW+
	5nV9I5uCITvPxJi073jqpsuiOyZsFm1mZkjsLZy7HCJE6ZpnCipGbgnnyv4/t5mRkJDDg1
	OMyDCaf24fW3WlUW0193fiAAZ0JRSOedYYQA6UHniyGsIQ9hQdDmk4xh/xICK5WQLdTGm0
	3+vdJdSVaZOQBL2mid00bDxJok6m9dEHCg1eCyaiQ7EqaBe0Ips6SwIeuPxNRKPpot9Ky9
	1NykqSBM5zGdoyFlzC/HWnBE83gm/yvjpp9lAfvsQg1XUWuEky84vjvXlRyrpg==
From: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric_=29?= <jeremie.dautheribes@bootlin.com>
Date: Tue, 19 May 2026 16:49:29 +0200
Subject: [oe][meta-python][scarthgap][PATCH] python3-backports-zstd: add
 recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260519-add-backports-zstd-v1-1-b417d7d9c0eb@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWdsEiJDoVZoupjMjVCNtOsWoh
 LtbdfkW/2+gkoMonJsNsjyChrhUdIcGaMZlEhO4Gvq2H9uhOxlkNh7plmIuat5a2LREzHj01A0
 j1DBluYTnb2rd37r6q1D5nmwUZ+9S0KRXmePirBLmMk+YHOz7B2mDLNqSAAAA
X-Change-ID: 20260519-add-backports-zstd-0ccdda4bc156
To: openembedded-devel@lists.openembedded.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric=29?= <jeremie.dautheribes@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5980;
 i=jeremie.dautheribes@bootlin.com; h=from:subject:message-id;
 bh=il5zM2cbGgrkvliz1hguoK//Fil1TuWTmC+VoHJy0vQ=;
 b=owEBbQKS/ZANAwAKASsAXqAbWo8DAcsmYgBqDHiGNJVyy0LKpogrbVj6sZ8yZ1D+ZvNlUPLMj
 zbqfuU3Fy+JAjMEAAEKAB0WIQT7FK2Qhtu4QpBIBAkrAF6gG1qPAwUCagx4hgAKCRArAF6gG1qP
 A5hmD/9uqCpCv/f0tGultyH3SMeMLjn2WIXSCwrPJG1ce4DOepLw9rjLBpWRw7IkgbuF34Y4jM3
 RTdz7xH7ZYU7ED5ksVyGPTz+iwsqPZcCA0TZBJ+nUUbwqmq2lpND678WIaoUSnyRlygLgxbFlfx
 mzpj7s6nYi0id1IO1xGVtvqhlfKdmNlUfiyy3oXxlTPWEJqIWsSSHP4RdzqO18Me6aZpVOa6bYJ
 B211iPuPL04PxaJzQQ0SXLWEeaNEvsuwOaiMfBNeqD6TX1DwjNlAq4UTyKrAJM4TGWfyo8YwtZa
 dE8dDk1yXRN3jl8zIbFuMAoOI/5UfCFIen7c3VF6rgvv2StOHFJQuJ6QcjGwctXT579rF/nt166
 AaDHDTmhgYpv8osQROdNCJwRgzybW03VdlIfs32QmeAKHti50dm44k772ZohQPSa6OZEm36vJ9J
 oYgF294aa+djH+KWGQkdW2t0S3htM/Yo8x5ASkSo/GDMfUyz4R+KD4EherHTg1lpvOanPBKk0iN
 9UocTsPYuwi7H5ML/oZweB77CqPaQC+VA8Dr4XvchoYM6bc3ZVIAUwXb4NfmLPDSGbnjVKmPHUJ
 iX6rPxO6QyDT6IdJuXXR+E4F1n3rZXW7XVdNBAW5wNtHEZVNhUIEa/dQAW5eMxeTMLjWN/lw0Tk
 ns6NFsiKfkXlcvg==
X-Developer-Key: i=jeremie.dautheribes@bootlin.com; a=openpgp;
 fpr=FB14AD9086DBB842904804092B005EA01B5A8F03
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2026 14:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127103

Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremi=
e.dautheribes@bootlin.com>
---
Hello,

This patch adds support for the backports-zstd Python module in the
Scarthgap branch. The recipe was previously part of the master branch but
was removed [1] because the module was integrated into the Python standar=
d
library starting from Python 3.14.

However, since Scarthgap uses Python 3.12, I believe it is reasonable to
include this backport for users on this branch.

[1]: https://git.openembedded.org/meta-openembedded/commit/meta-python?id=
=3Dd2539548d0c0e0a42a54fd35bb0e039e23396725
---
 ...oml-make-license-entries-compatible-with-.patch | 38 ++++++++++++++++=
++++++
 ...ojects.toml-lower-setuptools-requirements.patch | 31 ++++++++++++++++=
++
 .../python/python3-backports-zstd_1.5.0.bb         | 21 ++++++++++++
 3 files changed, 90 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd/0=
001-pyproject.toml-make-license-entries-compatible-with-.patch b/meta-pyt=
hon/recipes-devtools/python/python3-backports-zstd/0001-pyproject.toml-ma=
ke-license-entries-compatible-with-.patch
new file mode 100644
index 0000000000..3e20085071
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backports-zstd/0001-pyp=
roject.toml-make-license-entries-compatible-with-.patch
@@ -0,0 +1,38 @@
+From 1114b0d2b60056a3690be1f7629c112cf28ce367 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Dautheribes=3D20=3D28Sch=
neider=3D20Electric?=3D
+ =3D?UTF-8?q?=3D29?=3D <jeremie.dautheribes@bootlin.com>
+Date: Fri, 15 May 2026 13:39:15 +0000
+Subject: [PATCH] pyproject.toml: make license entries compatible with
+ setputools v69
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The pypropject.toml uses license and license-files entries that are only
+compatible with seuptools >=3D v77, while Yocto Scarthgap only provides
+setuptools v69.
+
+This is the only detected impact, otherwise the do_compile/do_package wo=
rk
+fine.
+
+Upstream-Status: Inappropriate [specific to OE LTS version]
+Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jerem=
ie.dautheribes@bootlin.com>
+---
+ pyproject.toml | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index ec9a1ea..18e6816 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -5,8 +5,8 @@ authors =3D [{ name =3D "Rogdham", email =3D "contact@ro=
gdham.net" }]
+ description =3D "Backport of compression.zstd"
+ readme =3D { file =3D "README.md", content-type =3D "text/markdown" }
+ keywords =3D ["backport", "backports", "pep-784", "zstd"]
+-license =3D "PSF-2.0"
+-license-files =3D ["LICENSE.txt", "LICENSE_zstd.txt"]
++license =3D { text =3D "PSF-2.0" }
++#license-files =3D ["LICENSE.txt"]
+ classifiers =3D [
+     "Development Status :: 5 - Production/Stable",
+     "Intended Audience :: Developers",
diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd/0=
002-pyprojects.toml-lower-setuptools-requirements.patch b/meta-python/rec=
ipes-devtools/python/python3-backports-zstd/0002-pyprojects.toml-lower-se=
tuptools-requirements.patch
new file mode 100644
index 0000000000..7cbeeff61d
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backports-zstd/0002-pyp=
rojects.toml-lower-setuptools-requirements.patch
@@ -0,0 +1,31 @@
+From 2ab6ba1d48a3d0e13382e346ba0a638548a5513e Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?J=3DC3=3DA9r=3DC3=3DA9mie=3D20Dautheribes=3D20=3D28Sch=
neider=3D20Electric?=3D
+ =3D?UTF-8?q?=3D29?=3D <jeremie.dautheribes@bootlin.com>
+Date: Tue, 19 May 2026 14:06:43 +0000
+Subject: [PATCH] pyprojects.toml: lower setuptools requirements
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Scarthgap provides setuptools v69, so adjust the requirement
+accordingly.
+
+Upstream-Status: Inappropriate [specific to OE LTS version]
+Signed-off-by: J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jerem=
ie.dautheribes@bootlin.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 18e6816..b5953e2 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -30,7 +30,7 @@ Source =3D "https://github.com/rogdham/backports.zstd"
+ #
+=20
+ [build-system]
+-requires =3D ["setuptools>=3D80"]
++requires =3D ["setuptools>=3D69"]
+ build-backend =3D "setuptools.build_meta"
+=20
+ [tool.setuptools.packages.find]
diff --git a/meta-python/recipes-devtools/python/python3-backports-zstd_1=
.5.0.bb b/meta-python/recipes-devtools/python/python3-backports-zstd_1.5.=
0.bb
new file mode 100644
index 0000000000..0c83202b4a
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-backports-zstd_1.5.0.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Backport of compression.zstd"
+DESCRIPTION =3D "Backport of PEP-784 'adding Zstandard to the standard l=
ibrary'"
+HOMEPAGE =3D "https://github.com/Rogdham/backports.zstd/"
+LICENSE =3D "0BSD & PSF-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D224f30639105a6ab845e068c2=
d0903ff \
+                    file://LICENSE_zstd.txt;md5=3D85fffd6822a26cd7d2a6ee=
b939ada0da \
+                    file://src/c/pythoncapi-compat/COPYING;md5=3Df74f548=
22fab8814a50330e4e4578b88 \
+                    file://src/c/zstd/LICENSE;md5=3D0822a32f7acdbe013606=
746641746ee8"
+
+inherit pypi python_setuptools_build_meta
+
+SRC_URI +=3D " \
+        file://0001-pyproject.toml-make-license-entries-compatible-with-=
.patch \
+        file://0002-pyprojects.toml-lower-setuptools-requirements.patch =
\
+"
+
+SRC_URI[sha256sum] =3D "a5e622a82eb183b4fbe18032755ce0a15fa9a82f2adb9b62=
1620b91247aaedb7"
+
+PYPI_PACKAGE =3D "backports_zstd"
+
+BBCLASSEXTEND =3D "native nativesdk"

---
base-commit: ae7dfb12245c7f9b9a353499e2688015bd4e6413
change-id: 20260519-add-backports-zstd-0ccdda4bc156

Best regards,
-- =20
J=C3=A9r=C3=A9mie Dautheribes (Schneider Electric) <jeremie.dautheribes@b=
ootlin.com>


