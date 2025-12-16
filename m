Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6322D637A3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 19:40:19 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2663.1765914009742471998
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 11:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hGrF0SMw;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47796a837c7so36517955e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 11:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765914008; x=1766518808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Hs7Yh8vZ3QehZh0tMOr2mFMhwiqJlB5jHI8X/QQTos=;
        b=hGrF0SMwRRy/4LnBe75xBrOef8Q0HNv+4blPTZVfd3byiaDlcv1JEqmTFKW9zI5bhC
         0O0t7OHpkkjtjT1/Htus1eCkzlp4ogJEiaTIcbQKMuVs6LypqC+I4XzKoJdjCrwufltp
         yHN9F8wal61o4Ete2VA/Yzd1jFrt5EK/ePWXTAXgv+ZwL7Zt/buMmL5ZOhFlX08vF71X
         Ea28nsCjegRFvnWbK5qis/JiWSueFl7vzFVKo7TEz4+Pbh3aA0jbh4jqFDwoMkYayKHO
         zUJAcAiQImlxLSNuuDTzr6r+isIcaoir0I9rwKvgbgNtajqbeCLPkzH1k9cP8wOfQgZ1
         Edxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765914008; x=1766518808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Hs7Yh8vZ3QehZh0tMOr2mFMhwiqJlB5jHI8X/QQTos=;
        b=r0tWLIfkCOFFssD+0fz/A4KHEfN+kyAlnT+YMm7IUwyvQKauf+5hExUgc4L/4SxC64
         RNEWpvZo0AfnMB+HVy03oAFuORpmrAs3gWjsN4L0YAap9DdX0sWP7NGHXtIbss8APS4J
         KIlgOxq+amT6iUguK7y9xUL57mNSvh5gEi2tNoVsqscAg878XWVv0nulF48M1pPxcFCA
         8gOHHzQNds7QCYMKQd4uOck6u1hsgkizXN8hKuvE3nDDKXlr6SPjzmWwHM+2bbq67hpH
         YyP56wbeweP5554mk8cgB9OzPJHkDw4gNGvsD4507tSNkEYDqGzGIbhU8KUjQGdj7f9J
         pMiw==
X-Gm-Message-State: AOJu0YyJ99FZ/EdexHrQydsP3ZDXf+Rwt04eYjS9k/gGSxZ72PbFZ/zq
	CHmy8AWdf6ne2CTrIVMLp8UhIl0r9/nFy0yZNxAI6aJGizgM/x2648r4UGtMRA==
X-Gm-Gg: AY/fxX5wTjExyoo7RP2fCa51daJEuH2faqcjL3h3hgvo9jnyMF+9LFwzu++aVwcuVOY
	k+wn3DnwqA3vHfrcHCvcsyJCp+arNM0/XVUL6UQAUG0pPM+6/tnpsbKRFVCEPaiZOcHC+KPK14S
	05p7D41jQLcN2iDL3z4DAtixZ68AxgwkG+qqe3n0+E8hLflXlcl5b0H1CTuriGGFj7S00XIofKe
	tqm15tYn27N5mDjI/bxCz93kEDnxFZlznhP6F/OEetn2PrtEletJMFrES5wvQV1cpoFpO7lzMnT
	W/CcD0fjcVdt2u82p5L0L3iIMJ9fvBxk0qXiFQAox9s9etJCHaL6MPaUF1RaGy3aJKS+7toKHkZ
	O2gfViOQHTyra53yuXcdLFv27S5//kpqxwA8DIu8grBiQkOeGdmn/YQBA2pxCvCENdbIr10N+w6
	MephmGMrEg
X-Google-Smtp-Source: AGHT+IGGIcmYd2OA+u3Nv6RxYGr6TuygdInF73+UAHCwx0Wu1DmSEjrdSiU6zvA0pzXPHarAwVAIRw==
X-Received: by 2002:a05:600c:1d2a:b0:477:9a28:b09a with SMTP id 5b1f17b1804b1-47a8f7039c3mr167157925e9.0.1765914007963;
        Tue, 16 Dec 2025 11:40:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47bdc1defb4sm4741395e9.9.2025.12.16.11.40.07
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 11:40:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 3/4] openh264: patch CVE-2025-27091
Date: Tue, 16 Dec 2025 20:40:04 +0100
Message-ID: <20251216194005.3006575-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251216194005.3006575-1-skandigraun@gmail.com>
References: <20251216194005.3006575-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 19:40:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122709

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-27091

The advisory confirms that the bug was fixed in v2.6.0.
When looking at the relevant Github advisory[1], it mentions
the name of the implementer. Pick the patch that was included
in this release, created by the mentioned Github account and
isn't only a cosmetic or build-system change.

[1]: https://github.com/cisco/openh264/security/advisories/GHSA-m99q-5j7x-7m9x

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../openh264/openh264/CVE-2025-27091.patch    | 27 +++++++++++++++++++
 .../openh264/openh264_2.1.1.bb                |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
new file mode 100644
index 0000000000..5a3c900e38
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264/CVE-2025-27091.patch
@@ -0,0 +1,27 @@
+From 4e82ae10b594d87da2a7884c2de850857931c78f Mon Sep 17 00:00:00 2001
+From: BenzhengZhang <140143892+BenzhengZhang@users.noreply.github.com>
+Date: Thu, 19 Dec 2024 17:12:42 +0800
+Subject: [PATCH] Potential bug fix (#3818)
+
+CVE: CVE-2025-27091
+Upstream-Status: Backport [https://github.com/cisco/openh264/commit/63db555e30986e3a5f07871368dc90ae78c27449]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ codec/decoder/core/src/decoder.cpp | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/codec/decoder/core/src/decoder.cpp b/codec/decoder/core/src/decoder.cpp
+index 3b38032a..b971f12f 100644
+--- a/codec/decoder/core/src/decoder.cpp
++++ b/codec/decoder/core/src/decoder.cpp
+@@ -844,6 +844,10 @@ int32_t WelsDecodeBs (PWelsDecoderContext pCtx, const uint8_t* kpBsBuf, const in
+             return pCtx->iErrorCode;
+           }
+ 
++          if (pCtx->iErrorCode != ERR_NONE && !(pCtx->iErrorCode & dsDataErrorConcealed)) {
++              return pCtx->iErrorCode;
++          }
++
+           pDstNal += (iDstIdx + 4); //init, increase 4 reserved zero bytes, used to store the next NAL
+           if ((iSrcLength - iSrcConsumed + 4) > (pRawData->pEnd - pDstNal)) {
+             pDstNal = pRawData->pCurPos = pRawData->pHead;
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
index aababb6684..113dbf1bba 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.1.bb
@@ -15,6 +15,7 @@ SRCREV = "50a1fcf70fafe962c526749991cb4646406933ba"
 BRANCH = "openh264v2.1.1"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
            file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
+           file://CVE-2025-27091.patch \
            "
 
 COMPATIBLE_MACHINE:armv7a = "(.*)"

