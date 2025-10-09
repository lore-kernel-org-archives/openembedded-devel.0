Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FEBCCD183
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:10:18 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7442.1760033411870285604
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:10:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kKRfDgta;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so244963766b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033410; x=1760638210; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I7aYAwONVWJpmUmTrCkudeISe1pfxDJjPHrNM2GuJiA=;
        b=kKRfDgtaPfHTCJ5xOln8NAvTRt0vbxAj0hiKvJh6mWuZB2KP5Emmxa1BkmJmrbr90H
         GykIWcs47z3Q+nHvqDV4wmNFqmaaXywWWnYzQuXW6UmMFCxwuj2rVLZjy95UYNrJFpzE
         vF6Clwrwh8TkP9bvnOFAeISZG5kTDH/V6fpbbO5jHGSrqw/8cK3K3PMa2VEv4UaMoYTt
         VWOsVLeciuLo2RxPRch+6VGqNhe4CQPv3aM2k62utl4lhWDXz4gJRO53PkDtYMw1zzYD
         SwCofi1uhisR392/GIrR6t71iux4L+jrOH6t280BdZwofDMFICNhChAeJ8FiZPrpvxbY
         /BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033410; x=1760638210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I7aYAwONVWJpmUmTrCkudeISe1pfxDJjPHrNM2GuJiA=;
        b=kb0hCS8acqy7h9BTdPTDnI/ey+rA8CQ7q3N/NsHsthvVF2teOSW7xXAnj6+j/oGyCW
         v0Z8ab9ATQ3cKap3E3IJOMxhImWY58CiQaTtBhLOxguj+LznHL7wwI5DKGbECXzdYyiC
         lPR6Y5colQuZjLhPljL+l+adjNrRDAzEgfCFI/8QQMXdjG3SfLGqlSjmH1Ih5YkikVyn
         Eetm1OEUdV4s4gOx1+aeuQCjEJUNkvKUCs2XXwoUBkxi4r1skvW9OqLo+Qt483LxZuCl
         27wpHyN8pn9t1b5Ppju8QuVJWy15GVo7VCMD44T0I6bXya0IxFW+UawdLqqS/tPDzMOa
         2BWw==
X-Gm-Message-State: AOJu0YzpFoGzKBhebR4vxylgn0Wl1YRFRpldgSWemOXT0QfItBfv38GF
	8d+sEmaEPj5as1GAtVrDo7B3HZqL2Vna4LDvoxQdERWEwKHY0Ze0HC3e50ew6w==
X-Gm-Gg: ASbGncsqjc+LdaAjMyrK+qaZdJNtDAegtfrTyg2mdpF59B9y7rnh1HZxGCbm6mtiBgG
	8iAZKrqVieQ2SXhkpGDLdHK4q8FUVi2nqbOOYlRLBhshlQbNN1GTxqfGgblDv8f9X1vJhDxESoH
	gc49uovTU7YfRI5ZTWv2laOEFKLpxMjq1v6k+itj5zHscXhhY67/9abOmhOoSiV2zzCDXYYzv3E
	uVtp1C0oN0wgfrJ5pre2hwo32BnRk2QtN60l8wrBT6pz7FYfm52hSs95IfvdblIt41COfIUQ8TT
	pS6hvuyOXkcKVFxl/CGnDOH8+OoIgJb2IylebpbDpzcOmp0TGljB1HWr6nMTD5gkvgzeNZnAm/R
	WuPXOL3vjFUhShrS651ALYhTkqlezl/VhrNrmv3ldu+sc
X-Google-Smtp-Source: AGHT+IF8+ji3l6dwMbMSa3cXUq3cHbDvmANUUN0/nfhbOQC6QS9UcDsJ/ErtfdcExESkLwx01dJJCQ==
X-Received: by 2002:a17:906:c1d1:b0:b50:b508:d0e9 with SMTP id a640c23a62f3a-b50b508d6d1mr698182966b.46.1760033410045;
        Thu, 09 Oct 2025 11:10:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900ccf1sm26784966b.63.2025.10.09.11.10.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:10:09 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 3/3] jasper: patch CVE-2025-8837
Date: Thu,  9 Oct 2025 20:10:07 +0200
Message-ID: <20251009181007.1538218-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009181007.1538218-1-skandigraun@gmail.com>
References: <20251009181007.1538218-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120447

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8837

Pick the patch from the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/0001-Fixes-402-403.patch    | 63 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.2.4.bb   |  1 +
 2 files changed, 64 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch
new file mode 100644
index 0000000000..f5773d877b
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-402-403.patch
@@ -0,0 +1,63 @@
+From 97c4d21cbe1936797bd8530669525287ee75f2c6 Mon Sep 17 00:00:00 2001
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
+index 125a29b..7e44f05 100644
+--- a/src/libjasper/jpc/jpc_dec.c
++++ b/src/libjasper/jpc/jpc_dec.c
+@@ -1136,23 +1136,23 @@ static int jpc_dec_tilefini(jpc_dec_t *dec, jpc_dec_tile_t *tile)
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
+@@ -2288,6 +2288,9 @@ static int jpc_dec_dump(const jpc_dec_t *dec)
+ 	const jpc_dec_tile_t *tile;
+ 	for (tileno = 0, tile = dec->tiles; tileno < dec->numtiles;
+ 	  ++tileno, ++tile) {
++		if (!tile->tcomps) {
++			continue;
++		}
+ 		assert(!dec->numcomps || tile->tcomps);
+ 		unsigned compno;
+ 		const jpc_dec_tcomp_t *tcomp;
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
index b3048d0adb..786df17606 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz \
            file://0001-Fixes-400.patch \
            file://0001-Fixes-401.patch \
+           file://0001-Fixes-402-403.patch \
            "
 SRC_URI[sha256sum] = "6a597613d8d84c500b5b83bf0eec06cd3707c23d19957f70354ac2394c9914e7"
 

