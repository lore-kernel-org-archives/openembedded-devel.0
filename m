Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.40064.1595802915234715388
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 26 Jul 2020 15:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZZBFcZzi;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id o18so15133089eje.7
        for <openembedded-devel@lists.openembedded.org>; Sun, 26 Jul 2020 15:35:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=awloM1pW6LZ0Q0YydOB958bODBRsV23Om19Kj1nrUNg=;
        b=ZZBFcZzimgimBbBJ6kHiinypCC6dAO/+KZW+Yjd64bJBv6yazymECJyJi5FsPtUwdN
         F50NE1BFPCK2YCfwnhaDJpTsm58Wk3VaGqq5bnU65IAMN9rJaEuJQHSFNmPASOcn5LaH
         aY9T9ZkdRh+x9q/uFa4miwJ65OWbCBEBeVjYND/s1DAQFLfyQEGPM3pB0M6e0iPWdf4f
         Mi+dFLwu9iRMjHk7gXqyyeSyvG5pknzKzeEmXZjdDYkmhqgaW+QkQQ93WIfIk8PFzkbj
         I2AV9tcIhveSKf50wGLa2BcL2kk/CnXU1l0TzEvKRApVAkeZgEnkdgW/SQlGtoJB/Zmx
         PtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=awloM1pW6LZ0Q0YydOB958bODBRsV23Om19Kj1nrUNg=;
        b=hMkZJUJfcOVpqowHTLGoyZ1kZHsO9l9PgbPdMPIJFmd5ESCBANT0aZYzGA9RFH3iGg
         mfq2TGpuPQaCXMNhGe9OQl8rwifRnH1WUMA/aFG+0Mlb2AVbivbhXEHCdU164dQ0LrWr
         IwTdYaCw6BuTbwkflGTO/EeEqgeYRit09XoeQi80llDTa8DYriwQ5X0yAbcINsNh+2p3
         hkV6A6z6bU+KrawPtWJy/eP66Xq0oZmXDTyhzGb+8AlqIRI6EgHo6LCRGymLTT2xGTRv
         KMBCdMcnaBcBZ0dzSBPTzEq1FvVbr46v0OBxw/8s2VzARsyWiXHQPsO0dleV3mm4qpS8
         Y8WQ==
X-Gm-Message-State: AOAM530vqVwJwi7UIGQvHkapdNFJWRPOmYZnaO3Eqxcp7qv0Lgbme60L
	DlKxxLuQuArxxMWxGfoHL6koUotY
X-Google-Smtp-Source: ABdhPJwUAyMhMQP4ku23ORxWM4s3HqlEIjnly+/L334rmBxj4Fpan/4bbdCzyedzLM8gzesPwiyk/Q==
X-Received: by 2002:a17:906:a0c8:: with SMTP id bh8mr19527838ejb.190.1595802913574;
        Sun, 26 Jul 2020 15:35:13 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f46e203fabf36e58663abdc.dip0.t-ipconnect.de. [2003:f0:7f46:e203:fabf:36e5:8663:abdc])
        by smtp.gmail.com with ESMTPSA id x64sm6404096edc.95.2020.07.26.15.35.12
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 15:35:12 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 09/10] libgweather: upgrade 3.36.0 -> 3.36.1
Date: Mon, 27 Jul 2020 00:34:54 +0200
Message-Id: <20200726223455.333001-9-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726223455.333001-1-schnitzeltony@gmail.com>
References: <20200726223455.333001-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

==============
Version 3.36.1
==============

This version works around the unavailability of the NOAA weather services
by using very short-term forecasts as current weather conditions.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../{libgweather_3.36.0.bb => libgweather_3.36.1.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather_3.36.0.bb => libgweather_3.36.1.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.0.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.1.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/libgweather/libgweather_3.36.0.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather_3.36.1.bb
index 914010b21..3ee382937 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.0.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.1.bb
@@ -7,8 +7,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "32e43c6b35bec88a5549ab62c71913cb"
-SRC_URI[archive.sha256sum] = "d2ffeec01788d03d1bbf35113fc2f054c6c3600721088f827bcc31e5c603a32d"
+SRC_URI[archive.md5sum] = "d6081108f9c224c5cb594f8ccb025db9"
+SRC_URI[archive.sha256sum] = "de2709f0ee233b20116d5fa9861d406071798c4aa37830ca25f5ef2c0083e450"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.26.2

