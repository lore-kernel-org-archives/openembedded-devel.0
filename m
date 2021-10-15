Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C049CC433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Oct 2021 19:15:57 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web11.1740.1634325356711683769
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:15:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=oPTin+Zl;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id x192so10775682lff.12
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Oct 2021 12:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MBODrO8t0jBBBcpPTogOumWJmJVXu+YEUEh+u8r3OxE=;
        b=oPTin+Zlf7ytzeW3U0LkaKwozJhvFyQDR8l9RYrQ+CpO+wVGlI5vhKcrv5fGDKCroE
         Sc7A5WRME14uC0sbSNiRwQPYEZVQWwUYKE/M46qsis05pAjNoWESPohyvhA7qTxnvLZZ
         X+4w0I878GWJvnKZk9RSHk2giHqAP89F7HozNr232A0fRCVqULZhTi4PEpPbz3peSGi4
         kH1IWqT5+1MjfJZggDMK4fNEFa+o4qbh+kBz1aNXtbBxV0pL4tQVyGLdknNvtVrfqHCD
         04ChtFv/W6EwltNy/tMydserEtlzuN9kGemeYnDQW9+vGwBR0gnmgQpleK2ok/PWNExC
         AQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MBODrO8t0jBBBcpPTogOumWJmJVXu+YEUEh+u8r3OxE=;
        b=QhwfHQu3aSUqyiRXdfycTtAijz7ABncODJ83fS7X3MydWNzj4803qwJHdXG6Alc9RV
         ALPdJ63lXz4iEGOTr1M+QlW2OXr4pNnsYKVsrJxE12P0T0FOEZLuKWin3vnQ7C826xZ0
         n7NcYqs1I4BDtt3Ls+NXRv6wKPhNl/vn7LvdZF47o/Q96qNw12XglRXtPiUYS/kBAsAm
         yWO4t+/60nr4UXdMxZEwUv8Vi+8MxMX4x3GmGlvKH7cZL8JXgGfPZPlsrFp2fKTQqnel
         fbqummYZxN/a7E03C2hp5CtwTl4vRMqQYa+eM8EE1Egq2UdpH8SdojLAgeBy7tlo8Lmw
         jHAA==
X-Gm-Message-State: AOAM532Iq8XsDE6EdcUgTgCSkHf5i/l7Uw2PUVdSbBWPmuJvEBX+oJUw
	o0WUeVq9ybq93IHoaR4wBZkFFKiuoKu0EBS/
X-Google-Smtp-Source: 
 ABdhPJxcF3HZgQaIubXqoF5q6Wv4+Zb14Fy+9aySuCcM/YMZ0UA0ISL+XKzmjHnlJSWy1FMnGlWCIQ==
X-Received: by 2002:a2e:b0ce:: with SMTP id
 g14mr14844630ljl.116.1634325354110;
        Fri, 15 Oct 2021 12:15:54 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 z18sm598071lfb.201.2021.10.15.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 12:15:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] libcdio-paranoia: update to 10.2+2.0.1
Date: Fri, 15 Oct 2021 21:15:52 +0200
Message-Id: <20211015191552.897837-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Oct 2021 19:15:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93332

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...paranoia_10.2+0.93+1.bb => libcdio-paranoia_10.2+2.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libcdio/{libcdio-paranoia_10.2+0.93+1.bb => libcdio-paranoia_10.2+2.0.1.bb} (81%)

diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
similarity index 81%
rename from meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb
rename to meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
index d6b898c18..441defea4 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+0.93+1.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio-paranoia_10.2+2.0.1.bb
@@ -1,13 +1,13 @@
 SUMMARY = "library to read digital audio CDs with error correction"
 HOMEPAGE = "http://www.gnu.org/software/libcdio/"
+BUGTRUCKER = "https://github.com/rocky/libcdio-paranoia/issues/"
 SECTION = "libs"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libcdio"
 
 SRC_URI = "${GNU_MIRROR}/libcdio/${BP}.tar.bz2"
-SRC_URI[md5sum] = "0255aa50e660db7f2c39658b9c565814"
-SRC_URI[sha256sum] = "ec1d9b1d5a28cc042f2cb33a7cc0a2b5ce5525f102bc4c15db1fac322559a493"
+SRC_URI[sha256sum] = "33b1cf305ccfbfd03b43936975615000ce538b119989c4bec469577570b60e8a"
 
 inherit autotools pkgconfig
 
-- 
2.25.1


