Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D455C46CA2
	for <webhook@archiver.kernel.org>; Sun, 17 Dec 2023 07:39:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.15173.1702798790125169133
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Dec 2023 23:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AGDpjKW7;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40d12ade25dso5993775e9.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Dec 2023 23:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702798788; x=1703403588; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOaJ9X68yNe1T49sJr6JDCos0s/fx9W7XdlfsvGqnyA=;
        b=AGDpjKW7k86Eeeomyg4rJvt/d1MXn+Janw4qY+J5YzuTQaKtUxt2d2wtnn5E2QVdfB
         3edJQgb9ytTabc44pVLhUE8Ma9GQK7zAKCHxiXvqrrRBpt5ASBc5tO19qe+oRMPi3VNP
         xMiUA1FyLZ9ep1NlI5ynZN3yIewj5OWqa2fiRcoKJ4UqwkMc45lwNJUd10FBbxNN04Xj
         n1ncuLjiExeo2F23frFo/F2p3Hv0HMkw/GDYuPJR3NrrYzW6PIMgZnsXeBfyXing9l8x
         o0nkXpLKmY74jYAnrg3TAWN+V0wwHKXQz/KaR1Zoxj+trHxk6U3Ro8plJkCC/pClzAlr
         JejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702798788; x=1703403588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOaJ9X68yNe1T49sJr6JDCos0s/fx9W7XdlfsvGqnyA=;
        b=tGxOv3/ofKL0RGwbV6Ka9XEsPeWERPy4ISVGiFqYWCWxAUsNwoxbkJzPQkUleGU4aR
         Wb56c8gcjBzZLkXP7Es7CuQRMqKyeS1KaYjFRSYfG0GDzBbF4lFZPP97k432YpVZj2oi
         kx3ZQlTlqNwA0gzv/Be8H5N6mkiisMmVxlXDHnuNLNlep2Y6ExkSyS8r/k9RYiwINdBm
         MQF8SV0eaDLag9Lcw8uMmXWSK5GapoQSc7OqJWtGLGiS0t9y1e+Wyw+Qb5EXjDhVlhDZ
         bKJEXNXNJg5r7ZDvGH2xHSOTsl5tR/G2qJidS+wCbbTf/6bIIiCKG2y0HV3+rv5fRJjy
         OU1Q==
X-Gm-Message-State: AOJu0YxLDCH5BG70l6a6SAO/O0X3ib54S4sRmBVDicO+ws/SKZtX1b/f
	ln8uriG0l807LAZRCSDpwT3Jy75TXErrpA==
X-Google-Smtp-Source: AGHT+IHMtP22MA1GfWSoCm2xsTk/2ymK1OJN1O3PhcamtLu9J3uTiBwTO03tndTbQBBjaFeoPhHS3A==
X-Received: by 2002:a05:600c:3ba6:b0:40b:5e1c:5c1d with SMTP id n38-20020a05600c3ba600b0040b5e1c5c1dmr7147556wms.50.1702798788012;
        Sat, 16 Dec 2023 23:39:48 -0800 (PST)
Received: from work-pc.sigfox.io ([2a01:e0a:8d5:c6c0:2e8:740a:5bbd:1d48])
        by smtp.gmail.com with ESMTPSA id v6-20020a05600c444600b0040c4886f254sm26458428wmn.13.2023.12.16.23.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 23:39:47 -0800 (PST)
From: frederic.martinsons@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>
Subject: [meta-oe][PATCH 2/3] crash: add cross canadian version
Date: Sun, 17 Dec 2023 08:39:40 +0100
Message-Id: <223330c9bc2db79e2c5716e7132bcf9b0b86bee3.1702798681.git.frederic.martinsons@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702798681.git.frederic.martinsons@gmail.com>
References: <cover.1702798681.git.frederic.martinsons@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Dec 2023 07:39:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107536

From: Frederic Martinsons <frederic.martinsons@gmail.com>

Signed-off-by: Frederic Martinsons <frederic.martinsons@gmail.com>
---
 .../crash/crash-cross-canadian_8.0.2.bb       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.2.bb

diff --git a/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.2.bb b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.2.bb
new file mode 100644
index 000000000..04be12602
--- /dev/null
+++ b/meta-oe/recipes-kernel/crash/crash-cross-canadian_8.0.2.bb
@@ -0,0 +1,53 @@
+inherit cross-canadian
+
+SUMMARY = "crash utility (cross-canadian crash for ${TARGET_ARCH} target)"
+PN = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+BPN = "crash"
+
+require crash.inc
+
+PR = "${INC_PR}.0"
+
+DEPENDS = "\
+    nativesdk-ncurses \
+    nativesdk-expat \
+    nativesdk-gettext \
+    nativesdk-gmp \
+    nativesdk-mpfr \
+    nativesdk-readline \
+    nativesdk-zlib \
+    virtual/${HOST_PREFIX}gcc \
+    virtual/${HOST_PREFIX}binutils \
+    virtual/nativesdk-${HOST_PREFIX}compilerlibs \
+    virtual/nativesdk-libc"
+
+RDEPENDS:${PN} = "nativesdk-liblzma"
+
+EXTRA_OEMAKE:class-cross-canadian = 'RPMPKG="${PV}" \
+                                     GDB_TARGET="${BUILD_SYS} --target=${TARGET_SYS}" \
+                                     GDB_HOST="${HOST_SYS}" \
+                                     GDB_MAKE_JOBS="${PARALLEL_MAKE}" \
+                                     LDFLAGS="${LDFLAGS}" \
+                                     '
+
+# To ship crash into your sdk, you should create/update a packagegroup-cross-canadian.bbappend and
+# add the following
+# CRASH = "crash-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+# RDEPENDS:${PN} += "${@all_multilib_tune_values(d, 'CRASH')}"
+#
+# You should also add some kernel packages in your sdk, add the followng in your conf/local.conf:
+#
+# TOOLCHAIN_TARGET_TASK += "\
+#     kernel-vmlinux \
+#     kernel-dbg \
+#     kernel-dev \
+# "
+#
+# After sourcing the sdk environment script, you can analyze a kernel panic dump with
+#
+# crash $OECORE_TARGET_SYSROOT/boot/<vmlinux file> $OECORE_TARGET_SYSROOT/boot/<System.map file> <your vmcore>
+
+do_install:class-cross-canadian () {
+    install -m 0755 ${S}/crash ${D}/${bindir}
+    cross_canadian_bindirlinks
+}
-- 
2.34.1


