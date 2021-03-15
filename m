Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2851.1615770851038364532
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 14 Mar 2021 18:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HbgwKEnb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12F1E95F067241;
	Sun, 14 Mar 2021 20:14:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615770849;
	bh=+/LXzXn0dqL1DzmT2N3I3r+vNi3G78y7V81czQlXpl4=;
	h=From:To:CC:Subject:Date;
	b=HbgwKEnbwpi84yOq2jd1F/hHzaFOwtIGhdjnrrWJuyjlQ6h4qD7mjyRGNVtpwA5RB
	 MNhF2vOrR1gBPJ8VXgAuxBM80wurCa3Y/oj8oJ2h+lN9ZvdQicrI+Kd9PeqDrGA2KX
	 Qnc6cAx2VDUp4LowOUsn6MpC4w9GiU0Fj/wAflvw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12F1E956109219
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 14 Mar 2021 20:14:09 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 14
 Mar 2021 20:14:09 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Sun, 14 Mar 2021 20:14:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12F1E8Hk112073;
	Sun, 14 Mar 2021 20:14:09 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Changqing Li <changqing.li@windriver.com>, Khem Raj <raj.khem@gmail.com>,
        <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][dunfell PATCH] thin-provisioning-tools: switch branch from master to main
Date: Sun, 14 Mar 2021 20:14:08 -0500
Message-ID: <20210315011408.6604-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
[cherry pick commit 260809cffdaad4fcd42b0977090f2c467a5474ef to dunfell]
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 .../thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
index 9f89bac22..3f82734ac 100644
--- a/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
+++ b/meta-oe/recipes-support/thin-provisioning-tools/thin-provisioning-tools_0.8.5.bb
@@ -7,7 +7,7 @@ SECTION = "devel"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://github.com/jthornber/thin-provisioning-tools \
+SRC_URI = "git://github.com/jthornber/thin-provisioning-tools;branch=main \
            file://0001-do-not-strip-pdata_tools-at-do_install.patch \
            file://use-sh-on-path.patch \
 "
-- 
2.17.1

