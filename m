Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55A5A7404E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 09:04:07 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8N948Xk017414
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Sep 2015 02:04:08 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Wed, 23 Sep 2015 02:04:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 23 Sep 2015 17:04:04 +0800
Message-ID: <1442999044-30163-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 2.4.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] p11-kit: remove from meta-oe
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
X-List-Received-Date: Wed, 23 Sep 2015 09:04:09 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Remove p11-kit from meta-oe that there is a newer version in oe-core.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb

diff --git a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb b/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
deleted file mode 100644
index e0ebe7d..0000000
--- a/meta-oe/recipes-support/p11-kit/p11-kit_0.19.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
-
-inherit autotools gettext pkgconfig
-
-DEPENDS = "libtasn1 libffi"
-
-SRC_URI = "http://p11-glue.freedesktop.org/releases/${BP}.tar.gz"
-SRC_URI[md5sum] = "d96046ab6ac00d005342caf416ed76ab"
-SRC_URI[sha256sum] = "94fbed372c11d0a404762aad966e54eb4f44c1d5b871a1b79a1a3b4cf36ed256"
-
-FILES_${PN}-dev += " \
-    ${libdir}/p11-kit-proxy.so \
-    ${libdir}/pkcs11/p11-kit-trust.so \
-"
-FILES_${PN}-dev += "${libdir}/pkcs11/*.la"
-FILES_${PN}-dbg += "${libdir}/pkcs11/.debug"
-- 
2.4.1


