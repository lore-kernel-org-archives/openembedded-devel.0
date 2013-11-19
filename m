Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 754F46D840
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2013 21:50:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAJLokWl011537
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 Nov 2013 13:50:46 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 13:50:46 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 19 Nov 2013 15:50:36 -0600
Message-ID: <1384897838-11066-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
References: <1384897838-11066-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [meta-networking][PATCH 1/3] quagga: Fix watchquagga initscript problem.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Nov 2013 21:50:46 -0000
Content-Type: text/plain

From: Bopeng Liu <bopeng.liu@windriver.com>

Change the default config file for making watchquagga can startup successful

Signed-off-by: Bopeng Liu <Bopeng.Liu@windriver.com>
---
 .../recipes-protocols/quagga/files/watchquagga.default           | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/files/watchquagga.default b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
index 53f6a8c..2d601ec 100644
--- a/meta-networking/recipes-protocols/quagga/files/watchquagga.default
+++ b/meta-networking/recipes-protocols/quagga/files/watchquagga.default
@@ -2,6 +2,11 @@
 #watch_daemons="zebra bgpd ospfd ospf6d ripd ripngd"
 watch_daemons="zebra"
 
-# To enable restarts, uncomment this line (but first be sure to edit
+# To enable restarts when multiple daemons are being used, uncomment this line (but first be sure to edit
 # the WATCH_DAEMONS line to reflect the daemons you are actually using):
-watch_options="-z -b_ -r/etc/init.d/quagga_restart_%s -s/etc/init.d/quagga_start_%s -k/etc/init.d/quagga_stop_%s"
+#watch_options="-Az -b_ -r/etc/init.d/quagga_restart_%s -s/etc/init.d/quagga_start_%s -k/etc/init.d/quagga_stop_%s"
+
+# Since we are using one quagga daemon for now, use the following line. If using
+# multiple daemons, comment the line below and uncoment the line mentioned
+# above.
+watch_options="-z -b_ -r/etc/init.d/quagga_restart_%s"
-- 
1.8.1.2.545.g2f19ada


