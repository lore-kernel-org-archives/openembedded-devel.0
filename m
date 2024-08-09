Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A58C1C3DA4A
	for <webhook@archiver.kernel.org>; Fri,  9 Aug 2024 23:31:39 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.96509.1723246295531169771
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Aug 2024 16:31:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iN8PJoyP;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-710cad5778fso2018121b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 16:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723246294; x=1723851094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dxc+qYqszg9JMa/wWoyHCViPRJ3cUYB818Qm0BDn4DU=;
        b=iN8PJoyPNHHNSJDHXXq9Nlm5d+qPdALVJYqAo/hTq6Ufwnzzmxh0KkKw2sEC/Hz2Bd
         orMEXSbrp22DKmSEewj6G/BTg+jw9VU5h+RAlP9Q96m0TqjUyl7kzI73pTNAtRq3UrdF
         73SGN/qHI0W8iavV5mP7YnzoqYTJRZddh0vIJe/XJGPKU0RmjYJ/xstzdCZQ0HZCF30F
         qzAAjdO0LhYFfO4267JYQQ+6ii6/0i0yGHr0NVO0KxIBaqu4PmDVghNEuhnc3/XgIste
         PdO+/S5+UqCcxoERSwPYRsKOtNlnzL2iPRzuIOm92+8TCqfkdj/XTtHNs03qTN9nqSWK
         rR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723246295; x=1723851095;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dxc+qYqszg9JMa/wWoyHCViPRJ3cUYB818Qm0BDn4DU=;
        b=Sh0A99QWCdQSZjrdp7536VCRLTHPV+ZzyaJ/yN1bKRJUhZIingMy6FxhK977o24lBT
         UQcWij04bUdlH1ZhWY+Qq6W/8fSFUHvV3iZEl8O+PZY/4xQA8aqaXAgtKnyb5ClAX8Ap
         v5H3to25DIyEbW29ROUga+jaFlYpWZWS2ML8iWCqliWoIZRl6GkYTOdO7t1gse4+jZTY
         GHNdRyFaGoeOeEWAIxXMERzQ1zsfatE/9aWSOP0cSLqlezxIO/ltPJpdROiL7WgGWPrJ
         O9VyEYy+q/u++tMMCdi8IQ6pNYxq6lYtKBOR/O4Z3xLMGACmpLNitBle/j00VcqmEZ/C
         HivA==
X-Gm-Message-State: AOJu0YzJp2bV+j0P+/erUL+rzF0p1PsI3yjxDdxmXLaW1PYzUO8D7UFR
	1N/hiBStu7f7mL9xE7E5ibkAbZ8q4Ai94lQcNCtIZuuYJ7we4yHRybURpQ==
X-Google-Smtp-Source: AGHT+IGNhJlgZRtCF+ReH241ejLZlld1OC4cUkZSkdwcS5/XrjT/3u3Hh+zEzZoT6XExGIw3MznMJA==
X-Received: by 2002:a05:6a20:c889:b0:1bd:709:e4cc with SMTP id adf61e73a8af0-1c8a01285a5mr4293731637.38.1723246294473;
        Fri, 09 Aug 2024 16:31:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a94675sm275357b3a.182.2024.08.09.16.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 16:31:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [meta-oe][PATCH] turbostat: Add band-aid to build from 6.10+ kernel
Date: Fri,  9 Aug 2024 16:31:31 -0700
Message-ID: <20240809233131.3339913-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Aug 2024 23:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111732

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../recipes-kernel/turbostat/turbostat_3.4.bb  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
index 4770fae50e..cfe3bb9682 100644
--- a/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
+++ b/meta-oe/recipes-kernel/turbostat/turbostat_3.4.bb
@@ -33,7 +33,7 @@ do_populate_lic[depends] = "${PN}:do_configure"
 
 
 EXTRA_OEMAKE = '\
-                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}' \
+                CC="${CC}" 'CFLAGS=-Wall ${LDFLAGS}'  \
                '
 
 # If we build under STAGING_KERNEL_DIR, source will not be put
@@ -52,12 +52,21 @@ do_configure:prepend() {
 		cp -r ${STAGING_KERNEL_DIR}/include/linux/bits.h ${S}
 		cp -r ${STAGING_KERNEL_DIR}/include/linux/const.h ${S}
 	fi
+	if [ -f "${STAGING_KERNEL_DIR}/tools/include/linux/build_bug.h" ]; then
+		cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/build_bug.h ${S}
+	fi
+	cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler_types.h ${S}
+	cp -r ${STAGING_KERNEL_DIR}/tools/include/linux/compiler-gcc.h ${S}
 	cp -r ${STAGING_KERNEL_DIR}/tools/power/x86/turbostat/* ${S}
 }
 
 
 do_compile() {
 	sed -i 's#<linux/bits.h>#"bits.h"#' msr-index.h
+	sed -i 's#<linux/compiler.h>#"compiler.h"#' build_bug.h
+	sed -i 's#<linux/compiler_types.h>#"compiler_types.h"#' compiler.h
+	sed -i 's#<linux/compiler-gcc.h>#"compiler-gcc.h"#' compiler_types.h
 	'TMPCHECK='grep "<vdso/const.h>" bits.h'' || true
 	if [ -n $TMPCHECK ]; then
 		sed -i 's#<vdso/const.h>#"const.h"#' bits.h
@@ -66,8 +75,15 @@ do_compile() {
 		sed -i 's#<linux/const.h>#"const.h"#' bits.h
 		sed -i -e 's#<uapi/linux/const.h>#<linux/const.h>#' -e 's#_LINUX_CONST_H#_LINUX_CONST_H_KERNEL#' const.h
 	fi
+	echo '#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))' >> msr-index.h
+	echo "#define BIT(x) (1 << (x))" > bits.h
+	echo "#define BIT_ULL(nr) (1ULL << (nr))" >> bits.h
+	echo "#define GENMASK(h, l) (((~0UL) << (l)) & (~0UL >> (sizeof(long) * 8 - 1 - (h))))" >> bits.h
+	echo "#define GENMASK_ULL(h, l) (((~0ULL) << (l)) & (~0ULL >> (sizeof(long long) * 8 - 1 - (h))))" >> bits.h
+
 	sed -i 's#MSRHEADER#"msr-index.h"#' turbostat.c
 	sed -i 's#INTEL_FAMILY_HEADER#"intel-family.h"#' turbostat.c
+	sed -i 's#BUILD_BUG_HEADER#"build_bug.h"#' turbostat.c
 	sed -i 's#\$(CC) \$(CFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#\$(CC) \$(CFLAGS) \$(LDFLAGS) \$< -o \$(BUILD_OUTPUT)/\$@#' Makefile
 	oe_runmake STAGING_KERNEL_DIR=${STAGING_KERNEL_DIR}
 }

