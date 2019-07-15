Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A10A47ED65
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 07:39:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6F7dauY024991
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jul 2019 00:39:36 -0700 (PDT)
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 00:39:35 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Jul 2019 10:38:44 +0300
Message-ID: <20190715073844.7334-2-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190715073844.7334-1-ovidiu.panait@windriver.com>
References: <20190715073844.7334-1-ovidiu.panait@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 2/2] python3-pillow: Add python3-misc/logging/numbers to RDEPENDS
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
X-List-Received-Date: Mon, 15 Jul 2019 07:39:38 -0000
Content-Type: text/plain

Fix the following issues:
$ python3 -c 'from PIL import Image'
ModuleNotFoundError: No module named 'pathlib'
...
ModuleNotFoundError: No module named 'logging'
...
ModuleNotFoundError: No module named 'numbers'

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-python/recipes-devtools/python/python3-pillow_6.1.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_6.1.bb b/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
index 13e6b4143..b74326755 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_6.1.bb
@@ -23,6 +23,12 @@ DEPENDS += " \
     openjpeg \
 "
 
+RDEPENDS_${PN} += " \
+    ${PYTHON_PN}-misc \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-numbers \
+"
+
 CVE_PRODUCT = "pillow"
 
 S = "${WORKDIR}/git"
-- 
2.20.1


