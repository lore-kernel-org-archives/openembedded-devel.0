Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE018C77B77
	for <webhook@archiver.kernel.org>; Sun, 16 Apr 2023 14:58:16 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web10.31745.1681657087595040621
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Apr 2023 07:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qXa9bA8Y;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id cm18-20020a17090afa1200b0024713adf69dso10982681pjb.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Apr 2023 07:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681657087; x=1684249087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GN9giLkS8boBU65mldYb0LGvotJjqqGVB8uFuqrfNUA=;
        b=qXa9bA8YUBFiN3cdykDRKSYQtyzRJpG8a3R1GUCyBccRJWEXFhbQeSIB5QbF45X8TS
         cKkz9ZKZTnXS2memjx/smsp7L4yQAD6w1782kAHR2tVM9ebiaAIwxrkp4uAvMnD6kylU
         M1fK+BIvY2V3/8NZWYrQPx29ShflBLdAY+tRvWTRZgkc1g0bjhHkb99ek7RVBYO2K7R8
         KbFprLsGpPFj6NSvmW/CusNaCe8SwuQYsHwMonFicXh4iOZXe+TNFpphjruh9lXHujpF
         3TOyxkH5bJo/JyzOA7IvYYihf64lp+Qc1pFUyjHUeVboKMdFk5fjhDj29JIi+k6rR5ox
         NM8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681657087; x=1684249087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN9giLkS8boBU65mldYb0LGvotJjqqGVB8uFuqrfNUA=;
        b=T3IfO32KVlDzsbDLXDbKTSbSIn6XWTrf4u+biF33ovo5zPIkw2AbdsMuVRl77/R/7X
         uyGl6BprAigBp448b1OQIcCxnYqgfKDJE2dTBWdKVGwb6kja2KAxRxw9+s37r7Xh0D5j
         WWBm4kg49Z1HK+P8bg46I2kQctThEN8br9eFWpuJ5rDFt3rrZ0nIdVebTbhLqDtQLLXd
         YNBEd/VMPdwDswDADPa/ujc7RtrnHeAFAapIrN5hQjc8xSSr59gT1Xc7ewlnLSPLrYnr
         iCXZVNWt5bnGpQHEbKWsgmmKEVvpSDEzIy4udEISTiOAuzl50KGYYKJdhMP5Rc3xCXAA
         ZS7A==
X-Gm-Message-State: AAQBX9f2JDlby5XTerJRzzbAGgpNzSXHTJmdupUeojNIUmFA/aqi1KTG
	/JojJt2WPsArZ682b9diMxaPdoyPPdTOQg==
X-Google-Smtp-Source: AKy350Z/9oGCJ+opb8uy2QiOVo6DI2hnqEz+E0ec3nn56qq9ZmDGbvjnRkrcavLvS0mbwBPACj5XqA==
X-Received: by 2002:a17:902:7489:b0:19f:3d59:e0ac with SMTP id h9-20020a170902748900b0019f3d59e0acmr9060968pll.44.1681657086629;
        Sun, 16 Apr 2023 07:58:06 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::ebd0])
        by smtp.gmail.com with ESMTPSA id b5-20020a170902bd4500b001a19cf1b37esm6044758plx.40.2023.04.16.07.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Apr 2023 07:58:05 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/2] python3-pandas: Fix TMPDIR references in dbg files
Date: Sun, 16 Apr 2023 07:58:02 -0700
Message-Id: <20230416145802.2419372-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230416145802.2419372-1-raj.khem@gmail.com>
References: <20230416145802.2419372-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Apr 2023 14:58:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102101

These are embedded into comments in C source code generated with cython
during do_compile.

Fixes

WARNING: python3-pandas-1.5.3-r0 do_package_qa: QA Issue: File /usr/src/debug/python3-pandas/1.5.3-r0/pandas/_libs/hashing.c in package python3-pandas-src contains reference to TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-devtools/python/python3-pandas_1.5.3.bb    | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
index aa8dfe279d..129c3147cf 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.5.3.bb
@@ -14,6 +14,16 @@ DEPENDS += " \
     ${PYTHON_PN}-numpy-native ${PYTHON_PN}-cython-native \
 "
 
+PACKAGESPLITFUNCS =+ "fix_cythonized_sources"
+
+fix_cythonized_sources() {
+	for f in `grep -l -r -e '\/* Generated by Cython.*/$' ${PKGD}/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}`; do
+		if [ -e $f ]; then
+			sed -i -e 's#${RECIPE_SYSROOT_NATIVE}##g' $f
+		fi
+	done
+}
+
 CFLAGS:append:toolchain-clang = " -Wno-error=deprecated-declarations"
 
 RDEPENDS:${PN} += " \
-- 
2.40.0


