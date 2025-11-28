Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 089C7D116F5
	for <webhook@archiver.kernel.org>; Fri, 28 Nov 2025 20:18:51 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3254.1764361128113459426
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Nov 2025 12:18:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PS05nMbX;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so22060815e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 12:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764361126; x=1764965926; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=iOkHh6DTrKjjaE3N58eZ4ejJjNzU/bQCpdyuNwvE8jY=;
        b=PS05nMbXYDCbuIITSzYFGm8TQtqGSHtdnPQ7MXXEJ03Nb0gaSVhDUgzQqJJCqSkxYD
         yZTe+2NC5CKJvv786YnEjRFiIFC/ItbpQsUy0QZglGU79T4adaAfSvF6sDMWvRroH3Wx
         CPVK3n9ZZlR+/oald9WF3gXyvvQNsN25iVU1lmB0vLHku1NeoG14VcGbZyfpTUSe/5/8
         mzrnYO8BkybefdExwB7LORaI6fQZ/7pdpfad6Sf2nLedJYxwRxD8R4VJT5rIIORs3OKh
         KuvvG752/efhoN3GhEfaYv16ihsKIieKgM6igNhooBgxfKt3lX4kfA+w3TMGnwUIudoL
         0hgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361126; x=1764965926;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iOkHh6DTrKjjaE3N58eZ4ejJjNzU/bQCpdyuNwvE8jY=;
        b=ogQmcypebNRyvIjqHuCU98zYp3riarrcyJ48c0s/P3tgjlGMn5GizCGBys2YdFT+rG
         4CCon2TQQ/JxrbddTY1iPR9TtyLmASoGIWkvWGCFMJtGcqhWxOdFfWV7mg5vkeiCfh/c
         9E62rlHcI4U5vM8mxIUE/qN+GVwWL0S0kUyl1lzYcdp3sBHx+9+0S6FshHAP3yYOz8v5
         G9Wz0c6WdApyTWEE3sP5P+9uBWGnmk2inpHNHH4BijFcNHevHoxMQAH9b9MPmzvIXpwo
         ugktghK8/wg+Wqmv52Z2M1d7pt+0ihy2/vuub9U0sfvKNuGQbR1ZukPLmPCAKTMeelDl
         olug==
X-Gm-Message-State: AOJu0YxG9fubeWQ+Y9gT5WT2+hQK1Aj0Jj0pOSlrW/dOHyy2OGhRw68f
	h5iJK6P/+TB/EkuR+lcONCnlR387rPWYSUIbzbmrrRMVhIhEa7pvvxsj/B4PIA==
X-Gm-Gg: ASbGncsogLM6ce4iFErcNf2/WdgjYN/jB40ebI5T8rMUoaqyOWrW6dvqaypYPUrKEtG
	YyaMNTJcMrfDAuu7QKk5rbT7ihbmrBxVPrJ/KmcxP0cLCWufCjHeC7wvB7ia18fzdmwcahKCwHo
	AtTstFBZlSBTxlQ1SIFpCB3fQ0W2snCH/cKghSlSNj45KhSOjex7VqafDHiS3LwpEPvldGRe+NQ
	WG8Kdzbu49p/j3KkK29NZPblbgeZacGOxJrlPgJ+VRjCDJHVs/ticqtjmEOt+ZxyzslWMDd2h3i
	56blBWnmaHf6KbbxHwu8t760GjV6QyB3BzIptukCkq1lI4EkeiQSHyaIsNM8nXFD6gF94r3C7ZY
	GQGUB0cv+u5ApbD4Tbp9A4YtLMmRaQLGAA37wUXLqlzZv5MfmWL3uMg1jhy1pBt/Ko/dNabw/5L
	sn/jaSH2kS8o8jIP5m5Mg=
X-Google-Smtp-Source: AGHT+IFn00PxP97bbOz38AtMH0mkOlTnhhj0JETqEvl8iCg2EoZSQs3SCZFrqgQUA4KHfbSzS9HRAQ==
X-Received: by 2002:a05:600c:a07:b0:477:a3d1:aafb with SMTP id 5b1f17b1804b1-477c115c657mr285702705e9.29.1764361126341;
        Fri, 28 Nov 2025 12:18:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d6064sm11674324f8f.13.2025.11.28.12.18.45
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 12:18:45 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 01/14] libde265: patch CVE-2022-1253
Date: Fri, 28 Nov 2025 21:18:32 +0100
Message-ID: <20251128201845.2578315-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Nov 2025 20:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122133

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-1253

Pick the patch from the nvd report.

The patch is only partially backported, because part of the vulnerable
code was introuced only in a later version.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../libde265/libde265/CVE-2022-1253.patch     | 34 +++++++++++++++++++
 .../libde265/libde265_1.0.5.bb                |  4 ++-
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2022-1253.patch

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2022-1253.patch b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2022-1253.patch
new file mode 100644
index 0000000000..57c86101fe
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265/CVE-2022-1253.patch
@@ -0,0 +1,34 @@
+From 4dcc28a63e12a6cc8b99bc8e96c5c764fc7a8f1d Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Tue, 5 Apr 2022 09:52:57 +0200
+Subject: [PATCH] error on out-of-range cpb_cnt_minus1 (oss-fuzz issue 27590)
+
+CVE: CVE-2022-1253
+Upstream-Status: Backport [https://github.com/strukturag/libde265/commit/8e89fe0e175d2870c39486fdd09250b230ec10b8]
+
+This is a partial backport of the linked commit. The vulnerability impacted
+two parts of the code, however one part, which deals with HRD parameters
+was only introduced in a later version (1.0.8), and is not present in
+the Kirkstone version yet (1.0.5).
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libde265/sps.cc | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libde265/sps.cc b/libde265/sps.cc
+index 476cdbb..37bde7b 100644
+--- a/libde265/sps.cc
++++ b/libde265/sps.cc
+@@ -425,7 +425,10 @@ de265_error seq_parameter_set::read(error_queue* errqueue, bitreader* br)
+ 
+   vui_parameters_present_flag = get_bits(br,1);
+   if (vui_parameters_present_flag) {
+-    vui.read(errqueue, br, this);
++    de265_error err = vui.read(errqueue, br, this);
++    if (err) {
++      return err;
++    }
+   }
+ 
+ 
diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
index d0ecd04f16..a9d5523bb5 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.5.bb
@@ -8,7 +8,9 @@ LICENSE = "LGPL-3.0-only & MIT"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=695b556799abb2435c97a113cdca512f"
 
-SRC_URI = "https://github.com/strukturag/libde265/releases/download/v${PV}/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/strukturag/libde265/releases/download/v${PV}/${BPN}-${PV}.tar.gz \
+           file://CVE-2022-1253.patch \
+           "
 SRC_URI[sha256sum] = "e3f277d8903408615a5cc34718b391b83c97c646faea4f41da93bac5ee08a87f"
 
 EXTRA_OECONF = "--disable-sherlock265 --disable-dec265"

