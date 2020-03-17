Return-Path: <ssajal@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABEA36078B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 20:05:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 02HK5sQ1014209
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Mar 2020 13:05:54 -0700 (PDT)
Received: from ala-lpggp3.wrs.com (147.11.105.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 17 Mar 2020 13:05:54 -0700
Received: by ala-lpggp3.wrs.com (Postfix, from userid 20885)	id 33F3A900B9E;
	Tue, 17 Mar 2020 13:05:54 -0700 (PDT)
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Mar 2020 13:05:33 -0700
Message-ID: <20200317200533.56238-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openjpeg: Fix CVE-2020-8112
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
X-List-Received-Date: Tue, 17 Mar 2020 20:05:53 -0000
Content-Type: text/plain

Backport from upstream to fix heap-based buffer overflow.

Upstream-Status: Backport
CVE: CVE-2020-8112

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../openjpeg/openjpeg/CVE-2020-8112.patch     | 46 +++++++++++++++++++
 .../openjpeg/openjpeg_2.3.1.bb                |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
new file mode 100644
index 000000000..cb250530e
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2020-8112.patch
@@ -0,0 +1,46 @@
+From 05f9b91e60debda0e83977e5e63b2e66486f7074 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Thu, 30 Jan 2020 00:59:57 +0100
+Subject: [PATCH] opj_tcd_init_tile(): avoid integer overflow
+
+That could lead to later assertion failures.
+
+Fixes #1231 / CVE-2020-8112
+---
+ src/lib/openjp2/tcd.c | 20 ++++++++++++++++++--
+ 1 file changed, 18 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/openjp2/tcd.c b/src/lib/openjp2/tcd.c
+index deecc4df..aa419030 100644
+--- a/src/lib/openjp2/tcd.c
++++ b/src/lib/openjp2/tcd.c
+@@ -905,8 +905,24 @@ static INLINE OPJ_BOOL opj_tcd_init_tile(opj_tcd_t *p_tcd, OPJ_UINT32 p_tile_no,
+             /* p. 64, B.6, ISO/IEC FDIS15444-1 : 2000 (18 august 2000)  */
+             l_tl_prc_x_start = opj_int_floordivpow2(l_res->x0, (OPJ_INT32)l_pdx) << l_pdx;
+             l_tl_prc_y_start = opj_int_floordivpow2(l_res->y0, (OPJ_INT32)l_pdy) << l_pdy;
+-            l_br_prc_x_end = opj_int_ceildivpow2(l_res->x1, (OPJ_INT32)l_pdx) << l_pdx;
+-            l_br_prc_y_end = opj_int_ceildivpow2(l_res->y1, (OPJ_INT32)l_pdy) << l_pdy;
++            {
++                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->x1,
++                                  (OPJ_INT32)l_pdx)) << l_pdx;
++                if (tmp > (OPJ_UINT32)INT_MAX) {
++                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
++                    return OPJ_FALSE;
++                }
++                l_br_prc_x_end = (OPJ_INT32)tmp;
++            }
++            {
++                OPJ_UINT32 tmp = ((OPJ_UINT32)opj_int_ceildivpow2(l_res->y1,
++                                  (OPJ_INT32)l_pdy)) << l_pdy;
++                if (tmp > (OPJ_UINT32)INT_MAX) {
++                    opj_event_msg(manager, EVT_ERROR, "Integer overflow\n");
++                    return OPJ_FALSE;
++                }
++                l_br_prc_y_end = (OPJ_INT32)tmp;
++            }
+             /*fprintf(stderr, "\t\t\tprc_x_start=%d, prc_y_start=%d, br_prc_x_end=%d, br_prc_y_end=%d \n", l_tl_prc_x_start, l_tl_prc_y_start, l_br_prc_x_end ,l_br_prc_y_end );*/
+ 
+             l_res->pw = (l_res->x0 == l_res->x1) ? 0U : (OPJ_UINT32)((
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
index 4045148dd..42011efa9 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.1.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
     git://github.com/uclouvain/openjpeg.git \
     file://0002-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
     file://CVE-2020-6851.patch \
+    file://CVE-2020-8112.patch \
 "
 SRCREV = "57096325457f96d8cd07bd3af04fe81d7a2ba788"
 S = "${WORKDIR}/git"
-- 
2.17.1


