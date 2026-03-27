Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F5210BA45A
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 09:10:02 +0000 (UTC)
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67858.1774602598332213975
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Mar 2026 02:09:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=XUys/3pp;
 spf=pass (domain: mvista.com, ip: 74.125.82.178, mailfrom: vanusuri@mvista.com)
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2c15849aa2cso2102803eec.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 02:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774602597; x=1775207397; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fvr8JWt6skGvZV6xDClojNRvJOfpy99sDCP+rUrL3Fo=;
        b=XUys/3pplJpIhOP/LRQJ9ScBEc+zuSWir/c/IZs4pGDUz66YBxMYKr6ybE1sdY9B/9
         /nujxshRC6vBx1hLO6fP5453TQ9Y1E7689tYXa0Ysu9FklmZb8ZpNSEOXSue/dtN1h9S
         U0mjQhVu8YLNDSWWozAO49Bn/vFg92IeGGpvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602597; x=1775207397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fvr8JWt6skGvZV6xDClojNRvJOfpy99sDCP+rUrL3Fo=;
        b=RcZmyX+dcwJvNt7SJFkEDUHcu4h1tHey58Q2LMjAbSlXWGDNTnicmnl1BYwFqpTfXB
         6dXpMIgkIpzDThB5Wq0iefOjB4dxWE3Tr/2aJ/JVas3zMWJ36NztV+yVJLtr2zt6lKQx
         DT8kwlc/2dG0wzmkCt0t4JB9C9sz0UOLc66wV5iJ7/mH9OKmyjTCLFP4cZRx4P1sr2bD
         91OAT7gXvzwex4ky5i2PuR81od2PZQRDCzWdSti3K8NnWRyzqEP5pBO+tjFznS9YVif+
         EfYQT8OcGlPYJ0X6g20Wfy4UiJL6d/fCAoMS6DWJn96fRWXSeVapvKoIezvye2qZmri4
         z1gw==
X-Gm-Message-State: AOJu0Yy9RZGc49SxxY3DHOsezFv4jPiO7d8y5So4s06t+x5WYu26bQQn
	RQ2ReS3JvWAXruaoX1NmX8RRf5Ug9ccoy9D7n2DFvyqPIui3WReHFViCiWcNZHgT4RDE5VXaUjy
	L252w
X-Gm-Gg: ATEYQzwKR8vaAbHwvdMvKTGfI9i6ijCN5p595t4FndNXgvipJBLMyJaBlx4NKFnDyzd
	UClZyFam8OlxTOttodBlTDIyhKwv5+FTYXdoSq1zs+epuqtBoaoc/e/xFjh5qrQ0vHp5SC7SPPO
	98V9NvoF/vSTinbWeO3DKHEq1zkfnpBmWZ1LQyBUDWz4VmW47FmJRUaG36lYOhUHzZKMKAL+5fN
	8NROyVB/6XP2mRJiQkn/pzw/WBGiBXPf2v/z6+vjBb+CAB00lDjtn9eGrazzCBHhmgzepoED8Zy
	/KpG78xNxuejobAFDA3w9lN6rfWxekRiuRwhAgiwWAsFyHGhZbaiYfi05I3yWDnByVx7bXtsIxC
	4PdU7zPyFCe4iZHSZrZix/NMKhTN6h4Nsfbqv/5uP+/7wMyQeeDRmd/XLB6VnM+euT90a32tHfL
	A1RYdBKapVWY4jZPXUFvLAA+cdeBLKEjJElCUA
X-Received: by 2002:a05:7301:6706:b0:2be:2f62:8bb6 with SMTP id 5a478bee46e88-2c185e813c2mr785937eec.30.1774602597181;
        Fri, 27 Mar 2026 02:09:57 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2406:7400:54:2bec:d873:3467:d1cb:22ab])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c16ec258c6sm4906284eec.4.2026.03.27.02.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:56 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch 3/3] giflib: Fix CVE-2026-23868
Date: Fri, 27 Mar 2026 14:39:20 +0530
Message-ID: <20260327090921.114180-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260327090921.114180-1-vanusuri@mvista.com>
References: <20260327090921.114180-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Mar 2026 09:10:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125783

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
2.43.0


