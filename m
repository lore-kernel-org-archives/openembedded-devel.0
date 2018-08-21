Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 066E979016
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 07:57:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7L7vfnh023157
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Aug 2018 00:57:41 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 21 Aug 2018 00:57:41 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <raj.khem@gmail.com>
Date: Tue, 21 Aug 2018 15:57:38 +0800
Message-ID: <1534838259-403454-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] fio: Upgrade to 3.8
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
X-List-Received-Date: Tue, 21 Aug 2018 07:57:41 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 meta-oe/recipes-benchmark/fio/{fio_3.7.bb => fio_3.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-benchmark/fio/{fio_3.7.bb => fio_3.8.bb} (95%)

diff --git a/meta-oe/recipes-benchmark/fio/fio_3.7.bb b/meta-oe/recipes-benchmark/fio/fio_3.8.bb
similarity index 95%
rename from meta-oe/recipes-benchmark/fio/fio_3.7.bb
rename to meta-oe/recipes-benchmark/fio/fio_3.8.bb
index 410e27b..eb517c3 100644
--- a/meta-oe/recipes-benchmark/fio/fio_3.7.bb
+++ b/meta-oe/recipes-benchmark/fio/fio_3.8.bb
@@ -20,8 +20,8 @@ PACKAGECONFIG_NUMA_arm = ""
 PACKAGECONFIG ??= "${PACKAGECONFIG_NUMA}"
 PACKAGECONFIG[numa] = ",--disable-numa,numactl"
 
-# rev for v3.7
-SRCREV = "c397ab3aac3d4ed1660d9cd4d820f31a4375306e"
+# rev for v3.8
+SRCREV = "bfd986752ad053175423ffe3bbbeb07803f8ad4a"
 SRC_URI = "git://git.kernel.dk/fio.git \
           file://0001-update-the-interpreter-paths.patch \
 "
-- 
2.7.4


