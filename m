Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C7ECCD18E
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 12:59:47 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web10.7551.1759409978998108487
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Oct 2025 05:59:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SRYB6t8H;
 spf=pass (domain: gmail.com, ip: 209.85.218.50, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b40f11a1027so190843966b.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 05:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759409977; x=1760014777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=djUglwClFpxCwZjm/4OZ+U4V23H7sy8vLy2dj+AkPKY=;
        b=SRYB6t8H9vN9NpKUvSv+89eT54Z9jqbZggu0MVREP5nV7U9Zg7bHMlhk9beA6rBSg1
         KfJ0jPjWhvhPAIYJt3Z+qzoC3QBnOAOxNcDS6m0kJBAxJOynw3nyUeNoX9xncJNB27f+
         lWP3f25jJJaQj0JL5cSo12ZXoNxQCEJL1UsuuCBmDUQ9tGSKj7+bXGaAflzQl5lT7IA/
         /ZrmOwtwaA22lWLl3iwTL74DhrJASCeJtmOXG6Z2ANvk+qbpn8KHnIakkra8GVc2uU/f
         rwAXkAXeMKNUylc6RbK9JIK2PdmtLD73JRn2hSLfAgC/T1a2Q0PHGHMLMhiKXEpBUHGl
         Z8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759409977; x=1760014777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=djUglwClFpxCwZjm/4OZ+U4V23H7sy8vLy2dj+AkPKY=;
        b=chPjK2ygcsuv47WjoqdLEKiTRiZUeYGBA1ilvtv2fHJavVZzFvKgMHKh1wFrywtI5m
         rU08mQbv4F9CF8sissCKO59f4r+K2Fw7Y+657ZKx6EFwwj6E8Rl2Q7yLMim7lqI1mH1H
         a5oMYxElkGIprw6VVJj/EwsAPeLASfIdrB3RC26cwXm7XzsWkPFZ0moYpVWMxR2RSWHl
         JUSTIHVH9+r0T/FFzeL3v2WuEzO8MuvlqaTNOJtFdJWkhGmXPV1dQjx7EabHxocaQs2p
         5zB20GPbRDgqGAealXEjCTbHGPJKPRXLLxtEabnimTid4eiqSW6O/4YtszmIgbfwz32g
         dzbw==
X-Gm-Message-State: AOJu0Yx90ZG3YKs9Fy+HGChMxE8e4Y8FpXVbLRYWozZqYlZtNWy3TN5F
	1GzD6uOeUuO8Ms6mQW5Ut4poeMr4fOGzb+PYDYYLgCvUIbGAfqFJmKhLIKs09Q==
X-Gm-Gg: ASbGncsp/+FEPeou0ZBWxwJXB3XLVud9ckWxBYrCmOKJi+S+nIUBPXRqBLYpmvK6KCK
	7O4Bl5WgDiQ8tkOnKI0LnaIDsiYZ1D91GRCs5w2J4eet49kkSCACA0CnithNSZ6PWyuvrXMrQqc
	lJ35vWcofBHlxWxwHqdTfynyE7/nyPo5p1nD1gn5Rqxtrj6BubGK9O3NOzjZ1Km2QRpo01Ov3i1
	v+wK7fX3ujhkN83IlVB+H+YUA3gN7lcGi4NT4a1zX1Cso37QefK/kYxs0XMnB5rL2qFHlWHmmsj
	SHmkAnwMb3CeXNOyGrlc+L6cM+s1q7Rg3g5CdPfz6Yg+GxINXR3JTkocn2MAPgQlT3X7jOH8/1K
	GZAJxE4SjJwUOIU5+ARJnYPF3zQ6+pNtH7vVXHhwxI82v
X-Google-Smtp-Source: AGHT+IER3Yp30rLsz5pDSlV2D+WibG/LF0/+wCysG4Hx3syUVo7jfibgFRF7e7EOlDaECDDb1Df2Tg==
X-Received: by 2002:a17:907:7ba1:b0:b3c:4ebc:85dc with SMTP id a640c23a62f3a-b46e4b8f008mr943519466b.11.1759409977248;
        Thu, 02 Oct 2025 05:59:37 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b03sm194127166b.84.2025.10.02.05.59.36
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 05:59:36 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 13/26] synergy: patch CVE-2020-15117
Date: Thu,  2 Oct 2025 14:59:13 +0200
Message-ID: <20251002125926.2624522-14-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251002125926.2624522-1-skandigraun@gmail.com>
References: <20251002125926.2624522-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Oct 2025 12:59:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120182

From: Peter Marko <peter.marko@siemens.com>

Pick commit based on [1].

Note that the pick is node from deskflow, which is open-source successor
of synergy.
If anyone uses thie recipe, it should be switched.

[1] https://github.com/deskflow/deskflow/security/advisories/GHSA-chfm-333q-gfpp

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit db283053d096cf77df8e4444ce91e5d882f8850c)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../synergy/synergy/CVE-2020-15117.patch      | 48 +++++++++++++++++++
 .../recipes-support/synergy/synergy_git.bb    |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch

diff --git a/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch b/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
new file mode 100644
index 0000000000..4ad2a45275
--- /dev/null
+++ b/meta-oe/recipes-support/synergy/synergy/CVE-2020-15117.patch
@@ -0,0 +1,48 @@
+From 79efdb7c617b809e1a2daf17441d7a30f7046aa5 Mon Sep 17 00:00:00 2001
+From: Jnewbon <48688400+Jnewbon@users.noreply.github.com>
+Date: Tue, 14 Jul 2020 13:14:40 +0100
+Subject: [PATCH] Merge pull request from GHSA-chfm-333q-gfpp
+
+Attempts to fis DoS to servers with less then 4GB memory
+
+CVE: CVE-2020-15117
+Upstream-Status: Backport [https://github.com/deskflow/deskflow/commit/0a97c2be0da2d0df25cb86dfd642429e7a8bea39]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/lib/synergy/ProtocolUtil.cpp | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/lib/synergy/ProtocolUtil.cpp b/src/lib/synergy/ProtocolUtil.cpp
+index d9f5dc324..7d2c37ff8 100644
+--- a/src/lib/synergy/ProtocolUtil.cpp
++++ b/src/lib/synergy/ProtocolUtil.cpp
+@@ -61,6 +61,9 @@ ProtocolUtil::readf(synergy::IStream* stream, const char* fmt, ...)
+     catch (XIO&) {
+         result = false;
+     }
++    catch (std::bad_alloc & exception) {
++        result = false;
++    }
+     va_end(args);
+     return result;
+ }
+@@ -216,7 +219,15 @@ ProtocolUtil::vreadf(synergy::IStream* stream, const char* fmt, va_list args)
+                 // allocate a buffer to read the data
+                 UInt8* sBuffer = buffer;
+                 if (!useFixed) {
+-                    sBuffer = new UInt8[len];
++                    try{
++                        sBuffer = new UInt8[len];
++                    }
++                    catch (std::bad_alloc & exception) {
++                        // Added try catch due to GHSA-chfm-333q-gfpp
++                        LOG((CLOG_ERR "ALLOC: Unable to allocate memory %d bytes", len));
++                        LOG((CLOG_DEBUG "bad_alloc detected: Do you have enough free memory?"));
++                        throw exception;
++                    }
+                 }
+ 
+                 // read the data
+-- 
+2.30.2
+
diff --git a/meta-oe/recipes-support/synergy/synergy_git.bb b/meta-oe/recipes-support/synergy/synergy_git.bb
index f2e7a91618..97891a6c86 100644
--- a/meta-oe/recipes-support/synergy/synergy_git.bb
+++ b/meta-oe/recipes-support/synergy/synergy_git.bb
@@ -10,6 +10,7 @@ DEPENDS = "virtual/libx11 libxtst libxinerama curl openssl"
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "git://github.com/symless/synergy-core;protocol=https;nobranch=1"
+SRC_URI += "file://CVE-2020-15117.patch"
 
 # Version 1.10.1-stable
 SRCREV ?= "1b4c076127687aceac931d269e898beaac1cad9f"

