Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0727ED64
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Sep 2019 09:41:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x829fOmM012850
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 2 Sep 2019 02:41:46 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 2 Sep 2019 02:41:32 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 2 Sep 2019 17:41:31 +0800
Message-ID: <1567417291-321780-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] satyr: upgrade 0.27 -> 0.28
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
X-List-Received-Date: Mon, 02 Sep 2019 09:41:55 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-oe/recipes-support/satyr/{satyr_0.27.bb => satyr_0.28.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/satyr/{satyr_0.27.bb => satyr_0.28.bb} (87%)

diff --git a/meta-oe/recipes-support/satyr/satyr_0.27.bb b/meta-oe/recipes-support/satyr/satyr_0.28.bb
similarity index 87%
rename from meta-oe/recipes-support/satyr/satyr_0.27.bb
rename to meta-oe/recipes-support/satyr/satyr_0.28.bb
index cc07dcb..fbf018d 100644
--- a/meta-oe/recipes-support/satyr/satyr_0.27.bb
+++ b/meta-oe/recipes-support/satyr/satyr_0.28.bb
@@ -10,7 +10,7 @@ inherit autotools-brokensep python3native pkgconfig
 SRC_URI = "git://github.com/abrt/satyr.git \
            file://0002-fix-compile-failure-against-musl-C-library.patch \
 "
-SRCREV = "dff1b877d42bf2153f8f090905d9cc8fb333bf1e"
+SRCREV = "8b5547b89b712b39a59f1d8b366e7de0f5f46108"
 S = "${WORKDIR}/git"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
@@ -23,7 +23,6 @@ PACKAGES += "python3-${BPN}"
 FILES_python3-${BPN} = "${PYTHON_SITEPACKAGES_DIR}/${BPN}"
 
 PACKAGECONFIG ??= "python3 rpm"
-PACKAGECONFIG[python2] = "--with-python2, --without-python2,,python2"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3"
 PACKAGECONFIG[rpm] = "--with-rpm, --without-rpm, rpm"
 
-- 
2.7.4


