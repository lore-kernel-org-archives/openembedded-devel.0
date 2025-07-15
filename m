Return-Path: <s-jain1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA83C83F17
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 17:43:59 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.1508.1752601437238604730
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 10:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dOvSxsdG;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: s-jain1@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FHhuSd063551
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 12:43:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752601436;
	bh=18P0vxrdoPo3/YtW3IE2PTqwM4Tj0ca65RoIZRJYs0Q=;
	h=From:To:CC:Subject:Date;
	b=dOvSxsdGbvt8UtZ0eaYBG/DzEjNELFl0HWYSidywvMCrIjS0db16sFt8y6ZelkKxT
	 7CK0QCW4sw9i9aPI867rySxn9pYnK9olynB6fg+hsrYAdKwXo4zLYGDJAUq32p3PaU
	 LxpSm70GP2mHm++zzFYxnUWkj9+4UIL16Tdi4muc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FHhuAx1415603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 12:43:56 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 12:43:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 12:43:56 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.227.22])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FHhsob3297446;
	Tue, 15 Jul 2025 12:43:54 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <devarsht@ti.com>, <praneeth@ti.com>, Swamil Jain <s-jain1@ti.com>
Subject: [meta-oe][PATCH] kmsxx: Revert to using original name for kmstest
Date: Tue, 15 Jul 2025 23:13:21 +0530
Message-ID: <20250715174321.476692-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 17:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118565

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
 .../meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb     | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
index 5d204d7d94..c8caaff221 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-multimedia/kmsxx/kmsxx_git.bb
@@ -20,15 +20,7 @@ PACKAGECONFIG[utils] += "-Dutils=true, -Dutils=false"
 
 DEPENDS += "libdrm libevdev fmt"
 
-
 inherit meson pkgconfig
 
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'utils', 'true', 'false', d)}; then
-        # kmstest already provided by libdrm-tests
-        mv ${D}${bindir}/kmstest ${D}${bindir}/kmsxxtest
-    fi
-}
-
 FILES:${PN} = "${bindir} ${libdir}"
 FILES:${PN}-python += "${PYTHON_SITEPACKAGES_DIR}/*"

