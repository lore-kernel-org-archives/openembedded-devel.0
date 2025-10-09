Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7ABBCCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:09:58 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.7431.1760033397095361114
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XVBzB05V;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-63163a6556bso2583245a12.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033395; x=1760638195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NfLqO2MdDL28PjyqCYiCvBxz44tWKQDdmQw5twN1FUQ=;
        b=XVBzB05Vt5/CO0BQ6ETMREOY8vKGVtH1Rl5tBJEcEv8iLbKA8vCjogGJKiEhvTnPGU
         EBToK/d6P5EJGVTqS1z83vsCbXQ26e7FWyoSh+1bOrB9Vbysc1idZj8fvNmcRi4xomJj
         CP/MS/oV3l+AGxbrlxQSk9rnJr2eVUgnVD0fAn1bKx103L5xKRVLA5nOtRpe/dKyMir9
         wZ+VTtgoNUe4yD3NFpis/pcHY55H16gDY7KWlRWeNm7hRq1mjn2faGtpov8q2VD3Pt6r
         hi+BPUBjcOtViIgOd8N4X1hKr36WxR3lia3N/upn8CRKw6qBVDdYsfRNzDHAfaqJBER4
         tz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033395; x=1760638195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfLqO2MdDL28PjyqCYiCvBxz44tWKQDdmQw5twN1FUQ=;
        b=O6Tluq9y4t3gWqnV/hCHTkYpkyXaH71ZmB0NoV6cSFpl2a+j8fkNT+syO4culH9rYj
         sL2JBf4QKBNae/e/6wtJpRCJyrtxPHsZ92mvoE9SUcxFp6jKvnMSlihZcMym1d34k0uV
         SHRQ5t65pBeIABJ2zw4vZh8735yhRMn5iT7U7PmkfwX5IAy6PBSnigvqIVStkVlPVInz
         wgyzCDyy76yI9bireXjQZOnaD9Qq2reTqpo2Fw1CvhaiLX4poYtbSSAZ+vjUWo7W7fmG
         ZcNJI4PLGQQrA7gRjUrSwy4Agl0s7guNt3f2MQL01nCuysjFIb8kxlk50XpQi9w+LdbF
         4gFw==
X-Gm-Message-State: AOJu0YxNYNWyyZwLyFi6Xn5IV+QZs7j32axDl2L7cEqkW0PogUkl5I50
	JxOg5W5TTt32itx2laVmwBlpxxsw8T943Jvl8jDmaWtY51kkvE4ZsSC1wBwnuQ==
X-Gm-Gg: ASbGnctwR5agNlu0ovbjhVKmPeJWkS6gr/P7nuHCUe0W6P83wPmzk5lh10ZhfBGSFVS
	5LFLI66sGbPec+ddgb2/BkJoP90P/1EZNIJ/L4NblQ5tzcGSN2ma5MZjV1p5MM4+/vG6v/rVH0A
	mTrSzQO8GFfSlCnwEkl2RKlMA2k5RKp+UbbCh+luTK3sYj00M3qlmjvdOyz61WJu4uOoE3sv0U5
	eM6d6o9YtScTdeTIl6oTcNLk9baGdqF8M2RhdL6shPbED+Vk2iqNUQiz4XLW6FksVKzw42TDc8a
	iQPOs0fdAmvfDbik7aT48Iiu0HxyCC90XTs1l+KfIGqXk9NfNzB4njkqjwHoTtnjbnQLyNDeUAc
	kEOehLPo7Rxi0Sncttz44/UpeMUwwT1Wfo4dVtTSYjZdiwM+eylpEw8U=
X-Google-Smtp-Source: AGHT+IHNTyX3SHy99GCW4bhz8NJrrgs0JpAMYpcHLWdMX3aX9dYAMg6pxCJ+LWRMvdPaTP3Ty7NRnA==
X-Received: by 2002:a17:906:ee89:b0:b3b:679d:7f4a with SMTP id a640c23a62f3a-b50aa387331mr856714266b.5.1760033395247;
        Thu, 09 Oct 2025 11:09:55 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cac037sm28608766b.12.2025.10.09.11.09.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:09:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 3/3] jasper: patch CVE-2025-8837
Date: Thu,  9 Oct 2025 20:09:52 +0200
Message-ID: <20251009180952.1538179-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009180952.1538179-1-skandigraun@gmail.com>
References: <20251009180952.1538179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120444

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8837

Pick the patch from the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/0001-Fixes-402-403.patch    | 62 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.1.1.bb   |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch
new file mode 100644
index 0000000000..b8d78c698e
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch
@@ -0,0 +1,62 @@
+From d3f6b098f83326222a2576f938ddff93338c60be Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/jpc/jpc_dec.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/libjasper/jpc/jpc_dec.c b/src/libjasper/jpc/jpc_dec.c
+index e76aa40..929f7ae 100644
+--- a/src/libjasper/jpc/jpc_dec.c
++++ b/src/libjasper/jpc/jpc_dec.c
+@@ -1134,23 +1134,23 @@ static int jpc_dec_tilefini(jpc_dec_t *dec, jpc_dec_tile_t *tile)
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
+@@ -2286,6 +2286,9 @@ static int jpc_dec_dump(const jpc_dec_t *dec)
+ 	const jpc_dec_tile_t *tile;
+ 	for (tileno = 0, tile = dec->tiles; tileno < dec->numtiles;
+ 	  ++tileno, ++tile) {
++		if (!tile->tcomps) {
++			continue;
++		}
+ 		assert(!dec->numcomps || tile->tcomps);
+ 		unsigned compno;
+ 		const jpc_dec_tcomp_t *tcomp;
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
index e3fbb87708..393539e227 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master \
            file://0001-Fixes-400.patch \
            file://0001-Fixes-401.patch \
+           file://0001-Fixes-402-403.patch \
            "
 SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
 

