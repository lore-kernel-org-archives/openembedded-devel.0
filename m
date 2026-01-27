Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86B5ED2F018
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 13:01:29 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10484.1769518883595613947
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jan 2026 05:01:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kUEHSc/k;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42fed090e5fso3448608f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 05:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769518882; x=1770123682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlutXmArAiXLrl8PvE4S6IakkhDmugnQhl4ml8IaP98=;
        b=kUEHSc/kIqWAwzP41ApkuHxi+dPJFnwtzd9QkGnCZIxmOc2l4usqyefv6y2Ea31xd3
         p66tSgW8l6GA8et37OTUlPSY5TImV9N3V4/so2D719wK/YivXGr4lCaAdwPkrkBEGz4t
         mKpjXbgtATjElr/eLlxYdpcmvZoA5uSXHT9gsxeg3FKwnvGiqAcucuEYVNTTwxHgI2mZ
         DPTAiQb2F2OHGP+6LTPh5k5AMPDvS8zIhEZxsTk5yKa3BC07+0SmwDKjyGAqsRTvewnM
         8hoXZJg3liOJ9vzaPhkMuqb8uNrPj9Sky5t0J1V8XRjfiBvi0lxVnsGQ6bXhx5W2fh+I
         tg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769518882; x=1770123682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZlutXmArAiXLrl8PvE4S6IakkhDmugnQhl4ml8IaP98=;
        b=aiuW4g/uuIUAYe2jN7c0pPi2buekPrD3yd1rmTpGctoh6CDJHauS/R+/HyCdfCJue/
         BWmFSBEZID2qXkvbMlVNXSgpWri+Rl6uLu7NPiVx17S5GvEtc2+mc3UgZlpclXWLIRK1
         YMSv4VcOycRldoaYqBKvC5WYFjerUFgN6f04wO1jlecHQ1gt0oHKUPHcpYY26UNkuXPQ
         LZBwY+cKRST2+o+ilHTOJ9u18TWGB2dgBVPgpxI+0qoFvUJ1YanysJRI4zGRdtV8Mes7
         QWKAxhWQEGmTCZUaP1BODKsyHJhZgB+cHttlHKGvklis+L302c0VPx2fRtRWbipzdZI4
         vR3A==
X-Gm-Message-State: AOJu0YxMfcfCWrd/mqcwU0pQZ1S0dkqBufzTN47YiYTDVjlYfLxW5fV0
	KtXjgwhx5Z2PuuJhg4oSbz96+Ph+DeBnVRr+wDzyE+f1dSzSoWQB5SqJx1SSVg==
X-Gm-Gg: AZuq6aL88tFupYCvJicoWgsokIXQxhc0bmUbRBk3VV0GONZoxRvyZuECI0BYcJndvSm
	4sjW2xdbNYUrjqsH+j1hTEHXKOzaV0np3ADUFD4nySbKKoj1KUpRFIJk9FelZx5SZflOQonySgu
	8RAEaBJBmjo1w3fnphbqyscqN0DhvqG8wNIP9SMZl4U6YpZxogLETpjYA6YXAh7e/XkVcsGTJS6
	wZG2wdVFeJIsPP8poSFhrhuH1LByM1NS7qp4YLwUJZSv1ImpTVy+yGuRPjh9j+W42y69wdUPNyN
	EgUuvIjWIBHlO9AC1gMEpJj1a86myBRCXFq9cg4LTF/at50dUGNDssHQAHj3i0qHhEXY5dPsDs4
	gVa1ZrpXqPTxW2UDDGzzwnrvranlUs2aRoML4ylW/NmsTr3nfL6fb+Q9XTE+NWbJpEfTP2Qbem/
	PFrSEi7D8p
X-Received: by 2002:a05:6000:230c:b0:435:9770:9eb6 with SMTP id ffacd0b85a97d-435dd1b9764mr2653330f8f.53.1769518881783;
        Tue, 27 Jan 2026 05:01:21 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24a8asm37671577f8f.12.2026.01.27.05.01.21
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 05:01:21 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][RFC PATCH 04/14] tigervnc: patch CVE-2023-6478
Date: Tue, 27 Jan 2026 14:01:04 +0100
Message-ID: <20260127130116.1902238-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127130116.1902238-1-skandigraun@gmail.com>
References: <20260127130116.1902238-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jan 2026 13:01:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123944

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-6478

Pick the backported version of the commit referenced by the NVD report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../tigervnc/files/CVE-2023-6478.patch        | 65 +++++++++++++++++++
 .../tigervnc/tigervnc_1.11.0.bb               |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6478.patch

diff --git a/meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6478.patch b/meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6478.patch
new file mode 100644
index 0000000000..765e83e196
--- /dev/null
+++ b/meta-oe/recipes-graphics/tigervnc/files/CVE-2023-6478.patch
@@ -0,0 +1,65 @@
+From a0952cc293c0fbda15e7519b1af9c1c2d3d9475f Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 27 Nov 2023 16:27:49 +1000
+Subject: [PATCH] randr: avoid integer truncation in length check of
+ ProcRRChange*Property
+
+From: Peter Hutterer <peter.hutterer@who-t.net>
+
+Affected are ProcRRChangeProviderProperty and ProcRRChangeOutputProperty.
+See also xserver@8f454b79 where this same bug was fixed for the core
+protocol and XI.
+
+This fixes an OOB read and the resulting information disclosure.
+
+Length calculation for the request was clipped to a 32-bit integer. With
+the correct stuff->nUnits value the expected request size was
+truncated, passing the REQUEST_FIXED_SIZE check.
+
+The server then proceeded with reading at least stuff->num_items bytes
+(depending on stuff->format) from the request and stuffing whatever it
+finds into the property. In the process it would also allocate at least
+stuff->nUnits bytes, i.e. 4GB.
+
+CVE-2023-6478, ZDI-CAN-22561
+
+This vulnerability was discovered by:
+Jan-Niklas Sohn working with Trend Micro Zero Day Initiative
+
+(cherry picked from commit 14f480010a93ff962fef66a16412fafff81ad632)
+(cherry picked from commit 58e83c683950ac9e253ab05dd7a13a8368b70a3c)
+
+CVE: CVE-2023-6478
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/xserver/-/commit/58e83c683950ac9e253ab05dd7a13a8368b70a3c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ randr/rrproperty.c         | 2 +-
+ randr/rrproviderproperty.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/randr/rrproperty.c b/randr/rrproperty.c
+index c2fb9585c..1fb89e67e 100644
+--- a/randr/rrproperty.c
++++ b/randr/rrproperty.c
+@@ -530,7 +530,7 @@ ProcRRChangeOutputProperty(ClientPtr client)
+     char format, mode;
+     unsigned long len;
+     int sizeInBytes;
+-    int totalSize;
++    uint64_t totalSize;
+     int err;
+ 
+     REQUEST_AT_LEAST_SIZE(xRRChangeOutputPropertyReq);
+diff --git a/randr/rrproviderproperty.c b/randr/rrproviderproperty.c
+index b79c17f9b..90c5a9a93 100644
+--- a/randr/rrproviderproperty.c
++++ b/randr/rrproviderproperty.c
+@@ -498,7 +498,7 @@ ProcRRChangeProviderProperty(ClientPtr client)
+     char format, mode;
+     unsigned long len;
+     int sizeInBytes;
+-    int totalSize;
++    uint64_t totalSize;
+     int err;
+ 
+     REQUEST_AT_LEAST_SIZE(xRRChangeProviderPropertyReq);
diff --git a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
index 7af347d858..a8eb397ba8 100644
--- a/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
+++ b/meta-oe/recipes-graphics/tigervnc/tigervnc_1.11.0.bb
@@ -22,6 +22,7 @@ SRC_URI = "git://github.com/TigerVNC/tigervnc.git;branch=1.11-branch;protocol=ht
            file://0003-add-missing-dynamic-library-to-FLTK_LIBRARIES.patch \
            file://0004-tigervnc-add-fPIC-option-to-COMPILE_FLAGS.patch \
            file://CVE-2023-6377.patch;patchdir=${XORG_S} \
+           file://CVE-2023-6478.patch;patchdir=${XORG_S} \
 "
 
 # Keep sync with xorg-server in oe-core

