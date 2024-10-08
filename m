Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC0BCEFC36
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 17:15:53 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.1345.1728407752851548152
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 10:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YSwwX7If;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ae3d7222d4so4968095a12.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 10:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728407752; x=1729012552; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ww1edf/kvrQKEmu4jShpYvS0+ldWXXxAZwz5FeJigw0=;
        b=YSwwX7IfeufR1u+K3esG7nHGUqGkddmMMg6n/xmzc96AmqRsdlk5GkRC7ipVBHwfwU
         0wDYKWPpBcBNlfjsB8BM07RwsnG0V+vGvbm9TGDdxMpXQtu1/NCiMpEBqDDqxZp8BKMv
         UBXoEd3DYjV/krVIDJKe6/LIhgYryuxZAW7xiiJ4FDnPuXfzyAZlY+QWmaTkLdzHI0Ax
         nLhgFDgOrSQEy3D0jGT8YVqr1pnlf323AwjjdGwFeYe8un387o+aH3eaqtskTl1a5bKz
         c2F9AesJvnXfA9Mlh8f1nTG8hFBkYWj5v2HH2I2uQU+2sHWKWRURRhQyMnwXV3OHITqh
         btag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728407752; x=1729012552;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ww1edf/kvrQKEmu4jShpYvS0+ldWXXxAZwz5FeJigw0=;
        b=sM9hr/SkLhlRgb0KfBN8cZfmi0x8qdT0UKe5KCfCI+cB7JhN+az/vNjwJNt4CaGXFf
         QpAdNnS0BPvdivMkCb9482VImKTqPDaussL8hqV8sq0y4E3YaE++X4IBwzfKDhoHEo3b
         7pqhmMEADSr2p8CzTbSseDgiTBIWyTJjSec+2TJ0UxQqYfSqWakkYF2DgEHnHkmrMVzJ
         5ZI3EMlxolJasZF1xfkgVdbWTs2+cqEhYHl4D3v8ICD1t91yRBF86JtluUoLL4D44PhR
         VIH/fSwM4jMXIJRBmdHatQYAF24SbK5XM0pTd3LOMhUQMo757eSKf6ViEKZ7HGtxcCo8
         RNLA==
X-Gm-Message-State: AOJu0YzN9s/Omz/bpGcj1V6AW4GcXejIbIHNud3kHmBnSuJIRGqCj9/+
	+kDr/DEZCKUG+bo+rnXApzhbW9Kacg7G9kc5towux5mwuvAs2KBptdr9rJrp
X-Google-Smtp-Source: AGHT+IGBigES0LqeFVCxWQEYt1sMPDXWLQ5fYsQbkbLe2La82TL6Ogk1BhsY6T9khphHTVAp5PbGCQ==
X-Received: by 2002:a17:90a:b88a:b0:2e2:958e:5bf6 with SMTP id 98e67ed59e1d1-2e2958e5d84mr1274254a91.23.1728407751853;
        Tue, 08 Oct 2024 10:15:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::c3e8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e20aebb7e5sm8068466a91.18.2024.10.08.10.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 10:15:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH v2] libhugetlbfs: Use linker wrapper during build
Date: Tue,  8 Oct 2024 10:15:49 -0700
Message-ID: <20241008171549.3628214-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 17:15:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112717

ld.hugetlbfs is munging certain linker commandline options
and presenting a differently named options to its users, in
summary its expecting linker process to call ld.hugetlbfs
which calls the final linker with additional decorations.

This patch makes space for that by adding -B option to compiler
so it finds this the linker in S and then we creates symlinks
for linker name that clang/gcc are expecting.

Fixes

libhugetlbfs/2.24/recipe-sysroot-native/usr/bin/x86_64-yoe-linux/x86_64-yoe-linux-ld.bfd: unrecognized option '--hugetlbfs-link=B'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Keep the gold hack intact

 .../recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb  | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 00b34ad4ab..7a2d7c7a85 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -46,6 +46,8 @@ export HUGETLB_LDSCRIPT_PATH="${S}/ldscripts"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+LDFLAGS += "-B${S}"
+
 inherit autotools-brokensep cpan-base
 
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
@@ -55,6 +57,13 @@ do_configure:prepend() {
     fi
 }
 
+do_configure:prepend() {
+    ln -sf ld.hugetlbfs ${S}/ld
+    ln -sf ld.hugetlbfs ${S}/ld.bfd
+    ln -sf ld.hugetlbfs ${S}/ld.gold
+    ln -sf ld.hugetlbfs ${S}/ld.lld
+}
+
 do_install() {
     oe_runmake PREFIX=${prefix} DESTDIR=${D}  \
         INST_TESTSDIR32=${libdir}/libhugetlbfs/tests \

