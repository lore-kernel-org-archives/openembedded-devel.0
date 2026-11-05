Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32572.1793879730923219369
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2026 03:55:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=nJwprPxJ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a208d93758so20156655e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 03:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793879729; x=1794484529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nH5QVfxYiYKIaN+qFrGkr2R5aaxr03zvNY7A6ziV/zY=;
        b=nJwprPxJVKyFu/mLdCyJX5OqykMt8pau1KnYwWSpacGsFa9pqM8IMFoMUMprpEA+Mf
         fTRONIJ7f/k2EJIDF7mXnjCzSAR4+saLKLFImyvLwQhwkj04KsFzGgiQ5d+y8RKX+xPK
         jDiTLaCf3KTiaYRzjFl8zi6W9ktUYCCIBBWI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793879729; x=1794484529;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nH5QVfxYiYKIaN+qFrGkr2R5aaxr03zvNY7A6ziV/zY=;
        b=hiUiZOHdD4BmOWTvy3q8m7LSMzWZFy1YcBYGrULsTOLVZlGqVzsquC0VY6XQTFnOBQ
         m7cjTmu/xutxU7i32SoCHbTB4VMW1k1R826jvCHL4Af1ywORK/E0ska9SxDeI+MWavgH
         6ynvYLyrxSsGrZmd3zIgnE57/R3p7SQEQiTO80QTBhSHgYgs2TgQ4QWSVs9br6GlLftK
         PHzTn91VS+SpIVxXp2lY2aVgD36Kk3O7Pveo3ldyvLa++za0WHmNbwF37nw5QDVmvKZM
         jv4XnapKwr3KaREWM8luIJ9oWHmiAT9a72ea+zkUfK6MTHHWhV6rRL1bKSNSixd9W30c
         tovQ==
X-Gm-Message-State: APuU4Z9p7aFPt4NZxiOhXjrtOi52kfhp9H08rtAfysB9ZNkgx+HXc4CR
	QsJ2Tbd0b8wz7DhbOW61l5zIwuz+2gLG4zikUqy4KUNt+ScbBGiKI4iulH79sfKzLnCFsWRnxiX
	L/nsu
X-Gm-Gg: AYBFou0mKk++809grWrzXvoVbCPZC96cOUu9WaVoVefVtCDQEvNOvRuvnqYZmPfiWZ+
	zTqv+vKufqL0I4KyjEQh2dVbBEHzc/j4DnMRQ3f7kFTiMq87HVf0CtIumduGjQGaBGlzPGJvxQR
	MlQ5+nuoGTQ3ZZ8oUwvIzKdmcWen2ggf0OHl3Z/rUA78Qd1nR4+hDs3CJvTxzC8cB+cFaY9KMKr
	rt/dXul8kJLI7B2RhmGAi5MJZZHgKYDKo+uJWkncytBR24gIel8xVRftfg/c05BS+2B7U7+r4H3
	IRoXIEHoMRSleUSBDdx1rhPjMrzaqhGyraZSr4WKxhi9IrwE2TQpDprhWbdQWTzgJgE6qy09v4b
	mKZdqCInKijUdi4RvPdEl5SkOHJO69FXZDUJb9yz8wsuOjEsSRtMgLdRpJ7Hmf7rLy8WLtC1uc4
	CN5BwaeU58A/51uqNCa7AsiRKvmRugSuTGnpEEQYv+9FXMLzp4L1Co7Q3ArErXVh3FYSZqOet/3
	UyULxlJSdCiMgtX57WnV39pWCwc490ZHZ8cto9Id7fn0UHZVOJYmnILJhx087Wi2dF1OUUjl+id
	iPTtD5XCW7UA6ixKkWDv5GgRTlqZLdN2CRGuyf6Pfk8/urZVBBF8kZEnhTc4C9Uh1MoGV8nO7I2
	J0BShkJbbKqqWKKlMTccuByhbMLz2fgmbI4u0wnGuGVcVSxC8CRYB95U9foBJ/S64Iy1bo7LVuE
	8=
X-Received: by 2002:a05:600c:474a:b0:4b5:d95c:2378 with SMTP id 5b1f17b1804b1-4b5d95c241cmr26865255e9.34.1793879729048;
        Thu, 05 Nov 2026 03:55:29 -0800 (PST)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm173720995e9.3.2026.11.05.03.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:55:28 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 01/19] python3-apispec: Upgrade 6.10.0 -> 6.10.1
Date: Thu,  5 Nov 2026 13:55:08 +0200
Message-ID: <20261105115526.634289-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2026 11:55:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131901
Content-Type: text/plain; charset="utf-8"

Upgrade to release 6.10.1:

- Recognize trace operations defined in view docstrings, instead
  of silently dropping them
- Fix intersect OneOf and Equal choices in field2choices
- Drop support for marshmallow 3, which is EOL
- Drop support for Python 3.10
- Test against Python 3.15

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-apispec_6.10.0.bb => python3-apispec_6.10.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-apispec_6.10.0.bb => python3-apispec_6.10.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-apispec_6.10.0.bb b/meta-python/recipes-devtools/python/python3-apispec_6.10.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-apispec_6.10.0.bb
rename to meta-python/recipes-devtools/python/python3-apispec_6.10.1.bb
index 52ebc43c6e..be4b658dbc 100644
--- a/meta-python/recipes-devtools/python/python3-apispec_6.10.0.bb
+++ b/meta-python/recipes-devtools/python/python3-apispec_6.10.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a75956865b40c80a37c1e864716592b4"
 
 inherit pypi python_flit_core
 
-SRC_URI[sha256sum] = "0a888555cd4aa5fb7176041be15684154fd8961055e1672e703abf737e8761bf"
+SRC_URI[sha256sum] = "46896cb0cab23b4e853e528528937719739f836358832bb8610edd14db1d9c01"
 
 RDEPENDS:${PN} += "python3-packaging"
-- 
2.47.3

