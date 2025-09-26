Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BDFCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 21:07:50 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web10.1978.1758920861558126617
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Sep 2025 14:07:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=YDKy8Xyf;
 spf=pass (domain: smile.fr, ip: 209.85.128.65, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-46e37d10f3eso16677225e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 14:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1758920860; x=1759525660; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oHT2A8ulMcYrQ6zpCj8/3Q8+eB9ChXTDwg0grDokFzw=;
        b=YDKy8Xyf1yrhDNRIABzljv+JovRLW0gTSifOwZNU1cxj0T5qqll4CURwJy4qkb3voC
         CDmiMkfch6QgbFtfWfV/dFpqkfYYYGrwWGMEwyLDnXUa/SB0DlbLu1jhfBXYW1mP4g9m
         vr7QWXLZBXWpvh11xV4NteufKPVQy8sbMK7Fw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758920860; x=1759525660;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHT2A8ulMcYrQ6zpCj8/3Q8+eB9ChXTDwg0grDokFzw=;
        b=w+vi1pUxcwbVR8oL7oUseyZMR+cLmyvVfdBCda4WF+GZFgwsJl5IwZtLfZlGtWU3KW
         IRUDNGbav+8UaRgL9yqLm5DQwWULDQ4E0fmrGrqMehzWztebw2dzxJMJlQrcRBP6jOg7
         e5qvmDCq/jXvuNnSLhcidLBw8cTW3AMoPAQxXh3RxOxOPbMPBWLPQxPeWQCm3fBGiY5E
         SNud6NyuaVjyD6k/GqupBigbvYSXC84a26FlaSU77SWtVoqsnrNtSyqi8uW1U+H+7E/H
         f9gg8sifsgLXfijEn2jEkW6z+5QPkX0jzhrrRapV6JO/4D/cw6kuhN1S8qTu/KeX2ZzC
         +Mtg==
X-Gm-Message-State: AOJu0Yzw/8Gd9HLXmSEFGLz6jvkusC0jnM544+BPhduyauPeTQgBVpJ+
	jd3wYu4ebLlueDtHTgOcMCc38PbLbCNF8Vu0PfvnFYoMmHEDjcaHnmr7f6ML2fsfJxqcyTrQNff
	H4UyGZhGo0g==
X-Gm-Gg: ASbGncsJ7OTygmCbatvZaqn6nfeL+qtIB7YVyxLdZtH5zsaf9+4ZOqVDZ9rEVYhzzRF
	W8BVlLFct3S8BgHIV1kWoyYxe//7+gnefAaKvXJnNWUlE2h5OSTcrNRojyAAsPfJE3GKBGQD3Ux
	/xWBPgviwjxjTYrmF150L/tU6XtNddXFKJoHRn6qlCER0Cl0G7FO27Jhz8/rcp3VUam1U0cZ/hx
	kt9/wR5/j/Qv97M5/thDwOG/zqPOa+7l2YMJUOpwZl8oW6z0NYdOW7NVOTljcgmuq+DpU/1/3S8
	l+uY+Zo6UPb2XS7U4ye0LgcvKruydKmzLZGizyl84aRubGH3/S0NL7ibpIyhiS0vOOgaAM94DQj
	1HD+Hj5VPVujU/4igqXKASMB1E0wgjBhUOv7h7zPGWsGyMt/Ks9N6OYYdiUEPTE82px80Eucu/4
	BoPcvygIuAnevq+5m1ByZdJTSQuejUEg==
X-Google-Smtp-Source: AGHT+IE5hSJd1HAay1NmqrDJIJCtBpdLUcYGQlzaIGtj0EKqCALSTZhZKndkYdbxXiWcT3zaVYl2hg==
X-Received: by 2002:a05:600c:4743:b0:459:d451:3364 with SMTP id 5b1f17b1804b1-46e329eb11cmr88044795e9.24.1758920859564;
        Fri, 26 Sep 2025 14:07:39 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.home (2a01cb001331aa0017b58d8bf04048c3.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:17b5:8d8b:f040:48c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e33be3268sm87094165e9.11.2025.09.26.14.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 14:07:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-devel@lists.openembedded.org
Cc: Yoann Congal <yoann.congal@smile.fr>
Subject: [meta-oe][PATCH] packagegroup-meta-oe: only add clinfo if DISTRO_FEATURES has opencl
Date: Fri, 26 Sep 2025 23:07:19 +0200
Message-Id: <20250926210719.636314-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Sep 2025 21:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119942

From: Yoann Congal <yoann.congal@smile.fr>

Since commit f65ae714d885 ("opencl: make use of the 'opencl'
DISTRO_FEATURE"), clinfo has a feature check on "opencl". Only add it to
its meta-oe package groups if the opencl is in DISTRO_FEATURES.

Fixes this warning (as seen on AB[0]):
stdio: WARNING: Nothing RPROVIDES 'clinfo' (but [...]/packagegroup-meta-oe.bb RDEPENDS on or otherwise requires it)

[0]: https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/453/steps/12/logs/warnings

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 8bc74b2f4c..eee4e096a9 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -712,7 +712,7 @@ RDEPENDS:packagegroup-meta-oe-support = "\
     c-ares \
     ccid \
     ckermit \
-    clinfo \
+    ${@bb.utils.contains("DISTRO_FEATURES", "opencl", "clinfo", "", d)} \
     cmark \
     ${@bb.utils.contains("DISTRO_FEATURES", "polkit gobject-introspection-data", "colord", "", d)} \
     consolation \

