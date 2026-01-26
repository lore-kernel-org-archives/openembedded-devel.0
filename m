Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2792CD13C0F
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 13:05:17 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18915.1769432712177811997
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 05:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eIMKkflA;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-435a11957f6so3705281f8f.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 05:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769432710; x=1770037510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U9yxDQc89QQf+pNKq4HjvjL3RQR2qzHajlztEixlC3Y=;
        b=eIMKkflASLQWAdQgANfTW3aCE5KZo/XA7dzlB7bdPNvwExW1kDkNAFYjyj5JZidK2B
         PtFT9PF8Uvntd0KS/CBw04bCcQ30slVHTse8XRai/vdwGl0T24gmPYpupOVU7cvq7IyC
         IuJopu6G+iG5nmdS/zsnuFC60zCe2mvueIPcQcZx7l8/CE0jBEzBydTrMSq+pKEWRizZ
         6AC7s2U36BtkzJ4RMim491oJvBzBIfzF2rII5pvz2KMmDlO45lxbkbLbgWcjj5pdx0Cy
         Wq8h/b+MzW3ZX9XxGB6Wi4XPMNcNL3QOqVF7mShyFboGPq4EEm9ElD27FY2CozNoyWeg
         I7ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769432710; x=1770037510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U9yxDQc89QQf+pNKq4HjvjL3RQR2qzHajlztEixlC3Y=;
        b=HjjbHZSqjtCk7aVXLbNGSeb/2Zg6ixnANrktNcMiu/cq5AeOna153yVTJETBb+cSXJ
         owd+rGna1SalCcwweUj0HS8sC1JBibeIxs1KK/ZqjHyOiBrTRgLo4g+Gkeo5mxDt7irk
         bDf3YiKHo3hhAu4iWH+19q2V3KzmVdMwtHWct/Cn3Dg/j+SDev4iBL1/3WeEGc4lB1nf
         rXm5MT0As6P4mmhuhOtRqQgodbpqW894/3VM3C+2k31eIopwdCK04UaJ/Ianzc2PLuhq
         67wVP0AqvtL8mLQd52Y/EULHAGlbkcHsbkgvR14meNkzVL+s1JGP7Yzjefl1iyUTDZxf
         8T9w==
X-Gm-Message-State: AOJu0YzHLkcWYfj5p4LCxOfd1xhgIukYZOkeblnZmNrgwjtOcumd0E7V
	uIWhYgMXsxjS10Q6jpCSJRVHxUIforYEMgt1Q8lyG4aKDzYckizIp6Jr/wxfMg==
X-Gm-Gg: AZuq6aIGYQV2WYOIV3u+iqEUqGoHt3wC8euLODMqMDEFir+rGzani0cBUCwQwmIdQAW
	hz/xrHOFOzl2F6YaXN761WgM2PyLSlfyUL6lju29dhwH1jvRb1Kc+oBl8KyjmX9u6bgCocTRT5J
	/IPw0lz46FXxeJekVnSkmUzcl01ko6SEcKw8y3dzRRAaMqXgPWVUBV+ys1V8Qz5929QRfaqNrzh
	TxqWSA2ZWNalGH8h5fVUV7fdhwvJIkOQEBND2Kphbu6l2akyYijPpF4SmqbYZ79TuQIoLIfJs85
	Fwxi0oEbBGwqNYEYzIdAvG6qLXQNM0rnC7YGfZp4urywatmrNXVUnI2tRr7MWiBq6OvdZFaX5oi
	13b08zyOY/WhrQ482AJ7Y8XGN3QQZq2c5eYycBveJHpINsrXCaMEABKYU6W4SCe0OH0dJcZcIda
	qFxbXXiEim+NMAC4sNVXk=
X-Received: by 2002:a05:6000:2401:b0:431:62:d946 with SMTP id ffacd0b85a97d-435ca121886mr7237140f8f.23.1769432710341;
        Mon, 26 Jan 2026 05:05:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24b54sm30897978f8f.15.2026.01.26.05.05.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 05:05:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][scarthgap][PATCH 04/11] sox: patch CVE-2017-15370
Date: Mon, 26 Jan 2026 14:04:58 +0100
Message-ID: <20260126130506.82699-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126130506.82699-1-skandigraun@gmail.com>
References: <20260126130506.82699-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 13:05:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123881

Details: https://nvd.nist.gov/vuln/detail/CVE-2017-15370

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2017-15370

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2017-15370.patch              | 29 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch
new file mode 100644
index 0000000000..39a18ebd9a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2017-15370.patch
@@ -0,0 +1,29 @@
+From cd7a008958d208345de04c7b6306c79a8a933f32 Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Sun, 5 Nov 2017 16:21:23 +0000
+Subject: [PATCH] wav: ima_adpcm: fix buffer overflow on corrupt input
+ (CVE-2017-15370)
+
+Add the same check bad block size as was done for MS adpcm in commit
+f39c574b ("More checks for invalid MS ADPCM blocks").
+
+CVE: CVE-2017-15370
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/ef3d8be0f80cbb650e4766b545d61e10d7a24c9e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/wav.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/wav.c b/src/wav.c
+index eca1cde..fad334c 100644
+--- a/src/wav.c
++++ b/src/wav.c
+@@ -127,7 +127,7 @@ static unsigned short  ImaAdpcmReadBlock(sox_format_t * ft)
+         /* work with partial blocks.  Specs say it should be null */
+         /* padded but I guess this is better than trailing quiet. */
+         samplesThisBlock = lsx_ima_samples_in((size_t)0, (size_t)ft->signal.channels, bytesRead, (size_t) 0);
+-        if (samplesThisBlock == 0)
++        if (samplesThisBlock == 0 || samplesThisBlock > wav->samplesPerBlock)
+         {
+             lsx_warn("Premature EOF on .wav input file");
+             return 0;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 18ce9a95d0..ae5d6d2010 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -33,6 +33,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-11332.patch \
            file://CVE-2017-11358.patch \
            file://CVE-2017-11359.patch \
+           file://CVE-2017-15370.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

