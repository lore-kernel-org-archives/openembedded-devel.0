Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA36ECCD184
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:10:18 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web10.7469.1760033411282690948
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:10:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g0amzhYx;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7322da8so227895966b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033410; x=1760638210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hirGoQpREsmRp8+guOtA9VDBQ4G0+Ut7E33K6mM7FWA=;
        b=g0amzhYx7h47crrmwsjWuDFMd30zOIuNht5kiKJsyUQppSjgEWSebqIlRLLlo8lxZD
         oqKIorPVDr95CJhJy4bbC44e+OuQchS3/iQDdUNCJOfCa44W/PlGmrO4rq+4m49epRrd
         k6h81aZjL0ZRUydYy1765O0afVKstRvcOcVVgb3Nl5yjF5LPs0yBmKc5sxYrBy5FzaeI
         c9JpTPHNO0E2TUYLWJqgHFyAPueNm4nHVonUo5e5ewWM1XOSqH6UxnvNzt5Dfy8gMFON
         D9bpoAKv9jsv95Zz3x8k5zNCoQn2RbaZwiTewQGbZ1KYoiN904iHAHt++Lk3Zz1b8ewB
         kxew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033410; x=1760638210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hirGoQpREsmRp8+guOtA9VDBQ4G0+Ut7E33K6mM7FWA=;
        b=E3FhzP/yX159PgTUh6tRKzb37api4YhCuH+leNmAND1ceBEXGUhGfdPIcJP76gwlV9
         59OAPtFukhz89riEghmhOIAPziwT+FelJ/QfpgVCX167k/aZBOINXAOQUOgb74vxHMgc
         jOoByhMtWqJXwclSXh4FkdaNPlV+sYE1ES48MxO1h2gjQdg8h+IT7+f1YOTzcUJq6M7h
         fzAKGsCdazbJMl4mvWQdlu4A6ouJxaXSsiGSVCz94ePkUoLIiaC5Zi0I/A7uL4+OQkbV
         YwST7MpcPo9yPcuLgokAKJ/hCdkSNFV/9YEOYyXFcXDp1TGXq9cDHO9k1CNBX8EjAaTz
         LXqw==
X-Gm-Message-State: AOJu0YyYTboThOLRqDIHVVhvgWVfWbqnvewjqh5E4BoHkED10Js0G2CT
	hG/XkDWZ6FN9JsziQlCqK60g/jyJckK/M+bcyT0PLoCdSk0eRpGmO3CRW57jJA==
X-Gm-Gg: ASbGncuyRNlCw597Y7zQ+z+6enZRVIJD2WI5pj3wlC7xi71SHl4CEOg12fVYmcEvloa
	sBvUcjXuQ/wAqA9f4OdrSwe+fr1ZOPZzGOL9n7OFbcsxxWwdfgzDl1Ek5pMvkg3vpQQYPzQD/X4
	NZ7CA50lSvEbCcqe0vPU8u6/xR5fXiI/f7uVyBPFIn0YCo6KzBpHB+Gt9Ri3Y4kIAShVy+HD94g
	45PU/pGzTb7K1124kjl5IzGOUYwvMuviz0y1GLnNca6xCYaFQDztMHocVeZ+sgX6wko2P0qtbjm
	OLrMpMUcKCh/hdC7jFA+vEkLw8OotbK+1wQoqnKp1DBwkvNVHzGA44t1xGDdvsD6Q9yRfTbSNq1
	8h38mGJQXyTNpN0vwJ577fxeYD04QsH+SpaiifHSXLO/z
X-Google-Smtp-Source: AGHT+IEagax8YjuTdiA4knmRQT36YWHgpFBpEs/1ZZGn+c3P8+GpRSBDpfHUvI0ZAjQ11erpo0ckUQ==
X-Received: by 2002:a17:907:7286:b0:b40:2134:a877 with SMTP id a640c23a62f3a-b50acb0ccf6mr887261766b.59.1760033409427;
        Thu, 09 Oct 2025 11:10:09 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900ccf1sm26784966b.63.2025.10.09.11.10.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:10:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 2/3] jasper: patch CVE-2025-8836
Date: Thu,  9 Oct 2025 20:10:06 +0200
Message-ID: <20251009181007.1538218-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009181007.1538218-1-skandigraun@gmail.com>
References: <20251009181007.1538218-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120446

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8836

Pick the patch mentioned in the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/0001-Fixes-401.patch        | 80 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.2.4.bb   |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch
new file mode 100644
index 0000000000..7b8e7a9d22
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch
@@ -0,0 +1,80 @@
+From 1d4faf90eb0e89b5e10804af00cfe9cb9b48a087 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Sat, 2 Aug 2025 18:00:39 -0700
+Subject: [PATCH] Fixes #401.
+
+JPEG-2000 (JPC) Encoder:
+- Added some missing range checking on several coding parameters
+  (e.g., precint width/height and codeblock width/height).
+
+CVE: CVE-2025-8836
+Upstream-Status: Backport [https://github.com/jasper-software/jasper/commit/79185d32d7a444abae441935b20ae4676b3513d4]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/jpc/jpc_enc.c   |  30 ++++++++++++++++++++++++------
+ src/libjasper/jpc/jpc_t2dec.c |   3 ++-
+ 2 files changed, 26 insertions(+), 7 deletions(-)
+ create mode 100644 data/test/other/poc_401.pnm
+
+diff --git a/src/libjasper/jpc/jpc_enc.c b/src/libjasper/jpc/jpc_enc.c
+index 041c030..e910a86 100644
+--- a/src/libjasper/jpc/jpc_enc.c
++++ b/src/libjasper/jpc/jpc_enc.c
+@@ -484,18 +484,36 @@ static jpc_enc_cp_t *cp_create(const char *optstr, jas_image_t *image)
+ 			cp->tileheight = atoi(jas_tvparser_getval(tvp));
+ 			break;
+ 		case OPT_PRCWIDTH:
+-			prcwidthexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_logerrorf("invalid precinct width (%d)\n", i);
++				goto error;
++			}
++			prcwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_PRCHEIGHT:
+-			prcheightexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_logerrorf("invalid precinct height (%d)\n", i);
++				goto error;
++			}
++			prcheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKWIDTH:
+-			tccp->cblkwidthexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_logerrorf("invalid code block width (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKHEIGHT:
+-			tccp->cblkheightexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_logerrorf("invalid code block height (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_MODE:
+ 			if ((tagid = jas_taginfo_nonull(jas_taginfos_lookup(modetab,
+diff --git a/src/libjasper/jpc/jpc_t2dec.c b/src/libjasper/jpc/jpc_t2dec.c
+index de77623..1eff88a 100644
+--- a/src/libjasper/jpc/jpc_t2dec.c
++++ b/src/libjasper/jpc/jpc_t2dec.c
+@@ -348,7 +348,8 @@ static int jpc_dec_decodepkt(jpc_dec_t *dec, jas_stream_t *pkthdrstream, jas_str
+ 						const unsigned n = JAS_MIN((unsigned)numnewpasses, maxpasses);
+ 						mycounter += n;
+ 						numnewpasses -= n;
+-						if ((len = jpc_bitstream_getbits(inb, cblk->numlenbits + jpc_floorlog2(n))) < 0) {
++						if ((len = jpc_bitstream_getbits(inb,
++						  cblk->numlenbits + jpc_floorlog2(n))) < 0) {
+ 							jpc_bitstream_close(inb);
+ 							jas_logerrorf("cannot get bits\n");
+ 							return -1;
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
index a2950dbe55..b3048d0adb 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz \
            file://0001-Fixes-400.patch \
+           file://0001-Fixes-401.patch \
            "
 SRC_URI[sha256sum] = "6a597613d8d84c500b5b83bf0eec06cd3707c23d19957f70354ac2394c9914e7"
 

