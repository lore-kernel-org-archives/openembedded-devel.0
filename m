Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30A7D25030
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:00 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27572.1768196092385210602
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:34:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fUAPL3Fk;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7c6d1ebb0c4so4606145a34.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768196091; x=1768800891; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y6gwFes/mGiySPXJZ4Nl0hDP/hn2Y/G+/YMor515+uU=;
        b=fUAPL3FkSMKvtQKfIgSYzv9iMBbJkDiPXOCc70GGUuCnx0wM3XlCr74oTW1hrWZPBr
         BX4KpGciNyCkBxszCjFPNWqaV4DhuykalbYC9cKraP1r0GbE+nxhM1/0xsWBkse/S62L
         W62U1HeBT6D24MK4OS7JrJ/CfY6UcTvgZJODa7nesMTel4gK8Am4VW2njf5pHpSTwcxz
         Zl7p4L5RsvXdfEdKSGP6oQK07JsI9WNTSHBbZUCNjt8DCzdla2+WEyqG4BcwNb8kdfDi
         YQItPw0prOIhkLAcsCeoZ6ETCpZ8NDq1nNNuIYIS9wdI6RnLpF32OU4tjOFrUOXakFCF
         7Fug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196091; x=1768800891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y6gwFes/mGiySPXJZ4Nl0hDP/hn2Y/G+/YMor515+uU=;
        b=rM84wDmNo4ZqRpWJmQwN2LqpqZAlTzAmY7KbHDUD1ydgGi7ifZIatM8Gy2DQVLSAyz
         4dnBmU5TIqZDxDSo7FNUHWjMEJ6tgWNk/6yxz4LQHu6iPLHR64aQb8fg5KaxqQcCSZf9
         OHoZO6a1AefLMQt5FYkesz8eW1MAp34ctIWKQg41Ukn4T8gOERoEhz7XK8yQt4wQHSjP
         dsYYbNP09CSA0T7oEixhTqHIrXXnD9+WLRLduKQZku0M/Hsoj2ZyzUPSS+9622TVyTWW
         iEGqFR/jVPwru2eBOzE4C7/VY57peMPiOW7GNQgNHsdGFFFgu0Mss7yI5eAzNEqMNsYI
         TSrw==
X-Gm-Message-State: AOJu0Yx3G1JoY/DDr9WdS/hWgNFoHSbmJRkVZ5QfhY249Tn/ALOcFY4E
	yAdiRA5v8fxooc9EsSRKUURy50GLN+MHxhLi8GWbJIlWv77ohj9Mxa6h6GcZdQ==
X-Gm-Gg: AY/fxX4Rf9p6m59Zc/SF1vyuPZiOTCedtAE+Q8wUvWP/YEiSZRh3WPOL4We96IXZDuy
	dUtYfDDjyBhKgQiXXp9cFBn/JDEIjk7ShFBcu1uFZBT9iPi1sgfkdIo0ztbd5tKxmCPBVH/kQDo
	6OiuWmHICie4Dc803wa+Vi52UeJkt+nkmZ+qKakDjd+1v3cp5YExudBTU5qzDZxSMIZYmxILNyA
	WEH/gzD7x7l7EoBI6By1jxP5s5CcQ+E7vP5vrRVnn86mGCeY033fqg0okWuw8xry4wo7SxNwqax
	teEk60KXPJMDcOcIZYbMA+AeMufPzSi53BSyxU6BHWGIlUe1x6Zm+O3sZxt2X/WH4Av1fQ5jBdN
	XPRVwazyw3eNOeZU6GsJZiszRQFNXUUnz8gPWK6zlr7wkKrkmCcf6qaLIvCZNCd6SvL20TnlMjk
	prvMRf8VQJNe6pW7V87Nj5T38=
X-Google-Smtp-Source: AGHT+IFEKX2UBOZkMKaLTPoUGTon9pj2xKvYQL9qyLIBG/3sGo18Vv9h8dN8A22nz8PbSr+NuM2HCQ==
X-Received: by 2002:a05:6830:3c1:b0:7c7:4f2:e15d with SMTP id 46e09a7af769-7ce508f9056mr10932835a34.16.1768196091450;
        Sun, 11 Jan 2026 21:34:51 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm13038512a34.23.2026.01.11.21.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:34:51 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][scarthgap][PATCH 2/6] gimp: ignore CVE-2007-3741
Date: Mon, 12 Jan 2026 18:34:36 +1300
Message-ID: <20260112053440.3694238-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
References: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:35:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123351

From: Peter Marko <peter.marko@siemens.com>

NVD still tracks this CVE as version-less, so explicit ignore is needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 34b5b89180..32b51dcdb5 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -70,3 +70,5 @@ do_compile:prepend() {
 FILES:${PN}  += "${datadir}/metainfo"
 
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
+
+CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"

