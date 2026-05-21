Return-Path: <jeremie.dautheribes@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6636BCD4F3D
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 05:04:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29836.1779339860513334624
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 May 2026 22:04:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=1r72/y0A;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: jeremie.dautheribes@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 21CE74E42D17
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 05:04:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DCDCF60718
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 05:04:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BD843107E8EC0;
	Thu, 21 May 2026 07:04:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779339857; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=7Ice19IMDzLCqwsMcfQm7jPFiptl3DuQQdeamui7mAE=;
	b=1r72/y0ApUArciJh0ConN74nKPnRCR9cJFKXU5lO4FLrliApf9RPZBj1bmaSyJq77As86I
	xd2zrTXUxOJn1wDiVFLM9i+aB2AD03cuS3z25RVNYwKVFjhM2qMdPX86urAz8UW4rIkHYr
	VkrYPGiBTAfTWQrkbVrVEMH8p5cGVOhvxx/h47Eq/EmzujvJj+emNDNsba6ubKioIwXbE/
	79M+Bf2b//05bCp/Ds0csVEEFCZ1I00oD/S3J+QhB23E6trh5lpY5ZoGpl3QtVa39UhK/H
	8Mxt2y2kuzo4XLcO4T1G2aZ6ox7cam6vVaDnMHcl/soW9FKqMWTobhnpeEdiiQ==
From: =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric_=29?= <jeremie.dautheribes@bootlin.com>
Date: Thu, 21 May 2026 07:04:03 +0200
Subject: [oe][meta-python][scarthgap][PATCH v2] python3-backports-zstd: add
 recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20260521-add-backports-zstd-v2-1-a31babc9b810@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Oyw6DIBQFf8WwLg0YH7Gr/gdhAZdboa1CgJpa4
 79X7b7LWcycs5CE0WEil2IhESeXnB83KE8FAavGHqkzG5OSlQ2reUeVMVQreAQfc6KflA1lAMa
 oSgOvG7KJIeLNvY+okD9OL31HyHtJeJRiwKxomLP1oxQJVMy2V0HutnUp+zgfjya+N/6OT5xyq
 ivemtZ0wFBftff56cYz+IHIdV2/EEvzeeQAAAA=
X-Change-ID: 20260519-add-backports-zstd-0ccdda4bc156
To: openembedded-devel@lists.openembedded.org
Cc: miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes_=28Schneider_Electric=29?= <jeremie.dautheribes@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6463;
 i=jeremie.dautheribes@bootlin.com; h=from:subject:message-id;
 bh=l0CD5HCwbUQxpkJNVQ94x8HlHf/qnNdxisxRTD4B2iI=;
 b=owEBbQKS/ZANAwAKASsAXqAbWo8DAcsmYgBqDpJQDFlPJ7bfix5k//JIsRngMfUWXxs9pDBln
 /fkUlwVUpqJAjMEAAEKAB0WIQT7FK2Qhtu4QpBIBAkrAF6gG1qPAwUCag6SUAAKCRArAF6gG1qP
 A5QcEADOW/a02RrRvDNYS1JAytoVML3AFoluJsnwLZQtz4GRLsjOLW1OaUbRgS53PyTfrPa3q50
 2iqpaymm38vTS/SjE83EVX52CfE7wV0H/EsqkGfuBDllD7hiuGcmEHgbOGPOgfLeKFrI59blNtJ
 BNIkA3VB8U34V/T2HN1XyEcaePvpf1QQh4GQXoJucqq/0fUH2TTfbZDfNanKL6gXk3jFavOnY0b
 7AN/GdhLMqu8P2CYnlgd8WVUm3jNZVwr0c5A8Hn201920umEks+tLKuZ8YUeMRfeMGA0CPP+vrZ
 QHJLJIK/ChxG4UGBw8dcIW2GqHuXIexTe7Ub3Rlcqepyh41IyBQ2+dQjm+6/KP6o9Y7Np/qWx0h
 azHYLNkTXJ5BHF0Odl2+ymwNa5JzngSUteO2u5FIsNT2rVb1de3l4fipndNiWIdKSo9VJeRCJp1
 yX/3ZkN82ug7tRM1PcAqhPEqS1cS80bzbTCvEfLaXgHsKKIOUjhZsksBC1kiXiqM/1Qr7QFOc/Q
 YxU2trjJK5MGctHXuexI6I0ioNs8Qex/v/Vum9myu3u3tBozSaAJgMhG5kFPkNGo3z8403jDZNv
 mcE3QWa/vYv312H1ei/7r1Zk2jCV4H4yYoaicGazzwXTkDeCIBPen5au6tELHXWiNJgapK3H0uq
 b8ScNHUrQMNZYxg==
X-Developer-Key: i=jeremie.dautheribes@bootlin.com; a=openpgp;
 fpr=FB14AD9086DBB842904804092B005EA01B5A8F03
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 05:04:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127132

This recipe was previously part of the master branch but was removed
because the zstd module was integrated into the Python standard library
starting from Python 3.14.

Since Scarthgap uses Python 3.12, restore and update this recipe for user=
s
on this branch.

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
Changes in v2:
- Add info in the commit message so that we know why we are adding a new=20
recipe in Scarthgap
- Link to v1: https://patch.msgid.link/20260519-add-backports-zstd-v1-1-b=
417d7d9c0eb@bootlin.com
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


