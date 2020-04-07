Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web10.2922.1586288087404932694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2020 12:34:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: matthew.zeng@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 037JYPFB025454
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 7 Apr 2020 12:34:36 -0700
Received: from mt-manjaro (128.224.21.114) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 7 Apr
 2020 12:34:15 -0700
User-agent: mu4e 1.2.0; emacs 28.0.50
From: "Matthew" <matthew.zeng@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] wireshark: poppler: prevent PACKAGECONFIG change based on different layers
Date: Tue, 7 Apr 2020 15:34:13 -0400
Message-ID: <87o8s3qedm.fsf@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.21.114]
Content-Type: text/plain

    As per discussed in a previous email under the subject "Regarding
    poppler auto PACKAGECONFIG when qt5-layer exists", adding a layer
    but not using it should not change PACKAGECONFIG automatically. It
    may result unexpected error.

Signed-off-by: Matthew Zeng <matthew.zeng@windriver.com>
---
 meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb | 2 +-
 meta-oe/recipes-support/poppler/poppler_0.85.0.bb            | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
index 91a7e1a36..db545028f 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_3.2.2.bb
@@ -19,7 +19,7 @@ PE = "1"

 inherit cmake pkgconfig python3native perlnative upstream-version-is-even mime mime-xdg

-PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5 plugins', '', d)}"
+PACKAGECONFIG ?= "libpcap gnutls libnl libcap sbc"

 PACKAGECONFIG_class-native = "libpcap gnutls ssl libssh"

diff --git a/meta-oe/recipes-support/poppler/poppler_0.85.0.bb b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
index 2f5d094fb..366f0c5cf 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.85.0.bb
@@ -14,7 +14,7 @@ DEPENDS = "fontconfig zlib cairo lcms glib-2.0"

 inherit cmake pkgconfig gobject-introspection

-PACKAGECONFIG ??= "jpeg openjpeg png tiff nss ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '', d)}"
+PACKAGECONFIG ??= "jpeg openjpeg png tiff nss"
 PACKAGECONFIG[jpeg] = "-DWITH_JPEG=ON -DENABLE_DCTDECODER=libjpeg,-DWITH_JPEG=OFF -DENABLE_DCTDECODER=none,jpeg"
 PACKAGECONFIG[png] = "-DWITH_PNG=ON,-DWITH_PNG=OFF,libpng"
 PACKAGECONFIG[tiff] = "-DWITH_TIFF=ON,-DWITH_TIFF=OFF,tiff"
--
2.24.0
