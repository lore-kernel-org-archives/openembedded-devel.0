Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71176CCA470
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 09:19:49 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web10.21083.1759223983206840500
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Sep 2025 02:19:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IuIVwdGT;
 spf=pass (domain: gmail.com, ip: 209.85.166.180, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-42d7ef9a402so458315ab.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 02:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759223982; x=1759828782; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szmoS9dC+zws+7quU3iesGV9YMYmhLX6EgBQQLCl8NU=;
        b=IuIVwdGT+pYarteRofKWaz8BnNLpBz0iLIBB8I0qR27gwsSNB+KveOQPgt7eTOqiFj
         ucw0QKK11QBE8AaZGG3ZVYS0FFRyc0plvF0Dw2Vo9HawFEzwWSvTAXeQn6YRqWbjgS6v
         QCir3H3TBwwmbeR/KP7/3zln98e8A6HxAkscb0ImKXyREU+gnefLXLpq32/kAXtAtOa9
         n8jGw32govuV7j5F5qEmLas9XuN4E5ayddMjbrv0GFmyRyqEoc5C/lHqzQdNAvsMdEih
         OZjEP6m5goDQ0v9RWn/9hZdFVu6EbKSzzYqOpb4j63YnUsC/0dJnPolApH+/yPMPQulJ
         a/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759223982; x=1759828782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szmoS9dC+zws+7quU3iesGV9YMYmhLX6EgBQQLCl8NU=;
        b=teN4gTakEzYFV+vQZXOTezkNfpRfOa0SJp1tGGYhtOXJSfAduL2Hv+NWOQ2Ir6sQ1X
         tF5H7nTwextDVz8zE//0+CSBsR47nwLdcQl5vfLjtRSlpCoSBk+GreqEMOGL90PS0eC2
         UBKSP7bpxtLZ30W6bHlhZr82VyJvjMs4N6ZNogwuQ/ax1BIIBIc6qSAfn7OUNT048YDa
         61E79gHTRrr+w1l0TA9lbYixFeqMfWYwRXIvsKI8kFchpxW6ykUTFmkCdowu3icqgOsv
         4X7ioapAGDu5hQ4DqvQvZmPAZDbQrpAePK96ujqQC/W1TcvuvLwsyFG2rA8ulGRyLhYW
         xZnA==
X-Gm-Message-State: AOJu0YxLxSECbCSUqJ8JnwsVumnslzTJQSfmA0hL6GTNxe5IqpOB+KWM
	dQDeIw9si8/Cu3+2VnnYYuENYc7DiqjUn68KxuviBKAPPetvYUdd6Naolx65wGCK
X-Gm-Gg: ASbGnctYA0MFzQ9FITsx7Z1MzauvoVTybKa483FQdelPZhBUtpT5/Ahr7Ntp/YMvjjZ
	Gf4wT1OoE8zztA5+sCpF4zTWJ/+760Q8yy02D8jW8H9Ojtb/e1BW5x0lnTywQA7PqNgKkgBdUkV
	C/FL2J8JQ27e8hg671QhsKX2hDH+jVp8vdaWArS/MmVeuhBwmk1xJhBkYIw3sLI5lnVRo5Y3NBd
	2bQUDjPb794zHVgO7UIQilzpTKAHIEENPH9bvqFvnQVKPejqJJyaTre7Xu6Y6RnH6iZWMaJEx1t
	Be4PhA/2cufh+oMkMx7AF8IdyJcMascRCTTdFvu7MpHaLO4A6oe0PhwFUdjpNBlNpLYLWreXmzI
	2+5O3rGKjD6Re3o0ZSHguhyG75zPpXhHf4biwbQd4nayjISoyYVFL/hu/SfIqxvcO8bZ8wUz51P
	s=
X-Google-Smtp-Source: AGHT+IFHawB2G/mnajzE+Sf7a1zpyuPLkyBEPodcSCWWUfJV8ZBl8pSPO+OMnPl4I6+4TuWzYNfDYg==
X-Received: by 2002:a05:6e02:5e05:b0:428:684c:b193 with SMTP id e9e14a558f8ab-42d0dfab988mr58474535ab.3.1759223982100;
        Tue, 30 Sep 2025 02:19:42 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.brunswick.com ([147.161.217.10])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5742a4afbc3sm1837064173.2.2025.09.30.02.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 02:19:41 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Zacharias <1475802+Fighter19@users.noreply.github.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH 21/22] libcanberra: Fix sound not playing on Colibri iMX8X
Date: Tue, 30 Sep 2025 22:18:40 +1300
Message-ID: <20250930091841.1693131-22-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
References: <20250930091841.1693131-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Sep 2025 09:19:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120073

From: Patrick Zacharias <1475802+Fighter19@users.noreply.github.com>

Canberra does not specify a buffer size, which leads to ALSA rejecting the settings.
By specfiying a buffer time of 500ms and a period time with a fourth of that,
an appropriate buffer size can be calculated.

This behaviour is mimicked from aplay for compatibility.

Signed-off-by: Patrick Zacharias <1475802+Fighter19@users.noreply.github.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 9d2dc82fcb598e17069855985c56952b1fec3184)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...udio-buffer-size-for-a-time-of-500ms.patch | 42 +++++++++++++++++++
 .../libcanberra/libcanberra_0.30.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-oe/recipes-support/libcanberra/files/0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch

diff --git a/meta-oe/recipes-support/libcanberra/files/0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch b/meta-oe/recipes-support/libcanberra/files/0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch
new file mode 100644
index 0000000000..b8ad041850
--- /dev/null
+++ b/meta-oe/recipes-support/libcanberra/files/0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch
@@ -0,0 +1,42 @@
+From 86488a7fc209ac08dd92c9d50a77e3330e7aedd9 Mon Sep 17 00:00:00 2001
+From: Patrick Zacharias <1475802+Fighter19@users.noreply.github.com>
+Date: Thu, 7 Nov 2024 14:03:29 +0100
+Subject: [PATCH] Determine audio buffer size for a time of 500ms
+
+On some hardware like the SGTL5000, not specifying a buffer size
+results to EINVAL being returned.
+
+This code sets the buffer time to 500ms and the period time to a fourth of that,
+or whatever is nearest to that.
+
+Upstream-Status: Pending
+---
+ src/alsa.c | 15 +++++++++++++++
+ 1 file changed, 15 insertions(+)
+
+diff --git a/src/alsa.c b/src/alsa.c
+index bebcc4a..ac26578 100644
+--- a/src/alsa.c
++++ b/src/alsa.c
+@@ -258,6 +258,21 @@ static int open_alsa(ca_context *c, struct outstanding *out) {
+         if ((ret = snd_pcm_hw_params_set_channels(out->pcm, hwparams, ca_sound_file_get_nchannels(out->file))) < 0)
+                 goto finish;
+ 
++        unsigned int buffer_time = 0;
++        if ((ret = snd_pcm_hw_params_get_buffer_time_max(hwparams, &buffer_time, 0)) < 0)
++                goto finish;
++
++        // Cap the buffer time to 500ms
++        if (buffer_time > 500000)
++                buffer_time = 500000;
++
++        unsigned int period_time = buffer_time / 4;
++        if ((ret = snd_pcm_hw_params_set_period_time_near(out->pcm, hwparams, &period_time, 0)) < 0)
++                goto finish;
++
++        if ((ret = snd_pcm_hw_params_set_buffer_time_near(out->pcm, hwparams, &buffer_time, 0)) < 0)
++                goto finish;
++
+         if ((ret = snd_pcm_hw_params(out->pcm, hwparams)) < 0)
+                 goto finish;
+ 
diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
index b6165c4fc5..7eac53ae90 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30.bb
@@ -13,6 +13,7 @@ SRC_URI = " \
     file://0001-build-gtk-and-gtk3-version-for-canberra_gtk_play.patch \
     file://0001-gtk-Don-t-assume-all-GdkDisplays-are-GdkX11Displays-.patch \
     file://0001-remove-dropped-templates.patch \
+    file://0001-Determine-audio-buffer-size-for-a-time-of-500ms.patch \
 "
 SRC_URI[sha256sum] = "c2b671e67e0c288a69fc33dc1b6f1b534d07882c2aceed37004bf48c601afa72"
 

