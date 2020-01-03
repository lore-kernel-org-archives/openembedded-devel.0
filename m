Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 565187F8A4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 05:25:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 0035Ppep003509
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 2 Jan 2020 21:25:51 -0800 (PST)
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Thu, 2 Jan 2020 21:25:51 -0800
From: <kai.kang@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 3 Jan 2020 13:25:46 +0800
Message-ID: <20200103052546.26944-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAMKF1soUur=ZknHqmVWYALGwnp4_kecgBVtVdp0_11pj6n-PEQ@mail.gmail.com>
References: <CAMKF1soUur=ZknHqmVWYALGwnp4_kecgBVtVdp0_11pj6n-PEQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] libbytesize: disable doc build
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
X-List-Received-Date: Fri, 03 Jan 2020 05:25:51 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It fails to build doc for libbytesize and the documents are simple and
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


