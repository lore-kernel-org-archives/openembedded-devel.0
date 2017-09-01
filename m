Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1CF287838B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Sep 2017 09:31:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v819VZgJ019623
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 1 Sep 2017 02:31:35 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 1 Sep 2017 02:31:34 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 1 Sep 2017 05:31:33 -0400
Message-ID: <1504258293-18973-1-git-send-email-dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] openjpeg: upgrade to 2.2.0
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
X-List-Received-Date: Fri, 01 Sep 2017 09:31:35 -0000
Content-Type: text/plain

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 ...fo_header-reject-bmp-files-with-biBitCoun.patch | 31 ++++++++++++++++++++++
 .../{openjpeg_2.1.1.bb => openjpeg_2.2.0.bb}       |  8 +++---
 2 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.1.1.bb => openjpeg_2.2.0.bb} (65%)

diff --git a/meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch b/meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch
new file mode 100644
index 0000000..866d9aa
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch
@@ -0,0 +1,31 @@
+From 226f07e4b49c2757b181c62e6841000c512054e3 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 14 Aug 2017 17:26:58 +0200
+Subject: [PATCH] bmp_read_info_header(): reject bmp files with biBitCount == 0
+ (#983)
+
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/baf0c1ad4572daa89caa3b12985bdd93530f0dd7]
+CVE: CVE-2017-12982
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
+---
+ src/bin/jp2/convertbmp.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
+index b49e7a0..2715fdf 100644
+--- a/src/bin/jp2/convertbmp.c
++++ b/src/bin/jp2/convertbmp.c
+@@ -392,6 +392,10 @@ static OPJ_BOOL bmp_read_info_header(FILE* IN, OPJ_BITMAPINFOHEADER* header)
+ 
+     header->biBitCount  = (OPJ_UINT16)getc(IN);
+     header->biBitCount |= (OPJ_UINT16)((OPJ_UINT32)getc(IN) << 8);
++    if (header->biBitCount == 0) {
++        fprintf(stderr, "Error, invalid biBitCount %d\n", 0);
++        return OPJ_FALSE;
++    }
+ 
+     if (header->biSize >= 40U) {
+         header->biCompression  = (OPJ_UINT32)getc(IN);
+-- 
+2.8.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
similarity index 65%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
index fa4f796..4ef1c40 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
@@ -4,9 +4,11 @@ HOMEPAGE = "http://www.openjpeg.org"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
-SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
-SRC_URI[md5sum] = "0cc4b2aee0a9b6e9e21b7abcd201a3ec"
-SRC_URI[sha256sum] = "82c27f47fc7219e2ed5537ac69545bf15ed8c6ba8e6e1e529f89f7356506dbaa"
+SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
+           file://0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch \
+          "
+SRC_URI[md5sum] = "269bb0b175476f3addcc0d03bd9a97b6"
+SRC_URI[sha256sum] = "6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b7c6e7b"
 
 inherit cmake
 
-- 
2.8.1


