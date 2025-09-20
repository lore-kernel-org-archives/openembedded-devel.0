Return-Path: <emailaddress.ashish@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05AB6CAC5A5
	for <webhook@archiver.kernel.org>; Sat, 20 Sep 2025 17:51:45 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.14545.1758390703170612481
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Sep 2025 10:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hndR36ft;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: emailaddress.ashish@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b4c1fc383eeso2167569a12.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758390702; x=1758995502; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3HMasGrz6uxUHvg+Y4Br2FwfXePlK7sNCf+OgGiszM=;
        b=hndR36ftpm4BkGnsxQrGm+YGH1gMw/iMaQoO8wp8JTx6A9e14cHwH+9+Kpz32uhrPF
         D6wkRpFmPs90UnEqw58skqgEUuzu3YoulUlrr/tBEdAt0hf9/qJiB23DqBfjDjMN2Wb4
         SXdEtJ2Hk92guaI0zHOzjbLA3ooglr4XblL1Jj0FWByFwXtgBNKMvECu6TscWvRA99zx
         4FaBxnCdcnALbD9U7hi3AidIKYEXDZXc/eziZ585W8o/KnU8mycI/NhALyJwPG4ZQXPw
         cs34pTY2JLkxNQ7Othz2qaSUbRVkKplhFgPTpeOHU/ikw5MrNagOUAgUCfMP0MJsAUQm
         SNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758390702; x=1758995502;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3HMasGrz6uxUHvg+Y4Br2FwfXePlK7sNCf+OgGiszM=;
        b=R9J1rJPb3PhFrK0AL1AZ8lKpW2R0Z86eOqtUiGQ0eUK/a/3oMrX7imSM9qs1+M9V/c
         jbXwsjxzztonX+s0f1amYb7QviBDaNO2pU3ssC254PYLry2zg3NXnU4R9QcIRoNISeBZ
         EbMKHz6YdJLEzY4a86DLxNSqdpAhJ7kijVHpY8+aW4kEYPDvpB6vOrkQnvIzX05YVXQY
         S3yO3aRL7sk+qZAeQoEIG6BtLPE6Oe+zO495YCxl2PkFZO0H26Np9SmVccu8sDYYYsCF
         Pag6TLaIgdt2k8KytxmRrIlJ0Ya1foJ4klBJHJEM2Jo82zKYjTcbI1ZeDrkxz0wMlPhF
         uX/w==
X-Gm-Message-State: AOJu0YwutdS3QP28DGXCzlMBHmV/L9nfQOo5SRqC7BQpqIfaXZlbGFGD
	kWFE/1L6hGeXEjDZJeFr0pmjBfXt6aRUC+Q6wA2CzmEY+qlFlZuO3Y6S5Dljxg==
X-Gm-Gg: ASbGnctyRLzSHjBPvoy6WxQS/hSQOXr1zZWZNbc8yLICrbAUL+PmJpwJu5Iar3ZB0AU
	2yQRX66hmeNTn+owDtC6tLk6gsYfEjuaL1SegBic6albZVG31RNaNKtw8z4P+Kz9ZQDS2rhQ+LW
	EUJVpPMHct8gZExGN7xeK8we2T0osA8YfuVq6zrRz+1fbVe/IJM4b+wrcLGzlfEGyKj4ePREWt8
	uhzA1dqYB4W6Ah0SULzmMlFvh5a7lCtKxrtm9nwpNVw/0dCSmUWi2g4a7PZeGn3VCMMw4vmmur0
	OSioM0S+E0PrT7zVSbyrlwwnFvWzFSsbUTtY7rGlqTzuaVFzQozn4qBksnoSiQu+iLMcyClDfcr
	rzEtNdhPF44sD
X-Google-Smtp-Source: AGHT+IGIXP2hyYSYhXt31Z0GHcbjVTIaAE9OlC+T/8Gz7N6S6yE8A52MEgAJHtr6VWjMaq09eSuGvA==
X-Received: by 2002:a05:6a20:7d8a:b0:262:82a6:d932 with SMTP id adf61e73a8af0-29272a5de3cmr10173269637.48.1758390701993;
        Sat, 20 Sep 2025 10:51:41 -0700 (PDT)
Received: from ashishkumar.. ([2401:4900:1f27:b34:6e65:c469:8e65:be54])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b551380444asm6078044a12.27.2025.09.20.10.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 10:51:41 -0700 (PDT)
From: AshishKumar Mishra <emailaddress.ashish@gmail.com>
X-Google-Original-From: AshishKumar Mishra
To: openembedded-devel@lists.openembedded.org
Cc: skandigraun@gmail.com,
	Sean Anderson <sean.anderson@seco.com>,
	Khem Raj <raj.khem@gmail.com>,
	AshishKumar Mishra <emailaddress.ashish@gmail.com>
Subject: [kirkstone][PATCH] image_types_sparse: backport generate "don't care" chunks
Date: Sat, 20 Sep 2025 23:21:15 +0530
Message-ID: <20250920175115.3458685-1-emailaddress.ashish@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 20 Sep 2025 17:51:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119622

From: Sean Anderson <sean.anderson@seco.com>

By default, img2simg will only generate raw and fill chunks. This adds
support for "don't care" chunks, based on file holes. This is similar to
how bmaptool works. "don't care" chunks do not need to be written,
speeding up flashing time.
This change corresponds to upstream  9862a017fa7f88424f0670ba89af58e5051550b0

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
---
 meta-oe/classes/image_types_sparse.bbclass    |   2 +-
 ...off-most-of-sparse_file_read_normal-.patch |  60 ++++++
 ...se-Add-hole-mode-to-sparse_file_read.patch | 188 ++++++++++++++++++
 ...port-for-converting-holes-to-don-t-c.patch | 114 +++++++++++
 .../android-tools/android-tools_5.1.1.r37.bb  |   3 +
 5 files changed, 366 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
 create mode 100644 meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch

diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index b092f68406..8668739fd9 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -11,6 +11,6 @@ CONVERSIONTYPES += "sparse"
 CONVERSION_CMD:sparse = " \
     INPUT="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}" && \
     truncate --no-create --size=%${SPARSE_BLOCK_SIZE} "$INPUT" && \
-    img2simg "$INPUT" "$INPUT.sparse" ${SPARSE_BLOCK_SIZE} \
+    img2simg -s "$INPUT" "$INPUT.sparse" ${SPARSE_BLOCK_SIZE} \
 "
 CONVERSION_DEPENDS_sparse = "android-tools-native"
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
new file mode 100644
index 0000000000..b3893f0c80
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch
@@ -0,0 +1,60 @@
+From 7b74d23ed955206a789a96bdc3288593e702afac Mon Sep 17 00:00:00 2001
+From: Sean Anderson <sean.anderson@seco.com>
+Date: Thu, 30 Dec 2021 15:16:08 -0500
+Subject: [PATCH] libsparse: Split off most of sparse_file_read_normal into a
+ helper function
+
+This carves out the core of sparse_file_read_normal and splits it off so
+it can be reused in the next patch. No functional change intended.
+
+Change-Id: Id00491fd7e5bb6fa28c517a0bb32b8b506539d4d
+Upstream-status: Backport [95657f3e5976d96073f7bbfe3a49192509999d1d]
+Signed-off-by: Sean Anderson <sean.anderson@seco.com>
+---
+ libsparse/sparse_read.c | 21 ++++++++++++++++-----
+ 1 file changed, 16 insertions(+), 5 deletions(-)
+
+diff --git a/libsparse/sparse_read.c b/libsparse/sparse_read.c
+index 8e188e9a4..ee4abd86a 100644
+--- a/libsparse/sparse_read.c
++++ b/libsparse/sparse_read.c
+@@ -353,13 +353,11 @@ static int sparse_file_read_sparse(struct sparse_file *s, int fd, bool crc)
+ 	return 0;
+ }
+ 
+-static int sparse_file_read_normal(struct sparse_file *s, int fd)
++static int do_sparse_file_read_normal(struct sparse_file *s, int fd, uint32_t* buf, int64_t offset,
++				      int64_t remain)
+ {
+ 	int ret;
+-	uint32_t *buf = malloc(s->block_size);
+-	unsigned int block = 0;
+-	int64_t remain = s->len;
+-	int64_t offset = 0;
++	unsigned int block = offset / s->block_size;
+ 	unsigned int to_read;
+ 	unsigned int i;
+ 	bool sparse_block;
+@@ -403,6 +401,19 @@ static int sparse_file_read_normal(struct sparse_file *s, int fd)
+ 	return 0;
+ }
+ 
++static int sparse_file_read_normal(struct sparse_file* s, int fd)
++{
++	int ret;
++	uint32_t* buf = (uint32_t*)malloc(s->block_size);
++
++	if (!buf)
++		return -ENOMEM;
++
++	ret = do_sparse_file_read_normal(s, fd, buf, 0, s->len);
++	free(buf);
++	return ret;
++}
++
+ int sparse_file_read(struct sparse_file *s, int fd, bool sparse, bool crc)
+ {
+ 	if (crc && !sparse) {
+-- 
+2.35.1.1320.gc452695387.dirty
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
new file mode 100644
index 0000000000..e5221d2b4c
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch
@@ -0,0 +1,188 @@
+From 41574b628ec4229c24dfe289af7b6978edcca4ed Mon Sep 17 00:00:00 2001
+From: Sean Anderson <sean.anderson@seco.com>
+Date: Thu, 30 Dec 2021 15:19:41 -0500
+Subject: [PATCH] libsparse: Add "hole" mode to sparse_file_read
+
+This adds support for filesystem-level sparse files. These files have
+holes which are not stored in the filesystem and when read are full of
+zeros. While these zeros may be significant in some types of files,
+other types of files may not care about the contents of holes. For
+example, most filesystem creation tools write to all the blocks they
+care about. Those blocks not written to will remain holes, and can be
+safely represented by "don't care" chunks. Using "don't care" chunks
+instead of fill chunks can result in a substantial reduction of the time
+it takes to program a sparse image.
+
+To accomplish this, we extend the existing "sparse" boolean parameter to
+be an enum of mode types. This enum represents the strategy we take when
+reading in a file. For the most part the implementation is
+straightforward. We use lseek to determine where the holes in the file
+are, and then use do_sparse_file_read_normal to create chunks for the
+data section. Note that every file has an implicit hole at its end.
+
+Change-Id: I0cfbf08886fca9a91cb753ec8734c84fcbe52c9f
+Upstream-Status: Backport [f96466b05543b984ef7315d830bab4a409228d35]
+Signed-off-by: Sean Anderson <sean.anderson@seco.com>
+---
+ libsparse/img2simg.c              |  2 +-
+ libsparse/include/sparse/sparse.h | 32 +++++++++++---
+ libsparse/sparse_read.c           | 71 +++++++++++++++++++++++++++++--
+ 3 files changed, 93 insertions(+), 12 deletions(-)
+
+diff --git a/libsparse/img2simg.c b/libsparse/img2simg.c
+index a0db36f45..2e171b613 100644
+--- a/libsparse/img2simg.c
++++ b/libsparse/img2simg.c
+@@ -96,7 +96,7 @@ int main(int argc, char *argv[])
+ 	}
+ 
+ 	sparse_file_verbose(s);
+-	ret = sparse_file_read(s, in, false, false);
++	ret = sparse_file_read(s, in, SPARSE_READ_MODE_NORMAL, false);
+ 	if (ret) {
+ 		fprintf(stderr, "Failed to read file\n");
+ 		exit(-1);
+diff --git a/libsparse/include/sparse/sparse.h b/libsparse/include/sparse/sparse.h
+index 8b757d22a..b68aa21a8 100644
+--- a/libsparse/include/sparse/sparse.h
++++ b/libsparse/include/sparse/sparse.h
+@@ -196,23 +196,41 @@ int64_t sparse_file_len(struct sparse_file *s, bool sparse, bool crc);
+ int sparse_file_callback(struct sparse_file *s, bool sparse, bool crc,
+ 		int (*write)(void *priv, const void *data, int len), void *priv);
+ 
++/**
++ * enum sparse_read_mode - The method to use when reading in files
++ * @SPARSE_READ_MODE_NORMAL: The input is a regular file. Constant chunks of
++ *                           data (including holes) will be be converted to
++ *                           fill chunks.
++ * @SPARSE_READ_MODE_SPARSE: The input is an Android sparse file.
++ * @SPARSE_READ_MODE_HOLE: The input is a regular file. Holes will be converted
++ *                         to "don't care" chunks. Other constant chunks will
++ *                         be converted to fill chunks.
++ */
++enum sparse_read_mode {
++	SPARSE_READ_MODE_NORMAL = false,
++	SPARSE_READ_MODE_SPARSE = true,
++	SPARSE_READ_MODE_HOLE,
++};
++
+ /**
+  * sparse_file_read - read a file into a sparse file cookie
+  *
+  * @s - sparse file cookie
+  * @fd - file descriptor to read from
+- * @sparse - read a file in the Android sparse file format
++ * @mode - mode to use when reading the input file
+  * @crc - verify the crc of a file in the Android sparse file format
+  *
+- * Reads a file into a sparse file cookie.  If sparse is true, the file is
+- * assumed to be in the Android sparse file format.  If sparse is false, the
+- * file will be sparsed by looking for block aligned chunks of all zeros or
+- * another 32 bit value.  If crc is true, the crc of the sparse file will be
+- * verified.
++ * Reads a file into a sparse file cookie. If @mode is
++ * %SPARSE_READ_MODE_SPARSE, the file is assumed to be in the Android sparse
++ * file format. If @mode is %SPARSE_READ_MODE_NORMAL, the file will be sparsed
++ * by looking for block aligned chunks of all zeros or another 32 bit value. If
++ * @mode is %SPARSE_READ_MODE_HOLE, the file will be sparsed like
++ * %SPARSE_READ_MODE_NORMAL, but holes in the file will be converted to "don't
++ * care" chunks. If crc is true, the crc of the sparse file will be verified.
+  *
+  * Returns 0 on success, negative errno on error.
+  */
+-int sparse_file_read(struct sparse_file *s, int fd, bool sparse, bool crc);
++int sparse_file_read(struct sparse_file *s, int fd, enum sparse_read_mode mode, bool crc);
+ 
+ /**
+  * sparse_file_import - import an existing sparse file
+diff --git a/libsparse/sparse_read.c b/libsparse/sparse_read.c
+index ee4abd86a..81f48cc13 100644
+--- a/libsparse/sparse_read.c
++++ b/libsparse/sparse_read.c
+@@ -414,16 +414,79 @@ static int sparse_file_read_normal(struct sparse_file* s, int fd)
+ 	return ret;
+ }
+ 
+-int sparse_file_read(struct sparse_file *s, int fd, bool sparse, bool crc)
++#ifdef __linux__
++static int sparse_file_read_hole(struct sparse_file* s, int fd)
+ {
+-	if (crc && !sparse) {
++	int ret;
++	uint32_t* buf = (uint32_t*)malloc(s->block_size);
++	int64_t end = 0;
++	int64_t start = 0;
++
++	if (!buf) {
++		return -ENOMEM;
++	}
++
++	do {
++		start = lseek(fd, end, SEEK_DATA);
++		if (start < 0) {
++			if (errno == ENXIO)
++				/* The rest of the file is a hole */
++				break;
++
++			error("could not seek to data");
++			free(buf);
++			return -errno;
++		} else if (start > s->len) {
++			break;
++		}
++
++		end = lseek(fd, start, SEEK_HOLE);
++		if (end < 0) {
++			error("could not seek to end");
++			free(buf);
++			return -errno;
++		}
++		end = min(end, s->len);
++
++		start = ALIGN_DOWN(start, s->block_size);
++		end = ALIGN(end, s->block_size);
++		if (lseek(fd, start, SEEK_SET) < 0) {
++			free(buf);
++			return -errno;
++		}
++
++		ret = do_sparse_file_read_normal(s, fd, buf, start, end - start);
++		if (ret) {
++			free(buf);
++			return ret;
++		}
++	} while (end < s->len);
++
++	free(buf);
++	return 0;
++}
++#else
++static int sparse_file_read_hole(struct sparse_file* s __unused, int fd __unused)
++{
++	return -ENOTSUP;
++}
++#endif
++
++int sparse_file_read(struct sparse_file *s, int fd, enum sparse_read_mode mode, bool crc)
++{
++	if (crc && mode != SPARSE_READ_MODE_SPARSE) {
+ 		return -EINVAL;
+ 	}
+ 
+-	if (sparse) {
++	switch (mode) {
++	case SPARSE_READ_MODE_SPARSE:
+ 		return sparse_file_read_sparse(s, fd, crc);
+-	} else {
++	case SPARSE_READ_MODE_NORMAL:
+ 		return sparse_file_read_normal(s, fd);
++	case SPARSE_READ_MODE_HOLE:
++		return sparse_file_read_hole(s, fd);
++	default:
++		return -EINVAL;
+ 	}
+ }
+ 
+-- 
+2.35.1.1320.gc452695387.dirty
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch b/meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
new file mode 100644
index 0000000000..9d19f58095
--- /dev/null
+++ b/meta-oe/recipes-devtools/android-tools/android-tools/core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch
@@ -0,0 +1,114 @@
+From 00cce57eff1a0de3b93efa5da225e9eb33d19659 Mon Sep 17 00:00:00 2001
+From: Sean Anderson <sean.anderson@seco.com>
+Date: Thu, 30 Dec 2021 15:34:28 -0500
+Subject: [PATCH] img2simg: Add support for converting holes to "don't care"
+ chunks
+
+This adds support for converting files with holes to "don't care"
+chunks. This can result in a substantial reduction in the time it takes
+to program an image if it has many holes.
+
+Generally, constants compared to argc have been reduced by one, since we
+no longer have the program name as the first argument.
+
+Change-Id: I00750edc07d6415dcc07ae0351e9397b0222b7ba
+Upstream-Status: Backport [6150b00b6025918da8c28e5c2f929ecdf480a9d6]
+Signed-off-by: Sean Anderson <sean.anderson@seco.com>
+---
+ libsparse/img2simg.c | 41 ++++++++++++++++++++++++++++++-----------
+ 1 file changed, 30 insertions(+), 11 deletions(-)
+
+diff --git a/libsparse/img2simg.c b/libsparse/img2simg.c
+index 2e171b613..c985d5449 100644
+--- a/libsparse/img2simg.c
++++ b/libsparse/img2simg.c
+@@ -40,25 +40,42 @@
+ 
+ void usage()
+ {
+-    fprintf(stderr, "Usage: img2simg <raw_image_file> <sparse_image_file> [<block_size>]\n");
++    fprintf(stderr, "Usage: img2simg [-s] <raw_image_file> <sparse_image_file> [<block_size>]\n");
+ }
+ 
+ int main(int argc, char *argv[])
+ {
++	char *arg_in;
++	char *arg_out;
++	enum sparse_read_mode mode = SPARSE_READ_MODE_NORMAL;
++	int extra;
+ 	int in;
++	int opt;
+ 	int out;
+ 	int ret;
+ 	struct sparse_file *s;
+ 	unsigned int block_size = 4096;
+ 	off64_t len;
+ 
+-	if (argc < 3 || argc > 4) {
++	while ((opt = getopt(argc, argv, "s")) != -1) {
++		switch (opt) {
++		case 's':
++			mode = SPARSE_READ_MODE_HOLE;
++			break;
++		default:
++			usage();
++			exit(-1);
++		}
++	}
++
++	extra = argc - optind;
++	if (extra < 2 || extra > 3) {
+ 		usage();
+ 		exit(-1);
+ 	}
+ 
+-	if (argc == 4) {
+-		block_size = atoi(argv[3]);
++	if (extra == 3) {
++		block_size = atoi(argv[optind + 2]);
+ 	}
+ 
+ 	if (block_size < 1024 || block_size % 4 != 0) {
+@@ -66,22 +83,24 @@ int main(int argc, char *argv[])
+ 		exit(-1);
+ 	}
+ 
+-	if (strcmp(argv[1], "-") == 0) {
++	arg_in = argv[optind];
++	if (strcmp(arg_in, "-") == 0) {
+ 		in = STDIN_FILENO;
+ 	} else {
+-		in = open(argv[1], O_RDONLY | O_BINARY);
++		in = open(arg_in, O_RDONLY | O_BINARY);
+ 		if (in < 0) {
+-			fprintf(stderr, "Cannot open input file %s\n", argv[1]);
++			fprintf(stderr, "Cannot open input file %s\n", arg_in);
+ 			exit(-1);
+ 		}
+ 	}
+ 
+-	if (strcmp(argv[2], "-") == 0) {
++	arg_out = argv[optind + 1];
++	if (strcmp(arg_out, "-") == 0) {
+ 		out = STDOUT_FILENO;
+ 	} else {
+-		out = open(argv[2], O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0664);
++		out = open(arg_out, O_WRONLY | O_CREAT | O_TRUNC | O_BINARY, 0664);
+ 		if (out < 0) {
+-			fprintf(stderr, "Cannot open output file %s\n", argv[2]);
++			fprintf(stderr, "Cannot open output file %s\n", arg_out);
+ 			exit(-1);
+ 		}
+ 	}
+@@ -96,7 +115,7 @@ int main(int argc, char *argv[])
+ 	}
+ 
+ 	sparse_file_verbose(s);
+-	ret = sparse_file_read(s, in, SPARSE_READ_MODE_NORMAL, false);
++	ret = sparse_file_read(s, in, mode, false);
+ 	if (ret) {
+ 		fprintf(stderr, "Failed to read file\n");
+ 		exit(-1);
+-- 
+2.35.1.1320.gc452695387.dirty
+
diff --git a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
index cf10968296..28286d6619 100644
--- a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
+++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
@@ -41,6 +41,9 @@ SRC_URI = " \
     file://core/adb_libssl_11.diff;patchdir=system/core \
     file://core/0013-adb-Support-riscv64.patch;patchdir=system/core \
     file://core/0014-add-u3-ss-descriptor-support-for-adb.patch;patchdir=system/core \
+    file://core/0015-libsparse-Split-off-most-of-sparse_file_read_normal-.patch;patchdir=system/core \
+    file://core/0016-libsparse-Add-hole-mode-to-sparse_file_read.patch;patchdir=system/core \
+    file://core/0017-img2simg-Add-support-for-converting-holes-to-don-t-c.patch;patchdir=system/core \
     file://extras/0001-ext4_utils-remove-selinux-extensions.patch;patchdir=system/extras \
     file://extras/0002-ext4_utils-add-o-argument-to-preserve-ownership.patch;patchdir=system/extras \
     file://libselinux/0001-Remove-bionic-specific-calls.patch;patchdir=external/libselinux \
-- 
2.43.0


