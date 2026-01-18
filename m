Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCBFECA5FEC
	for <webhook@archiver.kernel.org>; Sun, 18 Jan 2026 02:30:40 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8226.1768703431435583557
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Jan 2026 18:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VpvmrYjY;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a09d981507so23541405ad.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Jan 2026 18:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768703430; x=1769308230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dvEZENB8mu/kgFamj2wD/9fEjytHgWxMuz4QlnU73vE=;
        b=VpvmrYjYgPQGM+F3EXi/1bkdT+rgiFvBfrUtgeAgxHurEZi4g49/7y0BwGLsr4NqCo
         P9EkvHk3qnBikvaAPpYKDVvPn9VQX/6pWeCpneaaA7AePQIfn99xXYr2umvejuWlVUia
         f5kt4PqxjrNEu9OYe4EprgNXdcD7vs/RII5wLdy+//k6Ic2duJYhB+ZA9bhPy6CrTX5s
         Vvz+LqZKH2vXce8F4PnoADvAQAlm/Snq6w9+Je+TmmaqKLL6NmM1Q3ZuamLXfk+P1J+z
         MwCcmsAWWN/9CLausNoecQkvrp5KCAJZGEwG3n6ooQ8kSHW3kxm1tt/fDOIahsLF+WVH
         ++NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768703430; x=1769308230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dvEZENB8mu/kgFamj2wD/9fEjytHgWxMuz4QlnU73vE=;
        b=eVgGhTwW6oj2Jym9sVJ9x9GDwIZjVqf9udvFIUTS0FlX60WZ4LJqnzOu+aWl4Hs+Dg
         ZIhhZwYT1p6xBBc1JV6uPrjd/isX5cGDARInmIOj7Jrz8Yo4hoI3Evv5oAVRRXFnY6vb
         td7GoYFcuMKTVO02p0D7iC2P22PzeQ5mZVPz2Q0v1Vop6cRGk4LzbRS04ACKRJSFeoI8
         VYQ7J1D53F8m3dlqmcK9nQHpjQdLXY+DHUG3+vN32IYV7kjtI8s275RCLWpEqasU/5Uy
         21wcXGFQLvpLdlcO89YEruQGebQvjGjsVeisYBuQul1QR+HsUg1Dj1Hxo0eirGK+poUu
         ylcg==
X-Gm-Message-State: AOJu0YyGp7YIUlffMR1M3+OdiSOzD1KdcP/xlEeWSIiqcZdeeC6DJZ9t
	WSGpW1jzGXQVrnA2reIG1ct6xqie2Fiv00VUxPWQeThMx7Le6juRaHG5UddBnA==
X-Gm-Gg: AY/fxX7MLoN7o2PUUUwRDQj2E376xrCX0k0Mu+hAaZf7EopU+ajrqX67DGRrtrS73B/
	+wULp7q7JypEqc6cL0LQY0CMG08/AYS/mLE3Qjtpvu5PcyL5Pj0sktChTGjuq7ZSsHf6p0eiYoD
	9+fXCt0JPFMtPTdrf3J+tmTE98JK4Tpm3ANXHNHPTSy+MqFu13WSGVrDfNXL57NPDJvaEGeyfSo
	xltV116osvD8VEmgk/WKjcdco9kXIPOq6Kqd0hICM2ml2ieGncY+MP4aTPaZ0W7RtRcOaxtRFbb
	s9LiqrsNpKPCN0giiNsjdiYIIREnAmdNLYBnYnmucook7DPsAeQMIqMvewxEVBMT0lkcd06H+sA
	krMqs7p42DtNM10SnjVaKjX4ll8qw3snVDglzbmHr8b1nk9qaKbCZqW8vJcItJYiB5WnMk+Ax5t
	lm5O4UeVW1Bfk38nhQm+1OprnMG8Oku8YePA==
X-Received: by 2002:a17:902:c408:b0:2a0:9a3b:d2a4 with SMTP id d9443c01a7336-2a700990d72mr101198495ad.10.1768703429983;
        Sat, 17 Jan 2026 18:30:29 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fb998sm57414415ad.69.2026.01.17.18.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 18:30:28 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][scarthgap][PATCH] fluidsynth: patch CVE-2025-56225
Date: Sun, 18 Jan 2026 15:30:21 +1300
Message-ID: <20260118023021.1130772-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 18 Jan 2026 02:30:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123565

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-56225

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../fluidsynth/CVE-2025-56225.patch           | 25 +++++++++++++++++++
 .../fluidsynth/fluidsynth_2.3.4.bb            |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch

diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
new file mode 100644
index 0000000000..6398e9970a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth/CVE-2025-56225.patch
@@ -0,0 +1,25 @@
+From b2a3432639798270b46f0a35c7e25196978389b4 Mon Sep 17 00:00:00 2001
+From: "Tom M." <tom.mbrt@googlemail.com>
+Date: Mon, 14 Jul 2025 18:13:38 +0200
+Subject: [PATCH] Fix a nullpointer dereference during legato mode (#1607)
+
+CVE: CVE-2025-56225
+Upstream-Status: Backport [https://github.com/FluidSynth/fluidsynth/commit/45f2a79f4265dcc4f98cfbafdb10727fb1c0d411]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
diff --git a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
index dc05832e80..550d1b6650 100644
--- a/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
+++ b/meta-multimedia/recipes-multimedia/fluidsynth/fluidsynth_2.3.4.bb
@@ -10,6 +10,7 @@ SRC_URI = " \
     git://github.com/FluidSynth/fluidsynth.git;branch=master;protocol=https \
     file://0002-fluid_synth_nwrite_float-Allow-zero-pointer-for-left.patch \
     file://0003-Use-ARM-NEON-accelaration-for-float-multithreaded-se.patch \
+    file://CVE-2025-56225.patch \
 "
 SRCREV = "5ecdc4568e45123216c6888892caad07918ef127"
 

