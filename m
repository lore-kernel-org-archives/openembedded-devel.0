Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE39C5DF7D
	for <webhook@archiver.kernel.org>; Fri, 21 Aug 2026 05:44:20 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1309.1787291053846091640
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Aug 2026 22:44:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=a8En064p;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so489226a91.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Aug 2026 22:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787291053; x=1787895853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKhLIuBpfWJATZoI3L+PvIw8z4pe2/PWse/kGqTy8nk=;
        b=a8En064pfh1iTutUy4KlVJUMCSjUyQ8u5yeYlswIyGpEUxSaSp1rTbDQ5LkHfRz8P8
         ZneHX68jZG7bBInKexe1eGqlElZVBrOUU/39eMGuji11OyAmZII6ovhd+EcUpBpKnFfQ
         w6i/k77PgdVtUWTxrawhLIvC4elnHtZEPCsVOfsrKczyD/94NYAAdXMhcjhYctXKXqQH
         GrHYj+8Dfwi8LAW7RpS6G5ZYgUTbYleOh9E5zMXuAlQiT3s9gPtrk7XK3hquExhTHQGj
         pcWf9gg1kCWpkbTbLvBT/SC0SMubNN/F1qqggSbbMEfgejFyRjEf9T2G/ngaIjqS9At7
         lf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787291053; x=1787895853;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKhLIuBpfWJATZoI3L+PvIw8z4pe2/PWse/kGqTy8nk=;
        b=IJ9uphCzINP6tDacrn0+ZLia/byLdORbdmuYFbNkDu3JAZdfCTDlb8qO7+2Pqubqbh
         SJD0+HYg4jdhXP+RtR6xIEgmstyWuMNgrp6/nQUSX+PAZGVH+sCAyy/Iuag4RMT9HRvi
         Zn+Uxo/J8CBmArJB6z/dB/Xxun7E3eZnDJp14W9FvhNoHsYX0FdhQvjRYAXEf6r0/PYn
         etakDVVztbGHZMzqsrxJAl8FUx5fvcCezNSVL1oa9NTHGv6Y7L13fMeooWxTAT7mpegZ
         8hwEfV7hb61+gLMSjGhd5xYdEvy+rgf+YBUZI7b9vC1HsyPvQvQo6SZroZGFLrFMnwvn
         29NA==
X-Gm-Message-State: AFuF++kZjgz9N02Ki5uz0L7im8rwuYw73npzgleODJSPqTHIE+tOQPsk
	kMCciy3M4NXasGmzH4EKJz7Df8F1stg8al/MditL9lOzwJXr5AphhRO0l4HEeJsJ
X-Gm-Gg: AR+sD110sM90YFHAOBrmN+3jM0vsJJ6DT+3ZHmS7dsA/Xdi0A3ecxzSKK/k4/gR3MdR
	veDBVo950ZkN6gylRQbvx9hvLX1rp4C2fp0KYsO7vmvIhispG3vBJ6E1NZGZHl/TmkClDP0n7hM
	nABxgVBmws3A/QO6YxOS8Lhjg22pZPywjXdzzjmMQs17IhBN8RqqMGD1BIf2BEjAnOfvxANrPYN
	h64dBjRcpdoxzyJ1sm0kGAEnF3yDmy1OHelYWcsPXBrGtcUk32GwjUltTOthHNGMQ/ou6NWTgS6
	FgHLoIbz/s20fHKdmAGssdqk3rsU1Al/dL7gzCrjzhq4wxUODVSiJoAdmVvWUpLhlpvpRyXL00n
	fA06uwCa82Z+lqDYUG8nXthm90ZsHL2E8/2+2yxdprSPE6Jb48TCIxb4/07L3EgKqaSW1ur/7fr
	DYCCCiGx7PvPjAafUt4ks+PPCYBMmwmiUDmfRNzHJywsuaIb1obIjl+7u/uinsrFdOYyNeMo07O
	M78FmHOX/l4+Rlcs+JVoLAdeSDFIzd5XChRntthr7iLiWvV3oiVLhCyKQz8UWNJ4UGLHcrpwBVL
	4EayPDUNJlov1bNmx/8kbwr04VPsr4/GESgKi8DNWwIaohBU9mEfkZBqYLj66dECp0Ho5+iZPTv
	1PDqUIhJ+IOWUjOORuLhiLg6a76B4yTbMsP1vTByCabalHw==
X-Received: by 2002:a17:90b:4fc8:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-395c3573cecmr7293701a91.4.1787291053209;
        Thu, 20 Aug 2026 22:44:13 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf10d475sm25446914eec.18.2026.08.20.22.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 22:44:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-msgspec: add recipe
Date: Thu, 20 Aug 2026 22:44:09 -0700
Message-ID: <20260821054409.1387900-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2026 05:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129413

Fast serialization and validation library for JSON, MessagePack, YAML and
TOML. Added as a runtime dependency of the forthcoming python3-max recipe,
but useful on its own.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-msgspec_0.21.1.bb          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb b/meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb
new file mode 100644
index 0000000000..f12882e4c8
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-msgspec_0.21.1.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Fast serialization and validation library for JSON, MessagePack, YAML and TOML"
+HOMEPAGE = "https://github.com/jcrist/msgspec"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c21402f8022478021f697044388b97c4"
+
+SRC_URI[sha256sum] = "2313508e394b0d208f8f56892ca9b2799e2561329de9763b19619595a6c0f72c"
+
+DEPENDS += "python3-setuptools-scm-native"
+
+inherit pypi python_setuptools_build_meta
+
+# msgspec builds its version with setuptools-scm, which cannot read git metadata
+# from an sdist.
+do_compile:prepend() {
+    export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
+}
+
+RDEPENDS:${PN} += " \
+    python3-json \
+"
+
+BBCLASSEXTEND = "native nativesdk"

