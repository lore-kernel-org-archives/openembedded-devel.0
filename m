Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2664BCA9ED2
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 21:10:55 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5096.1791839448577285622
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Oct 2026 14:10:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZXcrG5pW;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so710992a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791839448; x=1792444248; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4x/C/dWGcatHe42E5jutBB/abcUKIjeNHiMFKqhs2V8=;
        b=ZXcrG5pW6R3/4nUXTM7wCuEoAmm8OTyJB1bVCAjsXjfbxF1h9/n3Ja7/eOwTGfvwpd
         gcH0/l1WbzYL4l4SD0dkJ+/YweEwbu7qxrx6Dqiig/ISEEFjAXBbyMISLg7xPPAHwIf3
         C5SzBS3gGPzTmHPQNt2DQp8rilNm98ZIya/4N0dCWIq5g5LnV2r4Yz/41gwB7sgN446D
         hPm64ZzO0ujQzrc9zHf2ECCo/CBfUxLhnUf7amhxPzuEzhZ61cQc63KK5SqYJ/DVv7Sq
         WjO22V+OqeSxK4MAvv4i6kLM+xbbb/zV4LTBh58W8hYVzfVVLOKiBDrt5DUs7eJHAKxA
         lI4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839448; x=1792444248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4x/C/dWGcatHe42E5jutBB/abcUKIjeNHiMFKqhs2V8=;
        b=oajiFITqkHChN37VOBUO4IcyElofG93uXyGhDHSmfISnZeDFvFi5H8DkDSQPdFFiqQ
         LXl+uHPHDFBjxLAH5evQiwg5pCqyBqJXC1bnR24OKzQt92yNVUb/Ea6gL9npsD8Iw0vr
         8VVIloylFaRag0vWWuH5oCpuUDb/TqaricjpDu9OJaNL+vBlcKFxBok8TyETahV5yibv
         2bgSte+3xC/3tL50pTLHgTuGDlTmmFvrk/YNAJxcLS78VZ8j080KxxKQLpFy6V5lLeVA
         3NNw7IL6f+SO0LMiJWNvux5xJk75nwMzwYrjA09NLxTAIRbHcCfNZrSNZWKcaQKGizg+
         zV2w==
X-Gm-Message-State: AFq9FYJx4Lhm87gz2GHPLcsRXTCUHALmIJK4uCpTAGRg+muA7MlyZa96
	XyR4myU5/M2h+d/Hn6kbPbPevJLREk9OIOxEN2vIDdK5520PpUAji3oriwu2igMY
X-Gm-Gg: AYBFou3tGlXx0vmp2eGL9SIsTEMZKRATTU9038nJ8SLLZTu2RrsKUrd6uXwnuDQ7seH
	MQ3ejb5+DdAKLz3/7d9w3RTfLsU/+00StKZxF91u6CeMSe8HmjxtB40Brn4XAmYf9NRqXJzwR9q
	B2m023mLCqYQcm3G7J/uJitwazW4IxH/hi82R0JvWTWfDdopYBb+UxtRdWL3SfpLio90Uklw39O
	oHKtigatSN2LuZ6zb1iJ6S5zAJ+jsfPYCyc8pGZVPdIvzpZnP7K7hCu7HtuLp92YqOROZMNWs8h
	1Sb0ig92JMi4+RLHL88+sWi6/93j8Nfy7517prcqvyjFCdCPYm0ejEnu2Aiq/WLdwIzZ+BZyqTM
	Qm7HUzbSqiJFLMvJtOSOUVOrH703Px9YdS1ucJIl6MHTb2RU2oFZKRjcxcZ8zmdUC+3i0VyqOxG
	d1fQgATCHYNT+9RiaBfbLk8/L+OAChB7B+WjW1n2RcYQh1Mi3Fv1KXUo0tX8/EkVWWxTPFks4Zv
	4Rm515sHY0AKfACy++TBcTyKPwzgukXyAQTe+w=
X-Received: by 2002:a17:90a:d2c7:b0:3a8:13d6:f740 with SMTP id 98e67ed59e1d1-3ab3a99aa95mr8700970a91.22.1791839447863;
        Mon, 12 Oct 2026 14:10:47 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab32c0f59bsm10962728a91.0.2026.10.12.14.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:10:47 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>,
	Anuj Mittal <anuj.mittal@oss.qualcomm.com>
Subject: [oe][meta-multimedia][blacksail][PATCH 12/43] libde265: patch CVE-2026-49295
Date: Tue, 13 Oct 2026 10:09:36 +1300
Message-ID: <20261012211009.3352822-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
References: <20261012211009.3352822-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Oct 2026 21:10:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130782

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
 
 

