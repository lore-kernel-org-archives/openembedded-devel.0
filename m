Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2002CCD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:24 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21487.1780394898046298510
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cMdJsGpo;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394899; x=1811930899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vYtXzzlOXcJwCKAQs4NTXZFsa9M80OTfuB7KS1ZA4Mc=;
  b=cMdJsGpoM9fPEnC1KZSb3g2fZkZrz36lJtGPskocr5E0PNDq34T6zICN
   p1+v9zZOPppDadySod5x2k0O8pQv0M8peQxJlYLdl20rQg8CqoJACtf+2
   Ht3TiFK6LpBgzRArpENMP7PRbodJ8eJzqptQrRk3fwDMkQr3W1Ap9EtjK
   uZUi4S4jbSKPwLvnHfVJrrbMcxb+5y+ZkVDyFy9EDEr5UPm5ahhUu2sZx
   tXG9SrfOcXQLf/UnM3WsN9dSbyV08MGEvAn15Us4GCCa/TRx4JUx4Lfz6
   Pu4jxOT+Rfg+D7WG5uXfdqs0jmnjj8UaeUw9TA2GPGw0R4JN7m5C6zBC9
   A==;
X-CSE-ConnectionGUID: 1mqpWxHnSwaeRTDUZODFcA==
X-CSE-MsgGUID: cSwVPosmRP6iQaj5aexumQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242743047"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242743047"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:17 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 5E34F7A45
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:16 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 10E30180CCDB
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:16 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id AC6281800107;
	Tue,  2 Jun 2026 10:08:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 08/38] libgphoto2: upgrade 2.5.33 -> 2.5.34
Date: Tue,  2 Jun 2026 18:07:24 +0800
Message-ID: <20260602100755.2117-8-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127330

From: Wang Mingyu <wangmy@fujitsu.com>

0001-libgphoto2-fix-const-correctness-for-c23-builds.patch
CVE-2026-40333.patch
CVE-2026-40334.patch
CVE-2026-40335.patch
CVE-2026-40336.patch
CVE-2026-40338.patch
CVE-2026-40339.patch
CVE-2026-40340.patch
CVE-2026-40341.patch
removed since they're included in 2.5.34

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...fix-const-correctness-for-c23-builds.patch |  84 ----------
 .../gphoto2/libgphoto2/CVE-2026-40333.patch   | 150 ------------------
 .../gphoto2/libgphoto2/CVE-2026-40334.patch   |  37 -----
 .../gphoto2/libgphoto2/CVE-2026-40335.patch   |  43 -----
 .../gphoto2/libgphoto2/CVE-2026-40336.patch   |  44 -----
 .../gphoto2/libgphoto2/CVE-2026-40338.patch   |  34 ----
 .../gphoto2/libgphoto2/CVE-2026-40339.patch   |  41 -----
 .../gphoto2/libgphoto2/CVE-2026-40340.patch   |  40 -----
 .../gphoto2/libgphoto2/CVE-2026-40341.patch   |  69 --------
 ...gphoto2_2.5.33.bb => libgphoto2_2.5.34.bb} |  11 +-
 10 files changed, 1 insertion(+), 552 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch
 delete mode 100644 meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
 rename meta-oe/recipes-graphics/gphoto2/{libgphoto2_2.5.33.bb => libgphoto2_2.5.34.bb} (75%)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch
deleted file mode 100644
index 9ded174095..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/0001-libgphoto2-fix-const-correctness-for-c23-builds.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From bfa786a260bfd4660e8186ebad8778718e85e8cd Mon Sep 17 00:00:00 2001
-From: Khem Raj <khem.raj@oss.qualcomm.com>
-Date: Sat, 4 Apr 2026 14:56:01 -0700
-Subject: [PATCH] libgphoto2: fix const-correctness for c23 builds
-
-C23 treats the return values of strrchr() and strchr() as const char *
-when the input string is const-qualified. Update local variables to use
-const char * where appropriate to avoid discarded-qualifier warnings and
-build failures with -std=gnu23.
-
-No functional change intended.
-
-Upstream-Status: Submitted [https://github.com/gphoto/libgphoto2/pull/1235]
-Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
----
- camlibs/directory/directory.c         | 2 +-
- libgphoto2/gphoto2-file.c             | 6 +++---
- libgphoto2/gphoto2-filesys.c          | 2 +-
- packaging/generic/print-camera-list.c | 2 +-
- 4 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/camlibs/directory/directory.c b/camlibs/directory/directory.c
-index 790405d54..cc63c6684 100644
---- a/camlibs/directory/directory.c
-+++ b/camlibs/directory/directory.c
-@@ -125,7 +125,7 @@ static const char *
- get_mime_type (const char *filename)
- {
- 
--	char *dot;
-+	const char *dot;
- 	int x=0;
- 
- 	dot = strrchr(filename, '.');
-diff --git a/libgphoto2/gphoto2-file.c b/libgphoto2/gphoto2-file.c
-index 04d4d5e3e..1a9dbc193 100644
---- a/libgphoto2/gphoto2-file.c
-+++ b/libgphoto2/gphoto2-file.c
-@@ -610,7 +610,7 @@ int
- gp_file_open (CameraFile *file, const char *filename)
- {
- 	FILE *fp;
--	char *name, *dot;
-+	const char *name, *dot;
- 	long size, size_read;
- 	int  i;
- 	struct stat s;
-@@ -906,8 +906,8 @@ gp_file_get_name (CameraFile *file, const char **name)
- int
- gp_file_get_name_by_type (CameraFile *file, const char *basename, CameraFileType type, char **newname)
- {
--	char *prefix = NULL, *s, *new, *slash = NULL;
--	const char *suffix = NULL;
-+	char *prefix = NULL, *new;
-+	const char *suffix = NULL, *s, *slash = NULL;
- 	int i;
- 
- 	C_PARAMS (file && basename && newname);
-diff --git a/libgphoto2/gphoto2-filesys.c b/libgphoto2/gphoto2-filesys.c
-index 45f957292..07decff24 100644
---- a/libgphoto2/gphoto2-filesys.c
-+++ b/libgphoto2/gphoto2-filesys.c
-@@ -521,7 +521,7 @@ append_to_folder (CameraFilesystemFolder *folder,
- 	CameraFilesystemFolder **newfolder
- ) {
- 	CameraFilesystemFolder	*f;
--	char	*s;
-+	const char	*s;
- 
- 	GP_LOG_D ("Append to folder %p/%s - %s", folder, folder->name, foldername);
- 	/* Handle multiple slashes, and slashes at the end */
-diff --git a/packaging/generic/print-camera-list.c b/packaging/generic/print-camera-list.c
-index 1707b4e87..44530b4ae 100644
---- a/packaging/generic/print-camera-list.c
-+++ b/packaging/generic/print-camera-list.c
-@@ -1138,7 +1138,7 @@ escape_html(const char *str) {
- 	newstr = malloc(strlen(str)+1+inc);
- 	s = str; ns = newstr;
- 	do {
--		char *x;
-+		const char *x;
- 		x = strchr(s,'&');
- 		if (x) {
- 			memcpy (ns, s, x-s);
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch
deleted file mode 100644
index 77c307e88d..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40333.patch
+++ /dev/null
@@ -1,150 +0,0 @@
-From 8fefd2da7b9e2c7c448086cd251b108c0ebf1262 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Wed, 8 Apr 2026 15:18:42 +0200
-Subject: [PATCH] Fixed EOS ImageFormat/CustomFuncEx Parsers Lack Length
- Parameter
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-ptp_unpack_EOS_ImageFormat() and ptp_unpack_EOS_CustomFuncEx() accept
-const unsigned char** data but no length/size parameter. They perform
-unbounded reads via dtoh32o calls (up to 36 bytes for ImageFormat,
-up to 1024 bytes for CustomFuncEx). Callers in ptp_unpack_EOS_events()
-have xsize available but never pass it.
-
- CVE-2026-40333
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40333
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/1817ecead20c2aafa7549dac9619fe38f47b2f53]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 53 ++++++++++++++++++++++++++++++++++-------
- 1 file changed, 44 insertions(+), 9 deletions(-)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index 09421b7..09dcc24 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -1448,7 +1448,7 @@ ptp_unpack_Canon_EOS_FE (PTPParams *params, const unsigned char* data, unsigned
- 
- 
- static inline uint16_t
--ptp_unpack_EOS_ImageFormat (PTPParams* params, const unsigned char** data )
-+ptp_unpack_EOS_ImageFormat (PTPParams* params, const unsigned char** data, unsigned int *size )
- {
- 	/*
- 	  EOS ImageFormat entries look are a sequence of u32 values:
-@@ -1492,30 +1492,57 @@ ptp_unpack_EOS_ImageFormat (PTPParams* params, const unsigned char** data )
- 
- 	const uint8_t* d = *data;
- 	uint32_t offset = 0;
--	uint32_t n = dtoh32o (d, offset);
-+	uint32_t n;
- 	uint32_t l, t1, s1, c1, t2 = 0, s2 = 0, c2 = 0;
- 
-+	if (*size < sizeof(uint32_t)) {
-+		ptp_debug (params, "parsing EOS ImageFormat property failed 1 (size %d)", *size);
-+		return 0;
-+	}
-+	n = dtoh32o (d, offset);
-+	*size -= sizeof(uint32_t);
-+
- 	if (n != 1 && n !=2) {
- 		ptp_debug (params, "parsing EOS ImageFormat property failed (n != 1 && n != 2: %d)", n);
- 		return 0;
- 	}
--
-+	if (*size < sizeof(uint32_t)) {
-+		ptp_debug (params, "parsing EOS ImageFormat property failed 2 (size %d)", *size);
-+		return 0;
-+	}
- 	l = dtoh32o (d, offset);
-+	*size -= sizeof(uint32_t);
-+
- 	if (l != 0x10) {
- 		ptp_debug (params, "parsing EOS ImageFormat property failed (l != 0x10: 0x%x)", l);
- 		return 0;
- 	}
- 
-+	if (*size < 3*sizeof(uint32_t)) {
-+		ptp_debug (params, "parsing EOS ImageFormat property failed 3 (size %d)", *size);
-+		return 0;
-+	}
- 	t1 = dtoh32o (d, offset);
- 	s1 = dtoh32o (d, offset);
- 	c1 = dtoh32o (d, offset);
-+	*size -= 3*sizeof(uint32_t);
- 
- 	if (n == 2) {
-+		if (*size < sizeof(uint32_t)) {
-+			ptp_debug (params, "parsing EOS ImageFormat property failed 4 (size %d)", *size);
-+			return 0;
-+		}
- 		l = dtoh32o (d, offset);
-+		*size -= sizeof(uint32_t);
-+
- 		if (l != 0x10) {
- 			ptp_debug (params, "parsing EOS ImageFormat property failed (l != 0x10: 0x%x)", l);
- 			return 0;
- 		}
-+		if (*size < 3*sizeof(uint32_t)) {
-+			ptp_debug (params, "parsing EOS ImageFormat property failed 5 (size %d)", *size);
-+			return 0;
-+		}
- 		t2 = dtoh32o (d, offset);
- 		s2 = dtoh32o (d, offset);
- 		c2 = dtoh32o (d, offset);
-@@ -1668,12 +1695,20 @@ ptp_unpack_EOS_FocusInfoEx (PTPParams* params, const unsigned char** data, uint3
- 
- 
- static inline char*
--ptp_unpack_EOS_CustomFuncEx (PTPParams* params, const unsigned char** data )
-+ptp_unpack_EOS_CustomFuncEx (PTPParams* params, const unsigned char** data, unsigned int *size )
- {
--	uint32_t s = dtoh32a( *data );
--	uint32_t n = s/4, i;
-+	uint32_t s, n, i;
- 	char	*str, *p;
- 
-+	if (*size < sizeof(uint32_t))
-+		return strdup("bad length");
-+
-+	s = dtoh32a( *data );
-+	n = s/4;
-+
-+	if (*size < 4+s)
-+		return strdup("bad length");
-+
- 	if (s > 1024) {
- 		ptp_debug (params, "customfuncex data is larger than 1k / %d... unexpected?", s);
- 		return strdup("bad length");
-@@ -1962,7 +1997,7 @@ ptp_unpack_EOS_events (PTPParams *params, const unsigned char* data, unsigned in
- 			case PTP_DPC_CANON_EOS_ImageFormatExtHD:
- 				/* special handling of ImageFormat properties */
- 				for (j=0;j<dpd_count;j++) {
--					dpd->FORM.Enum.SupportedValue[j].u16 = ptp_unpack_EOS_ImageFormat( params, &xdata );
-+					dpd->FORM.Enum.SupportedValue[j].u16 = ptp_unpack_EOS_ImageFormat( params, &xdata, &xsize );
- 					ptp_debug (params, INDENT "prop %x option[%2d] == 0x%04x", dpc, j, dpd->FORM.Enum.SupportedValue[j].u16);
- 				}
- 				break;
-@@ -2267,7 +2302,7 @@ ptp_unpack_EOS_events (PTPParams *params, const unsigned char* data, unsigned in
- 			case PTP_DPC_CANON_EOS_ImageFormatSD:
- 			case PTP_DPC_CANON_EOS_ImageFormatExtHD:
- 				dpd->DataType = PTP_DTC_UINT16;
--				dpd->DefaultValue.u16 = ptp_unpack_EOS_ImageFormat( params, &xdata );
-+				dpd->DefaultValue.u16 = ptp_unpack_EOS_ImageFormat( params, &xdata, &xsize );
- 				dpd->CurrentValue.u16 = dpd->DefaultValue.u16;
- 				ptp_debug (params, INDENT "prop %x value == 0x%04x (u16)", dpc, dpd->CurrentValue.u16);
- 				break;
-@@ -2275,7 +2310,7 @@ ptp_unpack_EOS_events (PTPParams *params, const unsigned char* data, unsigned in
- 				dpd->DataType = PTP_DTC_STR;
- 				free (dpd->DefaultValue.str);
- 				free (dpd->CurrentValue.str);
--				dpd->DefaultValue.str = ptp_unpack_EOS_CustomFuncEx( params, &xdata );
-+				dpd->DefaultValue.str = ptp_unpack_EOS_CustomFuncEx( params, &xdata, &xsize );
- 				dpd->CurrentValue.str = strdup( (char*)dpd->DefaultValue.str );
- 				ptp_debug (params, INDENT "prop %x value == %s", dpc, dpd->CurrentValue.str);
- 				break;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
deleted file mode 100644
index 883582dff0..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40334.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 20b33a26b2efdbf2c35c5cacc54a041855ec764b Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Wed, 8 Apr 2026 15:15:54 +0200
-Subject: [PATCH] Fixed Canon FolderEntry Missing Null Termination
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-ptp_unpack_Canon_FE() copies filename with strncpy into a 13-byte
-buffer without explicit null termination. The EOS variant at line
-1451–1452 correctly adds fe->Filename[PTP_CANON_FilenameBufferLen-1]
-= 0; confirming this was recognized as necessary but not applied to the
-original Canon path.
-
- CVE-2026-40334
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40334
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/259fc7d3bfe534ce4b114c464f55b448670ab873]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index 09dcc24..982b4f4 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -1369,6 +1369,7 @@ ptp_unpack_Canon_FE (PTPParams *params, const unsigned char* data, PTPCANONFolde
- 	fe->ObjectSize       = dtoh32a(data + PTP_cfe_ObjectSize);
- 	fe->Time     = (time_t)dtoh32a(data + PTP_cfe_Time);
- 	strncpy(fe->Filename, (char*)data + PTP_cfe_Filename, PTP_CANON_FilenameBufferLen);
-+	fe->Filename[PTP_CANON_FilenameBufferLen-1] = '\0';
- }
- 
- /*
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
deleted file mode 100644
index dfe832e6c8..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40335.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From edcdf804662eb4340fdc371af4853d6579e969ab Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Wed, 8 Apr 2026 15:07:38 +0200
-Subject: [PATCH] =?UTF-8?q?Fixed=20UINT128/INT128=20Unchecked=20Offset=20A?=
- =?UTF-8?q?dvance=20(CWE-125)=20=E2=80=94=20MEDIUM?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Finding 5: UINT128/INT128 Unchecked Offset Advance (CWE-125) — MEDIUM
-
-In ptp_unpack_DPV(), the PTP_DTC_UINT128 and PTP_DTC_INT128 cases advance *offset += 16 without verifying 16 bytes remain. The entry check at line 609 only guarantees *offset < total (at least 1 byte available). After the unchecked advance, *offset can exceed total, and the CTVAL macro's bounds check (total - *offset < sizeof(target)) wraps due to unsigned arithmetic.
-
-CVE-2026-40335
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40335
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/433bde9888d70aa726e32744cd751d7dbe94379a]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index 982b4f4..7fc120d 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -614,10 +614,14 @@ ptp_unpack_DPV (
- 	case PTP_DTC_UINT64: CTVAL(value->u64,dtoh64a); break;
- 
- 	case PTP_DTC_UINT128:
-+		if (total - *offset < 16)
-+			return 0;
- 		*offset += 16;
- 		/*fprintf(stderr,"unhandled unpack of uint128n");*/
- 		break;
- 	case PTP_DTC_INT128:
-+		if (total - *offset < 16)
-+			return 0;
- 		*offset += 16;
- 		/*fprintf(stderr,"unhandled unpack of int128n");*/
- 		break;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
deleted file mode 100644
index 1a809b4f25..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40336.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From e19c45d3530f1585805711e14aa4ea788e499f46 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Wed, 8 Apr 2026 15:13:51 +0200
-Subject: [PATCH] Fixed Sony DPD Secondary Enum List Memory Leak
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Finding 4: Sony DPD Secondary Enum List Memory Leak (CWE-401) — LOW
-
-File: ptp-pack.c:884-885
-
-When processing a secondary enumeration list (2024+ Sony cameras), line
-884–885 overwrites dpd->FORM.Enum.SupportedValue with a new calloc()
-without freeing the previous allocation from line 857. The original
-array and any string values it contains are leaked.
-
-CVE-2026-40336
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40336
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/404ff02c75f3cb280196fc260a63c4d26cf1a8f6]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index 7fc120d..fc51d77 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -879,6 +879,11 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
- 		/* check if we have a secondary list of items, this is for newer Sonys (2024) */
- 		if (val < 0x200) {	/* if a secondary list is not provided, this will be the next property code - 0x5XXX or 0xDxxx */
- 			if (dpd->FormFlag == PTP_DPFF_Enumeration) {
-+				/* free old enum variables */
-+				for (i=0;i<dpd->FORM.Enum.NumberOfValues;i++)
-+					ptp_free_propvalue (dpd->DataType, dpd->FORM.Enum.SupportedValue+i);
-+				free (dpd->FORM.Enum.SupportedValue);
-+
- 				N = dtoh16o(data, *poffset);
- 				dpd->FORM.Enum.SupportedValue = calloc(N,sizeof(dpd->FORM.Enum.SupportedValue[0]));
- 				if (!dpd->FORM.Enum.SupportedValue)
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch
deleted file mode 100644
index 9f233f2ec9..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40338.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 43cc20e807cd2935869617a7d8b9488070712c0e Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Sat, 11 Apr 2026 10:47:52 +0200
-Subject: [PATCH] =?UTF-8?q?Fixed=20Sony=20DPD=20Enum=20Count=20OOB=20Read?=
- =?UTF-8?q?=20(CWE-125)=20=E2=80=94=20MEDIUM?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-In the PTP_DPFF_Enumeration case of ptp_unpack_Sony_DPD(), dtoh16o(data, *poffset) reads 2 bytes for enumeration count N without verifying 2 bytes remain. The standard parser at line 704 has this check.
-
-CVE-2026-40338
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40338
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/3b9f9696be76ae51dca983d9dd8ce586a2561845]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index fc51d77..f90d2a5 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -851,6 +851,7 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
- 		break;
- 	case PTP_DPFF_Enumeration: {
- #define N	dpd->FORM.Enum.NumberOfValues
-+		if (*poffset + sizeof(uint16_t) > dpdlen) goto outofmemory;
- 		N = dtoh16o(data, *poffset);
- 		dpd->FORM.Enum.SupportedValue = calloc(N,sizeof(dpd->FORM.Enum.SupportedValue[0]));
- 		if (!dpd->FORM.Enum.SupportedValue)
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
deleted file mode 100644
index b00ac72772..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40339.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 585e8113b541469347d09c341c2e8b468b431adb Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Sat, 11 Apr 2026 10:50:47 +0200
-Subject: [PATCH] =?UTF-8?q?Fixed=20Sony=20DPD=20FormFlag=20OOB=20Read=20(C?=
- =?UTF-8?q?WE-125)=20=E2=80=94=20MEDIUM?=
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-ptp_unpack_Sony_DPD() reads the FormFlag byte via dtoh8o(data, *poffset)
-without a prior bounds check. The standard ptp_unpack_DPD() at line
-686–687 correctly validates *offset + sizeof(uint8_t) > dpdlen before
-this same read, but the Sony variant omits this check.
-
-CVE-2026-40339
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40339
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/09f8a940b1e418b5693f5c11e3016a1ad2cea62d]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index f90d2a5..28648a5 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -833,9 +833,10 @@ ptp_unpack_Sony_DPD (PTPParams *params, const unsigned char* data, PTPDeviceProp
- 	   code or the Data Type is a string (with two empty strings as
- 	   values). In both cases Form Flag should be set to 0x00 and FORM is
- 	   not present. */
--
- 	if (*poffset==PTP_dpd_Sony_DefaultValue)
- 		return 1;
-+	if (*poffset + sizeof(uint8_t) > dpdlen)
-+		return 1;
- 
- 	dpd->FormFlag = dtoh8o(data, *poffset);
- 	ptp_debug (params, "formflag 0x%04x", dpd->FormFlag);
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch
deleted file mode 100644
index a0852692b0..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40340.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fd9f234df894caec6c65144b5a4f0264aadf0989 Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Wed, 8 Apr 2026 16:01:48 +0200
-Subject: [PATCH] Fixed ObjectInfo Parser OOB Read
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-ptp_unpack_OI() validates len < PTP_oi_SequenceNumber (i.e., len < 48) but then accesses:
-
-    Offsets 48–51: dtoh32a(data + PTP_oi_SequenceNumber) at line 563 (4 bytes OOB)
-    Offset 52: data[PTP_oi_filenamelen] at line 547 (5 bytes OOB)
-    Offset 56: data[PTP_oi_filenamelen+4] at line 547 (9 bytes OOB)
-
-The Samsung Galaxy 64-bit objectsize detection heuristic reads up to 9 bytes beyond the validated boundary.
-
- CVE-2026-40340
-
-Reported-By: Sebastián Alba <sebasjosue84@gmail.com>
-
-CVE: CVE-2026-40340
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/7c7f515bc88c3d0c4098ac965d313518e0ccbe33]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index 28648a5..9eba06f 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -526,7 +526,7 @@ ptp_unpack_OI (PTPParams *params, const unsigned char* data, PTPObjectInfo *oi,
- {
- 	char *capture_date;
- 
--	if (!data || len < PTP_oi_SequenceNumber)
-+	if (!data || len < PTP_oi_filenamelen + 5)
- 		return;
- 
- 	oi->Filename = oi->Keywords = NULL;
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch b/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
deleted file mode 100644
index b71792c185..0000000000
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2/CVE-2026-40341.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 3674dbeafa5157a264ca5e562ffdbef159a2185f Mon Sep 17 00:00:00 2001
-From: Marcus Meissner <marcus@jet.franken.de>
-Date: Wed, 8 Apr 2026 15:28:52 +0200
-Subject: [PATCH] Fixed OOB read in ptp_unpack_EOS_FocusInfoEx
-
-Do not read out values before checking there is sufficient size
-
-CVE-2026-40341
-
-CVE: CVE-2026-40341
-Upstream-Status: Backport [https://github.com/gphoto/libgphoto2/commit/c385b34af260595dfbb5f9329526be5158985987]
-Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
----
- camlibs/ptp2/ptp-pack.c | 34 +++++++++++++++++++++++++---------
- 1 file changed, 25 insertions(+), 9 deletions(-)
-
-diff --git a/camlibs/ptp2/ptp-pack.c b/camlibs/ptp2/ptp-pack.c
-index 9eba06f..11428ab 100644
---- a/camlibs/ptp2/ptp-pack.c
-+++ b/camlibs/ptp2/ptp-pack.c
-@@ -1629,23 +1629,39 @@ ptp_pack_EOS_ImageFormat (PTPParams* params, unsigned char* data, uint16_t value
- static inline char*
- ptp_unpack_EOS_FocusInfoEx (PTPParams* params, const unsigned char** data, uint32_t datasize)
- {
--	uint32_t size 			= dtoh32a( *data );
--	uint32_t halfsize		= dtoh16a( (*data) + 4);
--	uint32_t version		= dtoh16a( (*data) + 6);
--	uint32_t focus_points_in_struct	= dtoh16a( (*data) + 8);
--	uint32_t focus_points_in_use	= dtoh16a( (*data) + 10);
--	uint32_t sizeX			= dtoh16a( (*data) + 12);
--	uint32_t sizeY			= dtoh16a( (*data) + 14);
--	uint32_t size2X			= dtoh16a( (*data) + 16);
--	uint32_t size2Y			= dtoh16a( (*data) + 18);
-+	uint32_t size;
-+	uint32_t halfsize;
-+	uint32_t version;
-+	uint32_t focus_points_in_struct;
-+	uint32_t focus_points_in_use;
-+	uint32_t sizeX;
-+	uint32_t sizeY;
-+	uint32_t size2X;
-+	uint32_t size2Y;
- 	uint32_t i;
- 	uint32_t maxlen;
- 	char	*str, *p;
- 
-+	if (datasize<4) {
-+		ptp_error(params, "FocusInfoEx has invalid size (%d)", datasize);
-+		return strdup("bad size 0");
-+	}
-+
-+	size 			= dtoh32a( *data );
- 	if ((size > datasize) || (size < 20)) {
- 		ptp_error(params, "FocusInfoEx has invalid size (%d) vs datasize (%d)", size, datasize);
- 		return strdup("bad size 1");
- 	}
-+
-+	halfsize		= dtoh16a( (*data) + 4);
-+	version			= dtoh16a( (*data) + 6);
-+	focus_points_in_struct	= dtoh16a( (*data) + 8);
-+	focus_points_in_use	= dtoh16a( (*data) + 10);
-+	sizeX			= dtoh16a( (*data) + 12);
-+	sizeY			= dtoh16a( (*data) + 14);
-+	size2X			= dtoh16a( (*data) + 16);
-+	size2Y			= dtoh16a( (*data) + 18);
-+
- 	/* If data is zero-filled, then it is just a placeholder, so nothing
- 	   useful, but also not an error */
- 	if (!focus_points_in_struct || !focus_points_in_use) {
diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
similarity index 75%
rename from meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
rename to meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
index 04c4786f84..fca158fe11 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.33.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.34.bb
@@ -12,17 +12,8 @@ DEPENDS = "libtool jpeg virtual/libusb0 libexif zlib libxml2"
 SRC_URI = "${SOURCEFORGE_MIRROR}/gphoto/${BP}.tar.xz;name=libgphoto2 \
            file://40-libgphoto2.rules \
            file://0001-configure-Filter-out-buildpaths-from-CC.patch \
-           file://0001-libgphoto2-fix-const-correctness-for-c23-builds.patch \
-           file://CVE-2026-40333.patch \
-           file://CVE-2026-40334.patch \
-           file://CVE-2026-40335.patch \
-           file://CVE-2026-40336.patch \
-           file://CVE-2026-40338.patch \
-           file://CVE-2026-40339.patch \
-           file://CVE-2026-40340.patch \
-           file://CVE-2026-40341.patch \
            "
-SRC_URI[libgphoto2.sha256sum] = "28825f767a85544cb58f6e15028f8e53a5bb37a62148b3f1708b524781c3bef2"
+SRC_URI[libgphoto2.sha256sum] = "51993f5d9bfb6b4e5925cbbe5883085791bff6f81bcacb8ffe1b783ce76d586a"
 
 UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/gphoto/files/libgphoto/"
 
-- 
2.43.0


