Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ABAC433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 22:08:09 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web10.1693.1634249263261001981
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=cpPJn+i5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.42, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f42.google.com with SMTP id g36so16300781lfv.3
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 15:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjr/PHONTqIVPVGkHIS9A2eiAfDg84jw2WaREho44DI=;
        b=cpPJn+i5ApzXN2oD08Qj3dTqEozZb7NKYKquN7vymgOM4frbO/mdogX1cpAFWApI4x
         foliWcm0wdw0n8U5YXnFnVHxZixwRTIZrMgPIjpKYKFvk4Xf8/RQgw3En//Z12zVzSsy
         y4GunRuoT78k1TiGhee0BFq8ySJiTADy99gdmvXfHHNUDo/D2k4qb+R9E4Ut8Gh5+oY+
         4hKfGIYvGVLAY7Iw0hIh3d0/p4eISdh2OaM3KZ4ZMA0BxBa1RAyl9W4QQQRdnFPcPTOc
         Qt+NKd3neXVE8gdlNdituI5g1Y0nA1HZzEBYRG7Y+Xu+HBVxz5gt5wvZwMMZ5G0NJEUo
         +Lhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cjr/PHONTqIVPVGkHIS9A2eiAfDg84jw2WaREho44DI=;
        b=fI3hk+h5fKghXpn0/OVxeaDpWksE/fPPV2DJCiWwNppLaTNm7nX1GEyS5Oz4iimqPW
         orojT1ZV+Z8ldLY37rMaZLTgTa7+Oe/7Ge/oo/XsVzbPM8f+u7jLaa1j5uY3wwy529fv
         aDqRdMFk9gyEaSQppacPTCRPjqxLLl4Uv0Kt01oCsmA9+E8cKI5JwAgzzAFo3mo2jAne
         WtMepSdl5XDXCytj/untIxzCKGTh+P+xSf8rUUwZCVWxrcoYZYIkkTAmsePAzsUs3StM
         SSRE4Bi4F1HLT67G677HT4CXo/4UCSHHFFPIxb3yFnmKsVRhSU7saUZPhxT+ak8BXFcu
         M9sA==
X-Gm-Message-State: AOAM53108ZTYKl2/DgQf216V3n3nhX3+JLsiEmMAJXGoWm4L2E01JDZk
	uRSx4okJakzZD6dYoXDun+4AVRozNLOj/sva
X-Google-Smtp-Source: 
 ABdhPJyo7R3u/h9Csu7FEaC5Nbz9bf6JiE7jJ7YIr3v3xaOOWRXiZuXFE40D/cJymsNz0pDCBcKQeQ==
X-Received: by 2002:a2e:bc17:: with SMTP id b23mr8941768ljf.434.1634249261002;
        Thu, 14 Oct 2021 15:07:41 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id d24sm372290ljc.2.2021.10.14.15.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 15:07:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH] thingsboard-gateway: update to 2.8
Date: Fri, 15 Oct 2021 00:07:35 +0200
Message-Id: <20211014220735.3679483-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 22:08:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93305

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ingsboard-gateway_2.5.2.bb => thingsboard-gateway_2.8.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/{thingsboard-gateway_2.5.2.bb => thingsboard-gateway_2.8.bb} (93%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.8.bb
similarity index 93%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.8.bb
index 3c89c377a..6ff98abe5 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.5.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/thingsboard-gateway/thingsboard-gateway_2.8.bb
@@ -7,8 +7,7 @@ HOMEPAGE = "https://thingsboard.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7cacdbeed46a0096b10"
 
-SRC_URI[md5sum] = "469c8b5cd1c16c20ef40f0a97a3a0fda"
-SRC_URI[sha256sum] = "b328f4e315c3541ac80a4931974a34a81afe4d1f382f48e8604669a55816c0d7"
+SRC_URI[sha256sum] = "35a8aa0268e61b15d689439927756934a28757dc77ad5f03ee6a9119edc37199"
 
 inherit pypi setuptools3
 
@@ -65,4 +64,4 @@ do_install:append(){
 
     install -d ${D}${systemd_unitdir}/system/
     install -m 0644 ${WORKDIR}/thingsboard-gateway.service     ${D}${systemd_system_unitdir}/thingsboard-gateway.service
-}
\ No newline at end of file
+}
-- 
2.25.1


