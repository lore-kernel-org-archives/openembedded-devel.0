Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAABCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:45:05 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.926.1762195500040675712
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Nov 2025 10:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TYsddz5Y;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47754547a38so2178765e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762195498; x=1762800298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=NqENmG0kWGFxHyoyTaw0pyXG7o5g8H8hhn8x8ZwOhXU=;
        b=TYsddz5YFe/QKmVVVdcy8xMDN+fozrpj5+swPE+OJqZFzGLq1dOYZUc4OS6zcxBg97
         hwFHkjutVs7+ieO1SlYE8mheishdyAbwHrlzD39MKxtyUnQW+UwOpj9TxOZ14L1Qsz1W
         g0qTvlo1Vat9fuGDdX6WAcMKHiVdjI/xu3CX/SXaRwrNe8sKtDZTkgfLjLgswRqej324
         bZBigeyzecNpoVR+mZn4XIQ1jGaxJdQRoyv5Fo5BC2wOcodyup4rbMVUe6ExGIfDrg8f
         t/YNm7b0qLTiLM2h/7nAS3zVk9AJX9b0qlFs/z4dDpYktIzMpJ8E3yOLsLkjx9WIA+8q
         z1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762195498; x=1762800298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqENmG0kWGFxHyoyTaw0pyXG7o5g8H8hhn8x8ZwOhXU=;
        b=Vn3+76Xm/XgtVTwaA4+VTqTIJEtic+wao+ju57wLk+9R3MPjL+hcRSs2g0k8/hc5He
         arfEQ1AQUCtFrTad/MHNl7VMD6hcgHFYDE28R9NfjXHl7vKJtVdo723P0DqajRwhrFEk
         gPOqHAcmBjYdi/x+A8iucrWE84b3Xs6/fFFEGp0rMvCX1VPSAR8LWSqM/MfTWud/QzSe
         HRK2RVMfP/LXZ/X05qmcM9D4WAcHptHm6G2Q1LuSiWSh/dO5fG/7JQZWirgbR49Yd/bi
         D/H0FNnO5+52OWWYfD2Lprf1tZf11KHsrDFD006TI9Q9k+I051pV5WayyU0aGiP3hhQa
         EdOQ==
X-Gm-Message-State: AOJu0YzJdtS2iMjNdZ7JRQJOo8C7jbIBVp/Q31rWHwbv3o3kL552eIVp
	ZTQ1TsRtw/PaDcQWFTvAm0j6EDgTI8DPJrKZZ9DyOSyBrYg1elXZv2HFdezj2yTx
X-Gm-Gg: ASbGncvIAJEK+uzsFGFqXaGYYztphdOC7vAqumF8jBeA9qYPYH3LOHeIWIF60UfpIUh
	jgj9SATFbWWNhR5wS23haJfUis23lNCBWfctS4Cccz4YLnY7jZFQlBhxQ50gFUfbX8rrUfzSLCA
	9uZtUkjdvIvLeBlloaDaji8ZSi2ukGJ3Ym9jsZ97a+ExPWotu5bZeERw3Ea9QZ+BRf1ngJpuaxV
	QlO4IYJBpqPS/KyyBWe9p1BrmK3kXnNJFzZMdZyjvKrHKaLmvj+GRzFskRvV7EP2BM9HwrAEZsF
	FFvNhBv+RoDkhhmmRzqJ8EA6ynaZa/bKU0zH8+TjS35m3DhM9St1COkUilmjjHei+yBKOelnqQM
	FWIL1oDowGfn++Pkw1GrOjcwlWo70KOQMQF518bi7RhZdfgzKzduXVjoRScvh3W3xGL/zgd9H9j
	yGlJhBDorI
X-Google-Smtp-Source: AGHT+IHfReqNwEC1YoCX6fKKZsF7DC/wi8PiNvCdUZe6v4Lo5wjIBaCM2E2f+UUYu6kePsaYIU+X1w==
X-Received: by 2002:a05:600d:8305:b0:477:54cd:200b with SMTP id 5b1f17b1804b1-47754cd2165mr2254785e9.16.1762195497945;
        Mon, 03 Nov 2025 10:44:57 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c394e33sm169629625e9.13.2025.11.03.10.44.57
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:44:57 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] imagemagick: upgrade 7.1.2-5 -> 7.1.2-8
Date: Mon,  3 Nov 2025 19:44:56 +0100
Message-ID: <20251103184456.3776808-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Nov 2025 18:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121280

Contains fix for CVE-2025-62171.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../{imagemagick_7.1.2-5.bb => imagemagick_7.1.2-8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.1.2-5.bb => imagemagick_7.1.2-8.bb} (99%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
similarity index 99%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
index 8ba14261ae..f83adb15f2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.1.2-8.bb
@@ -13,7 +13,7 @@ BASE_PV = "${@d.getVar('PV').split('-')[0]}"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>([0-9][\.|_|-]?)+)"
 
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git;branch=main;protocol=https;tag=${PV}"
-SRCREV = "4a620c2a89a7481e83cb4a0ff32db0ccbb3afcd2"
+SRCREV = "a3b13d143fd7dea44cd71d31aa02f411b597688f"
 
 
 inherit autotools pkgconfig update-alternatives

