Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE21CDE001
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 18:08:54 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18268.1782410926449660040
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 11:08:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QFvJGBNh;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139986373b8so252290c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782410926; x=1783015726; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ah6ax17x/G1ufIUjw0J4I9JkZEDiTfuZH3d/399JZSA=;
        b=QFvJGBNhcfBBbllW6CoSBxgW8tFuweY0aSk4V83tNaByAQicyDkUcilsivHzgbuOZZ
         QFRyOBO7KbE8Yj7w2iCNmdWhYHxIgdLopS5p8U6pzki9B8k/Tr/PPewhv7uVc24IVp2g
         6pX1Zxf/w5fBqE+B4SmvUiEMWSUu3c2iS/8eKtzgn7B8Td3E+0+qPKhzWclPxU1CZM8u
         M8pCkYq5YctiiQfJ2S5BRpFY3tOVz2KZNcxRSI4WALsO6itclBd01UfbXnAjHFhZ/lJs
         6j1+It4TqHmUhZFZfzkS2TZFqcVo/ofF1iEjsXcoafdlfsW2v3uenRn6nGfbXn8jcJKN
         pOjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782410926; x=1783015726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ah6ax17x/G1ufIUjw0J4I9JkZEDiTfuZH3d/399JZSA=;
        b=ECTQyOhw9hOvEO66k+KYFgicea8AOZ1hf4HfRQ38Kx1RcNRe5QfWd/Pv9j6S6mV44Z
         xwzpXhOtL6XjcTyVMXm6MWPetCfWR5aAPNHLyFuq7iEb+XR48qJmMEbeAhZ2QZMh4oDI
         qmk5OYrNF6p3FE+c+RT9EBIjLhWPExZTg1wgsa3Z4HXm0ZhhjYtMWpMYqlwzZkfDVxOK
         s93f94jfzzdxi0a43l6D/G2CYTZURv7nEgDQdk55W20IhjoW9PhgjPW71el2FhVa6jMa
         EjB8jkiDdUaizXEOPTRYbjmOe8uIXM5aBlCmu+wLmQ0NNgIiZLJvg2SXJKfIEGsS4NSy
         NJgA==
X-Gm-Message-State: AOJu0YwN1fdlgzRxWHLnfquR2O7dmmPuDQWU/S7CXvK8YVSiBzd2WbjM
	5cquM65wSmSeJujmYBtjB/9d/EG3VzSTnLMYAXHVQtzlu4yTxyouZaoODa/ZaTFFR7Y=
X-Gm-Gg: AfdE7cnn8pSm1zNpbD8rY9g5SrZf0GFzI4Fmk9cFDAKxYCigIWYMx/U65WSfQ8ah2bO
	aGY0mqUQInxnKacSybMfC0prRXwDRDf8rlbjrsyuKIFOl+lI+DWAg6IpgavaQjj0NL9A5Wk8U6e
	CcdA4FwrF1p1AYWz6dD4jAA1dMrLHzibbKZJNWKHa42WDNjF66ZR6C+5VFTk52V3p8/VAptyFNI
	VnOs9Dyc7YTQzcYSfhf31zGO0K8ue0slIy7uRL8fdHmQdmZyqXishWg1pbkEGwtRDJTz8N6WFVP
	RL7+JrbOFwcm0iofj/W32+FgvN4kIGH5FPEcDN5Nd1xPNSNTNMIHUAbd5KR5VfEhEeFO6SNbFPR
	lgOFoso0bWvVcJ9hyDo8vLEgJAubiKw1MgW45jApgvtLXD/w34ry3P+4v29BczeKr2QNBRvK8LH
	oAlHsiSqwSUQCZ2jW/hKvFFzNH+GH/gWfjFkbuC7PbHe++JOdPxjvuHHXBbbN1YJBDhC9uQt+87
	dFNXAKzzlEqMibVFXaBWrBdGW/MGRmoTLiJSuHbPNWQTW5perPXMvUfTOmuMyNDhBa46VaZ/r8d
	rn6t81h+xc4eixXx2XNay3tLTkmumw==
X-Received: by 2002:a05:7022:3d0f:b0:132:f16:a574 with SMTP id a92af1059eb24-139dbb1868amr3173904c88.7.1782410925610;
        Thu, 25 Jun 2026 11:08:45 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d8f5fc82sm9799620c88.5.2026.06.25.11.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 11:08:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 2/3] crash: drop unnecessary git scaffolding from do_compile
Date: Thu, 25 Jun 2026 11:08:38 -0700
Message-ID: <20260625180841.2638737-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625180841.2638737-1-khem.raj@oss.qualcomm.com>
References: <20260625180841.2638737-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 18:08:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127783

The do_compile:prepend ran "git init && git add . && git commit" inside the
staged gdb-16.2 tree. crash's build does not use git at all - the bundled gdb
is unpacked from a release tarball and merged with plain "patch -p0" - so this
served no purpose and only made the build depend on a working git identity.

In any environment where committer identity is unset, or where commit signing
is enabled globally (commit.gpgsign=true), do_compile fails with:

    error: gpg failed to sign the data
    fatal: failed to write commit object

Drop the git scaffolding entirely; the gdb patch still applies with patch(1).

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-kernel/crash/crash.inc | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/meta-oe/recipes-kernel/crash/crash.inc b/meta-oe/recipes-kernel/crash/crash.inc
index 4e889f7677..e7b3b9cf13 100644
--- a/meta-oe/recipes-kernel/crash/crash.inc
+++ b/meta-oe/recipes-kernel/crash/crash.inc
@@ -90,13 +90,6 @@ do_compile:prepend() {
     # 2. Copy the official clean GNU tarball source footprint into the active workspace mapping
     cp -rf ${UNPACKDIR}/gdb/gdb-16.2 ${B}/gdb-16.2

-    # 3. Initialize the localized tracking repository required by the crash build architecture
-    cd ${B}/gdb-16.2/
-    git init
-    git add .
-    git commit -m "initial commit"
-    cd ${B}
-
     bbnote "Writing dynamic target layout architecture context: ${ARCH_UPPER}"
     echo "${ARCH_UPPER}" > ${B}/gdb-16.2/crash.target

@@ -110,10 +103,6 @@ do_compile:prepend() {
     cd ${B}
     bbnote "Applying the native upstream crash integration patch onto the GDB source tree..."
     patch -p0 --fuzz=3 < gdb-16.2.patch
-    cd ${B}/gdb-16.2/
-    git add .
-    git commit -m "after upstream crash gdb-16.2.patch"
-    cd ${B}
 }

 do_compile() {

