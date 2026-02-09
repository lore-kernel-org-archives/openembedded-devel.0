Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 888C9E81BA1
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45787.1770637149167237408
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gCs/5XUU;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so32976565e9.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637147; x=1771241947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQdeeDbHbV4ttVEoCkPRGDYNmC58CYBExzwU7eS7XJw=;
        b=gCs/5XUUJziQWc29YuhZrR2z5d5uJdjnBGpv0PgJeZo5VwyAUtmFV4VL6XDD6yvHLt
         idnBkEZOYNFG+oiaokb24yJJziMERlZiFume7O1x8CdQhNXvcEIZ8TGTvnsu9ZA9tGnT
         kEyMwLQoAtOqMfy6uxpseVBmL8L/P+ytJKQIxnmN1jNCr9bJhcm94ig4aFF79ExQwqGS
         0d9TTMoNs/g/pg0poGmmwZq7yfG8b879YOk3iqxan0SUBQqJ0lNrKyHtLqlNorL6bWZd
         RgkCFbh+cp6iHw6cu/RJKuRUTVx+9ZQzGGpeRmR2qeCSMGphuOBk5PD9uT2XUObxlie2
         2r8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637147; x=1771241947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gQdeeDbHbV4ttVEoCkPRGDYNmC58CYBExzwU7eS7XJw=;
        b=riffyYzARkMO4wZ4BHRo+e2Fl0NFIktWP/fJy/I49B1LBYnzlDNDObVicK0YrHj4vM
         TLLw1dmsMgrTY7c3a7zaeawgzRp17iyRm8plj7SFuSzIR9e1ahsCZyMVs6vJQYTU7sFF
         Ijeg311ygQ+e6dq2z9db71MQGC8+JoKSK0NyKHj3fYn8l2+b4o2sUdnStAP7OuipTzmC
         LmLb/LOSQ8T59VLQMxD+tM/0xhjJHogSJGozGjZnQbSFAOIE0nvVbvzmCscXfLKSdoe1
         uN2h1uqz71ZsdgkW1oce4G0KlRvce6mnYHsa7qFCiMBrdVaWcSYdIcEjmx7pFAnSVPux
         jAsQ==
X-Gm-Message-State: AOJu0YxnZgZRgDteHRpC+1F5KfpT75ELX36F833ycmK2UKmkXPvBIFyQ
	ijr1bgd+/jtSfJdYYuL9WwRn5OORK0w0PF5Vc2O8/V0b2/sIlrxUYeORyvOazA==
X-Gm-Gg: AZuq6aLpk8xDfY4iYUIsmbSpXD0O69xYz6nZ1GM8NFoQRbRIJy3IYL504VuDTeO75w8
	1LpmrtOKra5g1kgcvcGpILEkjVzGCYCGpyht+UyjAq8BuThzFJG5bnIk8sFmgGkQk6OO9TM7x7Z
	xvYnlrbsHpSeobrf+NglmpT4Q0NlStn2vXA0optowFI0BWcYrVEeomTqPVUzEY7XNez3m8TP7Ti
	hMH4A9NOF/jFehwUcCX/hPgr0eE/uw08K6Pw0a6TnKVStGX0olNTM6zg3hw6g/Umayw3mh8dQ+l
	MRj59/iHogk+tQ/qmIXV0w9w9xFL5f+ZgpeOGuNIQ3K7Y6VyYi4EM+DkDOwpyvqy+3Uo7WfIPry
	qqba1OV0YysmOnWXOtJKiuwGTrJ4XfjMZd6CH1u6cjvCEECGDpW5waOTXTHAmPJYImJCbSq8wKY
	IQei/AppQyjQcxLc22o3o=
X-Received: by 2002:a05:600c:4750:b0:475:da1a:53f9 with SMTP id 5b1f17b1804b1-483201dd2f4mr146166195e9.14.1770637147403;
        Mon, 09 Feb 2026 03:39:07 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:07 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 04/16] sox: patch CVE-2017-15370
Date: Mon,  9 Feb 2026 12:38:51 +0100
Message-ID: <20260209113904.3442496-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124299

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
index 205b11b506..43b09a8ff0 100644
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

