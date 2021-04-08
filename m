Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.7707.1617887035681986750
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Apr 2021 06:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QiOt3qWJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.178, mailfrom: voa.aquino@gmail.com)
Received: by mail-qk1-f178.google.com with SMTP id o5so2087026qkb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Apr 2021 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yV+FiMKyyhQG9hQGsubg3IwwoiiHGi4VnKHGyrffYu0=;
        b=QiOt3qWJC5Dv99Jr8eZ8fJmi2PLQEne49ViInylKcdDGpQakfqmO8gSny2AkOY+jAn
         0P9TvMaOMtlgEOM6z0xjdNNVTKpa5969I23xcEw0S3C/vF2mxR/4AqgEzhCGT6QueycC
         0KhsPWAIDQwYVG3HpoWwu3QJCs7yyfWVBAQstPyHQRmxrg1K5mwTIK+IUZhAP4gIQqIC
         FxAkVGXEfC5pv0crGbyY+XBX7iFnTIilsRSpfTWEt2KBbgpno95+8KOwQH3sCFAeogJB
         869L3ZgBxeqr/43Q5he24ITz7bxaU5NHcNL/Ezz+I9RkiXMgosz391YldOCeSU7YiRTM
         PpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yV+FiMKyyhQG9hQGsubg3IwwoiiHGi4VnKHGyrffYu0=;
        b=pjFBiLjK9Ek2l+7x0h/NDKjnzvFcO8Oklnrhjmk1KVKj1ETVvsS4dqb74RkYxTbYTY
         k0hCcgM2Bvcwm4X6to1edA0KPUv2aDCzU5SExwt+wnjM7nmdTT9XWWtLDlsejYmrgsjU
         MC16CqfOtqKoxLiHyDvSBz9LvpO8IZNp9PnekL2jRIoZps3yV9LRT8a3WcK0kSOY3jrH
         DMIBR17sf0pjSM3nlssKg2D6qyROYyEIYdnQZj38vMBgtJd0BExJC2qMBIB9GALlb/0m
         f5HI35QukLSCJRASzGDuE7Mt9UbQVS9X1X2fJLJ4cQC04omEUAk785Co2rQmcJM9WXNg
         Fkww==
X-Gm-Message-State: AOAM531ZCFiztJsMX42g9Si53oWjsZ4m2n1f7bDr3Kz7U83ajqDNptYJ
	cwR/2vyimP4sScYNdp6eZd8U39fXgKCZKw==
X-Google-Smtp-Source: ABdhPJwWikM86C89Uaoj3dYGQjiWSLENjKxtsVGd1avQ9MInHHxN4HzDrVzFeNKLhndMFoT2PcQL4Q==
X-Received: by 2002:a05:620a:119a:: with SMTP id b26mr8603612qkk.438.1617887034573;
        Thu, 08 Apr 2021 06:03:54 -0700 (PDT)
Return-Path: <voa.aquino@gmail.com>
Received: from monster.lab.ossystems (200-180-244-11.user3p.brasiltelecom.net.br. [200.180.244.11])
        by smtp.gmail.com with ESMTPSA id r63sm284407qkf.23.2021.04.08.06.03.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:03:54 -0700 (PDT)
From: =?UTF-8?B?Vmluw61jaXVzIE9zc2FuZXMgQXF1aW5v?= <voa.aquino@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/2] libqmi: upgrade 1.26.6 -> 1.28.2
Date: Thu,  8 Apr 2021 10:03:25 -0300
Message-Id: <20210408130325.3753732-2-voa.aquino@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210408130325.3753732-1-voa.aquino@gmail.com>
References: <20210408130325.3753732-1-voa.aquino@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Vinicius Aquino <voa.aquino@gmail.com>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../libqmi/{libqmi_1.26.6.bb => libqmi_1.28.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.26.6.bb => libqmi_1.28.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
index 6d60a6702..9be48b75f 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.26.6.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.2.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "a71963bb1097a42665287e40a9a36f95b8f9d6d6a4b7a5de22d660328af97cb9"
+SRC_URI[sha256sum] = "8c8c3ee719874d2529bce9b35b028fe435b36f003979a360d3ad0938449db783"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.20.1

