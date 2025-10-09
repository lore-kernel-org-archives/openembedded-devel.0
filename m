Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E656DCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:09:58 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.7462.1760033396358448047
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zs0UcfmG;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b50206773adso434002866b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033395; x=1760638195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BMbv2xj2PKjpeoLcCc/98tChBNkgBKcJqPnfKFHNehE=;
        b=Zs0UcfmGeYe9/WvnKiYdzsMMPTLHpzroPloPrEo8rhXTKhrHZLuf1z+wy/T9eUAlM+
         gu28TC6JGWOVesxyq1swk/zmNmuOezpWxQgzZ5Pch+xELDVRupTzXEk/Cwu+tHbfdnD6
         p+bRdBgKoqyJ09r13We58jXzQiVXz2RYGJF9jXVmw5Pjt7jM1JWppQf2i+y7EKL8dz1j
         6yl/T1rfj8TS8GhSITbnNutYRO/nDIwxHAh9uvwRL3tBPFUnYVciElk0dgsnOhOBnO1h
         hhhAV9hhapahZiHZ0xIYZJoOZyEkfCBeNjHyrX17CwkdxgU8cYlV1iqA76db51FHEPSt
         8qWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033395; x=1760638195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMbv2xj2PKjpeoLcCc/98tChBNkgBKcJqPnfKFHNehE=;
        b=dhSLo8VsElQPrxgSNYK5DXj1E4J15qA0K2LxI7NMFRETCZ0s0cfzDBBZIGaIRyoHEb
         SJwurhoaIT1iIEXMnVypKfUniFo96XsqfKfykfKPePDeUFa1zaW4g/9ExvxOeSiqKbzi
         e+KMRgjrlLcfQ3PsR9Hb3A99Ucc9X+2D2dmTqnT7qNMf2aRvuT1in04JIEsJGMdO1cnh
         teG8jWy/hkTQLRmS8TP0Fsc+gOUl2ddtGGZ2n/Aszd5rYAUwwS6cDr72Nvi6iHnIIG/5
         2bjLTd/TCCVxH3yr6YTLl+AE0tEGpaA+iPZ9b6PA66nioNsuvQTKttyu9fQuZf/SA0uY
         O5LQ==
X-Gm-Message-State: AOJu0YxLSv6J55be3nhnvlNmi+4T3SU9OAmuji0Q/PXvIoToPuot+qGt
	uLH4Tvda6aJDZpAfKgqk2wvgfGMQGhozKFcjxUSXNSWzO4JAgDfJIjye0qqWqQ==
X-Gm-Gg: ASbGncst5EvXeDzvNAH/HaXam2VKVUd3t6XgOOkz1np0yGy4INaTD/tv6SAL5n6pxrI
	xNzSh2D7uU5ohqBefGyChTRtE7pmpmlp9CpkqKTGktJTWYnbfqczEZAEFXaXiQOrVQ3TwimNh1G
	nulv8qdVomDzDIo1TVcS2KrOTgqCHTofuPaxF0dg1j5HcN9Cf7L257/QqGRAjJ5XvHN/tRqkDig
	XTi6yag27IM368YutpYGsme2fUjvPOsdm6b6gYO0g81vi1lOHkYtjupPGbg34zwpG4noxW6SW9H
	gKt8LIk58TYXPcL2S8R15ZeVo+i3pj6+wLKOaF1ufR+yi2Pb2VFyWgnjTygtMGTqP24CyZtmjuT
	slF//Pzt59YBVpCrYeMe6YR1mIkSZGx3y5E/5fFgq3nKvhe2vD0qAcGI=
X-Google-Smtp-Source: AGHT+IHMg9R4zc8/74yQ4nOK8IRYM/GH3XJVBx5vaVE8PwJHqygU4X3StqJqQ7l04rTGNBCuIDOM7w==
X-Received: by 2002:a17:907:c717:b0:b3d:e757:8c36 with SMTP id a640c23a62f3a-b4f40789b30mr1570275966b.3.1760033394597;
        Thu, 09 Oct 2025 11:09:54 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cac037sm28608766b.12.2025.10.09.11.09.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:09:54 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 2/3] jasper: patch CVE-2025-8836
Date: Thu,  9 Oct 2025 20:09:51 +0200
Message-ID: <20251009180952.1538179-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009180952.1538179-1-skandigraun@gmail.com>
References: <20251009180952.1538179-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120443

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8836

Pick the patch mentioned in the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/0001-Fixes-401.patch        | 78 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.1.1.bb   |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch
new file mode 100644
index 0000000000..d7e40c8493
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-401.patch
@@ -0,0 +1,78 @@
+From 823034b2b47be037278e612177180783b04fb687 Mon Sep 17 00:00:00 2001
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
+index 64f8aa5..4fb23d4 100644
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
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
index 82867c0a1e..e3fbb87708 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master \
            file://0001-Fixes-400.patch \
+           file://0001-Fixes-401.patch \
            "
 SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
 

