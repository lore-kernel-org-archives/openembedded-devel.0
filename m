Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19631106B518
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:21:12 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20827.1774441267729803213
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:21:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=iBnpgNye;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48541edecf9so21384185e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 05:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774441266; x=1775046066; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w51FOfT+PZku5Vd/eOB1BibcyAeV34HGDtoI/b/vADw=;
        b=iBnpgNyeMa1dcY+RgdkrzBjuuWRrKtbxsvtVs3XwsPKlroW+vMO5Rq+4//HDz9T2sP
         Rom2mzgDuwtzDp//K6Qu54cc2JabTq0VX33LS1OXBZkw1k+2zZsIdjsP078A5vznKWJS
         YoJf/2udjMn1492XrYcLYqvsn/l+e1Z9SFzhp1jTJbUVLDZaLxg7D1b/kegwSXOV0/Wn
         taRpaiPSYf+mZII27jF1wiXA9qArNfX2O6i0tNBoxwm3Cl7Hfz13h8sybmV1D/X89fwT
         hemuQ0t0WbPwbQ4zqrb9CA+B1D37sYqFdZbDrwYR6T2kcXv8QqkVPdBG5RyD7/SB6vcY
         NZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774441266; x=1775046066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w51FOfT+PZku5Vd/eOB1BibcyAeV34HGDtoI/b/vADw=;
        b=p/VFUiLMu9KT5YU9DUyhlmZczdWBasGBCl6jRZLvw4IYnrUug0aKZr/woABeRl1r0k
         QBzEGJPpFnOrhczVhyd/jUxTjmDqyvO+c0GRtbOjPqjA38tDQfaEt993fxqgdtnfkyhc
         sszICVuNmYMEa691H8UUOAcRw9UzHNiWkthAT8Hr9Wo2DttPa5D3vRveuRRK8sJa7lUd
         PdVVTTgulDEvUTTBDEdqRtREyfw72AlzKGXdbqLfj73I4rpaTDoKlreGirb2FeJcTfaO
         4aP/shOsNGMWh8fcDlneB9MxfWLgy55i1a+q4iHBsk3fzo9IqiwLpx55gYvjOBppmhxA
         spdg==
X-Gm-Message-State: AOJu0YyndYRdBJOa79RpAYRztp3ag7U1viKlVsLrYu7riLbKWQCVzgmR
	UerkCflfTMjJfuA3th7kJJUpkQ7eagJ4Co8ohvrncW8LKC0HX2BSLml1qYMyYQ==
X-Gm-Gg: ATEYQzxth3lT5K7VX3lHczbpad+P1/4GPis8bmCprxDLQZwZPSSE75m4DRw2tl1rETu
	dPxMR9o/QqTRz6tReKLntOHMlgvk4zVgsXTFHQl8zLh8w8ZZny9HOStWXyDcsZfclAZKqVcKUDp
	vSDvDRTi2ZJsCZoVIwBQjiSp/xE4pcddaTYe3AoVJ2PUg9IX+Mf5vSRayG6iBYnydCsDhr2bPhW
	YMo/2Wh9T4CJvdr5RsrF6HrqoVamKh5Lrd9ux8e4CAHFTFzWallZHFwF6dfqZXy+ktp8803RO/G
	5v8Up1myv0nh7DRrN2bw3t48OXzWi/4XNGn06nbTsA13d3/vkVmh5A7QPMeYmt50T1L+zKSq+dU
	XlRAc/0VnoeERlVeMH3L2pRoJ/KFgW9t7XPky1BybBg3AcY9Fa9NbAzeZ7wB9OZvFj+o+G7v+dO
	tRJU7hFj21oXml8w==
X-Received: by 2002:a05:600c:524e:b0:486:fe45:483 with SMTP id 5b1f17b1804b1-4871605078fmr48773045e9.22.1774441265796;
        Wed, 25 Mar 2026 05:21:05 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487165feea6sm40257885e9.2.2026.03.25.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 05:21:04 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-oe][PATCH 05/15] gst-editing-services: Support Python freethreading
Date: Wed, 25 Mar 2026 13:19:31 +0100
Message-ID: <20260325122046.1211090-6-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325122046.1211090-1-zboszor@gmail.com>
References: <20260325122046.1211090-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 12:21:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125612

PYTHON_DIR now contains PYTHON_ABI, use this instead of
the directory name based on PYTHON_BASEVERSION.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../gst-editing-services/gst-editing-services_1.22.7.bb         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
index 50d45ef57b..1c951ecf41 100644
--- a/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
+++ b/meta-oe/recipes-devtools/gst-editing-services/gst-editing-services_1.22.7.bb
@@ -25,4 +25,4 @@ PACKAGES += "gst-validate-launcher libges"
 FILES:gst-validate-launcher = "${nonarch_libdir}/gst-validate-launcher ${datadir}/gstreamer-1.0/validate"
 FILES:libges = "${libdir}/gstreamer-1.0/*.so"
 
-FILES:${PN} += "/usr/lib/python${PYTHON_BASEVERSION}"
+FILES:${PN} += "/usr/lib/${PYTHON_DIR}"
-- 
2.53.0


