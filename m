Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B11DC43458
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:38 +0000 (UTC)
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75152.1782663757510307185
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XUKPJVlM;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c965eab27so4340794eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663757; x=1783268557; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uGrGrJD+MCQaan2deoqHoUT7qVhfzfIo4kLv2dx3AGM=;
        b=XUKPJVlMoftnRo+1ZWjalMnLfO54I9I+iblsSciq1yt6RSsXmrxGZUxejWY/yTTYBR
         Cuj/48nRSftOGJtu0cmzIxEYvUM5ugUZFJrT1mS0xvFDBaFUuMdTNQsUg5xHLlXL4Uuy
         D0sPlq6mJd0hmEk2kwvPFRvFv84JZzeFF4KgpYy6ouwQLh5sEYgLayin2GryQQql1TDp
         eLObLUvMK9ABF4zQ6MedVVzffI/EB0bJPiVTKYz5zKMdvFBTYkcK1MWasv/tzHf1zSrh
         sqDixzytEENf9QDiRGYMhHUqqq+9aqhuUeVPabyOQr+7+gUxZXuRSr8Oui3R6np5TCMl
         5hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663757; x=1783268557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uGrGrJD+MCQaan2deoqHoUT7qVhfzfIo4kLv2dx3AGM=;
        b=tLszaWKCynRu4TPpTKyL77xoRgKFsUZvHrLwAvvvQrnOC418HP3CnNc1ytKnCx0RyV
         A+UKs182dQN1HOkNxNgumeen0lJonl4ITj1a+oCqdGapxT4rGrMAsITcXiBId1LzSZgO
         X6pkG6FSxEiKCcb4IZLRB7MAvaZ+1UDDhpIEAR2lrS6wKFxIhXTAuWHgKxeXtViYFWeE
         fzOnesbagGrzEtZq8cT6NtDV9+ilhJXzEbiYwOs18DzbLQU1t9DbvAwFICE7yArrdObt
         tQHoTBKrup5kzAeNA9o21j7EHd1764vokIAPdPsQMaQ5eH2WbAxhaM7rvgZqWXMe6Xjn
         P6AQ==
X-Gm-Message-State: AOJu0Yzf4UbE08LvmJLgiXdakkjwCtVnw780/ahllrL9tDhrPJEyUhDN
	nEYYLP9COWy5VV9m35DLpyWxmZ4YS/oI0fWW6xXbdf9jKWUgotp5E44qRerBYE3mjHWQIA==
X-Gm-Gg: AfdE7cmNeiXA69D232pdV5kiFET6xqir0nM4FCXS5etKpwTagXrd/ZaPg60wwsH/ASo
	+egQLLEbUJUqg7o4Xr3AJvl8Noowmck5E/2Fwgfq9bmlu3Zr69rvAmRklIczYnKdKeMbI/jyfuS
	plNB5WwkV9f10ux/cJszPvp+bmAYAfQvkYy7jGADKtq1Sz7FpucSczERml9TRXWjgNIki6SspPx
	TFhpqt3MWUXNgQWsgbbMGD0yNZoAISZNYvs2xEnjNnwFbB6EDa2Bao4MHFeHYvywI9F/rzYBHN0
	qMD/Ao1lygAB1QPNlf4ZBUqvRq9tEH08C94tCh3gYzRQOw07wdrgas15cTpA2mHlvQIgpX5S1Vk
	bB8AVd+WNWy5piZemxSaBSXK70/WM4Jk6If0QeJTI/DcGD2/lEYysthbFLYhIm9upUgJeDAcUZe
	mLRZBGwRpgVXT2hYhY0ODYgKl9Gumq/xrHU/cuzsrly79h92+YhzMKEqtyhO4KMoIoE4de9nc1S
	taL8JWYKqy+xFu0FQ+7OdPSas7He9BuGFk4M2wB1YC9epINwH6343bm0rUL2bsr4s5S9R53an7l
	90lvKW8PV4VDs0mAbN54A7bQ9x2Po9gGUeOX/sP6
X-Received: by 2002:a05:7300:b10b:b0:30c:ab4f:46c0 with SMTP id 5a478bee46e88-30cab4f49camr6167742eec.38.1782663756730;
        Sun, 28 Jun 2026 09:22:36 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:36 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 111/128] python3-croniter: refresh trove-classifiers patch
Date: Sun, 28 Jun 2026 09:22:05 -0700
Message-ID: <20260628162222.4081517-11-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127921

Regenerate 0001-Allow-using-newer-versions-of-trove-classifiers so it
applies to 6.2.2.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...r-versions-of-trove-classifiers-and-.patch | 33 ++++++++++++++-----
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
index a20075a76f..4ce2404683 100644
--- a/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
+++ b/meta-python/recipes-devtools/python/python3-croniter/0001-Allow-using-newer-versions-of-trove-classifiers-and-.patch
@@ -1,28 +1,43 @@
 From 297d149636d063a82b33d95ab59928a88db51e4e Mon Sep 17 00:00:00 2001
 From: Khem Raj <khem.raj@oss.qualcomm.com>
 Date: Thu, 14 May 2026 11:44:44 -0700
-Subject: [PATCH] Allow using newer versions of trove-classifiers and pathspec
+Subject: [PATCH] Allow using newer versions of build dependencies
+
+The pyproject.toml pins exact (==) versions of all build-system
+requirements. When building with --no-isolation (as OE does), pip uses
+the build dependencies already present in the sysroot, which are newer
+than the pinned versions, e.g.:
+
+  ERROR Missing dependencies:
+        packaging==26.0
+        hatchling==1.29.0
+
+Relax the exact pins to >= so that the (newer) provided versions
+satisfy the requirements.
 
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- pyproject.toml | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
+ pyproject.toml | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
 index 657cc21..d1b9ce3 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
-@@ -2,9 +2,9 @@
+@@ -1,10 +1,10 @@
+ [build-system]
  requires = [
-     "hatchling==1.29.0",
-     "packaging==26.0",
+-    "hatchling==1.29.0",
+-    "packaging==26.0",
 -    "pathspec==1.0.4",
-+    "pathspec>=1.0.4",
-     "pluggy==1.6.0",
+-    "pluggy==1.6.0",
 -    "trove-classifiers==2026.1.14.14",
++    "hatchling>=1.29.0",
++    "packaging>=26.0",
++    "pathspec>=1.0.4",
++    "pluggy>=1.6.0",
 +    "trove-classifiers>=2026.1.14.14",
  ]
  build-backend = "hatchling.build"
- 

