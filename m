Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 743CEC61DD3
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:14 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4189.1788429009579961831
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UXXJJ29R;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so1952865b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429009; x=1789033809; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z+9GDNntGk7eYYoGmaAYkw8FSWA84+e8MC8H8nE3Ow=;
        b=UXXJJ29RSbqFpGkK+VmoOxb+tc/GgXL6/gTyzh5EOsFOPQW7jFK9tDKo/igwcF9FDG
         vXMmH9/gOLLw8yQEE+RpVR9nvBKTUXRz/4KuS6X1WSAVQbmTPhzYrx4Q71qZn/zZOXVm
         jra4N76kGyWMxt87fBJjqPS+96oNLvDRJR59kXAX/pj3Yww9fjHEO4j5lDSiam5m/FcQ
         wb89EwWTtCNEBiMsQMuMIRvslIdIfYoTH8d1nOE9W9x5ND4zU0HdOCxBagZYRjUgZH7Y
         g+kMHiUfohTpOoN767LkbzSIawVZHR/a62AKNnAYhfpBNhKWPLwm5SkARq988BOz6x2X
         9kMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429009; x=1789033809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8Z+9GDNntGk7eYYoGmaAYkw8FSWA84+e8MC8H8nE3Ow=;
        b=TEaXzB27yq4OQReg4ymZTsp3nsqlPJ0E76INRZrY67l3ExT+lh+68FGsdYASolpDuQ
         V3zPZwKgnYxaaRXi9SPalkGN3Nyyu+341R9TWixSrNhT5UJ1ekcrSNcQPddOtjgl2KHA
         4MVN9QtTBNZn3OyGwc09KGPbBP9kgLlzz/pEcxLHmxMW/MT5nyYPkPcU3RsGfyLjORS+
         mCwY/QDMlCsgdED6lUgsKZRwiSstuOE3BsW4Vn/t3FJpYocc2jaT1EfMIS/SI8boUDHj
         133oVG0F5VNDZPWdqHN5UeE2efrPFfErToACoO3Y63T5sFTGEPSwjSjuu6apwcDExqPt
         5joQ==
X-Gm-Message-State: AFuF++lnbo8L8E1oRz9vsaQ936diiu+HTxSmpghSQ3MwBP3eovR+VYgY
	f+ojb8qiwg63TReIIZvnTOInavNWezHXhhKQsis5AdrK5euAFfY2BBjOQD4Y0VTY
X-Gm-Gg: AYBFou0fGUv7FmC8N7fIGwbPSaj0wRmHiw29HZZs/jHMWhRLpblpsynIVzx0uWrRAAM
	LzVI4ZoZfwSdkg651Q+3SzswElUJ19JpE9IKHLe7dLLJUpm3xQllUaxDII/4vLU0b73YEZ3qnJt
	wOrFYYAtFOPRwrlAzAe3tN7uvDSgvz/nsq+RQMLIo/L+x9CTxi6o9xmXT+I7l330DsWNi+rxVcY
	HkUT6P26NtK2mZ12tEhA0gt1LP6sK+EhEG3RxkwSsv0evutZdd0YpajOnzwr2hf1lYxVFuI0r/m
	sUa42D2EUO6KvhUV2Y97DAoRiifvSvsJTs+yohQD1foaR7Dd619+SfrhL2tRcAb4BF1Vu8OXeo8
	Hs11gf5wZ/aAnhgseKGQi3ZSmnWIta7Y5Xamy3zMX2pnfm9EKiggo6SXTdUcgwcSwCmB0YPyWob
	cVRRYPLrhR52lg7BKHaDPBZosvFYPWdjts1UGY1rXKRmAz+AHb3uK/1TlrGH5XNAl9p03pFtZz
X-Received: by 2002:a05:6a00:a0b:b0:853:50f2:9c03 with SMTP id d2e1a72fcca58-85ed28d91f2mr14723200b3a.11.1788429008891;
        Thu, 03 Sep 2026 02:50:08 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:08 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 4/22] libde265: patch CVE-2026-49295
Date: Thu,  3 Sep 2026 21:49:35 +1200
Message-ID: <20260903094954.3240723-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129720

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49295

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49295.patch    | 41 +++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
new file mode 100644
index 0000000000..189d330b9a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
@@ -0,0 +1,41 @@
+From 7d5e48dbf9324691ba3ce4cd8ffa089d735b0b70 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 25 May 2026 20:14:07 +0200
+Subject: [PATCH] bound aggregate short-term RPS size (GHSA-g2rg-wj66-w594)
+
+(cherry picked from commit 691f3a3c55b3d32478c4a49895dee061a282652b)
+
+CVE: CVE-2026-49295
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/691f3a3c55b3d32478c4a49895dee061a282652]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libde265/refpic.cc | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/libde265/refpic.cc b/libde265/refpic.cc
+index ea4db4b0..dcd2b214 100644
+--- a/libde265/refpic.cc
++++ b/libde265/refpic.cc
+@@ -322,6 +322,22 @@ bool read_short_term_ref_pic_set(error_queue* errqueue,
+ 
+   out_set->compute_derived_values();
+ 
++  // The unused short-term references are all collected into a single PocStFoll array
++  // of MAX_NUM_REF_PICS entries (see decoder_context::process_reference_picture_set).
++  // While each individual list is bounded above, the predicted-RPS construction can
++  // append the current-picture delta to an already-full source set, pushing the
++  // combined count past MAX_NUM_REF_PICS. Reject such sets to avoid an out-of-bounds
++  // write when filling PocStFoll.
++  if (out_set->NumDeltaPocs > MAX_NUM_REF_PICS) {
++    out_set->NumNegativePics = 0;
++    out_set->NumPositivePics = 0;
++    out_set->NumDeltaPocs = 0;
++    out_set->NumPocTotalCurr_shortterm_only = 0;
++
++    errqueue->add_warning(DE265_WARNING_MAX_NUM_REF_PICS_EXCEEDED, false);
++    return false;
++  }
++
+   return true;
+ }
+ 
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
index 54f158eef9..b4f80d18a7 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-49295.patch \
+"
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 
 

