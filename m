Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFA0CCCD183
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 09:29:31 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.3913.1760606961572606602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Oct 2025 02:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cx1o6csH;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46fc5e54cceso3468465e9.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 02:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760606960; x=1761211760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I8t47QPwtAYkeI1PYffgaKnUrAxtHvduowkPEb/fw5s=;
        b=cx1o6csHCVJfBhj3xIzAcrIwk+yEbTqcVvuwTHS2muPUr4Hj6LpZ1GLaHR66WQ+ksO
         R5LMUtgzGAUjhxNBRdDOp7Tz2oRj7LwSF8JkV47jzTraTxoJ52gnG30PMZNsGSJfNK0R
         vfUIirZSjNNi0P3iHTqlYpfPHQVfmptSsk4QpHGJyDz+Tk7/AV8iEYxsofg8ooX0ENY3
         twQWvVQc6CPp/H32uvxKOycNFUDtKpYupeVVrRx1RSbjHuYGtz4Y+KIusDzhMeojaM9t
         Eb7o7BeY9H1MQiKi8tz+HNxcoRpc3AKPoEWrhduazqCxUSMZ2Ll7F5NC1OZj4Jo852/n
         l2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760606960; x=1761211760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I8t47QPwtAYkeI1PYffgaKnUrAxtHvduowkPEb/fw5s=;
        b=P6a5vAnYa4M8X7XS6mzx7l9fzIPWa1ODi6hbo8d2f78L/92NjGXINBxjVpK9s7V0L/
         1Kxsa7JzBORWWTqaNZHbifTM+Qw9sWZMSZPo3CPaH2HuC4c8crtyAICO+OeWhadWg/wJ
         mcwVu3V2j9jqvTz+LjvjkOX3AwZXEdPZhzWPJc7+rXfVuPTKe4FiXXhvsvyKc9LLSguN
         e0H/mm+XedaPNsgOWGvjYk/1XOP9BlZnZC6Z4/2hwyAoTq5qugNL96sJsgP2Lq8LPVxu
         eYg2yeUOiWrdykr2pYwkecB59+HGROpNuIixVlvJDdVzczv74j0R9Msi/GVh6KBEpjNJ
         BETQ==
X-Gm-Message-State: AOJu0YwZ7RILdXbHv49tzsyDDYofYFZdedBQfdqWsiGltS9lx1eewj55
	aeuy76JM+CwKKr9ZbH8pqLLzMPFVec9/1fDCbeRFDhxgbWtxdTlO6eAJof8ndQ==
X-Gm-Gg: ASbGncumUgUkwnc+wxyRpHUqF0H30uf2oWzvN66G33utcXzQt0nFMAgedtHyK07xXPU
	2DHM63SR60x0m3/hYFrXsUW9sMYugVSywDlbmP0/VTFLKyJtDxg7vns8Dacr8GL4l2RQEztT+ob
	8zkHFg2PQMxZPzKS5ITSNBuIxcbEViD0z3faStjj59y3kmSgm0lhfILAo2pIS+8oeJfmv2QjFXw
	tLuXsrCuupZNJ3pPCy5Ve7RtcDY94viH7zLJWk/K3vxlCzLnn41XG9m4id6GhGDWEPaF68VbPHd
	uuUsGCndjRswmgKcetVBzhiXIMMLvjqvrPvUzVRyP9uxWiyZ2Zp3pWDVrMGGrwpvRe2/pdpAVDH
	9fBkUu1AAHjmZcmqflrvigchdV15QCVJ0vllrABO/W8KsSTpAGWji+DF8/jPRR9HMuuFVRPaGZg
	EQHe4neGdo
X-Google-Smtp-Source: AGHT+IHlkADVczC5vVGJtHfRwDPmauHS3znJd2Jml5WMDx/gx8NtRpuEjmosrYFYR8vBDpPT2qe/jg==
X-Received: by 2002:a05:600c:1395:b0:46e:27fb:17f0 with SMTP id 5b1f17b1804b1-46fa9aa204cmr214665125e9.9.1760606959805;
        Thu, 16 Oct 2025 02:29:19 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4710ed9e7d7sm16819345e9.3.2025.10.16.02.29.19
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:29:19 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 3/4] faad2: patch CVE-2021-32274 and CVE-2021-32277
Date: Thu, 16 Oct 2025 11:29:16 +0200
Message-ID: <20251016092917.1946972-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251016092917.1946972-1-skandigraun@gmail.com>
References: <20251016092917.1946972-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Oct 2025 09:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120725

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-32274
https://nvd.nist.gov/vuln/detail/CVE-2021-32277

Pick the patch that resolved the issues linked in the nvd reports
(same patch fixes both vulnerabilities).

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>

merge to CVE-2021-32274
---
 ...frame-length-to-960-and-1024-samples.patch | 87 +++++++++++++++++++
 .../recipes-multimedia/faad2/faad2_2.8.8.bb   |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch

diff --git a/meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch b/meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch
new file mode 100644
index 0000000000..f1d5c63437
--- /dev/null
+++ b/meta-oe/recipes-multimedia/faad2/faad2/0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch
@@ -0,0 +1,87 @@
+From 9f7515c9571d5c72f6ec2dd6199650093628730b Mon Sep 17 00:00:00 2001
+From: Andrew Wesie <awesie@gmail.com>
+Date: Mon, 5 Oct 2020 05:47:59 -0500
+Subject: [PATCH] Restrict SBR frame length to 960 and 1024 samples.
+
+Fixes #59 and #60.
+
+CVE: CVE-2021-32274 CVE-2021-32277
+Upstream-Status: Backport [https://github.com/knik0/faad2/commit/c78251b2b5d41ea840fd61ab9502b3d3036bd747]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfaad/sbr_dec.c | 9 ++++++++-
+ libfaad/specrec.c | 4 ++++
+ libfaad/syntax.c  | 7 +++++++
+ 3 files changed, 19 insertions(+), 1 deletion(-)
+
+diff --git a/libfaad/sbr_dec.c b/libfaad/sbr_dec.c
+index 0705ddd..1a541ef 100644
+--- a/libfaad/sbr_dec.c
++++ b/libfaad/sbr_dec.c
+@@ -97,10 +97,17 @@ sbr_info *sbrDecodeInit(uint16_t framelength, uint8_t id_aac,
+     {
+         sbr->numTimeSlotsRate = RATE * NO_TIME_SLOTS_960;
+         sbr->numTimeSlots = NO_TIME_SLOTS_960;
+-    } else {
++    }
++    else if (framelength == 1024)
++    {
+         sbr->numTimeSlotsRate = RATE * NO_TIME_SLOTS;
+         sbr->numTimeSlots = NO_TIME_SLOTS;
+     }
++    else
++    {
++        faad_free(sbr);
++        return NULL;
++    }
+ 
+     sbr->GQ_ringbuf_index[0] = 0;
+     sbr->GQ_ringbuf_index[1] = 0;
+diff --git a/libfaad/specrec.c b/libfaad/specrec.c
+index 9797d6e..d539bbe 100644
+--- a/libfaad/specrec.c
++++ b/libfaad/specrec.c
+@@ -1053,6 +1053,8 @@ uint8_t reconstruct_single_channel(NeAACDecStruct *hDecoder, ic_stream *ics,
+ #endif
+                 );
+         }
++        if (!hDecoder->sbr[ele])
++            return 19;
+ 
+         if (sce->ics1.window_sequence == EIGHT_SHORT_SEQUENCE)
+             hDecoder->sbr[ele]->maxAACLine = 8*min(sce->ics1.swb_offset[max(sce->ics1.max_sfb-1, 0)], sce->ics1.swb_offset_max);
+@@ -1305,6 +1307,8 @@ uint8_t reconstruct_channel_pair(NeAACDecStruct *hDecoder, ic_stream *ics1, ic_s
+ #endif
+                 );
+         }
++        if (!hDecoder->sbr[ele])
++            return 19;
+ 
+         if (cpe->ics1.window_sequence == EIGHT_SHORT_SEQUENCE)
+             hDecoder->sbr[ele]->maxAACLine = 8*min(cpe->ics1.swb_offset[max(cpe->ics1.max_sfb-1, 0)], cpe->ics1.swb_offset_max);
+diff --git a/libfaad/syntax.c b/libfaad/syntax.c
+index f8e808c..462ba9e 100644
+--- a/libfaad/syntax.c
++++ b/libfaad/syntax.c
+@@ -1079,6 +1079,8 @@ static uint8_t fill_element(NeAACDecStruct *hDecoder, bitfile *ld, drc_info *drc
+ #endif
+                     );
+             }
++            if (!hDecoder->sbr[sbr_ele])
++                return 19;
+ 
+             hDecoder->sbr_present_flag = 1;
+ 
+@@ -1348,6 +1350,11 @@ void DRM_aac_scalable_main_element(NeAACDecStruct *hDecoder, NeAACDecFrameInfo *
+             hDecoder->sbr[0] = sbrDecodeInit(hDecoder->frameLength, hDecoder->element_id[0],
+                 2*get_sample_rate(hDecoder->sf_index), 0 /* ds SBR */, 1);
+         }
++        if (!hDecoder->sbr[0])
++        {
++            hInfo->error = 19;
++            return;
++        }
+ 
+         /* Reverse bit reading of SBR data in DRM audio frame */
+         revbuffer = (uint8_t*)faad_malloc(buffer_size*sizeof(uint8_t));
diff --git a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
index 6ac09c19ce..731600205a 100644
--- a/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
+++ b/meta-oe/recipes-multimedia/faad2/faad2_2.8.8.bb
@@ -10,6 +10,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = "${SOURCEFORGE_MIRROR}/faac/faad2-src/faad2-2.8.0/${BP}.tar.gz \
            file://0001-fix-heap-buffer-overflow-in-mp4read.c.patch \
            file://0001-mp4read.c-fix-stack-buffer-overflow-in-stringin-ftyp.patch \
+           file://0001-Restrict-SBR-frame-length-to-960-and-1024-samples.patch \
            "
 SRC_URI[md5sum] = "28f6116efdbe9378269f8a6221767d1f"
 SRC_URI[sha256sum] = "985c3fadb9789d2815e50f4ff714511c79c2710ac27a4aaaf5c0c2662141426d"

