Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 04AC27470D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 07:18:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w4T7IgQ3022003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2018 00:18:42 -0700 (PDT)
Received: from localhost (128.224.162.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Tue, 29 May 2018 00:18:41 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 29 May 2018 15:17:37 +0800
Message-ID: <1527578277-26494-5-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
References: <1527578277-26494-1-git-send-email-yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.137]
Subject: [meta-oe][PATCH 04/24] lmsensors: add RECIPE_UPSTREAM_VERSION
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 07:18:41 -0000
Content-Type: text/plain

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
index 454a69f..f235469 100644
--- a/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
+++ b/meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
@@ -16,6 +16,14 @@ SRC_URI = "https://github.com/groeck/lm-sensors/archive/V3-4-0.tar.gz \
 SRC_URI[md5sum] = "1e9f117cbfa11be1955adc96df71eadb"
 SRC_URI[sha256sum] = "e334c1c2b06f7290e3e66bdae330a5d36054701ffd47a5dde7a06f9a7402cb4e"
 
+# It is using '-' but not '.' as delimiter for the version in the releases page,
+# which causes the version comparison unmatched.
+#UPSTREAM_CHECK_URI = "https://github.com/groeck/lm-sensors/releases"
+
+RECIPE_UPSTREAM_VERSION = "3.4.0"
+RECIPE_UPSTREAM_DATE = "Jun 25, 2015"
+CHECK_DATE = "May 28, 2018"
+
 inherit update-rc.d systemd
 
 RDEPENDS_${PN}-dev = ""
-- 
2.7.4


