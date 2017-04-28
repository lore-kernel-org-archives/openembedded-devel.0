Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8106371E50
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Apr 2017 05:58:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3S5wFS9021263
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 22:58:16 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 27 Apr 2017 22:58:15 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 28 Apr 2017 13:58:14 +0800
Message-ID: <20170428055814.8696-1-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] python-pygobject: remove the empty pkgconfig directory
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
X-List-Received-Date: Fri, 28 Apr 2017 05:58:15 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The empty pkgconfif directory causes error when run
relocatable_native_pcfiles:

| sed: can't read /path/to/recipe-sysroot-native/usr/lib/pkgconfig/*.pc: No such file or directory

So remove the directory instead of removing the pc file
but left an empty pkgconfig diretory.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
index 952145f1e..acc2f5b7a 100644
--- a/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
+++ b/meta-oe/recipes-devtools/python/python-pygobject_3.22.0.bb
@@ -30,5 +30,5 @@ RDEPENDS_${PN}_class-native = ""
 
 do_install_append() {
     # Remove files that clash with python3-pygobject; their content is same
-    rm ${D}${includedir}/pygobject-3.0/pygobject.h ${D}${libdir}/pkgconfig/pygobject-3.0.pc
+    rm -rf ${D}${includedir}/pygobject-3.0//pygobject.h ${D}${libdir}/pkgconfig
 }
-- 
2.11.0


