Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B638606A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jul 2016 06:02:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u6K62ZDj018994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jul 2016 23:02:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 23:02:35 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 20 Jul 2016 14:00:07 +0800
Message-ID: <1468994407-21703-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-imaging: Fix CVE-2016-2533
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
X-List-Received-Date: Wed, 20 Jul 2016 06:02:38 -0000
Content-Type: text/plain

* PCD decoder overruns the shuffle buffer, Fixes #568
the patch comes from:
https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2533
https://github.com/python-pillow/Pillow/commit/ae453aa18b66af54e7ff716f4ccb33adca60afd4#diff-8ff6909c159597e22288ad818938fd6b

Signed-off-by: Li Wang <li.wang@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../python-imaging-CVE-2016-2533.patch             | 38 ++++++++++++++++++++++
 .../python/python-imaging_1.1.7.bb                 |  4 ++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch

diff --git a/meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch b/meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch
new file mode 100644
index 0000000..b01136f
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-imaging/python-imaging-CVE-2016-2533.patch
@@ -0,0 +1,38 @@
+python-imaging: CVE-2016-2533
+
+the patch comes from:
+https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2533
+https://github.com/python-pillow/Pillow/commit/ae453aa18b66af54e7ff716f4ccb33adca60afd4#diff-8ff6909c159597e22288ad818938fd6b
+
+PCD decoder overruns the shuffle buffer, Fixes #568
+
+Signed-off-by: Li Wang <li.wang@windriver.com>
+---
+ libImaging/PcdDecode.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/libImaging/PcdDecode.c b/libImaging/PcdDecode.c
+index b6898e3..c02d005 100644
+--- a/libImaging/PcdDecode.c
++++ b/libImaging/PcdDecode.c
+@@ -47,7 +47,7 @@ ImagingPcdDecode(Imaging im, ImagingCodecState state, UINT8* buf, int bytes)
+ 	    out[0] = ptr[x];
+ 	    out[1] = ptr[(x+4*state->xsize)/2];
+ 	    out[2] = ptr[(x+5*state->xsize)/2];
+-	    out += 4;
++	    out += 3;
+ 	}
+ 
+ 	state->shuffle((UINT8*) im->image[state->y],
+@@ -62,7 +62,7 @@ ImagingPcdDecode(Imaging im, ImagingCodecState state, UINT8* buf, int bytes)
+ 	    out[0] = ptr[x+state->xsize];
+ 	    out[1] = ptr[(x+4*state->xsize)/2];
+ 	    out[2] = ptr[(x+5*state->xsize)/2];
+-	    out += 4;
++	    out += 3;
+ 	}
+ 
+ 	state->shuffle((UINT8*) im->image[state->y],
+-- 
+1.7.9.5
+
diff --git a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
index a678328..ce45b2a 100644
--- a/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
+++ b/meta-python/recipes-devtools/python/python-imaging_1.1.7.bb
@@ -9,7 +9,9 @@ PR = "r5"
 SRC_URI = "http://effbot.org/downloads/Imaging-${PV}.tar.gz \
            file://0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch \
            file://allow.to.disable.some.features.patch \
-           file://fix-freetype-includes.patch"
+           file://fix-freetype-includes.patch \
+           file://python-imaging-CVE-2016-2533.patch \
+          "
 
 SRC_URI[md5sum] = "fc14a54e1ce02a0225be8854bfba478e"
 SRC_URI[sha256sum] = "895bc7c2498c8e1f9b99938f1a40dc86b3f149741f105cf7c7bd2e0725405211"
-- 
2.8.1


