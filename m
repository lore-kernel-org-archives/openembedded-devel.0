Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web09.4.1622754342527176996
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:05:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IrM/pEzE;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id k7so11219734ejv.12
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=vMWeyyWi0TPoNXJAC8DrvsvT+xpnKShR2HGjiIURRDU=;
        b=IrM/pEzENm7UFpLjMRgoYqQYaMtmn4FJG7fBiOqZfdcSuP+Wsjap+7W/9mGDBf1Ixt
         lJU2tPrKbz9yaOhV3hK0pkISF3/Ws6oCS+5ZkMR6JlxySL/w8UpFX7V688KnTYrUbSNP
         P5qLbJqy+ZCs+3wfYKFXxZCYizH2/CtNxdsiW+ABzsmtGMTMu/0UO7g7xvGqGjEWHmHi
         pUqAnljKJDeyNq+LvpsAUbOjzRJyme5l25TlrJhfb247vOisC57MpRqK92vaoZQ2nw/l
         Z/2my9wlMYwPPZFoSSLDDaMdGCVn2+0eoxJtcTbwPO0F6ZkSAZQz6OBi5eEsu3EAyGW2
         DQdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vMWeyyWi0TPoNXJAC8DrvsvT+xpnKShR2HGjiIURRDU=;
        b=MIsOYCe7R+9hSJgzTF1B79WkqOapPUVv1InbP6xkjQqhY/qijIzeaV0CVjQH7Z3G5z
         QLykeGtB/lAOGnuFiwQ6Yv5t7GRt+fyGXEm0S00z0RIuwiwZ3VHAV3F/XdyyO0M09Bot
         BWk+CVhSINW1fRb5B8kig5/QK7HFF43k2UK+ivdBF7xBw2+YCH2sClV4wHiPyfUPSCgX
         02Jg503Kpube52Rwjdgq74Ryg+JtyM+Khq0/GosU7IP68AmWG7zQXJh1/jIic0TNAY0J
         3GBQMXieO48iwHnf8w5ccEeZJpuTcF0zGeoQqy+iLnBLJSUoGMDuI5VyoCWJG6zGVC+o
         99hA==
X-Gm-Message-State: AOAM533m1gBdOH3O/O75oMcSyfa1pySMorLM7eaJ3g8e171cxZ8lByjN
	A0ttbEYcRVjeuqSEnbdQR0EKXYFRKLueiQ==
X-Google-Smtp-Source: ABdhPJyBEMkfiO6nPL+TJ6j/9JoaLxoWCvkARqKQJLo/46GuHG9hX2zKrR+dPg6n3duFgAyrPfF9eQ==
X-Received: by 2002:a17:906:39c6:: with SMTP id i6mr1129925eje.334.1622754341183;
        Thu, 03 Jun 2021 14:05:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id j22sm2020050ejt.11.2021.06.03.14.05.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:05:40 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/5] libmbim: upgrade 1.24.6 -> 1.24.8
Date: Thu,  3 Jun 2021 23:05:29 +0200
Message-Id: <20210603210531.2314701-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603210531.2314701-1-schnitzeltony@gmail.com>
References: <20210603210531.2314701-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libmbim/{libmbim_1.24.6.bb => libmbim_1.24.8.bb}          | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.24.6.bb => libmbim_1.24.8.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.6.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.8.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.24.6.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.24.8.bb
index 6fe6a2e4f..6a8d2405e 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.6.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.24.8.bb
@@ -12,6 +12,4 @@ DEPENDS = "glib-2.0 glib-2.0-native libgudev"
 inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
-
-SRC_URI[md5sum] = "38d228548eae3ee144e19a42b028eab0"
-SRC_URI[sha256sum] = "760465caaa1ccd699c14290e9791da456d5300dd11ebf4c1486151033e875dfd"
+SRC_URI[sha256sum] = "02590736163fff10e5732191fccc1b9920969616ddc59613a003052a116a3c25"
-- 
2.31.1

