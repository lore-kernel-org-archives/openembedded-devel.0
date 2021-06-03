Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.7.1622754343365541183
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 14:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=umuZLr8d;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id g8so11313789ejx.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 14:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=JGHTEbMXeJc6Rtbn4fJ4fFRf6n0kgJIF9D9+ZOPnY0s=;
        b=umuZLr8dpf0WGWYTd2vezpKm5LP4OHRBImIfbbYrD37hYwIftVt0mHl+b3mqGmo3+7
         TCiPqDj39JkFsPG/GIpKLi/V/eJiBC2QVLpuJlABueU8sQ0aEvjQ3cNrI0zfQWAQCFMO
         XnKFZSvd8yeRXp58zhiXZyvzLdc3eOvrE8054jX/SHxfZ3yk+sZmtdUuBwSRnFdMODWK
         oaypCGx/NRMEeUMVFeG9urzdbzPVMu0Qcu+Bm95gvT1Mkk0hfj3V3lZXuBIA9TusWOBl
         Wb1n2X+F8SNHOe+ws/JTNF+mLp5YhAlmf7EKtbyx8pHIDsdjuUpPhGsOUvQbSWATO1MS
         gj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGHTEbMXeJc6Rtbn4fJ4fFRf6n0kgJIF9D9+ZOPnY0s=;
        b=Dvs+T7nkuscITYL1EBbYDEmORTGWv5D+v6JyJv47oPCo59KDui6rLaBdQM4Ec7sliC
         iMgaEXqzUICcS7qgUnmXQvYGvrCO5LdTc5TZK81jUCbPbixt8Ia85MW12QEBIle0j0Rd
         aqxa0hxM3qQKhNf+mdKa49r2UJ80O+rzzVRvqb5vJnbXIditMp7T2OdjCT7Ii/fpEOxa
         qXQupCtWKiLwOZ/LYcuJfSC+6y4N2ijjzB9EjnwSqmqmHARp6wecMpck2HlOwRPUpgRq
         NqioXdoeGyXIOoELTU9IFoGRUV0uauuRFPpnT5Eqd434avMacuyz9Q/UIe3GwQmN0hUD
         gbdw==
X-Gm-Message-State: AOAM531gZgKw0LaQUZA9G23Aalcxpoz2MYLRuaiAGetAbRnzjctFL0i2
	lN1HUfab6mNGTeQtasi/NOCL/jjS01Jh5A==
X-Google-Smtp-Source: ABdhPJyNGuDO9rbjU7vAQVw40wSyW4avWs/JchKOMVOpZ01uvBpru+5lG2QV9/vH4QU46ksaHT9Msw==
X-Received: by 2002:a17:906:919:: with SMTP id i25mr1049516ejd.171.1622754341930;
        Thu, 03 Jun 2021 14:05:41 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id j22sm2020050ejt.11.2021.06.03.14.05.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 14:05:41 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/5] nss: upgrade 3.64 -> 3.66
Date: Thu,  3 Jun 2021 23:05:30 +0200
Message-Id: <20210603210531.2314701-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603210531.2314701-1-schnitzeltony@gmail.com>
References: <20210603210531.2314701-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/nss/{nss_3.64.bb => nss_3.66.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.64.bb => nss_3.66.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.64.bb b/meta-oe/recipes-support/nss/nss_3.66.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.64.bb
rename to meta-oe/recipes-support/nss/nss_3.66.bb
index fce5a856e..b5edc2b00 100644
--- a/meta-oe/recipes-support/nss/nss_3.64.bb
+++ b/meta-oe/recipes-support/nss/nss_3.66.bb
@@ -33,7 +33,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "d3175427172e9c3a6f1ebc74452cb791590f28191c6a1a443dbc0d87c9df1126"
+SRC_URI[sha256sum] = "89a79e3a756cf0ac9ba645f4d4c0fc58d4133134401fb0b6c8a74c420bb4cdc9"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.31.1

