Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D87F8C55175
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 21:46:06 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13612.1785620758093135208
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2026 14:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZGupROUn;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso2715446b3a.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 14:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785620757; x=1786225557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pn65ScQw1kQKVM2PBvbSW44DzsQ5SL4ItOTRP1o6L3s=;
        b=ZGupROUnO7P+/1PpwvDo00Vb+qgD6jnuiDJdYUelNB9/YuKE+TFAzURSJFU01jokfv
         wrx/i+dBNtuJK8THh2eAY3Pg+CjTo0I7lJpEop5p0FI29ndjChEipLp/C4nbrqw4qUls
         2RgMiWn8LJXxVW4WT4KZNPmcHaz8uKlVGgmt3P6rhpj3UkA+Sr7nJ3BrHjU6EGym2aLg
         UkcWG8J62aLCvuFZutkW9xGPdV7zrvZhwgHd1W02mPWwJb611nak/lsghAPVZ77SctHk
         v9ZASuwzyK3HMPvgyRYBz3suJT0DhpuMkPHBX0tMzGnSkURFAH50ruXHQxSRuyUERrB3
         Zyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785620757; x=1786225557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pn65ScQw1kQKVM2PBvbSW44DzsQ5SL4ItOTRP1o6L3s=;
        b=JzkPaQ6XmWWz79DQSkrorHbjhK30wsBptvlfBdJrH7UOiFz5c+bM9KJJmomFCA/za9
         P0sIUuCvyXQsrZloO5Vq8NzgaV2d8V+QQHOtrw1ycxWp3SRUXv2L7RYqNNyR8fFC5bAT
         itNf4zdC4PEjladHxNpGpIuCQXmaOaaSke7wSYKkPJG/+o+9Ul/eclJ1ib1IViIQeoUY
         N9wISa1HwqH/cAsO0MfbqZ/GgrFvrmAPHGZE9ERE7NpCGbiI5rS9ppt2EqCydIat/pZy
         XBPoMXmDRZ+JUBH7wuWwjyNv+bNgZqIIRXRDDseiKzNRzaLulHu50AipjcdD8/aMVbIK
         ZZ9g==
X-Gm-Message-State: AOJu0YwdKex5j8UyfAJPKN65M2ZQ0rTKVuxSmJrmtKLFw2rA8O1hKWWw
	sKiky83jiklwza0RlCCiGZEV7mx2U0LczC4ayZpjF63axxByoOKJa7MGUEhMCnVp
X-Gm-Gg: AR+sD10sjHmq6bPaGrbOQ6ejl4Pt8yJgOz9mxKrkR6LLiQ8AZzLOIiD8ICCVQPZg+BF
	8qhpZdxWeAdMzy1/P5XI6HkINuvpRU+CYh0lPJy02TqHkmx1XQppVz1fJLB7cmTicE2rFgpMuCq
	ivH/vvr2FwCHyIoqhlAccaJOasCGuyi3279ZVMjnzvUrY65Pxgf2Q1K1GLuIa7Qredfvjccy9zx
	D1m8zOp761yDnvI038r117GqL6etpQieceYLz/rgisQCbqO1oJwRyYslUGbnEFO/U7I1KQn0w+v
	OkAn/FQM3qsMyUS6srAU7DMcdjZFPhXLtFIzGuzPX8YkvfypwSBBgk39Jbtcng6FGxnMJqxczHW
	wDbOsNZUTMCktLc26jfZt6C0SKzmjJu3dCxH0mAIAlBf+b0Z0ZzQs3lAbWnTFbpvs9i6Hn3lMI1
	oOZ5tZ/ueNTJcGUryFdirpyGRWb8vdCtDvptOI1vSsqOtUyzXoEYl4f3c1/V0o3TAsegkByuNph
	oMsG78vUgjz4bUuGPaK5oWF0WTFHsmJDTX5UyCOxpVeV1Jlz13yyrwh0E5r0MWVUVqvqjCZLVgY
	1phEkWU+i0R6qyrKSgweTaRkTuP1nq90LYB0utniC7/B8KOXAgyh7SoPjCBLES0kqiRpdnceY3s
	tAwH7rITPEfCMQA==
X-Received: by 2002:a05:6a20:4499:b0:3c3:8de3:8eee with SMTP id adf61e73a8af0-3c92a88ee11mr4564489637.61.1785620757447;
        Sat, 01 Aug 2026 14:45:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm19105102eec.1.2026.08.01.14.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 14:45:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: AshishKumar Mishra <emailaddress.ashish@gmail.com>,
	Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 29/31] e2fsprogs-ext4sparse-native: compiles ext2simg.c using android-tools-native
Date: Sat,  1 Aug 2026 14:45:24 -0700
Message-ID: <20260801214526.788343-29-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
References: <20260801214526.788343-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Aug 2026 21:46:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128646

From: AshishKumar Mishra <emailaddress.ashish@gmail.com>

Add a custom do_compile step to build the  ext2simg_android utility (ext2simg)
when building for the native class.
This can be used to generate ext* based sparse image

Signed-off-by: AshishKumar Mishra <emailaddress.ashish@gmail.com>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../e2fsprogs-ext4sparse-native_1.47.4.bb     | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb

diff --git a/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
new file mode 100644
index 0000000000..04f9aaaf2b
--- /dev/null
+++ b/meta-oe/recipes-devtools/e2fsprogs-ext4sparse/e2fsprogs-ext4sparse-native_1.47.4.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Native ext sparse conversion utility from e2fsprogs"
+DESCRIPTION = "Builds only ext2simg for host-side ext* sparse image conversion"
+HOMEPAGE = "http://e2fsprogs.sourceforge.net/"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://contrib/android/ext2simg.c;beginline=1;endline=14;md5=fc8a826484cc82548adeaad2579adfca"
+
+DEPENDS = "e2fsprogs-native android-tools-native"
+
+SRC_URI = "git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master;protocol=https"
+SRCREV = "ece89fac4603e400155b7bbf6326284f8511bca9"
+
+inherit native
+
+do_compile() {
+    bbnote "Compiling ext2simg.c with native toolchain"
+    # Source directory for ext2simg.c in the e2fsprogs tree
+    SRC_EXT2SIMG="${S}/contrib/android"
+
+    INCLUDES="-I${S}/lib -I${B}/lib -I${SRC_EXT2SIMG}/lib"
+
+    # STAGING_LIBDIR_NATIVE: where android-tools-native installed libsparse
+    LIBS="-L${B}/lib -L${RECIPE_SYSROOT_NATIVE}${libdir} -L${RECIPE_SYSROOT_NATIVE}${libdir}/android -lsparse -lext2fs -lz -lcom_err"
+
+    ${CC} ${CFLAGS} ${LDFLAGS} -o "${B}/ext2simg_android" "${SRC_EXT2SIMG}/ext2simg.c" ${INCLUDES} ${LIBS}
+    bbnote "ext2simg_android compilation finished"
+}
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/ext2simg_android ${D}${bindir}/ext2simg_android
+}
+

