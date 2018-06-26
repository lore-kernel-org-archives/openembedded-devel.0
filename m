Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5C174860
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jun 2018 06:01:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5Q61Fpu013324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jun 2018 23:01:15 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Mon, 25 Jun 2018 23:01:15 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 26 Jun 2018 14:01:03 +0800
Message-ID: <1529992863-24711-20-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
References: <1529992863-24711-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-python][PATCH 20/20] python(3)-idna: upgrade 2.6 -> 2.7
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
X-List-Received-Date: Tue, 26 Jun 2018 06:01:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The license checksum changes but the license remains the same.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta-python/recipes-devtools/python/python-idna.inc                 | 6 +++---
 .../python/{python-idna_2.6.bb => python-idna_2.7.bb}               | 0
 .../python/{python3-idna_2.6.bb => python3-idna_2.7.bb}             | 0
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python-idna_2.6.bb => python-idna_2.7.bb} (100%)
 rename meta-python/recipes-devtools/python/{python3-idna_2.6.bb => python3-idna_2.7.bb} (100%)

diff --git a/meta-python/recipes-devtools/python/python-idna.inc b/meta-python/recipes-devtools/python/python-idna.inc
index b1d0d1895..d6d8d92ba 100644
--- a/meta-python/recipes-devtools/python/python-idna.inc
+++ b/meta-python/recipes-devtools/python/python-idna.inc
@@ -1,10 +1,10 @@
 SUMMARY = "Internationalised Domain Names in Applications"
 HOMEPAGE = "https://github.com/kjd/idna"
 LICENSE = "BSD-3-Clause & Python-2.0 & Unicode"
-LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=c9ba5acd829579492fd5eb306c7a0565"
+LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=782775b32f96098512e283fb5d4546cd"
 
-SRC_URI[md5sum] = "c706e2790b016bd0ed4edd2d4ba4d147"
-SRC_URI[sha256sum] = "2c6a5de3089009e3da7c5dde64a141dbc8551d5b7f6cf4ed7c2568d0cc520a8f"
+SRC_URI[md5sum] = "0e5bb69018ddef1b9d95f681182be82c"
+SRC_URI[sha256sum] = "684a38a6f903c1d71d6d5fac066b58d7768af4de2b832e426ec79c30daa94a16"
 
 RDEPENDS_${PN}_class-target = "\
     ${PYTHON_PN}-codecs \
diff --git a/meta-python/recipes-devtools/python/python-idna_2.6.bb b/meta-python/recipes-devtools/python/python-idna_2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python-idna_2.6.bb
rename to meta-python/recipes-devtools/python/python-idna_2.7.bb
diff --git a/meta-python/recipes-devtools/python/python3-idna_2.6.bb b/meta-python/recipes-devtools/python/python3-idna_2.7.bb
similarity index 100%
rename from meta-python/recipes-devtools/python/python3-idna_2.6.bb
rename to meta-python/recipes-devtools/python/python3-idna_2.7.bb
-- 
2.11.0


