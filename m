Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47272D6A25A
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 22:00:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6450.1731621619385231680
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Nov 2024 14:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C9B41474
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:49 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id ABD853F66E
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 14:00:18 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 11/21] python3-pocketsphinx: inherit cython class
Date: Thu, 14 Nov 2024 21:59:59 +0000
Message-Id: <20241114220009.737413-11-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114220009.737413-1-ross.burton@arm.com>
References: <20241114220009.737413-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Nov 2024 22:00:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113834

Use the new cython class to avoid duplicated fixup code to remove build
paths.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-devtools/python/python3-pocketsphinx_5.0.3.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0=
.3.bb b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
index 4ffcb4db82..4391da177e 100644
--- a/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pocketsphinx_5.0.3.bb
@@ -8,9 +8,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc4d720cdc9c695=
3091f65e8b01524bb4"
 SRC_URI +=3D "file://0001-cython-Use-cythyon3-in-cmake-check.patch"
 SRC_URI[sha256sum] =3D "27f4de0ca2d2bce391ce87eaab84fe6f0bc059b306fd1702=
d5fe6549b66e1586"
=20
-inherit cmake pkgconfig pypi python3native
+inherit cmake pkgconfig pypi python3native cython
=20
-DEPENDS +=3D "swig-native python3-cython-native python3-scikit-build-nat=
ive gstreamer1.0 gstreamer1.0-plugins-base"
+DEPENDS +=3D "swig-native python3-scikit-build-native gstreamer1.0 gstre=
amer1.0-plugins-base"
=20
 EXTRA_OECMAKE +=3D "-DBUILD_GSTREAMER=3DON"
=20
--=20
2.34.1


