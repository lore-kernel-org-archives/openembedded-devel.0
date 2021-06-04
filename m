Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web09.3359.1622773922840625258
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Jun 2021 19:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LDcXa3fP;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id k15so6373267pfp.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Jun 2021 19:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysD+7REa14U8hoinMhF4anLMvEK8GFSIMWU5YCmSg58=;
        b=LDcXa3fP+9NyoQ2lZnidFRQD5rFxaPaKowyY13Tjf0Ve0EPgt8McQaCcSh0zBqs8j2
         EyVkK9WK0OI8jBeAfFKcY/BcvywEqBExmeauk13d70VIyO+LajLqrKj0H44OskoQ+Qmx
         QjHZLUy5NQgSdx2dqGBPNg0LVwguF2iYmMnSj++kk6zgDESpq2WVJZhXlnlrM9gyGI8H
         KFYpLo0AZF7p2oLDuwJgSnAUKsdSjKY5eoIUn6s9SKtZo1PSiqt6o6iIIQIOiVydYDzy
         gw11gnZAjLv5cLFx1nLya1i/P6nqZsfL+dOixPf+Phsmjaes9KVownzg/eksfY0tZ78Y
         bA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ysD+7REa14U8hoinMhF4anLMvEK8GFSIMWU5YCmSg58=;
        b=qm3+Mm4zBMC7xA1eKm1HzCbDHL6sffsnR4QwCOMFEbrIpr866Oz5QzrwdpIx69+54e
         nPR5biROX55UbzvHUFAKrnP/Bpi00VPJkqHPqg7k+0+9POQo7mMir1NIPtBsvUzD3bV2
         QJA39+ijLUBsaYw8SChFLHZe7So9B5+hnFF56bIjyj8FBnSQp0kuzy97iPHZelOOfULm
         OaqXnyBmfuT7Hs+AXSa/7NVfSrvOU18u4NYnkbUzRGzR9bD3jZVFX61mDRPQdqKJelY8
         gJSpgyBi8ZV/xEmQMnzGWm3AxF1QKLutZIGM9BVPtFFJQvsOev+oUR2usNkBhUwv8M3Y
         yeXA==
X-Gm-Message-State: AOAM532CJKz8/ngxSZRccrMnocnlQ4W89Izix9bc5lUMOSUessZKqnuA
	JobAyBzT4zXgZuK7UcmYAdyIJw7dWDg2Fg==
X-Google-Smtp-Source: ABdhPJxii/PR5hz8CQRcHPADEcg2UXSb92Q+Uw6/U5KuhcvSGJaJiG95GZWFGwpwxH0TW6vVJQJM6Q==
X-Received: by 2002:a63:5f46:: with SMTP id t67mr2578533pgb.37.1622773921976;
        Thu, 03 Jun 2021 19:32:01 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id q24sm370130pgk.32.2021.06.03.19.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 19:32:01 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH] mbedtls: Upgrade to 2.26.0
Date: Thu,  3 Jun 2021 19:31:59 -0700
Message-Id: <20210604023159.1670778-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

https://github.com/ARMmbed/mbedtls/releases/tag/v2.26.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../mbedtls/{mbedtls_2.25.0.bb => mbedtls_2.26.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/mbedtls/{mbedtls_2.25.0.bb => mbedtls_2.26.0.bb} (97%)

diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
similarity index 97%
rename from meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
rename to meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
index 481e7ea949..8c2457ce06 100644
--- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.25.0.bb
+++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_2.26.0.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 SECTION = "libs"
 
 S = "${WORKDIR}/git"
-SRCREV = "1c54b5410fd48d6bcada97e30cac417c5c7eea67"
+SRCREV = "e483a77c85e1f9c1dd2eb1c5a8f552d2617fe400"
 SRC_URI = "git://github.com/ARMmbed/mbedtls.git;protocol=https;branch=development"
 SRC_URI += "file://0001-ssl_tls-Increase-size-of-padbuf-to-64.patch"
 
-- 
2.31.1

