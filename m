Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B487C0218F
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 03:15:16 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.80040.1738552515629766200
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 02 Feb 2025 19:15:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dIZCH0E7;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: alistair23@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-216281bc30fso84971685ad.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 02 Feb 2025 19:15:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738552514; x=1739157314; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jT64ocIwBR/w+pFMJjTdZFQ2cZPfv9Gr7JZyAjC+I8E=;
        b=dIZCH0E7ifW5uCTNmabO7cLS1fThIMqnu3kqj4sie1Oj6cL4HfEZdAmqG82vSnC9sI
         en1vBCQ2lG+hrbQZZ8OduiLwrkHvPfnKRcD9KDEVfeV5tdBuaVHZSgYZHwOIlD1zxMGB
         2IGaLesbKeSQW33RJDwehn42CYLOiziaGeA30GVZeDaj8s9ePQghArqxYDn1TlDuxO6g
         SEzsBUMcBfmL31KWzx/cuHEzAbKyQw48l2Dc0IFTCZilG4Yyfsdxx5IwQsRMilASiF3J
         +Fsbnv68eeG228pLJPVvbeonyvWwCWtXPje0Rejyu+EbeAWUJrzKrlUk/JoeZcHKSkg/
         jZeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738552514; x=1739157314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jT64ocIwBR/w+pFMJjTdZFQ2cZPfv9Gr7JZyAjC+I8E=;
        b=crM9XrMq2FflJ+1vZjSKvKW7Ca67rxAxiD5fyHRMdAt681DF2lp6Sqcv0QFgH2DDSY
         oM2lHf2SLlAB9s1wxp9b22KCCoxckDnwE+W4ryOHVHRvG/sFHV27/mT6ROMskCYASGsJ
         27fWiNG9HbbGSoIC+9CFDGhJUnhI+F/kMsWdc3H+mn2TrXe/fH7xn3mLh17UCZpTtzbW
         pNnWPCNhjVez4IgpwEoaiHOI0Srw7aB9F1lI+BuOfdv2JOxJlxirgK7pTlpe3qUzO1q5
         hcnUM23PNT7KEc1Unol0QffgSQ9IhXQT3Ow3A8p+J8eQ3zYvlMj/0S8BEW3K8wbc5uRi
         uFsg==
X-Gm-Message-State: AOJu0YwdAFqU8Za3VmguZLNmndlD6OJRYJsNIVNJes8lTE0qprI5GNKW
	X+uerLyx9D3BqruABxg1qHunA1goaJ9UVDKQQPI6YZ5oNyAIAaiOy678Xg==
X-Gm-Gg: ASbGnctZEcNQZNGvzCvTB/G7RtOGewR5XZb9duRmkqVK/QlSzoJl/ZVgUXfkQxtXzqs
	Jj7mWEZvNmvHmSYJiikteJL0If+7peSmj/TDjEnuMYRLOE46kYrjcH02mqztnbmpNnXY/p9ZT1x
	Es8ljo8O3Xf/h2QxL0RGpZ4XTPZD/EOL7xgwurukCu27S5EZa5hJ0WhZRanOpsBDjvxvS6fuUPT
	aZDShgSBWtoyr2kUtzphBVDcDFqw0ZJ0w/CDSFr/RuWS/tqau70fhzO6YTQzEr/8zaDSyk537ED
	siF7dmGBQyf5z7Q1/cr5znebrgweWA1MRYAenVZyk5X9lUfRCneUzZprU7vj/uz0VOQJ5bKIIxS
	8nBkCTmOhRo6tAlwdVQ==
X-Google-Smtp-Source: AGHT+IFUlYvtM1XtM1AtyTdHKIvjyMpUEisCBTd+mlFvD4oCovK+J7cTlIDGUuyuOFuOoBMSVE57BQ==
X-Received: by 2002:a05:6a00:a95:b0:725:ef4d:c1bd with SMTP id d2e1a72fcca58-72fd0c6cf7fmr34068377b3a.19.1738552513090;
        Sun, 02 Feb 2025 19:15:13 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-321-6fb2-58f1-a1b1.ip6.aussiebb.net. [2403:580b:97e8:0:321:6fb2:58f1:a1b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631bea6sm7274241b3a.22.2025.02.02.19.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Feb 2025 19:15:12 -0800 (PST)
From: Alistair Francis <alistair23@gmail.com>
X-Google-Original-From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-devel@lists.openembedded.org
Cc: alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [meta-oe][PATCH 1/2] libspdm: Fixup the build flags
Date: Mon,  3 Feb 2025 13:14:58 +1000
Message-ID: <20250203031459.50222-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Feb 2025 03:15:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115231

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
index fa04ce6c59..f3e4b83ed7 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.6.0.bb
@@ -17,7 +17,7 @@ S = "${WORKDIR}/git"
 inherit cmake
 
 LIBSPDM_CFLAGS = "\
-	${TARGET_CFLAGS} \
+	${OECMAKE_C_FLAGS} \
 	-DLIBSPDM_ENABLE_CAPABILITY_EVENT_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_MEL_CAP=0 \
 	-DLIBSPDM_ENABLE_CAPABILITY_GET_KEY_PAIR_INFO_CAP=0 \
@@ -25,6 +25,8 @@ LIBSPDM_CFLAGS = "\
 	-DLIBSPDM_HAL_PASS_SPDM_CONTEXT=1 \
 	"
 
+LIBSPDM_CFLAGS:append:toolchain-gcc = " -fPIE"
+
 def get_spdm_multiarch(bb, d):
     target_arch = d.getVar('TARGET_ARCH')
     multiarch_options = {
@@ -52,6 +54,7 @@ EXTRA_OECMAKE += "\
 	-DCOMPILED_LIBSSL_PATH=${libdir} \
 	-DDISABLE_TESTS=1 \
 	-DDISABLE_EDDSA=1 \
+	-DCMAKE_C_FLAGS='${LIBSPDM_CFLAGS}' \
 	"
 
 do_install () {
-- 
2.47.1


