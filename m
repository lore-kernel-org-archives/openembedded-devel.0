Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3682CFD316
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 17:43:19 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17917.1763919793438560630
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 09:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DBF9fegR;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-477b5e0323bso23643285e9.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 09:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763919792; x=1764524592; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fQ1M3qddofyHNonxwcStH++mRiDTQRQHKys5+MfACEc=;
        b=DBF9fegRAwDwcn32q7JTEPpPBpdZhgadCwelzLt2r91KU5i33y5HUagdjhtv5aCAhz
         ZIH21Z9KzQnOci0ql3iHhVBNvPaemSUQHX2FB7F9836/i/nI+jAziIBZzPRjmb7dogwn
         a425vW3TtENYvhpkM5kvma4MLIDEhi1l1bu8Tg4ItsbS0OgPrYZV4jO8ZYbWcX/0KaNw
         Iqc98duiKkY5ZsUcEeoBO+1zc0gxpcxouJSMrHtMfDTGD3C4kPgVUE+WOx+ARssQJrI6
         p1/OTXz3Oxxn7klN3dw7V6K/Kt6ffgv2PftTZ+eSJieY0rDTHMySA32UPEf9b9Qen7Du
         qyMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763919792; x=1764524592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fQ1M3qddofyHNonxwcStH++mRiDTQRQHKys5+MfACEc=;
        b=lF9APgbnkrleWx1LB7T/xE4I6VPEnfrZhe4mYxoFeJDzGQlRxQzAAohuaDNoFJ3Ym6
         VoR30AgPYJKFcGTePvxm0OpGqVDXIOM2URk2xscKSNH7TKzpRand6iPzyhndVslYegNY
         O1SD8Q73g+gsvKNjzQ9gWgc5gUhtIv2VA7jqirGiIYN6tPZNQoL/Mf69IzjeKo0Sfsag
         pgCa6NSLC3v+aHiBJ8n8rtasPRvIqKM6RhyDEtVrHoXWLPi8++8q/0ijg1e/OHtciPqw
         Jd6tfmRqQEOwx0tja23bGVQ0jGQuduzm4ewuE42nybjbdf1P6qVGDe31XtVJwzDIGoSm
         Nrww==
X-Gm-Message-State: AOJu0YzmFnegwrVlP8SpNat/Im3iWWTPeArdoDaHjMAKRfkFWJ21jo3v
	oZ+dFS1rKZmZrvYc1SZ0XNPf1CP92zXU0r0tJXUWJNM2Rpct4RDx1WkdZ9tvQwrO
X-Gm-Gg: ASbGncunSWvVPSiRrjY3El+hYieXynpwDvi8Ud5Tc0QPKIP5BooAHiaYdqiVc4WXzPm
	NlFvkmxP4jt5kR6zG5V97uGjPofk+XIL/lJklbvg3iiwjmlTt7Wl8O2gsPVnvt3EFie4a3+m7Qr
	ecp/uIRYrkwGjYbbHLQwxfh6sv0dTo1rJK4hhvZV1BKLXe6jn30TSkzE+36nKtw66cM60M5pPOc
	+JDSQrXoUh8zUXsgm9gMhUwnlVBh7eeJQ5fvZwYVAwNdiMPT8rCl6rV+kF1SpsAkI0s3IkE4FLr
	FJa5lxKnxLn6WiyMDNRyGKNV0FeXx7/KwT6Dg/8KqpJwkPUoWWxzr7copM2qIX1+cmnTzLZEr2E
	t0AFeWcvioGtK1RWeDtzXO13QknnvlmmqZHiYkzhaHFMm4Gm8MFk9xFLQBc0GzBfXEIxImL970l
	EfauatIxvlhc2+WGYtidY=
X-Google-Smtp-Source: AGHT+IECEZ7Md8XPIq6uY/cpQerJbrBh+ZMee9t2Or77SLmexhcDSR27ihL8y2g+emBHFP/YuekrIQ==
X-Received: by 2002:a05:600c:628f:b0:477:bf1:8c82 with SMTP id 5b1f17b1804b1-477c053c90amr99110955e9.15.1763919791590;
        Sun, 23 Nov 2025 09:43:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1f3e63sm156733795e9.7.2025.11.23.09.43.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:43:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/4] jasper: patch CVE-2025-8836
Date: Sun, 23 Nov 2025 18:43:08 +0100
Message-ID: <20251123174309.2625557-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123174309.2625557-1-skandigraun@gmail.com>
References: <20251123174309.2625557-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 17:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122000

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8836

Pick the patch that is referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/CVE-2025-8836.patch         | 78 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_2.0.33.bb  |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8836.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8836.patch b/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8836.patch
new file mode 100644
index 0000000000..247d1064ca
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8836.patch
@@ -0,0 +1,78 @@
+From 0e045908b1fec6748688cbc13bd3dc3703ddb17e Mon Sep 17 00:00:00 2001
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
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/jpc/jpc_enc.c   | 30 ++++++++++++++++++++++++------
+ src/libjasper/jpc/jpc_t2dec.c |  3 ++-
+ 2 files changed, 26 insertions(+), 7 deletions(-)
+
+diff --git a/src/libjasper/jpc/jpc_enc.c b/src/libjasper/jpc/jpc_enc.c
+index 93013f9..c957e3f 100644
+--- a/src/libjasper/jpc/jpc_enc.c
++++ b/src/libjasper/jpc/jpc_enc.c
+@@ -474,18 +474,36 @@ static jpc_enc_cp_t *cp_create(const char *optstr, jas_image_t *image)
+ 			cp->tileheight = atoi(jas_tvparser_getval(tvp));
+ 			break;
+ 		case OPT_PRCWIDTH:
+-			prcwidthexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid precinct width (%d)\n", i);
++				goto error;
++			}
++			prcwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_PRCHEIGHT:
+-			prcheightexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid precinct height (%d)\n", i);
++				goto error;
++			}
++			prcheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKWIDTH:
+-			tccp->cblkwidthexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid code block width (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKHEIGHT:
+-			tccp->cblkheightexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid code block height (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_MODE:
+ 			if ((tagid = jas_taginfo_nonull(jas_taginfos_lookup(modetab,
+diff --git a/src/libjasper/jpc/jpc_t2dec.c b/src/libjasper/jpc/jpc_t2dec.c
+index e52b549..6e1f1f7 100644
+--- a/src/libjasper/jpc/jpc_t2dec.c
++++ b/src/libjasper/jpc/jpc_t2dec.c
+@@ -337,7 +337,8 @@ static int jpc_dec_decodepkt(jpc_dec_t *dec, jas_stream_t *pkthdrstream, jas_str
+ 						const unsigned n = JAS_MIN((unsigned)numnewpasses, maxpasses);
+ 						mycounter += n;
+ 						numnewpasses -= n;
+-						if ((len = jpc_bitstream_getbits(inb, cblk->numlenbits + jpc_floorlog2(n))) < 0) {
++						if ((len = jpc_bitstream_getbits(inb,
++						  cblk->numlenbits + jpc_floorlog2(n))) < 0) {
+ 							jpc_bitstream_close(inb);
+ 							return -1;
+ 						}
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
index c314da539f..d78250306b 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master \
            file://CVE-2023-51257.patch \
            file://CVE-2025-8835.patch \
+           file://CVE-2025-8836.patch \
            "
 SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
 

