Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E1D0B7F95B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:51:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0032ooCW004330
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 2 Jan 2020 18:51:11 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.468.0; Thu, 2 Jan 2020 18:50:28 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 3 Jan 2020 10:50:25 +0800
Message-ID: <20200103025025.16344-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libbytesize: disable doc build
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
X-List-Received-Date: Fri, 03 Jan 2020 02:51:20 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build doc for libbytesize and the documents are simpole and
not important, so disable doc build.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb b/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
index 07bf1faae..1a5c1848b 100644
--- a/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
+++ b/meta-oe/recipes-support/libbytesize/libbytesize_2.1.bb
@@ -25,8 +25,6 @@ FILES_${PN} += "${PYTHON_SITEPACKAGES_DIR}/bytesize"
 
 PACKAGECONFIG ??= "python3"
 PACKAGECONFIG[python3] = "--with-python3, --without-python3,,python3-core"
-PACKAGECONFIG[doc] = "--with-gtk-doc, --without-gtk-doc, gtk-doc-native"
 
+EXTRA_OECONF = "--without-gtk-doc"
 EXTRA_OEMAKE = "py3libdir=${PYTHON_SITEPACKAGES_DIR}"
-
-
-- 
2.17.1


