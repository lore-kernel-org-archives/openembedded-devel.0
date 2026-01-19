Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D166ED29C5D
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 18:43:52 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41796.1768848225922029790
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 10:43:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mdbuvZsX;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fbc305882so2582356f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768848224; x=1769453024; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=aUehaDG2Qae+/c6Mc1nJY/IpOevOSt57wUu+HQgdbmE=;
        b=mdbuvZsX1eEcxZVJrZDCgGkP8D3j/+mRq3gh6scM82HF4QBwU1mnTwPh3cvuRyq+4T
         uF+FhPDQKQM78+kfgg0txW+o2GlSxB+96KQOWYUdHbRhvvgtg6hlGRm+82s/llJ3KTjv
         RXqRzwQPESxbbxLyO4gPWL5HRpflXFK48xubp4ngRfIZynG8RTAlxsc03i6YnB1ym8kM
         AEfxNnIzkDF/MY6zGfS6wGKbjUjZ8JTCl+Pg5WJznxJmo+RI7FWyp7cqOLxBHNVLD4Wk
         sK4dYRwuEAIwRnfhGAmQxWWaHOTg5xvBu1poAZx47BqKThA68Hmc+gU5XMzmTbsFwc4Q
         DClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768848224; x=1769453024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUehaDG2Qae+/c6Mc1nJY/IpOevOSt57wUu+HQgdbmE=;
        b=OMJqg1aSbHm69cMGpleom7emNyAOmt2IUKJsrG3NLoPJZD9lFyuI7Gb6sy6nsjl5mS
         TFzTaoIdA1ySiWjPdPAhwm99yqyVyLy+SQhKiqt90yZolp7l4aoGOmKevueMl+0dukT8
         hyEOmopOeCkygAGs2K2p7Jqv/R9egZZGYUylh7Ib37ERfKb4jKVfhlAW7FHhJReFVyba
         efKWRF5PiJKGPmmtHrtLYuL3/3lj+ia1eDaHkuSyTuzfFZOlSiQApmaoIjAojn4dwOs0
         1AzhZZikD5nTeoaZAGUnit3oh3uAcBdeDx1HG4DRH6T2JLTRibDUOT4/mAzHIf/w0YRb
         5Yqw==
X-Gm-Message-State: AOJu0YyL7mFlFT/vJLgwDsDrtwNzcXkCpVLuvtswcoPXN41AJxpFZJl5
	9UkNiI55suD/1Y6ZaABL9625CyGdrLUoMAdeTBkeb4FGZ77+WsY1rZCAIA/Y9A==
X-Gm-Gg: AZuq6aIUz3IHK4JbCWZXRmYA5a9D4TW3RFVtV3lrBQ5a2F6M48pm8LftGrcun0fJcJ2
	w6X2s103cZeJx+snM9qsU+P10ajtbcVH3thzHw5oW2lkrR5/Tr7PPIlazmSydN0vC6XoyyDyNbI
	q5e/JGUle8tPgsYrBnA/mNHh8SDykuVaY8q+MeRq4oQ0xUtUmf+Ip2iKcgjyZkgLHw4gLL2gvYS
	5PXf/ObrwaKdYst6P0qVOF/zy/r7DI0pkS6Fot0hansl0A6juA4x3voYiTpXvHW7UvkJwdhTSaC
	miSgfByKeIkFb84+fpsF9L4Rmingwc2pH5QAPI/TUDxgLnqlJ/gsjL6/pStaMBn6iFd2qOIkucR
	Kp2sgz38aMkI1SnX7Na9TwTHISUP/lKjFzVeU1gt8znYoD5vizEI2upN/NfpOqXeIlScFsiyW0l
	3g5iLlGKJw
X-Received: by 2002:adf:ee0e:0:b0:432:84f9:95f4 with SMTP id ffacd0b85a97d-43569bbebd1mr13693179f8f.31.1768848224155;
        Mon, 19 Jan 2026 10:43:44 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43569926ff1sm24559135f8f.13.2026.01.19.10.43.43
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:43:43 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH v2] fluidsynth: patch CVE-2025-56225
Date: Mon, 19 Jan 2026 19:43:43 +0100
Message-ID: <20260119184343.785649-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 18:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123648

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-56225

Pick the PR content referenced by the NVD advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---

v2: instead of adding the patch  to class-target specific recipe, add it to the
    common .inc file, so it applies to both native and target versions.

 .../fluidsynth/fluidsynth.inc                 |  4 ++-
 .../fluidsynth/CVE-2025-56225.patch           | 25 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
index a4590d61a9..17439e570a 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth.inc
@@ -4,7 +4,9 @@ SECTION = "libs/multimedia"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fc178bcd425090939a8b634d1d6a9594"
 
-SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https \
+           file://CVE-2025-56225.patch \
+"
 SRCREV = "8b00644751578ba67b709a827cbe5133d849d339"
 S = "${WORKDIR}/git"
 PV = "2.2.6"
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
new file mode 100644
index 0000000000..a1de14ca19
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
@@ -0,0 +1,25 @@
+From 18ab31c1dad215188edf2bedc78be98a32492ec9 Mon Sep 17 00:00:00 2001
+From: "Tom M." <tom.mbrt@googlemail.com>
+Date: Mon, 14 Jul 2025 18:13:38 +0200
+Subject: [PATCH] Fix a nullpointer dereference during legato mode (#1607)
+
+CVE: CVE-2025-56225
+Upstream-Status: Backport [https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/synth/fluid_synth_monopoly.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/synth/fluid_synth_monopoly.c b/src/synth/fluid_synth_monopoly.c
+index d1de1319..6e6e2a90 100644
+--- a/src/synth/fluid_synth_monopoly.c
++++ b/src/synth/fluid_synth_monopoly.c
+@@ -410,7 +410,7 @@ int fluid_synth_noteoff_mono_LOCAL(fluid_synth_t *synth, int chan, int key)
+                 fluid_channel_breath_msb(channel))
+         {
+             /* legato playing detection */
+-            if(channel->mode  & FLUID_CHANNEL_LEGATO_PLAYING)
++            if (channel->mode & FLUID_CHANNEL_LEGATO_PLAYING && channel->preset != NULL)
+             {
+                 /* the list contains others notes */
+                 if(i_prev >= 0)

