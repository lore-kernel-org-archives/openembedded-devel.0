Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B41C5DF67
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 07:44:55 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3780.1787039089121166173
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2026 00:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kmWch1wi;
 spf=pass (domain: mvista.com, ip: 209.85.215.170, mailfrom: vanusuri@mvista.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c998fd549a8so3279890a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 00:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1787039088; x=1787643888; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vjWe6BrGfao+h77gHxWn+4wDHkYioUA82XrmoUocehg=;
        b=kmWch1wih8kvKbjfR6vtjcw2tas3xNwmrWqLtrYmUTHd4Ly5WkH/s5v25gNgUFnjS1
         TIy2n0B27Fgjt3JceaRpSPZXXkcZZ8nWekGhQthxJO7PGXIUsKd4J6XZ0a3ulfRmuUjf
         n1x3yjDYwL1yUd4Zf94jY8gqK0tVSMimcuMFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787039088; x=1787643888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjWe6BrGfao+h77gHxWn+4wDHkYioUA82XrmoUocehg=;
        b=fOQHJUdvuQeChNl4v6DyoWau+2w62KfHg/m+EJwqXnCWkbUOmaU3l/TkFGzbOlmz1s
         P5gRVq6AnjC3ddeiQLnkNtirjt/ZbpWCpq59/143MM32n3SrxpJn3RAmfR+sMnbOofkH
         TIVw5D365f1gLZsAhZHzh3sHeVBfif+WSkQBDpb3N7Z0pFu7zcMJ9gCjkpAj3JvKq56p
         3O1o4Az3heL1uBZBo0rM4AOoyP4oCgYwsU6cti2VL2AyjoBCxYatQXc5ztc03ssgEDUQ
         ul7gj9sh5xL2tTKCU0zc5WmJFciJFr64Y7i2wdcbGCgboNYaVSaz/H+pp3yK9Dk2iCI5
         QIZg==
X-Gm-Message-State: AOJu0Yw8n0/cnwb7/2eaM/SZxozwJTVC2ipZZmPynU4HP2O/M3iDf+UV
	wn6Moy3DQlWw8XN1UWU2KrUVy/WpXFgqpvR/f08z1nl/RBa47AeyCVYzUWx5xqj4l/bplwK8YQ0
	lkIpCHTA=
X-Gm-Gg: AR+sD13XV04DvtNmuewofGAc4lBlWo+nuqC/un+LIa2mzgWmMWB1hvoJB49xicl6qum
	6iaZ0pGGZNmLFiiIKuWujr1hwR+Sb0ParSixkRmB6aR8xL9qs+PG4YeoANyhSJyYgeV0mtYQ7Py
	NC1TOiRcoWgDa+LZ5ho+dgemuks1ORCLn+0oCd67mDB9U9YC6itZBuAJw0+6oqK9I6J3OAwqdQ2
	VD2HOWR58L1zR8xUuDDOeJf7+hzn8Cb4/of9tHLNt4E6HDYXxpvzfshL7gUMSOGjgthfSKZ2E7Q
	+ydmPs8g5F2vICO4kOjazphbms3yxjhcclhWBY8+Q5rsEalDHqMZU9EAZxfcoJ27AilHYtjelYI
	+KwLnqQIwQ6ZyyfpB8PqZEvTVq7Mx+Oiq6jzNJv7jscjiybcYKHNr84s++zkQgDxxJ/Nzt8mBoL
	Tscnej2c1BMX01/5H1trlaJcxOTCGvHTpupOjMcZqqpTtzAS+ikLsdbyhkmVMweFlYL3HbPnnzt
	8aR
X-Received: by 2002:a17:90b:17d2:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-3933e60c1damr30117272a91.14.1787039088318;
        Tue, 18 Aug 2026 00:44:48 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f29:777d:ea96:6c89:c935:111e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-326798c566asm15644832eec.11.2026.08.18.00.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 00:44:46 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch] giflib: Fix CVE-2026-26740
Date: Tue, 18 Aug 2026 13:14:15 +0530
Message-ID: <20260818074415.1079855-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 07:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129228

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-26740
[2] https://ubuntu.com/security/CVE-2026-26740

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../giflib/giflib/CVE-2026-26740.patch        | 40 +++++++++++++++++++
 .../recipes-devtools/giflib/giflib_5.2.2.bb   |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch

diff --git a/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
new file mode 100644
index 0000000000..1e30a28773
--- /dev/null
+++ b/meta-oe/recipes-devtools/giflib/giflib/CVE-2026-26740.patch
@@ -0,0 +1,40 @@
+From 061605081115bbfd7019bafc119a13b6f17fcf25 Mon Sep 17 00:00:00 2001
+From: Anthony Hurtado <amhurtado@protonmail.com>
+Date: Mon, 1 Jun 2026 15:40:48 -0500
+Subject: [PATCH] Fix CVE-2026-26740: heap OOB write in EGifGCBToSavedExtension
+
+EGifGCBToSavedExtension calls EGifGCBToExtension which unconditionally
+writes 4 bytes into ep->Bytes without checking ep->ByteCount. If the
+extension block was allocated with fewer than 4 bytes, this results in
+a heap buffer overflow.
+
+The read-side counterpart DGifExtensionToGCB already validates that
+GifExtensionLength == 4 before reading. Add the symmetric check on
+the write side: return GIF_ERROR when ep->ByteCount < 4.
+
+Signed-off-by: Anthony Hurtado <amhurtado@pm.me>
+
+Upstream-Status: Backport [https://sourceforge.net/p/giflib/code/ci/061605081115bbfd7019bafc119a13b6f17fcf25]
+CVE: CVE-2026-26740
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ egif_lib.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/egif_lib.c b/egif_lib.c
+index 1526868..8160560 100644
+--- a/egif_lib.c
++++ b/egif_lib.c
+@@ -678,6 +678,9 @@ int EGifGCBToSavedExtension(const GraphicsControlBlock *GCB,
+ 		ExtensionBlock *ep =
+ 		    &GifFile->SavedImages[ImageIndex].ExtensionBlocks[i];
+ 		if (ep->Function == GRAPHICS_EXT_FUNC_CODE) {
++			if (ep->ByteCount < 4) {
++				return GIF_ERROR;
++			}
+ 			EGifGCBToExtension(GCB, ep->Bytes);
+ 			return GIF_OK;
+ 		}
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
index c26f3cf160..e96765ca2b 100644
--- a/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
+++ b/meta-oe/recipes-devtools/giflib/giflib_5.2.2.bb
@@ -12,6 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/giflib/${BP}.tar.gz \
            file://0001-Makefile-fix-typo-in-soname-argument.patch \
            file://CVE-2026-23868.patch \
            file://CVE-2025-31344.patch \
+           file://CVE-2026-26740.patch \
            "
 
 SRC_URI[logo.sha256sum] = "1a54383986adad1521d00e003b4c482c27e8bc60690be944a1f3319c75abc2c9"
-- 
2.43.0


