Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A7B207909B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 22:58:07 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id n11-v6so356256wmc.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=v+v4sDHDdKxMaGmhkyInXP5s1EwVnuI3sspjUlz0QjI=;
	b=sOQcO708Yme6jh68l1NYTWEy+akzSo9HMg2lN7Ijktiv6LBCbVQXVU/VU1b/JswLKS
	kzvKBRM82PqpvycXntwD0gmGL+W812QSnhq9hoKM70tSJfSsy4XgBbI2p8d0e+mfaVrL
	UyEw95JHIeOnoXU75+iAPnps7RaumWrD8ObMsoXG1l1UKAvS71g/hEQjCD6lhZt2H27H
	JhrwB5+QUFjsh9LheWiyZHmurrgFuByCIB4sjW/Fnz5De1Teqw8M8JsL6E9CgFYoaTKI
	7C0hln69FkYzM0Xx0Zpf6PFcvnNc6cIrEfzCIyQ5wZgDXcuQGLRFQS345rFqnA5sbcLH
	Ft6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=v+v4sDHDdKxMaGmhkyInXP5s1EwVnuI3sspjUlz0QjI=;
	b=O97Ffx/W9TcHIz9PWUTrWnZ9CIgMU4VaxlxJ9SvsNq+Qhk/0UsIaq69a2mH17ZEZg1
	IxqTfGBFfwhvZsAnzuLhPGChETcgaiuOc1H0d5km9s1JikhCUnTT3A0qpxmVXzvKz9i5
	biCoHRe31v5PSjlH3MnoV7O0J8KJiWokF9wIo8j4jirb2Zo6FuU5B/qNDbzfpxp+1lCJ
	wRiaWJdse/dxLdOue1YIGMae7s6IGc7REfROZ5JJ0SCZUJwXg4fNVVKqfxXesT/HR3RY
	2rWzTF5BPdHxpqua0njQsr97S6+0NL+cmrL8xwl5LCkaSCavAQ1YijGGvljiOYWvKE6k
	jt8A==
X-Gm-Message-State: APzg51Bcasm04dQn96JWqrP6DDJ8WMG1u+ARCaJrLr+3Em5/24EGeupw
	s/fTNSsWEPSF6nIpG468rM5LjBX2
X-Google-Smtp-Source: ANB0VdbHbeWz6zv8sFxnidnXXAxTHkc4Vqso0Tl7LKMQhCVg/vgpYdgjf0txoFgVLWrIQh4NWbIUVg==
X-Received: by 2002:a1c:910d:: with SMTP id t13-v6mr750734wmd.15.1534892288077;
	Tue, 21 Aug 2018 15:58:08 -0700 (PDT)
Received: from localhost.localdomain
	(p200300F07BC993951E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc9:9395:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id
	e12-v6sm28659wrt.29.2018.08.21.15.58.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 21 Aug 2018 15:58:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 22 Aug 2018 00:57:54 +0200
Message-Id: <20180821225755.19796-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20180821225755.19796-1-schnitzeltony@gmail.com>
References: <20180821225755.19796-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] openjpeg: upgrade 2.2.0 -> 2.3.0
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
X-List-Received-Date: Tue, 21 Aug 2018 22:58:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* fetch by git to avoid github checksum surprises
* 0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch was applied upstream

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...fo_header-reject-bmp-files-with-biBitCoun.patch | 31 ----------------------
 .../{openjpeg_2.2.0.bb => openjpeg_2.3.0.bb}       |  8 +++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.2.0.bb => openjpeg_2.3.0.bb} (54%)

diff --git a/meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch b/meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch
deleted file mode 100644
index 866d9aa41..000000000
--- a/meta-oe/recipes-graphics/openjpeg/files/0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 226f07e4b49c2757b181c62e6841000c512054e3 Mon Sep 17 00:00:00 2001
-From: Even Rouault <even.rouault@spatialys.com>
-Date: Mon, 14 Aug 2017 17:26:58 +0200
-Subject: [PATCH] bmp_read_info_header(): reject bmp files with biBitCount == 0
- (#983)
-
-Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/baf0c1ad4572daa89caa3b12985bdd93530f0dd7]
-CVE: CVE-2017-12982
-Signed-off-by: Dengke Du <dengke.du@windriver.com>
----
- src/bin/jp2/convertbmp.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/bin/jp2/convertbmp.c b/src/bin/jp2/convertbmp.c
-index b49e7a0..2715fdf 100644
---- a/src/bin/jp2/convertbmp.c
-+++ b/src/bin/jp2/convertbmp.c
-@@ -392,6 +392,10 @@ static OPJ_BOOL bmp_read_info_header(FILE* IN, OPJ_BITMAPINFOHEADER* header)
- 
-     header->biBitCount  = (OPJ_UINT16)getc(IN);
-     header->biBitCount |= (OPJ_UINT16)((OPJ_UINT32)getc(IN) << 8);
-+    if (header->biBitCount == 0) {
-+        fprintf(stderr, "Error, invalid biBitCount %d\n", 0);
-+        return OPJ_FALSE;
-+    }
- 
-     if (header->biSize >= 40U) {
-         header->biCompression  = (OPJ_UINT32)getc(IN);
--- 
-2.8.1
-
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
similarity index 54%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
index 22b75d962..d5d06206d 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.2.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.3.0.bb
@@ -5,11 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
 DEPENDS = "libpng tiff lcms zlib"
 
-SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
-           file://0001-bmp_read_info_header-reject-bmp-files-with-biBitCoun.patch \
-          "
-SRC_URI[md5sum] = "269bb0b175476f3addcc0d03bd9a97b6"
-SRC_URI[sha256sum] = "6fddbce5a618e910e03ad00d66e7fcd09cc6ee307ce69932666d54c73b7c6e7b"
+SRC_URI = "git://github.com/uclouvain/openjpeg.git"
+SRCREV = "081de4b15f54cb4482035b7bf5e3fb443e4bc84b"
+S = "${WORKDIR}/git"
 
 inherit cmake
 
-- 
2.14.4


