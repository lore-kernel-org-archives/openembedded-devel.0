Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AFBECA9ED1
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 08:53:53 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9074.1791795225904016797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 01:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gMVjBRbN;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso2992385ad.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 01:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791795225; x=1792400025; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4x/C/dWGcatHe42E5jutBB/abcUKIjeNHiMFKqhs2V8=;
        b=gMVjBRbNbfSY+SsuwpMdfrN21PbIzEH205DcUOeM8EZwrUQ1V5NaljmwNxnw94236p
         YHjICYcBxyFnXLsFQkl+yBuDCIwvuwW6w2UrD04Dp3IpZYrEiiabVeiW+Z8YsWDBWnu8
         GpUXYvThHxqoRgaK2X4mOEhGYt1EbxI7IddfzZkBPDuH3nzuG4uE5X4uDP1D8pYgWEyA
         H3qQbyBM/qpmpu0hdunCpgSo0V19mLwTZeCFW3/2ofnJ/+f8V4dfeCd7fexFzJ3hB6Q9
         lg/TF2p8fXuP888iLQER2MVL9JJEMtK9Z1B9QWnNVZyXs4pYThNO7CPF80LFwvo9B60f
         sKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791795225; x=1792400025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4x/C/dWGcatHe42E5jutBB/abcUKIjeNHiMFKqhs2V8=;
        b=HrVdz0d6IpCrBlmyv2YR5065edqoxuviFxNwcwouU/CwagqreB//uFxLn4lEUhlW+D
         9gTufh2oKvvoLV0YxGgwSEh4ZLxaE+3trDv8IXn7HqsnrRnPH8QbJivxWcT0Jlcq8W0C
         KE4lpwMnduVlIfve/N6yF2+UBRWHjYOK2McgBfRLZF+c2S2t/Mr9CnU39QltWbRcZOz8
         +9vYh6O65o+JuGlwZDBOO9VX7vpUMWm6C610bibW9tqrXGz2UCa85qYKNCyxLWSVBFvs
         /gpMue6CzheQWmAS07PPVvPS7/6UJ/5GAUgxInj8BPx5mAVnF4sBgtnETKmMJPBhRdv9
         BXSw==
X-Gm-Message-State: AFq9FYIs5rtfHeGs1UW4yKH0nC2rblBBsQYcHtPqAteSAMc//V+PBp9E
	ySNUjwtkXkV/Mew061Ur29IZE1w/vBhQ+P6YLckvqcUNyagPjNDykHSBdHs5uK4Kdkk=
X-Gm-Gg: AYBFou3WLQ1ca/axu0Nw1T3PlEsNylWxxJS7+ibViZqUCnEMiJx4S7gPFC9fKxAd/oy
	1c9+4EOCHv2l3AhKWhqsPnYH4GtBcZpgiXyrK43pKat3lpswXHCV2YL5y41klKWkyoaMDnsbPfr
	5er7EQ13DIAfF+vN2/cNBl47lnmzI5FfDKPhxspIX6+f00LmRRL/D7JDfH3EanbPMzmmLLPk+LC
	0izqaEF2aAp/AHZNvoP67+enWP5jpRJ2lXukJ87kSMM22kA+iBoP9TNWvlK43n8sKtBDiBnmi44
	CwZYXo4W5wg3VNZuVAoreegH7f6znqRMoj8hfpu47BTCv3cJso1YISbfTMQh/vPzU0O8dXsz4se
	e/co61C7Xu25hsk6PZW+vH4JiA4+NrfzSKgjNmKNwBVJf9/G0ep8HC8KApXLtVVbj7AiBoa6m4T
	F46LZa3nYHubDsPrT1t/HSHgJCXWJS55xeFiSoE09wad162AaXn79o1xhBoHeD7hfU9eJkBL9wo
	Tc/Gl2QtJHzjSwmiVaTv8GmDs9BuccxW7B/X4w=
X-Received: by 2002:a17:903:1a8f:b0:2e2:d39f:182f with SMTP id d9443c01a7336-2e842bc7f46mr75971405ad.28.1791795225059;
        Mon, 12 Oct 2026 01:53:45 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8acfa3b6csm14943335ad.41.2026.10.12.01.53.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:53:44 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][PATCH v2 1/4] libde265: patch CVE-2026-49295
Date: Mon, 12 Oct 2026 21:53:34 +1300
Message-ID: <20261012085337.2879365-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 08:53:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130755

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-49295

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit bd09bb41b41ee12aeb181bf04e5f5961b00123ef)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libde265/libde265/CVE-2026-49295.patch    | 41 +++++++++++++++++++
 .../libde265/libde265_1.0.19.bb               |  4 +-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2026-49295.patch
new file mode 100644
index 00000000000..189d330b9a5
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
index ca05e9099e5..6bed3250fa5 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.19.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only AND MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV}"
+SRC_URI = "git://github.com/strukturag/libde265.git;branch=master;protocol=https;tag=v${PV} \
+           file://CVE-2026-49295.patch \
+"
 SRCREV = "824b4138ecd51611d7073f1b50d5d6f982609b06"
 
 

