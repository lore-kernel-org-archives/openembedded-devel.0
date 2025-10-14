Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1355CCD192
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 14:55:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.18808.1760453732974176881
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 07:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TnZWCFTk;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-426ed6f4db5so552096f8f.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 07:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760453731; x=1761058531; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=AmeQlha5DEZWJZaGPO9QGkvbyimrObPkcjpkRXHj4YA=;
        b=TnZWCFTkTgIuodH9w1IedNnsOy/bp0LhdkGclAF1oiipd/FE8BXKjb9TRiHAWAwVnV
         ZyIdgPJ0qbJ8jfD55OkxHEU2AqYjuf/TgA5++MvFHFKW6reaUKme394K4xgQxksLK474
         FjJs9MLlVJg+xCHk9JVzc5Zd36jDDLv4lRTUO+VGsMuNwD8t6R3nPdLKZ3uizLj0MDKq
         e7BqI8ucjqKhqa1+HxFl4ZIGitp83SY2SkGvC+LC5QOLeCjCdO7IHQh+nlMGzzKfWhF/
         FmMQATiyKABVvr0YIdwZOOHhb/FIUyL8enBPsQWj0/kpV36xCgoOODQVz4j0N+/5AkhL
         blhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760453731; x=1761058531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AmeQlha5DEZWJZaGPO9QGkvbyimrObPkcjpkRXHj4YA=;
        b=Xrtivzh67XkHjKCzQQwTKiZzwQ2AzYXR2uWhWAOwpugDrE85V6p/eqQoCNP2O+bxtg
         8e1EWT0KvrLK+oB+IDBPfWOUt2G+RE/stVbnScvol922BeEckVlYZ9wt6WdyYyWiZG99
         +af2oyJoZq4zf4mbwoF/kYKa+NK+9i5aqBjo5fSECRkuN25uEhRElWGMYw3kXewBK6Hp
         PNcrET7iXQbBISNbG6hnqA4AmvDfqVyg8rwypB2LPjctkdsfsIla447w2ixaZAuHF+mH
         s56GSLHUbt0k4cs95nhbLOy1RpmrcaUT00ujG+HzWIY4VJpgJSwojMlqWiDUXL8nfh56
         sOJg==
X-Gm-Message-State: AOJu0YwoanHt8Xj4pdZdPnvespUMBBDT92Ve17aloC+BqKFT+NxmhPJz
	VUdbUydedtzDfdXS8UFZ/V/kqFiasEMraZ41DJEaIM00k+qNs+Uy5R9RY7aAXA==
X-Gm-Gg: ASbGncsQqnJHMLslQ7graXpnr3LRexxm35CVP9M/KlDFOkmw/3umi3TCNu2AW6ArQKn
	EOQd/1lMGkxlufOQcJBxvnWE1OTotLZT9USQyQMGGXbod1COx81AmZySSiqwdyjnso9aM149kSn
	U2noaGCIuXj4+HQvnnz0L/zh3uwchBXUmYXv6k4g2b9QGmdbMS4j0vUMYuwpbxfHDnozMv7N+uT
	AzXkPYqiqrhL4Onz8/tNLUxMP9d5NxkahUL6VrRunIwQPmOlxS+F9LO3/wexxF240nCPPGqQNzy
	a29kDC83XCjsCgdr8gUyM1EGexbCsL/KfJrvraqiFAQYPQMzbjXnwf9VR8gboId41nCB4dMheVJ
	EJNVz9xSl1gcyCwdCEVe5+0YbWdUF1R6NjcVe7+Q=
X-Google-Smtp-Source: AGHT+IE9ZpAy3ru8EjkhjmMWUw5BPMKoKCgl8EI7psrj5qv6uSarwKiI+D8qVhJb8RLj+SBsy7vnXA==
X-Received: by 2002:a05:6000:24c4:b0:3f4:ad3f:7c35 with SMTP id ffacd0b85a97d-42582a0534bmr16108720f8f.27.1760453731055;
        Tue, 14 Oct 2025 07:55:31 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5cf790sm23263564f8f.28.2025.10.14.07.55.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:55:30 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/6] hdf5: patch CVE-2025-2153
Date: Tue, 14 Oct 2025 16:55:24 +0200
Message-ID: <20251014145529.1078084-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 14:55:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120612

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-2153

Pick the patch that resolved the issue from the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../files/0001-Fix-CVE-2025-2153-5795.patch   | 47 +++++++++++++++++++
 meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb   | 10 ++--
 2 files changed, 52 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch

diff --git a/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch
new file mode 100644
index 0000000000..4b31718dea
--- /dev/null
+++ b/meta-oe/recipes-support/hdf5/files/0001-Fix-CVE-2025-2153-5795.patch
@@ -0,0 +1,47 @@
+From 183c8aeb601a02a38dd6815bcb651a7317b1b647 Mon Sep 17 00:00:00 2001
+From: Glenn Song <43005495+glennsong09@users.noreply.github.com>
+Date: Thu, 9 Oct 2025 07:51:49 -0500
+Subject: [PATCH] Fix CVE-2025-2153 (#5795)
+
+This PR fixes #5329. Previously, the message flags field was able to be modified such that a message that is not sharable according to the share_flags field in H5O_msg_class_t could be treated as sharable. A check has been added to make sure messages that are not sharable can't be modified so that they indicate they can be shared.
+
+The bug was first reproduced using the fuzzer and the POC file from #5329. With this change, the heap based buffer overflow no longer occurs.
+
+CVE: CVE-2025-2153
+Upstream-Status: Backport [https://github.com/HDFGroup/hdf5/commit/38954615fc079538aa45d48097625a6d76aceef0]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/H5Ocache.c   | 4 ++--
+ src/H5Omessage.c | 3 +++
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/src/H5Ocache.c b/src/H5Ocache.c
+index 87f321c..12c30cf 100644
+--- a/src/H5Ocache.c
++++ b/src/H5Ocache.c
+@@ -1399,8 +1399,8 @@ H5O__chunk_deserialize(H5O_t *oh, haddr_t addr, size_t chunk_size, const uint8_t
+             else {
+                 /* Check for message of unshareable class marked as "shareable"
+                  */
+-                if ((flags & H5O_MSG_FLAG_SHAREABLE) && H5O_msg_class_g[id] &&
+-                    !(H5O_msg_class_g[id]->share_flags & H5O_SHARE_IS_SHARABLE))
++                if (((flags & H5O_MSG_FLAG_SHARED) || (flags & H5O_MSG_FLAG_SHAREABLE)) &&
++                    H5O_msg_class_g[id] && !(H5O_msg_class_g[id]->share_flags & H5O_SHARE_IS_SHARABLE))
+                     HGOTO_ERROR(H5E_OHDR, H5E_CANTLOAD, FAIL,
+                                 "message of unshareable class flagged as shareable");
+ 
+diff --git a/src/H5Omessage.c b/src/H5Omessage.c
+index 7190e46..fb9006c 100644
+--- a/src/H5Omessage.c
++++ b/src/H5Omessage.c
+@@ -354,6 +354,9 @@ H5O__msg_write_real(H5F_t *f, H5O_t *oh, const H5O_msg_class_t *type, unsigned m
+          */
+         assert(!(mesg_flags & H5O_MSG_FLAG_DONTSHARE));
+ 
++        /* Sanity check to see if the type is not sharable */
++        assert(type->share_flags & H5O_SHARE_IS_SHARABLE);
++
+         /* Remove the old message from the SOHM index */
+         /* (It would be more efficient to try to share the message first, then
+          *      delete it (avoiding thrashing the index in the case the ref.
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
index 974007a3e9..345598c8f2 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.6.bb
@@ -11,11 +11,11 @@ inherit cmake siteinfo qemu multilib_header multilib_script
 
 DEPENDS += "qemu-native zlib"
 
-SRC_URI = " \
-    https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${BPN}-${PV}.tar.gz \
-    file://0002-Remove-suffix-shared-from-shared-library-name.patch \
-    file://0001-cmake-remove-build-flags.patch \
-"
+SRC_URI = "https://support.hdfgroup.org/releases/hdf5/v1_14/v1_14_6/downloads/${BPN}-${PV}.tar.gz \
+           file://0002-Remove-suffix-shared-from-shared-library-name.patch \
+           file://0001-cmake-remove-build-flags.patch \
+           file://0001-Fix-CVE-2025-2153-5795.patch \
+           "
 SRC_URI[sha256sum] = "e4defbac30f50d64e1556374aa49e574417c9e72c6b1de7a4ff88c4b1bea6e9b"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"

