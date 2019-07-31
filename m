Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DC4487F3E1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jul 2019 06:49:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6V6mY14018145
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Jul 2019 23:48:44 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 30 Jul 2019 23:48:23 -0700
From: <kai.kang@windriver.com>
To: <bunk@stusta.de>
Date: Wed, 31 Jul 2019 02:48:19 -0400
Message-ID: <20190731064819.134342-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] poppler: toggle gobject-introspection support
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
X-List-Received-Date: Wed, 31 Jul 2019 06:49:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

It doesn't provide a way to enable or disable gobject-introspection
support for poppler. Toggle it respect to variable GI_DATA_ENABLED.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/poppler/poppler_0.79.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
index 068433475..b285eecd2 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.79.0.bb
@@ -34,6 +34,7 @@ EXTRA_OECMAKE += " \
     -DBUILD_GTK_TESTS=OFF \
     -DENABLE_ZLIB=ON \
     -DCMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES:PATH='${STAGING_INCDIR}' \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-DENABLE_GOBJECT_INTROSPECTION=ON', '-DENABLE_GOBJECT_INTROSPECTION=OFF', d)} \
 "
 
 do_configure_append() {
-- 
2.20.0


