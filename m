Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 975BBC2BD09
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 19:55:10 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.151833.1719258902918568960
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Jun 2024 12:55:03 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 047922A0FE
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 21:55:01 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.160.37]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sLpmG-42rpLd0; Mon, 24 Jun 2024 21:55:00 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] exiv2: update 0.28.0 -> 0.28.2
Date: Mon, 24 Jun 2024 21:55:53 +0200
Message-ID: <20240624195553.107793-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1719258900-C5FF8D1D-CD512542/0/0 CLEAN NORMAL
X-TOI-MSGID: 8ef2b7f8-8b4a-4504-9da3-d2a5c1948c1f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Jun 2024 19:55:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111007

- Remove outdated comment
- Switch to git fetcher. Otherwise the official download location leads t=
o:
  WARNING: exiv2-0.28.2-r0 do_recipe_qa: QA Issue: exiv2: SRC_URI uses un=
stable GitHub/GitLab
  archives, convert recipe to use git protocol [src-uri-bad]
- Remove reproducibility hack. Theres no buildpath leakage in exiv2Config=
.cmake
  anymore.

Changes from version 0.28.1 to 0.28.2
-------------------------------------

Release Notes:

* https://github.com/Exiv2/exiv2/issues/2914
* https://github.com/Exiv2/exiv2/milestone/13?closed=3D1

This release also fixes two low-severity security issues in quicktimevide=
o.cpp:

* [CVE-2024-24826](https://github.com/Exiv2/exiv2/security/advisories/GHS=
A-g9xm-7538-mq8w):
  out-of-bounds read in QuickTimeVideo::NikonTagsDecoder.
* [CVE-2024-25112](https://github.com/Exiv2/exiv2/security/advisories/GHS=
A-crmj-qh74-2r36):
  denial of service due to unbounded recursion in QuickTimeVideo::multipl=
eEntriesDecoder.

These vulnerabilities are in a new feature (quicktime video) that was add=
ed in version 0.28.0,
so earlier versions of Exiv2 are not affected.

Changes from version 0.28.0 to 0.28.1
-------------------------------------

Release Notes:
https://github.com/Exiv2/exiv2/issues/2813

This release also fixes [CVE-2023-44398](https://github.com/Exiv2/exiv2/s=
ecurity/advisories/GHSA-hrw9-ggg3-3r4r),
an out-of-bounds write in `BmffImage::brotliUncompress`. The vulnerabilit=
y is in new code that was added in
version 0.28.0, so earlier versions of Exiv2 are not affected.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb | 19 -------------------
 meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb | 11 +++++++++++
 2 files changed, 11 insertions(+), 19 deletions(-)
 delete mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb

diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb b/meta-oe/reci=
pes-support/exiv2/exiv2_0.28.0.bb
deleted file mode 100644
index 958810cf7..000000000
--- a/meta-oe/recipes-support/exiv2/exiv2_0.28.0.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY =3D "Exif, Iptc and XMP metadata manipulation library and tools"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D625f055f41728f84a8d7938acc35b=
dc2"
-
-DEPENDS =3D "zlib expat brotli libinih"
-
-SRC_URI =3D "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${=
BP}-Source.tar.gz"
-SRC_URI[sha256sum] =3D "89af3b5ef7277753ef7a7b5374ae017c6b9e304db3b688f1=
948e73e103491f3d"
-# Once patch is obsolete (project should be aware due to PRs), dos2unix =
can be removed either
-# inherit dos2unix
-S =3D "${WORKDIR}/${BP}-Source"
-
-inherit cmake gettext
-
-do_install:append:class-target() {
-    # reproducibility: remove build host path
-    sed -i ${D}${libdir}/cmake/exiv2/exiv2Config.cmake \
-        -e 's:${STAGING_DIR_HOST}::g'
-}
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb b/meta-oe/reci=
pes-support/exiv2/exiv2_0.28.2.bb
new file mode 100644
index 000000000..faae24799
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.28.2.bb
@@ -0,0 +1,11 @@
+SUMMARY =3D "Exif, Iptc and XMP metadata manipulation library and tools"
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D625f055f41728f84a8d7938acc35b=
dc2"
+
+DEPENDS =3D "zlib expat brotli libinih"
+
+SRC_URI =3D "git://github.com/Exiv2/exiv2.git;protocol=3Dhttps;branch=3D=
0.28.x"
+SRCREV =3D "04207b9c39bf7b3b1a7144f7ed4e4f16b4f29ef6"
+S =3D "${WORKDIR}/git"
+
+inherit cmake gettext
--=20
2.45.1


