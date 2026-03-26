Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97427109E546
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 03:50:18 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40198.1774497014886522448
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 20:50:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=hfvyG9UO;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so310095b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 20:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774497014; x=1775101814; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+ClmSxRucinbGkKWyrYTuuXAiZ4kKT6WSHacVEkPNp4=;
        b=hfvyG9UO92fk8QMQkex3mlg51ZGHMZA2a5IwWtSqJ1NEtB+T0R6QO3LyCpGxDls/DR
         IOLOiXDTMSIAKSGX85WQb6J5ra6dAqgJtl7juKpp/qd5xClQU4tT61e3+52pym/oFb+B
         MIw0L3UOTTAyRwCpx8cdAVw+k9uE+QKJI14as=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774497014; x=1775101814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+ClmSxRucinbGkKWyrYTuuXAiZ4kKT6WSHacVEkPNp4=;
        b=Ipw7vgKZpq7PQsgdAo1BFVgdYJUFcaSld7Mfmy+NRUvDrV7sGqfLtAHzh/3JgTT1HS
         UzwlFRJdP3hL9ghDiUOq1Ug2I1RJuGS/ap8WGirQuQlsG917ULSTZ6gzIVWPt40CF7c1
         PFUxdc4Jn2KP09kMtR2xUyJAJ1QKKxfxSG3OqsCqejqj9/bpEYXj4xxjTZgT5BbMhsuI
         SUTMC7qW6Pxr5IkHYPdHdJlKLUzQ6y7rszKgog/CejN/meg+expz+ougiv/sIz6a1z2q
         QnVLbvZyNDzqkyySWj7etZ8DIdu3nLC1irzIFawdT7QezSw82AqTuPL0XR2gW4wHSCQi
         qdsQ==
X-Gm-Message-State: AOJu0YxYARhMlAeBKx/3vxbBbFxBJylE+p0k6xJDZrIb4KoPXk0Qx4j1
	A43gebu5jkfESxvJgvKBeMfc4RBSanbt3ZMRtiRq6wOlRJGOOsz1zgNWX51I7BCWBgqOaUbK8j8
	U6F/Bghg=
X-Gm-Gg: ATEYQzxBfasqvmu27bOoYak3pZc081C6Z3Zpk1JFZ/16LPproDapo1r8WT1R9/CjqBl
	z6l4W6O+fZTArTGrA7kPr7kgZ2ajQ6Cg6tz4SnawtqhnsJS53a+PcYE6vDc2EmjlFyOXU6EawIH
	nDPueoEt8FKo+ua6gvlklOIb2JBEgn3vwafTNKB9rj8WP66oPynBOUwkrtZ1BEHOZCyx/Ix4CFE
	jEGHyZUuYjC9zKNZzJg4+bWu6AzdZdzjGYA4PLqnZgQrVlx86qR+7X10vR4RG6ujZwH1aZgDvKV
	eMAqXR+V0l6ATpitIGR1p4s56WkiPLMo10ujgEpz1+nCaACjRZVzs2voAPpV3cqsgQ49BFzOllx
	WcLrMKKTARgMi7/oHeQ7aQJGCL+hsVS1bjoHKGHvPGq7KrR3fVuFRFGO3XZsJUkPYbREtAQjyt4
	XkYkDifrU+O6t3FjLkOT6GmH1w3maTdrGOn5Dh
X-Received: by 2002:a05:6a00:4fc5:b0:827:2dea:8840 with SMTP id d2e1a72fcca58-82c6e15fee9mr6166907b3a.56.1774497013801;
        Wed, 25 Mar 2026 20:50:13 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:7987:be3f:ca17:f7a1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82c7d1e645dsm1184455b3a.10.2026.03.25.20.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 20:50:13 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][kirkstone][PATCH] giflib: Fix CVE-2026-23868
Date: Thu, 26 Mar 2026 09:20:04 +0530
Message-Id: <20260326035004.31568-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 03:50:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125632

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [1]

[1] https://www.facebook.com/security/advisories/cve-2026-23868
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-23868

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../giflib/giflib/CVE-2026-23868.patch        | 34 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
new file mode 100644
index 0000000000..4243344d9e
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-23868.patch
@@ -0,0 +1,34 @@
+From f5b7267aed3665ef025c13823e454170d031c106 Mon Sep 17 00:00:00 2001
+From: Eric S. Raymond <esr@thyrsus.com>
+Date: Wed Mar 4 18:49:49 2026 -0500
+Subject: [PATCH] Avoid potentuial double-free on weird images.
+
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106]
+CVE: CVE-2026-23868
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ gifalloc.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/gifalloc.c b/gifalloc.c
+index 47c6539..cfb6e33 100644
+--- a/gifalloc.c
++++ b/gifalloc.c
+@@ -349,6 +349,14 @@ SavedImage *GifMakeSavedImage(GifFileType *GifFile,
+ 			 * aliasing problems.
+ 			 */
+ 
++			/* Null out aliased pointers before any allocations
++			 * so that FreeLastSavedImage won't free CopyFrom's
++			 * data if an allocation fails partway through. */
++			sp->ImageDesc.ColorMap = NULL;
++			sp->RasterBits = NULL;
++			sp->ExtensionBlocks = NULL;
++			sp->ExtensionBlockCount = 0;
++
+ 			/* first, the local color map */
+ 			if (CopyFrom->ImageDesc.ColorMap != NULL) {
+ 				sp->ImageDesc.ColorMap = GifMakeMapObject(
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index aa47f93095..8226e9b6c7 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -10,6 +10,7 @@ DEPENDS = "xmlto-native"
 SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            https://sourceforge.net/p/giflib/code/ci/d54b45b0240d455bbaedee4be5203d2703e59967/tree/doc/giflib-logo.gif?format=raw;subdir=${BP}/doc;name=logo;downloadfilename=giflib-logo.gif \
            file://0001-Makefile-fix-typo-in-soname-argument.patch \
+           file://CVE-2026-23868.patch \
 "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
-- 
2.25.1


