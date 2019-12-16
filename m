Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5B2E47F7CD
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 03:42:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id k20so3829922pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 19:42:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Y3FE9cEMQqqIVxchhITGQqgClkU1u6N7khRVy9vrC8=;
	b=o47h822CxgoT9C6msCTok1iOrkgxyeuUH7oOXFCXDTmsJ3yjcRzrX202aX1dycuUSH
	EJ1d1CfJpRwldBQ4JhC17ADTtUt9Ex/bnWO7VAY36urE/uOjMXf9h6O2R7i9JIcwt2mO
	/JUtV+wrFfBj1qB5/nQIYBr8Tpxae3zlNcZEAMtZ3rNooAnkoD9RjXBOZQTH5E0txKEN
	4GV0YU871oGuYk4JdcNaQrApmgjk1DaSYayas2CIs1WOTIWqnuAW7blK0qi1cinwJdwi
	PQ1MX3cYtUimid+GsbxgYzH2TBJBHOgoA2f33i1v4iAPDpHH82PHPmemA6vjqw9VusWU
	pXxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=/Y3FE9cEMQqqIVxchhITGQqgClkU1u6N7khRVy9vrC8=;
	b=IN7j/Dnc4w0B+QcPzQqmIx5w/qwmVv90CecXGoLHd07+uAhUawRdE5bVC6CR9G53Kk
	so7ABCacqg6EhjvdGCv7dQDpImkSPJxtMQlDU8eqdZlKkbHsaa8K2HKyw6ZZj64Acx7v
	V6EHrJe9ScmWQiL4d7tgKNpPx5HgsOpkcYXxmNkWOicS2dIkzDuk8pnrsPxt1mwp0GO4
	LU4TgopRZohNUlUrtHO7KUh+GhJnbDypPoePAY7MaTaA1LTgtPJ8b57PXoWj08gpR57p
	fiEYv5v3kQZHV3SnRc0s8YXKtkTtT6sRcFnrwR+qDP1EDm/9usZ1JYHf4Xkb7+tY6rzJ
	U9Hg==
X-Gm-Message-State: APjAAAWM4cgi6oacEnoWiKbB7RFgx1hJ4vs9Gy3YAMBGO60fXebwoXqZ
	iJYfw3m0JzXdK34cd8+vibZejVinfFM=
X-Google-Smtp-Source: APXvYqyIvVgpmEIte5o292lGk/jXLepjxnFu1oanCO4VWnqak5Q1Q5Q0RLu76q0REWDyG/XP9z0Szw==
X-Received: by 2002:a17:90a:8a0e:: with SMTP id
	w14mr15606575pjn.51.1576467729804; 
	Sun, 15 Dec 2019 19:42:09 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::6563])
	by smtp.gmail.com with ESMTPSA id
	a22sm21336106pfk.108.2019.12.15.19.42.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 19:42:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Dec 2019 19:41:51 -0800
Message-Id: <20191216034155.2675900-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Subject: [meta-filesystems][PATCH 1/5] ufs-utils: Renames from ufs-tool
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
X-List-Received-Date: Mon, 16 Dec 2019 03:42:09 -0000
Content-Transfer-Encoding: 8bit

Add a patch to fix build with musl/mips64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-utils/ufs-tool/ufs-tool_git.bb    | 23 --------
 ...place-u_intXX_t-with-kernel-typedefs.patch | 54 +++++++++++++++++++
 .../recipes-utils/ufs-utils/ufs-utils_git.bb  | 32 +++++++++++
 3 files changed, 86 insertions(+), 23 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
 create mode 100644 meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch
 create mode 100644 meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb

diff --git a/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb b/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
deleted file mode 100644
index 208ac3c58b..0000000000
--- a/meta-filesystems/recipes-utils/ufs-tool/ufs-tool_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Tool to access UFS (Universal Flash Storage) devices"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PV = "1.3+git${SRCPV}"
-
-BRANCH ?= "dev"
-
-SRCREV = "8b00e33003b57d7071943f63863fcf8cc48d5be9"
-
-SRC_URI = "git://github.com/westerndigitalcorporation/ufs-tool.git;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
-
-EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
-
-do_configure() {
-	sed -i -e "s|-static$||g" ${S}/Makefile
-}
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/ufs-tool ${D}${bindir}/
-}
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch
new file mode 100644
index 0000000000..e69a3cf1ff
--- /dev/null
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils/0001-Replace-u_intXX_t-with-kernel-typedefs.patch
@@ -0,0 +1,54 @@
+From 6cf6f5b9c39dfd0d46f2069c3baeab92ae980367 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Dec 2019 00:58:13 -0800
+Subject: [PATCH] Replace u_intXX_t with kernel typedefs
+
+u_intXX_t requires including sys/types.h which might not work in kernel
+code, if this header is used in a kernel module
+
+Fixes
+| In file included from ufs.c:16:
+| In file included from ./ufs.h:9:
+| ./scsi_bsg_util.h:131:2: error: unknown type name 'u_int16_t'; did you mean 'uint16_t'?
+|         u_int16_t result;
+|         ^~~~~~~~~
+
+Upstream-Status: Submitted [https://github.com/westerndigitalcorporation/ufs-utils/pull/23]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scsi_bsg_util.h | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/scsi_bsg_util.h b/scsi_bsg_util.h
+index 3f8a482..497c3ae 100644
+--- a/scsi_bsg_util.h
++++ b/scsi_bsg_util.h
+@@ -121,15 +121,15 @@ struct ufs_bsg_reply {
+ #endif /* SCSI_BSG_UFS_H.*/
+ 
+ struct rpmb_frame {
+-	u_int8_t  stuff[196];
+-	u_int8_t  key_mac[32];
+-	u_int8_t  data[256];
+-	u_int8_t  nonce[16];
+-	u_int32_t write_counter;
+-	u_int16_t addr;
+-	u_int16_t block_count;
+-	u_int16_t result;
+-	u_int16_t req_resp;
++	__u8  stuff[196];
++	__u8  key_mac[32];
++	__u8  data[256];
++	__u8  nonce[16];
++	__u32 write_counter;
++	__u16 addr;
++	__u16 block_count;
++	__u16 result;
++	__u16 req_resp;
+ };
+ 
+ #define BSG_REPLY_SZ (sizeof(struct ufs_bsg_reply))
+-- 
+2.24.1
+
diff --git a/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
new file mode 100644
index 0000000000..5fdd089aef
--- /dev/null
+++ b/meta-filesystems/recipes-utils/ufs-utils/ufs-utils_git.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Tool to access UFS (Universal Flash Storage) devices"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
+
+PV = "1.6+git${SRCPV}"
+
+BRANCH ?= "dev"
+
+SRCREV = "a3cf93b66f4606a46354cf884d24aa966661f848"
+
+SRC_URI = "git://github.com/westerndigitalcorporation/ufs-utils.git;protocol=git;branch=${BRANCH} \
+           file://0001-Replace-u_intXX_t-with-kernel-typedefs.patch \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}" CFLAGS="${CFLAGS}""
+
+CFLAGS_append_mipsarchn64 = " -D__SANE_USERSPACE_TYPES__ -D_GNU_SOURCE"
+
+do_configure() {
+	sed -i -e "s|-static$||g" ${S}/Makefile
+}
+
+do_install() {
+	install -D -m 755 ${S}/ufs-utils ${D}${bindir}/ufs-utils
+}
+
+PROVIDES += "ufs-tool"
+
+RPROVIDES_${PN} += "ufs-tool"
+
-- 
2.24.1


