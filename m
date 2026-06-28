Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C443C44500
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 08:12:27 +0000 (UTC)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.69147.1782634342749384216
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 01:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=dxocRj5y;
 spf=pass (domain: gmail.com, ip: 74.125.82.175, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bc871ecdfso3061087eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 01:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782634342; x=1783239142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NStfMmD/5yv5dXUAsB3NwbnHDMALK0+ReBh+xAeoEwU=;
        b=dxocRj5yjg4ogZ7x/2kxB946JEPA0oZbQTO3Rl4xRCT9CzZpumvm65fOafDRGopkVe
         r2XevK+TmWbtlfvqTljJ+mbxOxsjh29GOSlfll/lN7TzgldnTlSjdP+vP99sY9LLhAfu
         /0esPVQpAiEJGs5RPIn4wxblSxq7J+9o8573CNgIzKaxUEb8S/Ov46lnETTIQWf5gb0a
         gMtvcmNxqPkTkkru0+oHHNbgjewuBJWLX0O+D4FnDn7Vj86hnW03TMo+6DYHRuNHy1CM
         PBkFLItl+O3Heqg9Fxf9U9F3/LseXbWu4KRvUAeBtCizxYOl3PchvKZwxELx0bR4ek/5
         feyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782634342; x=1783239142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NStfMmD/5yv5dXUAsB3NwbnHDMALK0+ReBh+xAeoEwU=;
        b=a2nOQFaZr6zNeTwKZnbEMXM8wjM0Ulo0qEpKNzVzqcLguirEKMbZvTOa7w1Avf6/gK
         btp5aU7KetgnY+iM5KZy3njoZds9P/8WtYh7SpWhbVhPNgXCInJKokLi/t+sEvmua5kM
         x25V29p+94Uxt65gKrK4Souf73XoboMpRDBcw659Bsvi8hJr0+Z11yByBISud494+yqC
         Gag1Ioj9d69KpSARORIWg+EdUdaIYGgMjVkPg6nLnkHgWjE4TW7Np+Yjk+IeR9twIQqk
         2QHxcvirmfPxRiP5HuFfMrP+cY/L/6nN8zrFgWbTcQF6a8gD0BiwZY7+X3TqCbPJtYZ0
         DVHw==
X-Gm-Message-State: AOJu0YzJ4Z0CQA6s8lAV5yYB7qn7uMptiT2pMznWElyH+RgC30fsSvi1
	WytBRj/7Sh5mMletVKfDjSrxq/4gCyeGFu5Ll01iPeOC8qTuJoCXdejO+I+y2rMGlR2nmw==
X-Gm-Gg: AfdE7cmT5powi8SvmHhx5jE+VXRWOOxHsHtAXTg+X0AJ3vB3K+iiz7SmhJ1q7l4q0uQ
	R15ZV8ZEi//mfaYtwSarv/wKLHbxE8cK9iUeHMlU9bkWlZGP+rHn1VfDReJbZF1I3Ms2fanc3Hl
	a6iEAhj4g0HFpyq3t30cxq6/0mpaVnfZS49zKpkSSqfT/barfSVd6FpDpANetCJMjEv7muQKm3A
	b90uUqc/+gZLbKMfgxoEJwTkqddYDjSGwPOHbrXdwKx6S4MBzZfhJGiXnJmVP+dMZSdsi3HpdEa
	KFzK+MwWq7DnIXIkxf2JHblzt04GE6ug5aFS3hXC28aoY1p+In7hRXw4R45VhKkGOcGBXrlK8cW
	Rsg6XiwaCs5kPMDD1B+Kh8N2ejaPTxTGm8q2MzSsJVkJpTNJbLnvNymmPko6o8aCWwog+taxJqB
	T2kRXwgbkeTLtLeSAFOLytH+Yk0jIX2IJ04pB+XiNsmSDEllPpiat+50/rlcnlQAyJeHZqXVa7K
	B59BDFLSl5bvRhdRyJTge0XeW82ungq82avknK23QZrkZ2A/sR1VxknqPbbiagMTwR1+Jv4UBhq
	D9ze7/RzTYL8NTpyxBYW8siMdCxxNg==
X-Received: by 2002:a05:7300:2312:b0:30c:efc:c399 with SMTP id 5a478bee46e88-30c8502724fmr13071905eec.35.1782634342041;
        Sun, 28 Jun 2026 01:12:22 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ea81b39easm6306040eec.31.2026.06.28.01.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 01:12:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 062/128] poppler: upgrade 25.12.0 -> 26.06.0
Date: Sun, 28 Jun 2026 01:10:13 -0700
Message-ID: <20260628081122.178348-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
References: <20260628081122.178348-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 08:12:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127872

poppler now sets CMAKE_CXX_STANDARD 23, which enables clang-scan-deps,
absent in the native sysroot. poppler has no module units, so disable
scanning with -DCMAKE_CXX_SCAN_FOR_MODULES=OFF.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../poppler/{poppler_25.12.0.bb => poppler_26.06.0.bb}         | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_25.12.0.bb => poppler_26.06.0.bb} (95%)

diff --git a/meta-oe/recipes-support/poppler/poppler_25.12.0.bb b/meta-oe/recipes-support/poppler/poppler_26.06.0.bb
similarity index 95%
rename from meta-oe/recipes-support/poppler/poppler_25.12.0.bb
rename to meta-oe/recipes-support/poppler/poppler_26.06.0.bb
index 71bff6d70d..3b1edd9335 100644
--- a/meta-oe/recipes-support/poppler/poppler_25.12.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_26.06.0.bb
@@ -9,7 +9,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-cmake-Do-not-use-isystem.patch \
            file://0001-workaround-build-racing.patch \
            "
-SRC_URI[sha256sum] = "c18b40eb36b1a0c5b86e29ca054bf0770304583da4f2cdd42fe86eca6a20de48"
+SRC_URI[sha256sum] = "4cb4e5a3dc8cb5eec751c8a23c8ba19f61f96dedc0cd07d2aee6b0c8e2cf6ba4"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0 glib-2.0-native"
 
@@ -33,6 +33,7 @@ inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt5', 'cmake_qt5', '', d)}
 SECURITY_CFLAGS = "${SECURITY_NO_PIE_CFLAGS}"
 
 EXTRA_OECMAKE += " \
+    -DCMAKE_CXX_SCAN_FOR_MODULES=OFF \
     -DENABLE_LCMS=ON \
     -DENABLE_UNSTABLE_API_ABI_HEADERS=ON \
     -DBUILD_GTK_TESTS=OFF \

