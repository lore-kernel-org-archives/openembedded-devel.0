Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 126C773E36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:17:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B9HQY3010672
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:17:26 -0700 (PDT)
Received: from localhost (128.224.163.137) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 11 Jun 2015 02:17:26 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Jun 2015 17:16:56 +0800
Message-ID: <d91dc6b8dc38ba342cb29cc8f67871b18eb1054b.1434013953.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1434013953.git.yi.zhao@windriver.com>
References: <cover.1434013953.git.yi.zhao@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.163.137]
Subject: [meta-oe][PATCH 9/9] tesseract-lang.inc: set ${S} to fix the QA warning
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
X-List-Received-Date: Thu, 11 Jun 2015 09:17:25 -0000
Content-Type: text/plain

The ${S} is not set in the recipe cause the QA warning:
WARNING: tesseract-lang-eng: the directory ${WORKDIR}/${BP}
(/buildarea2/build/tmp/work/all-poky-linux/tesseract-lang-eng/3.02-r0/tesseract-lang-eng-3.02)
pointed to by the S variable doesn't exist - please set S within the recipe to point to where the source has been unpacked to

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-graphics/tesseract/tesseract-lang.inc  |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc b/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
index 7f69eb1..c40c71d 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang.inc
@@ -3,11 +3,13 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/Apache-2.0;md5
 
 SRC_URI = "https://tesseract-ocr.googlecode.com/files/tesseract-ocr-${PV}.${TESSERACT_LANG}.tar.gz"
 
+S = "${WORKDIR}/tesseract-ocr"
+
 inherit allarch
 
 do_install() {
     install -d ${D}${datadir}/tessdata
-    cp ${WORKDIR}/tesseract-ocr/tessdata/${TESSERACT_LANG}.traineddata ${D}${datadir}/tessdata
+    cp ${S}/tessdata/${TESSERACT_LANG}.traineddata ${D}${datadir}/tessdata
 }
 
 FILES_${PN} += "${datadir}/tessdata"
-- 
1.7.9.5


