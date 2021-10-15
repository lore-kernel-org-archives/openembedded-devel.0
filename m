Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12016C433F5
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 04:55:41 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.5438.1634273739828564688
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kugXPkIA;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so6422992pjb.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 21:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSPsDeu+0BYyUNCUKgUmBksfJBqDguE+AMDLamELhxs=;
        b=kugXPkIASPH48AFJTyiz9bv2nqqnJGdHmgI9zg1dQdd7NyYJllqxB4RkAqtvRtqbFE
         czu5WZJfcUYrcK/LKsb69OoTCjFkfqmnLbrziv+Au7dD2TAGPTFMX4Tzw3yZUGsaCs4N
         tDb92C3bZ9wSIH0Amz1bpyKMMzbah63arCMlTApxgTy0L+DJOFFQcGXlMkCm5n06/aLQ
         QieSpCiGy7ODgglG33iRd1zZ408M/AlWaMOHt3OQn0d7e8UPuEyYKtMquaZSs6ghtDvg
         Fel6Y1iPQBlf0OsmYzK4lFfRNFc9ls/hLtc3X91UwHlu+SZ+g61cedJo772N8HrIEkYo
         60cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TSPsDeu+0BYyUNCUKgUmBksfJBqDguE+AMDLamELhxs=;
        b=jORrGpW/CQraX6ogdnqoc0fxzvYY+D/rzF5aW3bkBJLmJVrwRRfNEcVKn/Ca2XdvNS
         QrNj17LGSMmBsFw2gQ4kMxNXudMbvDyv3FaoMT+ZQLdj8uNvVeZk6Khz6iOaJTVGboyf
         ECbMNcDLVBJQlnZ/Swmb35QOIJfzP5oBBijXc6xba7SKu1aTmtYTb94yFe7cmoUt+l0f
         9HV563/SD/t8kaT5YL8rrYIQNlgfAZFoIgwa2pm2az0lQ0DlcFljo4KV1H8JIpL9+qIi
         1He1e+zwlmcYpWWFmPvzEfBOhbYsbeKnhRqgq1VNsZ6/VKu42NaHsMzgz6Cjm6Gn982n
         yF2g==
X-Gm-Message-State: AOAM533RItrncK6XR53Gs6byPx0jyfkRhxmXJnpm0R+VTC/eVaOI4Ld7
	YrccK09rZqx5SE0y/AFMvC/31+1AwzawAw==
X-Google-Smtp-Source: 
 ABdhPJwY+JeTGIBZhn3TBxfeIDF1iiLLVFAfvwVa16JZhZyivUa2/uavBkoYqfF7EARfyhHZVFS+OQ==
X-Received: by 2002:a17:90a:9404:: with SMTP id
 r4mr11032383pjo.240.1634273738790;
        Thu, 14 Oct 2021 21:55:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3fd8])
        by smtp.gmail.com with ESMTPSA id
 y75sm3935021pfb.57.2021.10.14.21.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 21:55:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-perl][PATCH] libcrypt-openssl-rsa-perl: Upgrade to 0.32
Date: Thu, 14 Oct 2021 21:55:35 -0700
Message-Id: <20211015045535.2718772-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 04:55:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93319

0.32 changes
    - Prefix internal bn2sv function so it doesn't collide with Net::SSLeay
    - Ensure that verify() leaves openssl error stack clean on failure
    - Fixed broken SEE ALSO links.
    - prevent outer $SIG{__DIE__} handler from being called during optional require.
    - omit done_testing since it does not work for older perl versions

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nssl-rsa-perl_0.31.bb => libcrypt-openssl-rsa-perl_0.32.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcrypt/{libcrypt-openssl-rsa-perl_0.31.bb => libcrypt-openssl-rsa-perl_0.32.bb} (86%)

diff --git a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
similarity index 86%
rename from meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb
rename to meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
index 9a42b52cb6..48c04531ec 100644
--- a/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.31.bb
+++ b/meta-perl/recipes-perl/libcrypt/libcrypt-openssl-rsa-perl_0.32.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a67ceecc5d9a91a5a0d003ba50c26346"
 
 SRC_URI = "http://www.cpan.org/modules/by-module/Crypt/Crypt-OpenSSL-RSA-${PV}.tar.gz "
 
-SRC_URI[md5sum] = "d33681e19d2094df7c26bc7a4509265e"
-SRC_URI[sha256sum] = "4173403ad4cf76732192099f833fbfbf3cd8104e0246b3844187ae384d2c5436"
+SRC_URI[sha256sum] = "adc74f0ae125c77f65d5dd32abb9c3429300a79543bf263494f333f9c0b62a61"
 
 DEPENDS += "libcrypt-openssl-guess-perl-native openssl"
 
-- 
2.33.1


