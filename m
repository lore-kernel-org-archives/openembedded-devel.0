Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D011ACFA46B
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 17:43:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17919.1763919794495034783
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 09:43:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JDvjn49d;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47755de027eso18936115e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 09:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763919793; x=1764524593; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFHUmWvI8WFSqTbyZIFrgHJWLtSpUrmStq+f20iAwmU=;
        b=JDvjn49dMk0aRFMEHUbbL1rh8SRq3IA7HXEK+NNSYksApLZ2dOUpIC8IF+dNTyBaKH
         voyZnvI9sA7RFVhkz/IXCl2ihRGjc+15j5upUp8XGAYWvsBZLfP7cMCjE3KAvccwk5Uw
         nsKKt+DRmSUxzHoEtthZqm4uRG7VuFnsxiqBlfOtyalEXdA6Hor9ZpdudPq4OTsiUMu8
         WbyEMnmKgJEPtp1tTObWBj93Wh6Em4rsWMEuFE3vbNOUnd0PjEyCqlebqP/YXDpicXxJ
         rNnGg0MSSpKzHxTqlMUi2XKBimXfzcPwNhmLrzKD4ltiVnTgO+0N2RUGIcUYnNval6f9
         zyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763919793; x=1764524593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lFHUmWvI8WFSqTbyZIFrgHJWLtSpUrmStq+f20iAwmU=;
        b=Q4GyTakdzNQrwYIEQUvZk/ZeOrYZ9UIScWa34gXw7LSK1Mh8+pcxgXXZFkjM0uBts+
         4TbUKyyt7nPWR06ghajvk37PspB6NzJrSdmgoj+3ZbJJvJdXUq2qpaiES9JHwbYO0pHV
         nXhZyCZ6DiWsf9g59RJAXs75EZBXuqVdVqpEhAVxdbR1n1EzD/3bkqAokr/iLXQoMpPj
         cJ8hbl5hQ1/2fic0OZ2Qv8Cj0yo6g+LuG0UBWDrEs5xcHXHeNDeltvSQH5PTy5rEOLw7
         BmYtKs529JTEUNu0wDKd5f9yhAGmhm42uaGNfqyP9eXTQDyWhrmrfxHDWeUt8i8Vy4X0
         drqg==
X-Gm-Message-State: AOJu0YzYSFvkogxJzW1FFGdR2jgvNlG3uNc2+29PdSxNtVSY6DHP8hM5
	k3CoiavbsSTUACilltJdk4zvNCNNEvfTPOiE3wLmmrvF2sFOQPctisyJkVX80vF8
X-Gm-Gg: ASbGnct8ddwAjm5HTT7POTt9sNjS4Pb52WXFE2d0stuWwvi6MEhWInq792pggfC0PYK
	Mz4nxBaYJZUjS+o89yDfUcfRgnbcbPz3rytf7YnPw5jo8KJU6tdSxbmjBUqidg2edPvBr/gial7
	+xtitFosVdRHlh2gILG8t5aj3VBZPKmMFPb3nUtgH/atffn3yU8j97V9YYPVY2QYLUyHWhYXGfa
	+WfA/Ltn7qAhFfklFEWDqOVjleSrrF25MeXgO6G+f/D2BKZSFXTWUYAPrtvT7aAPHoCHDivztvy
	xeb8R+T7/cWOwZ6oeUuzOCrU5Q+RAoBYPF88560sMlt5+uCr0AnWaxiN42GzAOg3llJgfab5NGy
	juXeLWx0TEPH6RIDWwMfd3ar+7cOZfAp7P7HBrYSMwomltpy7v8lGZsZvWuJzRlsdtrP6lkJiuq
	SBZyQkC8bN
X-Google-Smtp-Source: AGHT+IEhfYZ3+rO1bLUKccHseTVA5SK3Op444AdlVsQlFHWK3dme11K2oSu3lyOwaXU+HB2q2DPTsQ==
X-Received: by 2002:a05:600c:4f49:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-477c01dfe16mr100997705e9.27.1763919792536;
        Sun, 23 Nov 2025 09:43:12 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1f3e63sm156733795e9.7.2025.11.23.09.43.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:43:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 4/4] jasper: patch CVE-2025-8837
Date: Sun, 23 Nov 2025 18:43:09 +0100
Message-ID: <20251123174309.2625557-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123174309.2625557-1-skandigraun@gmail.com>
References: <20251123174309.2625557-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 17:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122001

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8837

Pick the patch that is referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/CVE-2025-8837.patch         | 63 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_2.0.33.bb  |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8837.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8837.patch b/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8837.patch
new file mode 100644
index 0000000000..7a1eefa6c6
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8837.patch
@@ -0,0 +1,63 @@
+From 61c37530a3abcb5db2f7a431e91dbb3531ff1816 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 5 Aug 2025 20:46:48 -0700
+Subject: [PATCH] Fixes #402, #403.
+
+JPEG-2000 (JPC) Decoder:
+- Added the setting of several pointers to null in some cleanup code
+  after the pointed-to memory was freed.  This pointer nulling is not
+  needed normally, but it is needed when certain debugging logs are
+  enabled (so that the debug code understands that the memory associated
+  with the aforementioned pointers has been freed).
+
+CVE: CVE-2025-8837
+Upstream-Status: Backport [https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/jpc/jpc_dec.c |  13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/libjasper/jpc/jpc_dec.c b/src/libjasper/jpc/jpc_dec.c
+index 2553696..c2600c4 100644
+--- a/src/libjasper/jpc/jpc_dec.c
++++ b/src/libjasper/jpc/jpc_dec.c
+@@ -1107,23 +1107,23 @@ static int jpc_dec_tilefini(jpc_dec_t *dec, jpc_dec_tile_t *tile)
+ 
+ 	if (tile->cp) {
+ 		jpc_dec_cp_destroy(tile->cp);
+-		//tile->cp = 0;
++		tile->cp = 0;
+ 	}
+ 	if (tile->tcomps) {
+ 		jas_free(tile->tcomps);
+-		//tile->tcomps = 0;
++		tile->tcomps = 0;
+ 	}
+ 	if (tile->pi) {
+ 		jpc_pi_destroy(tile->pi);
+-		//tile->pi = 0;
++		tile->pi = 0;
+ 	}
+ 	if (tile->pkthdrstream) {
+ 		jas_stream_close(tile->pkthdrstream);
+-		//tile->pkthdrstream = 0;
++		tile->pkthdrstream = 0;
+ 	}
+ 	if (tile->pptstab) {
+ 		jpc_ppxstab_destroy(tile->pptstab);
+-		//tile->pptstab = 0;
++		tile->pptstab = 0;
+ 	}
+ 
+ 	tile->state = JPC_TILE_DONE;
+@@ -2259,6 +2259,9 @@ static int jpc_dec_dump(const jpc_dec_t *dec, FILE *out)
+ 	const jpc_dec_tile_t *tile;
+ 	for (tileno = 0, tile = dec->tiles; tileno < dec->numtiles;
+ 	  ++tileno, ++tile) {
++		if (!tile->tcomps) {
++			continue;
++		}
+ 		assert(!dec->numcomps || tile->tcomps);
+ 		unsigned compno;
+ 		const jpc_dec_tcomp_t *tcomp;
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
index d78250306b..e972b7b85a 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=mas
            file://CVE-2023-51257.patch \
            file://CVE-2025-8835.patch \
            file://CVE-2025-8836.patch \
+           file://CVE-2025-8837.patch \
            "
 SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
 

