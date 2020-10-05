Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.31426.1601891447204779439
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 02:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: siew.hoon.lim@intel.com)
IronPort-SDR: vv3HL60O9Ksj22UFpK9Gz8TxjRhBrCMzwBdKpxrKpx3jCbm/+JXVk1EcjPfvb5uPmbeDNgOXZF
 ufnE3ud5APLQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9764"; a="150993135"
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="150993135"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2020 02:50:43 -0700
IronPort-SDR: gSnM8xC7Ib7t7+J9Q0pnHgEYFePFDNNztRF1WEsVyufFvVh9DiBWSffWsl6yl9smyvAqDbZurR
 DzAdumprTxYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,338,1596524400"; 
   d="scan'208";a="340829599"
Received: from unknown (HELO slim50-desktop.png.intel.com) ([10.221.79.121])
  by fmsmga004.fm.intel.com with ESMTP; 05 Oct 2020 02:50:42 -0700
From: "Lim Siew Hoon" <siew.hoon.lim@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] Alliance for Open Media: new library
Date: Mon,  5 Oct 2020 17:50:19 +0800
Message-Id: <20201005095019.30755-1-siew.hoon.lim@intel.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Lim Siew Hoon <siew.hoon.lim@intel.com>
---
 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/aom/aom_2.0.0.bb

diff --git a/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
new file mode 100644
index 000000000..4b388d57f
--- /dev/null
+++ b/meta-oe/recipes-multimedia/aom/aom_2.0.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "Alliance for Open Media - AV1 Codec Library"
+DESCRIPTION = "Alliance for Open Media AV1 codec library"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ea91368c1bbdf877159435572b931f5"
+
+SRC_URI = "git://aomedia.googlesource.com/aom;protocol=https"
+
+SRCREV = "d1d1226af626a61f7ca664b270dd473b92228984"
+
+S = "${WORKDIR}/git"
+
+DEPENDS_append = " yasm-native"
+
+inherit pkgconfig cmake perlnative python3native
+EXTRA_OECMAKE_append = " -DBUILD_SHARED_LIBS=1"
-- 
2.17.1

