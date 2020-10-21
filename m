Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web08.15087.1603299365220211930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2020 09:56:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rdLvqH6S;
 spf=pass (domain: gmail.com, ip: 209.85.128.66, mailfrom: luca.boccassi@gmail.com)
Received: by mail-wm1-f66.google.com with SMTP id b127so3350610wmb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2020 09:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kWAQOEooaCdcTh1Iegv/IfXM3GO7v5siDo7nE2hURSk=;
        b=rdLvqH6SkCUp2aQosXuah/MTE7wxe57b4IfshG7tdfp4BKkhx7nl1AGuOjFdJLZnBh
         EG1WS554NrPINnlsNsk7POj4ngxd+5djoHcN8QLGsmFAr4/jXZ3PcURz3YWrtBwj3WAE
         0sr2X2bDfweoEzY99z/maxzpBt/NmXvBnZA2U8ovrn1rCDLkzQom3ZFputBndDSqnUZy
         W3E6ULmSxBTdeSkMwXv9M7fHtbWOakkxNjIUxRtpaGP9V3izUOA2QyL4R50q2HW7nPFU
         arDhUBun1320lqaC4On/RU32OLaaSG0BHGyspiDw0JTXH6A85u0VcvUH0ALr02CdpPH+
         9G6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kWAQOEooaCdcTh1Iegv/IfXM3GO7v5siDo7nE2hURSk=;
        b=Nxs3MfV6QsdOuUPmdL6UWUB/V8CgSoG/cVcUAIGXn1c7d9Go/adX3R1lQQX9RjYo0k
         0+1NaLfo9qKig72uNChjz/KAIwoorkxNNo7UMXPi7eaYnD/7pMr27ZmCGJhnqHHaEHRk
         lBx2QBnHJRl6XXXE0D76rMI/AofOZNVXY5JZGxUuPJFdLVx//HA99DLdQ02feF5FVxiJ
         rqTY4xlDLjFgPTc1x5WYzMhN25pUIrLfbOYN3UD6W8KxMHQEJ1CDI6nnJEtIylv9eTa1
         ubedyWP2Lk+GSyHFBLGSzGzsU0NKsU0puFzBEJPuZuBRfba9KnhiohSwS8N7E7XFboHr
         us2Q==
X-Gm-Message-State: AOAM531ons9OeB3qfJv+hHBqKOMFywb/VLqS4Nr+UlWdJ6XkURsn+HYp
	a3so2jqYHzcpsSAiqrUS18ofykkE8EHZsg==
X-Google-Smtp-Source: ABdhPJzQHE++wVFSvKlJtHH5XlMyYClGFdp5xu9/jRXtXKYEjiCw2Rdhbje26T0BOwSdP1m57j8Upw==
X-Received: by 2002:a1c:5545:: with SMTP id j66mr4727970wmb.31.1603299363396;
        Wed, 21 Oct 2020 09:56:03 -0700 (PDT)
Return-Path: <luca.boccassi@gmail.com>
Received: from localhost ([88.98.246.218])
        by smtp.gmail.com with ESMTPSA id l26sm4258901wmi.41.2020.10.21.09.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:56:02 -0700 (PDT)
From: "Luca Bocassi" <luca.boccassi@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: raj.khem@gmail.com
Subject: [meta-oe][PATCH v2] Add recipe for fsverity-utils
Date: Wed, 21 Oct 2020 17:55:52 +0100
Message-Id: <20201021165552.2885646-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201021155656.2841020-1-luca.boccassi@gmail.com>
References: <20201021155656.2841020-1-luca.boccassi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

Library and command-line tool to manage the fs-verity
feature, introduced in Linux 5.4 and supported in ext4
and f2fs filesystems.

https://www.kernel.org/doc/html/latest/filesystems/fsverity.html

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
v2: renamed recipe to use version in filename, added to meta-oe-crypto packagegroup

 .../packagegroups/packagegroup-meta-oe.bb     |  1 +
 .../fsverity-utils/fsverity-utils_1.2.bb      | 28 +++++++++++++++++++
 2 files changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 92190c838..a63c94023 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -186,6 +186,7 @@ RDEPENDS_packagegroup-meta-oe-core_remove_riscv32 = "safec"
 RDEPENDS_packagegroup-meta-oe-crypto ="\
     botan \
     cryptsetup \
+    fsverity-utils \
     libkcapi \
     libmcrypt \
     libsodium \
diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb
new file mode 100644
index 000000000..4d5dbafb3
--- /dev/null
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.2.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Userspace utilities for fs-verity"
+DESCRIPTION = "fs-verity is a Linux kernel feature that does transparent \
+on-demand integrity/authenticity verification of the contents of read-only \
+files, using a hidden Merkle tree (hash tree) associated with the file. The \
+mechanism is similar to dm-verity, but implemented at the file level rather \
+than at the block device level."
+HOMEPAGE = "https://www.kernel.org/doc/html/latest/filesystems/fsverity.html"
+SECTION = "console"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=bc974d217b525ea216a336adb73e1220"
+
+SRCREV = "406187bb3a885e083b448b2c2aa42c22957ae629"
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git"
+
+S = "${WORKDIR}/git"
+
+DEPENDS = "openssl"
+
+EXTRA_OEMAKE += "PREFIX=${prefix} USE_SHARED_LIB=1"
+
+do_install() {
+        oe_runmake install DESTDIR=${D}
+}
+
+PACKAGES =+ "libfsverity"
+FILES_libfsverity = "${libdir}/libfsverity*${SOLIBS}"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1

