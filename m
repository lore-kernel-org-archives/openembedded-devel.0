Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BD3DC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 18:40:57 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.772.1635273656019801948
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:40:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=Xy1+inId;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.182, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f182.google.com with SMTP id o11so384446ljg.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Oct 2021 11:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMNoj7UpI3ZnotaQMpEn2GTYJZMMWqaa00/AbEQ6mgc=;
        b=Xy1+inIdhTV6ylbSLNOQu+4u41qJQPbh+D0pkq9iayH/g8MGs81GSJ+VN+wVA0rF7s
         saRBr+WWmPWo1OBpqk5GjYWxGzVhfuv4mvOx1DLnOKS4vl4LdkljngsadKIZlgFyx7rE
         AqWQXrL6uhd+4AU2XXdFqYZcaoSd/r7sRZJU9E/6pq3HGeH0gKJTLyv00R3pDaMtr5kN
         R4H7Lb4wVDSzbj/+EOlUHZ8cX5RmqkmoAsabSXvSRahDumQzeJuUaRKkyHNylEhvBU45
         SdvIs0B3qLTmqtVIZ39zg2bbZkwqY6I5WMwQ3BRE/+zgg4N0RCq3HoRnVJS+vZo/+iFx
         ujmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MMNoj7UpI3ZnotaQMpEn2GTYJZMMWqaa00/AbEQ6mgc=;
        b=32ch2hlhDCZKnV47C7JVDD+esdQXwePUFQdP3p4nUs78R7/SrqkhjIawzTEuZbbrIu
         gLWpfHazRCOvDxWzKkPFNLpcyIfg9Brywj2aa+KD3H1RFXbikMYIQTOFJZWvcryJaPfU
         LTHjXzTK1rzeJiU7WFCo9LQbP8Jv8sB65ka23zV6Igh/rAbXJKukdxAAbcmylEx6bQ7J
         I/0RHW/NB9ztZo7fuvFTlFZWr81uH6bLphfCkvdtA1ZEkq1WhvzE+JPiu5iROg6pa16l
         tu2BROHc5SWASXfnmG/d+1GvAP1EDAnxeMxhiAhCq79OOHncbY2ZZzaZU8ov2/NMkqnK
         XYZA==
X-Gm-Message-State: AOAM532Cqv0wMCAO8W6rTg9fJdO2ihq6GPGM++ZdZSzHzbtUscN+oTho
	yl3N4MjnJkTMwy8N7VmQsSVtQEDsD8QYpzZJ
X-Google-Smtp-Source: 
 ABdhPJye3SE7HUoiDfF2cKDVU0Y9ZZlZtNGZ8fsZZkdROTPZznoCa1aG1UfuqVs82FaZ+zwQRyn9Uw==
X-Received: by 2002:a2e:4a0a:: with SMTP id
 x10mr27518353lja.146.1635273653448;
        Tue, 26 Oct 2021 11:40:53 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 y26sm414764lji.75.2021.10.26.11.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 11:40:53 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] redis-plus-plus: update to 1.3.2
Date: Tue, 26 Oct 2021 20:40:50 +0200
Message-Id: <20211026184050.1054170-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Oct 2021 18:40:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93608

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...lus-plus_1.2.2.bb => redis-plus-plus_1.3.2.bb} | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-extended/redis-plus-plus/{redis-plus-plus_1.2.2.bb => redis-plus-plus_1.3.2.bb} (75%)

diff --git a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.2.bb
similarity index 75%
rename from meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb
rename to meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.2.bb
index 0870c6629..2a6bb57ed 100644
--- a/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.2.2.bb
+++ b/meta-oe/recipes-extended/redis-plus-plus/redis-plus-plus_1.3.2.bb
@@ -1,18 +1,21 @@
 DESCRIPTION = "C++ client for Redis based on hiredis"
 HOMEPAGE = "https://github.com/sewenew/redis-plus-plus"
 SECTION = "libs"
-
-DEPENDS += "hiredis"
-RDEPENDS:${PN} += "hiredis"
-
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
-SRCREV = "8ac506e6eb0e5c5b2625785b67400bde705773a1"
+
 SRC_URI = "git://github.com/sewenew/redis-plus-plus"
+SRCREV = "e29c63db54653a660d7a0f556f670b7a6fce0a78"
 
 S = "${WORKDIR}/git"
 
 inherit cmake
 
+DEPENDS += "hiredis"
+
+RDEPENDS:${PN} += "hiredis"
+
 FILES_SOLIBSDEV = ""
-FILES:${PN} += " ${libdir}/libredis++.so"
+FILES:${PN} += " ${libdir}/libredis++.so*"
+
+INSANE_SKIP:${PN} += "dev-so"
-- 
2.25.1


