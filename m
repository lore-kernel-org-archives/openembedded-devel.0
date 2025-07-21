Return-Path: <s-jain1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1C6C83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 17:33:04 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.47366.1753119182068961110
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Jul 2025 10:33:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KU+RkYGq;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: s-jain1@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56LHX1Fe1309093
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 12:33:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753119181;
	bh=aJ5xhS2kZC2mw5BeLs5U2KoFKfg3tui+JtcRVADjywE=;
	h=From:To:CC:Subject:Date;
	b=KU+RkYGqvODnM7x72R52O5jshbMIhq/lSYF97WpgNT2kqQwLXp51w4PZh/Wc10rvW
	 ORoC8OJ6MLO3QfyEOgcedT8Wsq8/z5iqjqZWXyurrsaK6sd0ZF0WoB3mcRCzi0BN9g
	 h/gYqm9mRFL6cyy1IXH1OMMM/nEDuCgmb5iY2hTs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56LHX1Im1033254
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 12:33:01 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 21
 Jul 2025 12:33:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 21 Jul 2025 12:33:01 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.227.22])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56LHWxvj010899;
	Mon, 21 Jul 2025 12:32:59 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <devarsht@ti.com>, <praneeth@ti.com>
Subject: [scarthgap][meta-oe][PATCH] kmsxx: Revert to using original name for kmstest
Date: Mon, 21 Jul 2025 23:02:58 +0530
Message-ID: <20250721173258.703425-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Jul 2025 17:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118661

Earlier both libdrm[1] and kmsxx[2] projects used to provide a binary
program called kmstest. To avoid the clash, the kmsxx recipe was
updated to rename this binary to kmsxxtest during installation. However
libdrm project has now removed kmstest[3] and hence there is no clash
in naming anymore, so revert back to original name of binary i.e.
kmstest.

[1]: https://gitlab.freedesktop.org/mesa/libdrm.git
[2]: https://github.com/tomba/kmsxx
[3]: https://gitlab.freedesktop.org/mesa/libdrm.git
commit: 2b997bb4bb688be00620887c8646ff24ccb9396b

Signed-off-by: Swamil Jain <s-jain1@ti.com>
---
Backport above patch[*] from master.

[*]: https://github.com/openembedded/meta-openembedded.git
commit id: 7692f40f5b76ed62ad311edd5c74dfea2612c513
---
 .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb      | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
index cdba1a24d1..8fb93ae7aa 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
@@ -24,12 +24,5 @@ S = "${WORKDIR}/git"
 
 inherit meson pkgconfig
 
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'utils', 'true', 'false', d)}; then
-        # kmstest already provided by libdrm-tests
-        mv ${D}${bindir}/kmstest ${D}${bindir}/kmsxxtest
-    fi
-}
-
 FILES:${PN} ="${bindir} ${libdir}"
 FILES:${PN}-python += "${PYTHON_SITEPACKAGES_DIR}/*"

