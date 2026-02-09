Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EB7BE7E0DB
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 11:39:18 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.45588.1770637153572232370
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Feb 2026 03:39:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxYFXVMS;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so2346575e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 03:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770637152; x=1771241952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zy7Y6Zoiiq0QQYuG4tVvFjrMBUXRigrLYL5AD3hOtb8=;
        b=SxYFXVMSDVDLHMPB87RVpTfr1R+a/Vcud2l1Nr5shAF6+Kkcesr9Tuxorx7V80PGaQ
         LYoGy0GCSgND7M6/s55sDJ15uqlhCYKQFqkkHQeMD/dieSikuWxn/AOK94gfH4BTPhRR
         uJTGS+RTiWT8hjlXUxFMyt9SeXFzw0EE0VKDkMsR+zTCLbGg24juIN7NZ3HogfOJXari
         ODtvLQHvGwBbZUsiI545qerKknH2qZ4fn3cE/utWBV+GgiC1TltoEbBsFa0gEMssODwb
         gSKv4Iav9gPgowhiGARazpr2xRAAUvFqjBMB9VpZ49g80zeUyMVL+keDAEGrY4yXkp5s
         Vf2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770637152; x=1771241952;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Zy7Y6Zoiiq0QQYuG4tVvFjrMBUXRigrLYL5AD3hOtb8=;
        b=TseDxOABWwZOw9RjSiwu5rlQgYolBH6NDvOmJ1yhgU3a4m2fY2ShHtWaGthbfwMCqw
         WKVAHxYh3El9t6NqfRkCDHnWXp2knmwsRZKsmHiB7j8kT0hGIlYVD7EdNB1kW0DwGRcI
         rPnq6sFlLzSv1ZWjDxRaV/uWxJsEqrkQRPzcE4KDWcDc2vlGBwtTGtjeXGuOngqN4qpX
         tEMUfjgndOILTz8oK4Y82TfzbODgTZdtQ837s4IlTm5CtyGNpNj0Hxuq19nSGwc5hqlu
         vrxBpjSETcRerX/LwUjVm1WywIGmWzyQuBL+be+WLHs8JYoTfE79oRu5sO35n7st7vnU
         NCsg==
X-Gm-Message-State: AOJu0YzNkDLiLD41QCbH5v7uHBCd5LNfdJxmzl9TTlm9umSEY7GEmpTw
	cA4XM2mJJU1PzTl499enHz7zTE5uB2ByfL6l1QsRMp7zrNVSE8QU4IluZIFAoQ==
X-Gm-Gg: AZuq6aL5n2IRBLCfMUvzTax6oIjv1bf1rLvq+iIGcj63ct7GIe+6YMnsnCy8DS/xYuH
	IDDzqgxQUN9jOHD31Q3159jsEx1z5P4znCelgkXPwf+FJpE0GGIByGYGsr+MpXU0STW05DaRS7y
	Q6kvsWS/U35FLA4m/dKWEvXD/KL4g7JOw9mYt2HpiDR/qbmeHqJ96TMmiQfc2BvZ23peXTs+HFN
	TwG6IRWZj36wQvq0/K+g2qILk16TruRLpXo5LU210xF+iCXgyp7mYOfKR4mo9oaN/LqwLagSmDE
	b0lVYZtaRuG22MfYWTvmBSZVOqvjc56Onu1UkRbUWSHqQh93SnW/yHmgn/87HmBSSd+oVa0bxxF
	YFld/8l23Ocal2p0gisxUCCLCMvvrHu2UkWYlS4zQzvVNrwuc4dFlelZXB1r871awrYJVWbu/Ap
	iXxPqlzVjq
X-Received: by 2002:a05:600c:4f8a:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-483201dd051mr157322495e9.4.1770637151821;
        Mon, 09 Feb 2026 03:39:11 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834304232bsm56030375e9.2.2026.02.09.03.39.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 03:39:11 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][kirkstone][PATCH 10/16] sox: patch CVE-2019-13590
Date: Mon,  9 Feb 2026 12:38:57 +0100
Message-ID: <20260209113904.3442496-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260209113904.3442496-1-skandigraun@gmail.com>
References: <20260209113904.3442496-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Feb 2026 11:39:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124305

Details: https://nvd.nist.gov/vuln/detail/CVE-2019-13590

Pick the patch that was identified by Debian[1] as the solution.

[1]: https://security-tracker.debian.org/tracker/CVE-2019-13590

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../sox/sox/CVE-2019-13590.patch              | 34 +++++++++++++++++++
 .../recipes-multimedia/sox/sox_14.4.2.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch

diff --git a/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
new file mode 100644
index 0000000000..4877ba8b53
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/sox/sox/CVE-2019-13590.patch
@@ -0,0 +1,34 @@
+From aa8f02729962a0ee5e9864de90871fa821f262be Mon Sep 17 00:00:00 2001
+From: Mans Rullgard <mans@mansr.com>
+Date: Tue, 4 Feb 2020 12:55:18 +0000
+Subject: [PATCH] sox-fmt: validate comments_bytes before use (CVE-2019-13590)
+ [bug #325]
+
+Cap the comments size to 1 GB to avoid overflows in subsequent
+arithmetic.
+
+The missing null check mentioned in the bug report is bogus since
+lsx_calloc() returns a valid pointer or aborts.
+
+CVE: CVE-2019-13590
+Upstream-Status: Backport [https://github.com/mansr/sox/commit/7b6a889217d62ed7e28188621403cc7542fd1f7e]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/sox-fmt.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/sox-fmt.c b/src/sox-fmt.c
+index aad965c..11c8877 100644
+--- a/src/sox-fmt.c
++++ b/src/sox-fmt.c
+@@ -46,7 +46,9 @@ static int startread(sox_format_t * ft)
+       lsx_readdw(ft, &comments_bytes))
+     return SOX_EOF;
+ 
+-  if (((headers_bytes + 4) & 7) || headers_bytes < FIXED_HDR + comments_bytes ||
++  if (((headers_bytes + 4) & 7) ||
++      comments_bytes > 0x40000000 || /* max 1 GB */
++      headers_bytes < FIXED_HDR + comments_bytes ||
+       (num_channels > 65535)) /* Reserve top 16 bits */ {
+     lsx_fail_errno(ft, SOX_EHDR, "invalid sox file format header");
+     return SOX_EOF;
diff --git a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
index 917d1db1f7..2eb3adbf97 100644
--- a/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
+++ b/meta-multimedia/recipes-multimedia/sox/sox_14.4.2.bb
@@ -38,6 +38,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/sox/sox-${PV}.tar.gz \
            file://CVE-2017-15372.patch \
            file://CVE-2017-15642.patch \
            file://CVE-2017-18189.patch \
+           file://CVE-2019-13590.patch \
            "
 SRC_URI[md5sum] = "d04fba2d9245e661f245de0577f48a33"
 SRC_URI[sha256sum] = "b45f598643ffbd8e363ff24d61166ccec4836fea6d3888881b8df53e3bb55f6c"

