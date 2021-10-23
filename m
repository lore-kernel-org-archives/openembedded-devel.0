Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C60CC433F5
	for <webhook@archiver.kernel.org>; Sat, 23 Oct 2021 20:36:31 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.11113.1635021381024944614
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=YsMSIvSY;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.208.179, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lj1-f179.google.com with SMTP id o11so8536059ljg.10
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Oct 2021 13:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4QleT72ZRLe77MRyOim9LRoYShOsvU53KnLhTkuxi+w=;
        b=YsMSIvSY3P4cKHk2ZSVQmbKf386hz3Z0U6Xh9RqoMZDabiEKqoOkJ4WqsfYZj3DlUb
         W8U1Y3If8oxwMpqzp39xTWgu5AUcMfRkUI+GXZjyNnvIvqw9utuRy+Nlo5b2uWtokZbc
         jEhDRlBVAP30ubMc2HRURf4fvw620y+FWkpCeRgEr7zLml7dixXDV0wrTMaq+bGjUdtb
         +jbyp0gopVM6aXwhiazP7N45M7CoV6NgbJ+KHoV/ubxbfDpOuDRxIScYDC9aeXh6PP42
         eJMcocZpDYkO0BYgZ9bEoU06ZlviZR+u7DuI4ZmniQZ6FjepSs7f9SK26E2sSs9Tmn2+
         Nd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4QleT72ZRLe77MRyOim9LRoYShOsvU53KnLhTkuxi+w=;
        b=h+JV81NaDt3DNHqQXL2PXnXBJL8m/Iv3U0KNRml/+ZOWGfNtJLU+XPI8h3IUbUcTCf
         UheXsxFUPY+8I6DVbvp13LYcuuycnaIks9njEtLKLxhJ84fHBrkFnW2v3pj4VmElhgXA
         WFbbjS/5MsfjQxcuBymoMntl0e6hf7lpK5fHEgw9VE+t3EqA8bPeSfvvyr2Lt4m/YC6L
         Ge1CzPK2A7SP6z/P4z4gzqODCIkzIfH3Ra4YJDXJv0u9quMxPMImwMg5c33RK9+1bADg
         23GwSRTuU5DL6ZXt3MaI8xvkHziCW2Ab52oeMXwb4ep6A4fcnMucRiHO/XDO2hR7hTPq
         14fQ==
X-Gm-Message-State: AOAM531G+qW6PE7AETwBG8G3BfWEBhaOizHYivlb83wL+6sTPKgrMNnT
	B0t9AvXpCm0UVEXPeS1LfYGGr2rSoKygMSaM
X-Google-Smtp-Source: 
 ABdhPJwW6udGdvOiQYNNcH+Qlozk462lQWMPzzPCIp3PX2f4SIy/j+RqQvEPtfHWkYtwd7M9Ip6OqQ==
X-Received: by 2002:a2e:a4a9:: with SMTP id g9mr8002903ljm.245.1635021379106;
        Sat, 23 Oct 2021 13:36:19 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 b15sm1131479lfb.255.2021.10.23.13.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 13:36:18 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-python] python3-stevedore: update to 3.5.0
Date: Sat, 23 Oct 2021 22:36:17 +0200
Message-Id: <20211023203617.1656746-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Oct 2021 20:36:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93548

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-stevedore_3.4.0.bb => python3-stevedore_3.5.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-stevedore_3.4.0.bb => python3-stevedore_3.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb b/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
rename to meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
index e2f43048e..8d345e66e 100644
--- a/meta-python/recipes-devtools/python/python3-stevedore_3.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-stevedore_3.5.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://docs.openstack.org/stevedore/latest/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "59b58edb7f57b11897f150475e7bc0c39c5381f0b8e3fa9f5c20ce6c89ec4aa1"
+SRC_URI[sha256sum] = "f40253887d8712eaa2bb0ea3830374416736dc8ec0e22f5a65092c1174c44335"
 
 DEPENDS += "${PYTHON_PN}-pbr-native"
 
-- 
2.25.1


