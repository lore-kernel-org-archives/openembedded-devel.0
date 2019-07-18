Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 081AA7D2AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jul 2019 04:21:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6I4LNK0005511
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jul 2019 21:21:24 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 17 Jul 2019 21:21:23 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 17 Jul 2019 21:21:22 -0700
Message-ID: <20190718042123.61092-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] fio: Upgrade to 3.15
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
X-List-Received-Date: Thu, 18 Jul 2019 04:21:23 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.12.bb => fio_3.15.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.12.bb => fio_3.15.bb} (96%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.12.bb b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
similarity index 96%
rename from meta-oe/recipes-benchmark/fio/fio_3.12.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.15.bb
index e85e7c709..c44075cdb 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.12.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.15.bb
@@ -22,7 +22,7 @@ PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
 # rev for v3.8
-SRCREV = "16500b5a0b03ee0142d592bb74a46943a223b06e"
+SRCREV = "01bf5128d0581e267383f280c6a1dcd26517240f"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
 "
-- 
2.21.0


