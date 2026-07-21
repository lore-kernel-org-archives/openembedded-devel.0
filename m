Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46A9CC44520
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 02:32:54 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14246.1784601173499451436
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 19:32:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m1kQL4G/;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-81eaf3709b4so86335717b3.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784601172; x=1785205972; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wSgaALKU2nRGK5MC38y93/07m11h3r21UlihOpcoVVE=;
        b=m1kQL4G/au1RMm1xfM0ccP0NLSN5XK2IPNYugIxE2Q5yTxED3mWz76m+vvXV40T0nd
         2KZIuYcsbOz9QktLdap9TFeCTpyfOq4qNc8fRzTiLwX/mNOiz6bQ1RllYk0vPfLSC/+v
         CDlQqc1CyUP3JKQfh/WjNt2qUALhjDca8z0Vi95dmY0xGqDOxkwXryBltCrcR+UZZADd
         N4WavaM7FVUYDk81k7j8vzT3Zu3WjnBPxhcuMKExeDZL7u6T13JbT7xluafEfJHkf4MG
         OjRo1QmpJvy2Gd47KWpEUi0/82A2gg+Nd0r/yO6fldinmvSDrHmSqibmkBaO7sQWfEW2
         DElQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784601172; x=1785205972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wSgaALKU2nRGK5MC38y93/07m11h3r21UlihOpcoVVE=;
        b=lCJiq9Lw6LbIkUOQLFzXIFLCSGdDmZvhqRqGj5sOGQeGGke+bQt6e37dfjyE53jEyy
         97ohSkKK3RmbSlWPmtKaV3LMvnhlgCckbTuGdWEYfCLP7aa+/TwDluhkRspBvI9S5e44
         BIAzuysb/c54FPOa8ll8xxobZOe0gKwS7PygjkKeah45quAF1dSI3C/YnXLM7jdAU9Bh
         HU/xAHC3Epmr9du6TszR8opFYT0MFk6rLBVZpOV2dSzo/1HWqGwquSk1zCCTY6gDBAYF
         mTUlU/72ML2cuE8ZiTAxYYSzx+IQFsS+4I+GekngRgG5Ugn8hmcGsCyJeP/fNpTe7YpN
         u3Hg==
X-Gm-Message-State: AOJu0Yygt78951eCqpVcoDqdhK2v80n1IVNA8pEUleJkwGZEkXkTNYfc
	ZoOSn+F1ydjDT2jna+uvSqu5Y6YjyrvHU5W4kYwSUhd0edSjMeqvVk3tT3D7uuXN
X-Gm-Gg: AR+sD10A82XbkunAkGDE++n/eRKj/UmgBV9hRXUC8jcuPJcFr0IDvnx7xroAaz3Hn9T
	Gq59tNMkzEKMq82VOdnLW4ljvIjFFc3MZNja3hKVnOxuua2tw2Oyh7KL0C9HI9q1wED6R/SV00R
	h4NM/rDkkMDRw6YasAd/p/51N51bVhVTj/PER1JbKXJM+eaXRaNSYmxxYdJhcq4QR9CGx7ia1u5
	Ax2MwEeuEkL2d/sSzlAKh9ae1u32NPwt49+YUglX4RIRoiw2MkFCi6UMJVdh9+gcQWkfAGrfjqp
	EFNlWj4mw/5gBTtkGaaK/prBhDcSDjmOJWp+ZFSxzXASUDaWwEdalcOKznLEW+eUPcqRjrJk4bq
	vVBYnefUqcIwl/vlqbKHclWqwHCNzEWjUIQpBB3Xue1hfL73kKX7Dlyv0ZUYFwN9JNrDC8JsWmn
	CMVwg821xL9VYPyzkQ2gGROUJ63hMxFJwS+eyeIwQ/RI3x2SpVK7Z8bbHewDcPG6Sg3ObJXrxla
	0tvNLXTKZp3qhIhS+iPI1Als3UEagBofwVx2OND
X-Received: by 2002:a05:690c:650f:b0:81e:9f17:8050 with SMTP id 00721157ae682-81ef26fdd7bmr47254207b3.21.1784601172361;
        Mon, 20 Jul 2026 19:32:52 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81ef406700csm58910877b3.22.2026.07.20.19.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:32:51 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-dev-tools: upgrade 4.21.1 -> 4.21.2
Date: Mon, 20 Jul 2026 22:32:32 -0400
Message-ID: <20260721023232.347453-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Jul 2026 02:32:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128337

Changelog: https://gitlab.xfce.org/xfce/xfce4-dev-tools/-/tags/xfce4-dev-tools-4.21.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../{xfce4-dev-tools_4.21.1.bb => xfce4-dev-tools_4.21.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.21.1.bb => xfce4-dev-tools_4.21.2.bb} (91%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.2.bb
similarity index 91%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.1.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.2.bb
index 9570d656f7..b8a206047f 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.b
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "2b127088f22453ffc725c002d2fce830bac86fc770e094d43b45e92e0f132c97"
+SRC_URI[sha256sum] = "a43f726a082b589186d9e6ed076101d41249d1e22bbe61448037550190d7f75a"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


