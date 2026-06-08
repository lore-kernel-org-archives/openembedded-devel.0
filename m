Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E042ACD8CA7
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 23:39:14 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.68191.1780961944982051636
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jun 2026 16:39:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Ug4twuiM;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30749947917so2418865eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 16:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780961944; x=1781566744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6KpGKVyC8BoOgggmvz/aF6BW2LK+I+xLJ9dp3U7gDc=;
        b=Ug4twuiMytEE/d+qq2UFzwqqzEm9+vypyL883ytltH2EJJS+/PAiWkv54TXqiay3Y+
         4UDflYcQ8uPfxuNkKFVUkfMIzOgvHdZfVJy0UbZxo+fPxEB2joMOmMfUcbyTnC++eg62
         9pYYH+jctJDjmzwcqUXR42GifkaUZ5KHXBpChQGzVX1oRmCKBNMoLGSEUnvU25feFGxd
         RYKSwXtYr0I/PL1qeL02IgaTRcM/DVTcqfecILsu+vH5bP31E/2BwYp9G17DTXX4QV3s
         mHRgTLeIB7P1Z8ANSrC5L5imi8YA/mBRM2/EkuDFIOkZN78h3FDlPgT6rsM+sbZFvqXw
         70zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780961944; x=1781566744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j6KpGKVyC8BoOgggmvz/aF6BW2LK+I+xLJ9dp3U7gDc=;
        b=AxZSLHUCPD8ia7MZs/VcSng/8ejpMFC8QfLkXgWTMk73cwUCVFeV24tsJWUHnELwVx
         1DobaTivwUk5FF8Ximd3MtjKIQoaeE2L5KQ3S8q56AuU+uk3JkU/VqrBdxo+d9pdAGwE
         4rm0SlxqVvxdKLVkH/GER023izD2lJnDc2kqwRQlq5/c3+2EPwpY7uKYT2i06/OH5vgc
         MKkdLVQojXCNIIawaa6cNn1fzDYbrwcACbl7WflXvgrLE1/X10+emSGIEzriVVUZpldE
         xLKEhYrKbIGTtVWbHYrDCyL5KnnCRcxqtpyaGhDzDeF4aDImR347Yo8O/WcLOeD09gHr
         cqTg==
X-Gm-Message-State: AOJu0YwLQcLbWOzub8h8GDpAVCgyf5Mhp8DMHu2RVTzZZstoz8Pr9G98
	GBaizXBFXYk9v944+jYH/VSc6W8pTYAxoFaebJD77+3tYNmpxAWE7Iv3fNSPDggwlgBfzA==
X-Gm-Gg: Acq92OGJxp0J7rjNs5fCCSbUG6rrr2FIIMpJ2ve7SJ7MleoOCf9hc3gGb/LohRzZMpZ
	DNFJ2XaJF5SCzwJY9mvRlbl1WgY52R3UxDa2EaFJJZWlkt8AbXU2ZiH+TLPMMa1F2yQrXqYlV/Z
	Tp6k8VQWXLCJ39Z0K/6/fsTTp73XUFT8UyCjKSQ+fdqBQo1fcYuJQMmYxLc1x/cee9dkrFItmZ9
	FRW/aNhR7FDXogu9R+VSVw1DOhHZ9W2TS6SI+ohSEXXJlkcAOffRnkK8aH8G7zBRRt8bE7/5x+M
	GalyfrZpYdYYD7gVBVQxqNxU8BaDmmtQXqXwBBK3Bi3/rqgbRIJF2n6LAVQQOE9qLVZsEc2j+a+
	tgaXCZxUEbN77cFHTkiLpRdmBYI3/PmN+Zf9YNtYCQmkqcPQaqXp6tuKdxd3QxuXOQNeuF1yk1n
	4X7KIvSOMLVWspJRs/huP0Ig+kN91/Qp5gJHy1ISXa9q6SY/8qYLfOJ11wVWFkHeiUo1FkzTHmd
	e96SJcndvzDJVjkBdL/s+cNemLd3kSC0LuW5SYsyKtZ2moC2VMvWsR/PRACHU+H3RCzBpAcGPww
	US7wRUtlPVnUWFmMiYEY5J1ODRDKyAin+3uCGIW4ll2w7KAZjfM=
X-Received: by 2002:a05:693c:65ce:b0:307:91f9:c1c1 with SMTP id 5a478bee46e88-30791f9d7c5mr4072491eec.25.1780961944205;
        Mon, 08 Jun 2026 16:39:04 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df64eb9sm16941395eec.25.2026.06.08.16.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 16:39:03 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 2/3] python3-pytest-cache: remove dead recipe
Date: Mon,  8 Jun 2026 16:38:59 -0700
Message-ID: <20260608233900.2568363-2-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608233900.2568363-1-khem.raj@oss.qualcomm.com>
References: <20260608233900.2568363-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jun 2026 23:39:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127427

pytest-cache has been unmaintained since its last release in 2013 and
its functionality was long ago merged into pytest core. Drop the recipe
along with its packagegroup-meta-python entry and the now-redundant ptest
dependency in python3-fastjsonschema.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../packagegroups/packagegroup-meta-python.bb     |  1 -
 .../python/python3-fastjsonschema_2.21.1.bb       |  1 -
 .../python/python3-pytest-cache_1.0.bb            | 15 ---------------
 3 files changed, 17 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb

diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
index 1741d3c7fb..b129e62d16 100644
--- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
+++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
@@ -343,7 +343,6 @@ RDEPENDS:packagegroup-meta-python3 = "\
     ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "python3-pystemd", "", d)} \
     python3-pytest-asyncio \
     python3-pytest-benchmark \
-    python3-pytest-cache \
     python3-pytest-forked \
     python3-pytest-helpers-namespace \
     python3-pytest-html \
diff --git a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
index 11fc6de8d6..4d8cf7a56b 100644
--- a/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-fastjsonschema_2.21.1.bb
@@ -17,7 +17,6 @@ RDEPENDS:${PN}-ptest += "\
     python3-misc \
     python3-pylint \
     python3-pytest-benchmark \
-    python3-pytest-cache \
     python3-statistics \
 "
 RDEPENDS:${PN} += "\
diff --git a/meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb
deleted file mode 100644
index 5338ffdd29..0000000000
--- a/meta-python/recipes-devtools/python/python3-pytest-cache_1.0.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-# Copyright (C) 2021 Khem Raj <raj.khem@gmail.com>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "pytest plugin with mechanisms for caching across test runs"
-HOMEPAGE = "http://bitbucket.org/hpk42/pytest-cache/"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=a6bb0320b04a0a503f12f69fea479de9"
-
-SRC_URI[sha256sum] = "be7468edd4d3d83f1e844959fd6e3fd28e77a481440a7118d430130ea31b07a9"
-
-inherit pypi setuptools3
-
-RDEPENDS:${PN} += "python3-core python3-execnet python3-pprint python3-py python3-pytest"
-
-BBCLASSEXTEND = "native nativesdk"

