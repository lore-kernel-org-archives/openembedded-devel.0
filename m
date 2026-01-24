Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3834D715DB
	for <webhook@archiver.kernel.org>; Sat, 24 Jan 2026 06:30:23 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14209.1769236216070629164
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 22:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e+Ae3HPv;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee07570deso21967605e9.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 22:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769236214; x=1769841014; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9yFaB9uobUqFYFclXT33ZgLJHGv499WWh+sjCff8NjQ=;
        b=e+Ae3HPvnwE2t/sALXPL8/4h4yP3y/A76hKDUNMJ35O9LpZf43JiEB6GNfNoujsDeR
         tVxhH8IXdnEB8jkeGgxbSzTbVycmb8UgjQYIfNvtYizmY9G4QF4n+kKwZAdPHlgHDCDt
         Jxksgtf2OlQMOmp8uuhPmHD6yZ7aUdARcqk1/Gpe65dxZDwUwCbI3Hfk4WJ8hJdrR/6+
         6nd8yxERnFivT+hZN1EHyT76AMwItjU3zZ8Hdepd4pk7CzVKwHzzlAYYA5vUIr75+Auy
         zIC6n87PRFb8Suk+A9VZOJXbW0tMvPNgWa/fqVlpaV7jGMyGHPbh3ON0Dpz6jWMwXHmg
         7cVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769236214; x=1769841014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9yFaB9uobUqFYFclXT33ZgLJHGv499WWh+sjCff8NjQ=;
        b=LVwyufAogOCRg1Pcsqpvd2TWjdqVdwsAnErY+Nmj6sxuqcOnYCAySOR5ZVVZSEiKap
         CQ7q5XJCLs+GtqGJPo8LDUv7k4SxzMjJuTe37A2DC2wciEkNX5wZjIJ6dwSagbqNxCI7
         XpH1CsCeHrl0RuvZ4vDvmEOaiYvCgElaQSIlMLF9Zn3XI3uXHo8kxPY4z/dGTyjv/jAg
         0hgym7jDbMMcxti1PdhHAd3wuKSvQjT+XUvRzWwCQIUH4wL5yU83VY3zurw2TqvUTNYV
         rcYOfG4LyEhsSk9cdfDOI/Jw87blKlP+JKj4w7TWFR1kpM+Fy8AP9sbTntOjnWqEYwkG
         QsLQ==
X-Gm-Message-State: AOJu0YzIHs+g90Bc9EUyHO6gXAj/YjrZaauptHXOGplEOpaIyKjy5W2u
	5SJ3Rv5ezWIKOLJMvPF7xwDzVQn/2CNibRQRAec3flA8/O9ZZUG/YKC1ZSdQIg==
X-Gm-Gg: AZuq6aLmYCxCwdWASL7XaJuIlMAuxQIKUI5UzIO+oU4q6mdlCR/vKEXamn9gikY1fP5
	lUNeftAsdp0VeHqv0yayWb+y8T348DjujPHYp/GQyi9n/HGVe9N27HsEjSlM+64SWXp0kTOu7wS
	8LeG7pH3KleHaxjM2koCro5UbM7x7dvslSmpXRi2YqKE56JwQrEX2062CJeK933sKNYyZqVNmrI
	om4ROWZioGId12J3FHIlyRsJVVy5CY6CsXsDTfoJw9ee26Idv/FZ102tVzwKUFOtdd2jA96d6qz
	p2Uxo+fUA1xB1UrvBp2BqlqtWHFphTAyyjwrFq/GxIliAKx1hvTr1Aqf70i75xyKbiVe4UVKXak
	un+SYPvPSh3OnYmeYEffIMIoETJT2Rt+uQ3Fqe4+GcAj9XDt2kMPwcP+YxwRIt/pQ5j3EFkDoyk
	BXTufzFdnRGgpF/LgPK54=
X-Received: by 2002:a05:600c:3f12:b0:477:7af8:c8ad with SMTP id 5b1f17b1804b1-4804c9cca64mr94072475e9.31.1769236214337;
        Fri, 23 Jan 2026 22:30:14 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm265354385e9.2.2026.01.23.22.30.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 22:30:14 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 10/13] xrdp: patch CVE-2022-23484
Date: Sat, 24 Jan 2026 07:30:04 +0100
Message-ID: <20260124063007.28313-10-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124063007.28313-1-skandigraun@gmail.com>
References: <20260124063007.28313-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Jan 2026 06:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123816

Details: https://nvd.nist.gov/vuln/detail/CVE-2022-23484

Pick the patch that mentions this vulnerability explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
(cherry picked from commit 2578e5c17d95cdb56e3d85cecaf541d7473122f9)
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../xrdp/xrdp/CVE-2022-23484.patch            | 31 +++++++++++++++++++
 meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb   |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch

diff --git a/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
new file mode 100644
index 0000000000..af27c50376
--- /dev/null
+++ b/meta-oe/recipes-support/xrdp/xrdp/CVE-2022-23484.patch
@@ -0,0 +1,31 @@
+From c2c6efb1d377be6baaa4acbc9d3700490fe92887 Mon Sep 17 00:00:00 2001
+From: matt335672 <30179339+matt335672@users.noreply.github.com>
+Date: Wed, 7 Dec 2022 10:03:24 +0000
+Subject: [PATCH] CVE-2022-23484
+
+Add check for RAIL window text size
+
+CVE: CVE-2022-23484
+Upstream-Status: Backport [https://github.com/neutrinolabs/xrdp/commit/c2c6efb1d377be6baaa4acbc9d3700490fe92887]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ xrdp/xrdp_mm.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/xrdp/xrdp_mm.c b/xrdp/xrdp_mm.c
+index 74b0516afa..4352625874 100644
+--- a/xrdp/xrdp_mm.c
++++ b/xrdp/xrdp_mm.c
+@@ -929,6 +929,12 @@ xrdp_mm_process_rail_update_window_text(struct xrdp_mm *self, struct stream *s)
+ 
+     g_memset(&rwso, 0, sizeof(rwso));
+     in_uint32_le(s, size); /* title size */
++    if (size < 0 || !s_check_rem(s, size))
++    {
++        LOG(LOG_LEVEL_ERROR, "%s : invalid window text size %d",
++            __func__, size);
++        return 1;
++    }
+     rwso.title_info = g_new(char, size + 1);
+     in_uint8a(s, rwso.title_info, size);
+     rwso.title_info[size] = 0;
diff --git a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
index f8fd052e7f..c67f2e83d8 100644
--- a/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
+++ b/meta-oe/recipes-support/xrdp/xrdp_0.9.20.bb
@@ -25,6 +25,7 @@ SRC_URI = "https://github.com/neutrinolabs/${BPN}/releases/download/v${PV}/${BPN
            file://CVE-2022-23481.patch \
            file://CVE-2022-23482.patch \
            file://CVE-2022-23483.patch \
+           file://CVE-2022-23484.patch \
            "
 
 SRC_URI[sha256sum] = "db693401da95b71b4d4e4c99aeb569a546dbdbde343f6d3302b0c47653277abb"

