Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CDAAFCA174
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 18:21:09 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21678.1773080463937944979
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 11:21:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OoAZEg0J;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b7c2788dso6138819f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 11:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080462; x=1773685262; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vECldKQh9dXafK5xmG61SPJGlm8iSb2XIlN1lCdKfWs=;
        b=OoAZEg0JJBqXgT4EUEy8VUuBkArIw6dzvDXb/EGFUacAzUHvyEckzxaTPdNfFpnn4+
         SBGL2aGD7jRNfAOZ5x6mdMrNR4o7Cwzm2DhmbUpPNkh3mTAoAtTsD5+4gn17Phj95wux
         rxOcLp9W6AWF3xwlE5FSiB3HIa+Zltux5GGP/9VYmEUwSuvIuzpw1cuJV2vNBhU6ZeiL
         8INkRHrK/adMT5MxQ5IqbfsGGX1VqswfowkCP15jVAxKeYrrS7ymFPgg5k9quQ5D/jpJ
         EVddELnVJojAYixG/Iw24qetKpjEqYxqKLx2e//BBV9tCakXWihaJBy2VXVSRubyx1ta
         X92A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080462; x=1773685262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vECldKQh9dXafK5xmG61SPJGlm8iSb2XIlN1lCdKfWs=;
        b=lCqokuJXVcNdNhnuGVAmj3GnUg46+08eyQthe1DjRPbsAWtC7sYxx/XftKvX4Q+JUC
         u7rUacG537HoTGkwcU8hJ+DXTI+SUkeRrTJV+Pz1YNlSLZyNAdw3zk9HfDqwgZltSYXN
         YLaqWlWBT0Vkof7vlEiSl6LhlHgRTSPu6O+i6MImFJzSt4gAbEi99p6zMt4nyXmb/v+o
         JX/4Av3URUPq1QvUfxRdnxL/xWL3YBv+MNpu6xjA8DAD99XsceJX4htcbh1W/FRlUHUu
         B7C+XZtg/UmN3jzfiMJWWHXYu3b1QUfG5eQXHo7w9KIVE94nRovG8WYVLd5Yzr03ag5Y
         nmsA==
X-Gm-Message-State: AOJu0Yz7mjYJSb4X8Sl8VgBwEZQF402BJS0TLl7V1jDvU4WHzbqUKo/K
	nKynYKq3kvHhqb06NI/+M5QJkelVDff9Y7NaZUhZHAmitPb+6lfYzYv6aaSfuQ==
X-Gm-Gg: ATEYQzzrejxbg51DC+7X0NhnRkyIZq76HT2dWUpp/mMIsgLHrIUHxbLl6051VqfyN8J
	0K7hdGncZwF+BmxybWJsIdBW/NiJam5GjTG/gWS6deoMdrLMonPToUB6kvTLq2aSwMEu7Kb0VZ+
	CIf5cTdrBRRMpplPvfYvqJVcSsl1voXqi6Axz3kS1v3t0avTyLWeG8wGsIOpTwY6Ljkd1UMAo5e
	2s9uML0pZ7IzaPuxeFgBE+KTcFiAPWeZVYCq+CrYD/FHQ1nHDcdDW13/uceUN3pTnuC6mqxhGxP
	vfGj/rFt9vYIjT4tbjelkfmlksUEqV9JUSzNGJMuvXyNhDWT4hVBO6bup9v3sgXcaQPyjX6lSGF
	5MFYdIVrXwY9yalW/aBRcpp4IOpzto6+ajmTqGEKQYwvnqJn/pfVSQi0U/ndCEijix1SahEHhUs
	Y1NRXAapHQkBbCtAGNNyAq
X-Received: by 2002:a05:600c:888c:b0:485:3f1c:d8a1 with SMTP id 5b1f17b1804b1-4853f1cd9fcmr32397895e9.9.1773080462208;
        Mon, 09 Mar 2026 11:21:02 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541aba60esm9379875e9.5.2026.03.09.11.21.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:21:01 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 2/3] gimp: patch CVE-2023-44442
Date: Mon,  9 Mar 2026 19:20:59 +0100
Message-ID: <20260309182100.717697-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309182100.717697-1-skandigraun@gmail.com>
References: <20260309182100.717697-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 18:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125003

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-44442

Backport the patch that resolved the related upstream issue[1].

[1]: https://gitlab.gnome.org/GNOME/gimp/-/issues/10101

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gimp/gimp/CVE-2023-44442.patch            | 28 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb  |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.patch
new file mode 100644
index 0000000000..8b51b35792
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2023-44442.patch
@@ -0,0 +1,28 @@
+From a4f550be80f2f771927e2df9ae09e3f3354d22f1 Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Fri, 29 Sep 2023 20:39:29 +0000
+Subject: [PATCH] plug-ins: Fix vulnerability in file-psd
+
+Resolves #10101.
+This patch adds a missing break statement after an error condition
+is detected to prevent the code from continuing afterwards.
+
+CVE: CVE-2023-44442
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/985c0a20e18b5b3b8a48ee9cb12287b1d5732d3d]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ plug-ins/file-psd/psd-util.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/plug-ins/file-psd/psd-util.c b/plug-ins/file-psd/psd-util.c
+index 5686bb7..8514b07 100644
+--- a/plug-ins/file-psd/psd-util.c
++++ b/plug-ins/file-psd/psd-util.c
+@@ -518,6 +518,7 @@ decode_packbits (const gchar *src,
+             {
+               IFDBG(2) g_debug ("Overrun in packbits replicate of %d chars", n - unpack_left);
+               error_code = 2;
++              break;
+             }
+           memset (dst, *src, n);
+           src++;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
index 124760651d..ff34bfa6fd 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.30.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://CVE-2022-32990-2.patch \
            file://CVE-2022-32990-3.patch \
            file://CVE-2023-44441.patch \
+           file://CVE-2023-44442.patch \
            "
 SRC_URI[sha256sum] = "88815daa76ed7d4277eeb353358bafa116cd2fcd2c861d95b95135c1d52b67dc"
 

