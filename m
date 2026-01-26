Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84148CF65E5
	for <webhook@archiver.kernel.org>; Mon, 26 Jan 2026 11:45:16 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18227.1769427912802612708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Jan 2026 03:45:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ESx38B/o;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4801c731d0aso34713445e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 03:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769427911; x=1770032711; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJgRkuqzNXF8Z2tJ7ufy7TFjCucC49TjnXiKipGVKEc=;
        b=ESx38B/o8hnIVVq2MY+y7s8Nohg69BtiNliQq3lty8o8B2pF3/a2Nv5hGH6KM7o4lI
         wBtFOJDiLr8XRGV6a0VqWQva0Z4hkPmiRilF7EAD3Rf8TQ7lGpPvAeNUrY0mtqj2LhpW
         OybkVOS5pPY7Rq5cqRVBm2bQUijI9/+Y+rjsPpg0sKMUcyPujxTEXyXLyVOK1v3GGGxI
         PPaxEoTfeKEiMEPddwrzLsh+I+9yQUS3BSyE8AfccwABAHVDy9NffF4SFrGRKIbUiumj
         WGozfOxH6s1QmC1rTyy1W/h5gL9PO/uTWwNnlULHu31Kv0Qyf8zn7/KxVevNSqC0a11O
         ZXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769427911; x=1770032711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jJgRkuqzNXF8Z2tJ7ufy7TFjCucC49TjnXiKipGVKEc=;
        b=dd5OK4YUzjA6csxWDaEAwTUVEp8RbM9o5Ot19omsZCZDJl66l9CDW6ziFdaqjYXZu7
         8NBnB+pot9RMGIjnE6TDy/3AQw9bbMKWS37JZPrataF9+JTvn7Hzukmi9qeC62MWKjTp
         LHO9OhU3CGX08OCigY+KLLMgwirfkfksmS/SXcpDeP0UnWmJts8zMhz7ojtLL6BDgRXI
         tD+59j9SZ1sSEE4Izm2RBCnPkr5yqK+AMRDK33ouYLABNhjP1hrO0t/6MIH1OrDMYqrI
         WfQfz08IhAMIpaXeVWMHNvq+RK6h19SLkuzpT0m/5Bk44BBGBLqhruycIqvRK5bzsRWo
         Uczg==
X-Gm-Message-State: AOJu0Yx+Vyj3IEh1JAcZDhRw69/dPoubz9PPrhyjrEjwK+qmVvVtBM0a
	xDN33EAbmWM03UWnhIHaZezWzf+Zw1mGkH0lMW9UC9pl9go+SUkSk7zZsgfAdQ==
X-Gm-Gg: AZuq6aKQtj5KdEJkdJMHjS12lmjubTv7ABpxEOoKod84b+Zp4HyLoRN9coBRBnTKAVO
	pSPSFjMgJ6ztPcZNwXcn3CfSBaAuCSNeSDdtWqYxPvW7HnzvxQXx97NsS+h/yZEzrxIfyiJYoW6
	pfVVEWYhbvrhjWAioIlXySLv0LsuLr1lsSecOBnpJbJTKHuAG9b16mKltCCnt0UNzwmb8IhfkFj
	emOJgQmz27G4aa9Kd0yIv2881FesKODzSI7X2M5FtT0KjBwZ+PQ6m93kJCB9HKd/DBetoEapmCl
	f2Ov/jKE3AdQk5LpTL37NjLzv0GVvJPLfcaTmEbmDtceDIS8k9g7DSL/s1e5aipOhdnMmAN6TPI
	b5m4qRTHPHiGRtwYUXoIDqrqmF0pHGtdKC49HBzQaUZ6KO/PDYECBo8Lvf8+9OyI5HvstC2mlL+
	d02FIA04fX
X-Received: by 2002:a05:600c:6290:b0:477:89d5:fdb2 with SMTP id 5b1f17b1804b1-4805ce3f888mr63747195e9.14.1769427909630;
        Mon, 26 Jan 2026 03:45:09 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804dbd4630sm98454055e9.17.2026.01.26.03.45.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 03:45:09 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/4] fontforge: patch CVE-2025-15275
Date: Mon, 26 Jan 2026 12:45:04 +0100
Message-ID: <20260126114506.3846753-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126114506.3846753-1-skandigraun@gmail.com>
References: <20260126114506.3846753-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Jan 2026 11:45:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123873

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-15275

Pick the patch that mentions this vulnerability ID explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/fontforge/CVE-2025-15275.patch  | 34 +++++++++++++++++++
 .../fontforge/fontforge_20251009.bb           |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
new file mode 100644
index 0000000000..d3d00fd9ac
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2025-15275.patch
@@ -0,0 +1,34 @@
+From 8aed4d992db246a537d07862f31dd04698c3f7e2 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Fri, 9 Jan 2026 16:58:23 +0100
+Subject: [PATCH] Fix CVE-2025-15275: Heap buffer overflow in SFD image parsing
+ (#5721)
+
+From: Ahmet Furkan Kavraz <55850855+ahmetfurkankavraz@users.noreply.github.com>
+
+Fixes: CVE-2025-15275 | ZDI-25-1189 | ZDI-CAN-28543
+
+Co-authored-by: Ahmet Furkan Kavraz <kavraz@amazon.com>
+
+CVE: CVE-2025-15275
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/7195402701ace7783753ef9424153eff48c9af44]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/sfd.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/fontforge/sfd.c b/fontforge/sfd.c
+index 149941148..e19d3a30f 100644
+--- a/fontforge/sfd.c
++++ b/fontforge/sfd.c
+@@ -3585,6 +3585,10 @@ static ImageList *SFDGetImage(FILE *sfd) {
+     getint(sfd,&image_type);
+     getint(sfd,&bpl);
+     getint(sfd,&clutlen);
++    if ( clutlen < 0 || clutlen > 256 ) {
++        LogError(_("Invalid clut length %d in sfd file, must be between 0 and 256"), clutlen);
++        return NULL;
++    }
+     gethex(sfd,&trans);
+     image = GImageCreate(image_type,width,height);
+     base = image->list_len==0?image->u.image:image->u.images[0];
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
index 58f15ab396..fc3d001dbf 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20251009.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https;tag=$
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
            file://CVE-2025-15279-1.patch \
            file://CVE-2025-15279-2.patch \
+           file://CVE-2025-15275.patch \
            "
 
 EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"

