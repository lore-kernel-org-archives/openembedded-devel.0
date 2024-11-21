Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19BDDD75BC4
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 06:25:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.5048.1732170322597723339
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Nov 2024 22:25:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Wg39mtEe;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7246c8b89b4so1260732b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Nov 2024 22:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732170321; x=1732775121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PrbMyW1UNtqSwOwHJTN9B/OWsIHYMuhgcJP3L5BMsTM=;
        b=Wg39mtEeukuuIVEPREMe4ziXQSjw50gYM/e0mMzjhlSmn7Mc+vazQR3Uyuk8RtIh4a
         LZ5ELACM6fI189ZB+Tj5AFBN7jsxkcnv9ZbfH2inOPF7vjayxh7nySCUrZqbRqKxpuMw
         1SB+K5NL9+Zl2+YqQ5dwgyOLi3oCFjU6rOKnpmDrbTmjahGGUAWbgF5e7w5WrjVErI4Y
         VpxZEBbnzkkF+GengNaB0Mr68KZbxunyGlkw17xi28oPsafCvhYUAvsFyXEBeKLA4e95
         kMTA3ffc/M0GmvVISQWBMJ3A2JfkeETV48FFBU9BNLhuUE4TvARE5/YljKyaS5Ga6UBB
         UzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732170321; x=1732775121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PrbMyW1UNtqSwOwHJTN9B/OWsIHYMuhgcJP3L5BMsTM=;
        b=nCTCnlNxxe8JCC4ZXsa7DRe/oH+qkhcnfSIoJ2+XD6bl3UgRCTTJt2yYzu9YWTS47I
         ReMZGcKZzy0WF9ilnML7a02QDr/W5fG1SNwYBs8ANdkyJX1JBsKXJ81JuUbgRMTG6DY/
         +RJU4RUU8nh3V9xyqSepjPiLwCm7AkqDFYPIz7uTToRXiDeGGG0Gnxj0QBxgkdGdm1Jk
         rMUQyYLrLHge+LgtotWLn/ToeTjzQdVljr9/m55zVrARecZZP+lcv5/9/6JNvji/6FZs
         dg4XYw98OD2v5Pzj3sQ72VsXV2x+V7mlbwLuXrfVRpMijk/ZA97eScWQG3STVEllQILs
         aviA==
X-Gm-Message-State: AOJu0Yxnvxv1ZJx9Jg5R9XgzbCjidar1XIT13iVM0W4q1RX+wlV4kHPQ
	CEIqJPQJT1QepHPofz9UgbpWkzMIrj1F+2SS+wUQ45sEMgSBeSxbVZ2vtg==
X-Google-Smtp-Source: AGHT+IFHkWWINbitXqKnL/24pa15HnASwODg4Usl6TyJI5NAASwOgeQbrhW9xXBcSc6vHHKwopPf4w==
X-Received: by 2002:a17:903:1d1:b0:205:8763:6c2d with SMTP id d9443c01a7336-21283c56723mr35192515ad.9.1732170321383;
        Wed, 20 Nov 2024 22:25:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8201:fd20::2c23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-212883fd550sm5814705ad.254.2024.11.20.22.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 22:25:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-black: Add recipe
Date: Wed, 20 Nov 2024 22:25:16 -0800
Message-ID: <20241121062518.3074722-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121062518.3074722-1-raj.khem@gmail.com>
References: <20241121062518.3074722-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Nov 2024 06:25:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113953

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-black_24.10.0.bb           | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-black_24.10.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-black_24.10.0.bb b/meta-python/recipes-devtools/python/python3-black_24.10.0.bb
new file mode 100644
index 0000000000..612a2a5ab3
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-black_24.10.0.bb
@@ -0,0 +1,23 @@
+SUMMARY = "The uncompromising code formatter."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
+                    file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
+                    file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
+
+DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
+SRC_URI[sha256sum] = "846ea64c97afe3bc677b761787993be4991810ecc7a4a937816dd6bddedc4875"
+
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-fancy-pypi-readme-native"
+
+PYPI_PACKAGE = "black"
+
+RDEPENDS:${PN} = "python3-click \
+				  python3-mypy-extensions \
+				  python3-packaging \
+				  python3-pathspec \
+				  python3-platformdirs \
+				  python3-tomli \
+				  python3-typing-extensions \
+				  "

