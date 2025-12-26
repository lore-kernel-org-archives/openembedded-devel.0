Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 614E5E8FDB8
	for <webhook@archiver.kernel.org>; Fri, 26 Dec 2025 19:10:09 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.158346.1766776205416391506
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Dec 2025 11:10:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OBgCodbw;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e77f519so4785514f8f.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 11:10:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766776204; x=1767381004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5N0jaxQnY2P6EZF6mXe1ymK34K/dW0R/v1cATtU7xk=;
        b=OBgCodbwfD/5Jmb67zcPL5d5DiHCn85Rtu/sWolhG3MZY1yYOFa4NdM6AJV3/SGtst
         1FjfhpfqQY6N59teLcF4Iw4VZn7cxv5mOOKfwTL+FTCt4euvV5JcL6Nv/dMhQS5HTsc6
         uLgz3P8M1TOJRN7IO5ROa8b7fadMA+J+BxQ/GU1y5/Yent9DQ19bYM5u5MTa/4p3CsAf
         OJzWpoyF2SEnGvkowE3J0zXJ2Qiyyrd4JFSZIMqlrtbdMQ4N/3NBGWFxx1vJLH7Ob6+a
         p/tCqs/UPRAicTczdpS+Vk0WVF6ycpjzHFDO2Vz5l/tKx8KvA8QVYZfApVFWLPwAAVhB
         +Nww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766776204; x=1767381004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g5N0jaxQnY2P6EZF6mXe1ymK34K/dW0R/v1cATtU7xk=;
        b=ZP04Wv+HeIc612pELXMw38JZ4h4dkYZQ4D+e27ePTCuAvd3zTN8Fl+RN+neXesvoUb
         GvM2vm3/e5VRAHuFFHVof1oCM6GrbPGbvTY+/5GfPnhGPUwR3VhbdQfG722kRrVA371S
         tFAlt/0WZPQNp89dqlytzh5mxEIJ9Zcr81z0cMNDQ+l678Gfd1uLtevAx/T6JMF2z7E6
         Xi7uX/MwRFXyVYLPeb/xRAehRZ74+D059Yvd3lpn37L6YFC1c2SJzJlKpCqVc737KKQ8
         iKyw2R1lUNvSHaBnWU8bDuB0oz0lz8iYqm59NPho2P2AcNN1/sHZbODeveiAl9VgE3MY
         Quiw==
X-Gm-Message-State: AOJu0Ywpe/rfHqwNk2hNDUgENWA/xD/dkdYn/N+PnksFz57Y3yOHE7fR
	QGVGkJpzflmQy4H/ukEp6s5rSnscdGaPRHtelcHT5Ehx12OOLgyeOC+fabCwQA==
X-Gm-Gg: AY/fxX5/ksnIEIQRmKbSqFUqxbU7FnDxfODOc2DYAb+r+U6zLMAREd/127cm2ymM0bo
	vvnTKF9Q+u4Ys7u0N2yYdCgDV0OM+Dj65co/YikfrAweCqMtfPWGKdam6UGsdZYKqzU1L0tByoJ
	ov06bSNPv3sZrgEUXSViOkCixbgeOG2gOuG87oTYNn91fgNe7Xe+WJ2WNU/Rsc4z5vmkm3tOEgz
	YfR1iAnK3ddIwcKsD+wFNIAtgMwfVDasxmx9t0BJN+rU90DRp/1ahgnHyBafmFkNuEAGr1EkyZu
	8lB3KNihSRM9SCQ4T7u5YcfNZhsfppWxn4RdDVlpv44rmOOYDYfi7rcYOgklkutS2H+QJ63cM6g
	S2KrvIrD6LuLROzkPULElcE7MalauUTbsxQmdP88RCrO2kOZeL72ei1ZtLokiPBmlsFpZNxCErP
	cTjhAaxq9g
X-Google-Smtp-Source: AGHT+IG28vBstsOK6S6OrqOITFhp6Af9quwwJg9buRbQFZKPdYPLdc/7WqzdyeLqgHAmUVgEfn+H/A==
X-Received: by 2002:a05:6000:2302:b0:42f:bbc6:eda2 with SMTP id ffacd0b85a97d-4324e5060b7mr25481060f8f.40.1766776203699;
        Fri, 26 Dec 2025 11:10:03 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1afbfsm47583330f8f.9.2025.12.26.11.10.03
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 11:10:03 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 3/5] unionfs-fuse: upgarde 3.4 -> 3.7
Date: Fri, 26 Dec 2025 20:09:59 +0100
Message-ID: <20251226191001.2920748-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226191001.2920748-1-skandigraun@gmail.com>
References: <20251226191001.2920748-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Dec 2025 19:10:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122941

License-Update: copyright year bump

Drop patch which became unneeded (CFLAGS are not overwritten anymore)

Selected shortlog (without readme and CI changes):
- Use fchmodat with AT_SYMLINK_NOFOLLOW if available
- Use utimensat on macOS
- tests: properly test for directory existence using os.path.isdir
- Enable commented test for rmdir
- Add more tests for renaming using cow
- Allow directory renaming when cow is disabled but it only exists in one branch
- Use existing function for checking if file exists
- Fix directory rename hiding files from lower branches
- remove deprecated "use_ino" option from examples and documentation
- CMake: Support CFLAGS= and -DCMAKE_C_FLAGS= from the outside
- set -D_FILE_OFFSET_BITS=64 unconditionally so that compilation does not fail on 32bit systems

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-support-cross-compiling.patch  | 31 -------------------
 ...nionfs-fuse_3.4.bb => unionfs-fuse_3.7.bb} |  8 ++---
 2 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
 rename meta-filesystems/recipes-filesystems/unionfs-fuse/{unionfs-fuse_3.4.bb => unionfs-fuse_3.7.bb} (65%)

diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch b/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
deleted file mode 100644
index 9b4d0f6cae..0000000000
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/files/0001-support-cross-compiling.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6e794a36564a2639a07d8720260e33d7c9435aa4 Mon Sep 17 00:00:00 2001
-From: Alper Ak <alperyasinak1@gmail.com>
-Date: Fri, 10 Nov 2023 20:50:48 +0300
-Subject: [PATCH] support cross compiling
-
-Do not override OE CMAKE variables
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
-
-Upstream-Status: Pending
----
- src/CMakeLists.txt | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
-index f549496..ab71fb2 100644
---- a/src/CMakeLists.txt
-+++ b/src/CMakeLists.txt
-@@ -4,9 +4,9 @@ set(UNIONFS_SRCS unionfs.c opts.c debug.c findbranch.c readdir.c
-     fuse_ops.c)
- set(UNIONFSCTL_SRCS unionfsctl.c)
- 
--SET(CMAKE_C_FLAGS "-pipe -W -Wall -D_FORTIFY_SOURCE=2")
-+SET(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pipe -W -Wall -D_FORTIFY_SOURCE=2")
- SET(CMAKE_C_FLAGS_RELWITHDEBINFO "-O2 -g")
--SET(CMAKE_C_FLAGS_RELEASE "-O2")
-+SET(CMAKE_C_FLAGS_RELEASE "${CMAKE_C_FLAGS_RELEASE} -O2")
- SET(CMAKE_C_FLAGS_DEBUG "-O0 -g -DDEBUG")
- 
- add_executable(unionfs ${UNIONFS_SRCS} ${HASHTABLE_SRCS})
diff --git a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
similarity index 65%
rename from meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
rename to meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
index fc474e3238..5ba202b90c 100644
--- a/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.4.bb
+++ b/meta-filesystems/recipes-filesystems/unionfs-fuse/unionfs-fuse_3.7.bb
@@ -3,13 +3,11 @@ HOMEPAGE = "https://github.com/rpodgorny/unionfs-fuse"
 SECTION = "console/network"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://src/unionfs.c;beginline=3;endline=8;md5=30fa8de70fd8abab00b483a1b7943a32 \
-                    file://LICENSE;md5=7e5a37fce17307066eec6b23546da3b3 \
+                    file://LICENSE;md5=0e75c95b3e0e1c01489b39e7fadd3e2d \
 "
 
-SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master;protocol=https \
-           file://0001-support-cross-compiling.patch \
-           "
-SRCREV = "773f1853b043eeb64b7459f903a2c65bd096f9d9"
+SRC_URI = "git://github.com/rpodgorny/${BPN}.git;branch=master;protocol=https;tag=v${PV}"
+SRCREV = "3fcbd11f78b9a9e02ea0e861d741840fe45dc9c8"
 
 DEPENDS = "fuse3"
 RDEPENDS:${PN} = "bash"

