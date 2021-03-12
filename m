Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web12.3557.1615519083724600859
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Mar 2021 19:18:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 12C3Hqac029574
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Mar 2021 19:17:57 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 11 Mar 2021 19:17:45 -0800
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Thu, 11 Mar 2021 19:17:44 -0800
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] quagga: Update SRC_URI
Date: Fri, 12 Mar 2021 11:17:43 +0800
Message-ID: <20210312031743.33629-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Update the SRC_URI as the previous is unaccessible to fix the below
warning:
WARNING: quagga-1.2.4-r0 do_fetch: Failed to fetch URL https://download.savannah.gnu.org/releases/quagga/quagga-1.2.4.tar.gz;, attemptin MIRRORS if available

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 6df72427b..3b7a425bb 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -20,7 +20,7 @@ SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '',
 # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
 RDEPENDS_${PN} += "iproute2"
 
-SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
+SRC_URI = "https://github.com/Quagga/quagga/releases/download/quagga-${PV}/quagga-${PV}.tar.gz \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
-- 
2.29.2

