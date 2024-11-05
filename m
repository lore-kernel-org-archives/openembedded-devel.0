Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED36CD2C114
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:21 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.19557.1730817432098658231
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RlnIuQHK;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ed5e57a7so43458897b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817431; x=1731422231; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTAHRnVtZOkGmQqYoSosTlLq7Jiud6PuyCiwaUUdvb4=;
        b=RlnIuQHK7UBIAkeT345sPl7erYfo6bOdC/QlKuct3LzsHk+95j+M/4CbM0MkHbL4fa
         f4Aa2aJ2NeBrzHI2FbH/ILLzkbSfpsgpHgbhAq+/FiakCOyJW2Sz1qJTysAG2nOthVk0
         Bku13BP4ovoV2t7g4h6jmELUVoofYFMXfDoM7SE6OEI4vpiQwgzX4Fmca29loNFmW853
         B3f6G5eNb+y6hSBS1RQ1scSuYmYQpb+k0gr4zhtB84eckzEF+b3N4xp4cNNruCM9/AYB
         vhc7fnmGZe0mM9+XHPmW9Ye1fSINGIdodxKvfbIpkvwKZQkClgeMMIVQQYdzXmiRXOD0
         evhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817431; x=1731422231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTAHRnVtZOkGmQqYoSosTlLq7Jiud6PuyCiwaUUdvb4=;
        b=G7uunkhSdA7shnuNiX7KwsoORoGf53QpX1b7EWilH/w0i1hMGN52Ls0QTytsCqQPNE
         v7i3ZODjQ7I89bnVqT60vuzorHCsHYdx16xX35FgzwGfaFHiywyroOuToBxZ+vzsKZMl
         Ttmbytpvogvlw/rkWUUxG8wh2d0/7bTolec7qyLN5WlEPWChkIvB7AmOO6De4z9Ro3vl
         14Bc9wB/vZBybAF+/FFsCk68fhkPuFTm54lW0iXNvq9u1CYMpiUxQfmeGzGpU1oVl9pV
         7S42kmolsW6H32UrFc6QyWZn5XrkvZqkZqgpCwFtkrtZuagjtfxYNoZ1sIkiKribZUwx
         871g==
X-Gm-Message-State: AOJu0YwRMIaczRybMF+JVDeQHUU9HiQtUSXDy44KD+5D/HcqthP3/Od2
	yfDpWVkA7cS4psf9ZFO6yVBI3Sd4qkP/2zGAUWAU8kOVzT5E09lw+8xnBg==
X-Google-Smtp-Source: AGHT+IEZfmLraRYRIfPhZIWpf9QBejDjU+LydcMPQCJXGVHK8PUd529A2RseiFvueEH52DrJX36b6Q==
X-Received: by 2002:a05:690c:d1a:b0:6e0:447:f257 with SMTP id 00721157ae682-6ea524cbfc1mr195896637b3.22.1730817431132;
        Tue, 05 Nov 2024 06:37:11 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:37:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 68/90] libhugetlbfs: Use linker wrapper during build
Date: Tue,  5 Nov 2024 09:35:33 -0500
Message-ID: <20241105143638.2301245-69-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113484

From: Khem Raj <raj.khem@gmail.com>

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
(cherry picked from commit dc84a9e699caa852adc043e9ba1eb134880f055d)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../libhugetlbfs/libhugetlbfs_2.24.bb                  | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
index 00b34ad4ab..aa1c0ddd5e 100644
--- a/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
+++ b/meta-oe/recipes-benchmark/libhugetlbfs/libhugetlbfs_2.24.bb
@@ -46,6 +46,8 @@ export HUGETLB_LDSCRIPT_PATH="${S}/ldscripts"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
+LDFLAGS += "-B${S}"
+
 inherit autotools-brokensep cpan-base
 
 #The CUSTOM_LDSCRIPTS doesn't work with the gold linker
@@ -53,6 +55,11 @@ do_configure:prepend() {
     if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
         sed -i 's/CUSTOM_LDSCRIPTS = yes/CUSTOM_LDSCRIPTS = no/'  Makefile.in
     fi
+
+    ln -sf ld.hugetlbfs ${S}/ld
+    ln -sf ld.hugetlbfs ${S}/ld.bfd
+    ln -sf ld.hugetlbfs ${S}/ld.gold
+    ln -sf ld.hugetlbfs ${S}/ld.lld
 }
 
 do_install() {
@@ -61,7 +68,8 @@ do_install() {
         INST_TESTSDIR64=${libdir}/libhugetlbfs/tests \
         install-tests
 
-    sed -i -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
+    sed -i \
+        -e 's|${RECIPE_SYSROOT_NATIVE}||g' \
         -e 's|${RECIPE_SYSROOT}||g' \
         `find ${D}${libdir}/libhugetlbfs/tests -name dummy.ldscript`
 }
-- 
2.43.0


