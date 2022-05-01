Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3B8DC433FE
	for <webhook@archiver.kernel.org>; Sun,  1 May 2022 16:27:09 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.173.1651422422508987057
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:27:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UJyooCye;
 spf=pass (domain: gmail.com, ip: 209.85.216.45,
 mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f45.google.com with SMTP id
 cu23-20020a17090afa9700b001d98d8e53b7so11146042pjb.0
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 01 May 2022 09:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UB5lkvVAybTV31cPAqfefUJZsjBA6bPH8Q0/MvucY8g=;
        b=UJyooCyezWu19sShjPVcPDkLgRzekwk665rmyFybxtDDPRhuSIlMvEVf9AxaKW3hTJ
         BuLGr+SWZgmgeiSlcIVhAs3PX4STnono5mSwUiHM50kbiFMDiPm5P0EROAp6v1FfGe9l
         0VLLrhufwgovT12FYUixW5/4gJjf6Nxw3G1y30+8+Gn7r5p16eBrZ7tB61Xek3HtOmUh
         m31bYlIKn9MciCyb/zTynG7SDc6KgkjsmKmvqysWhvb1KhBokoWgFvjq22S1aTxSylk/
         xZvhTe2u+Hq5ugHPe4uJO3//UB1gjKooUfxaI8GndEIxkuHpVQm/SxWRz40M//euDDqW
         L6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UB5lkvVAybTV31cPAqfefUJZsjBA6bPH8Q0/MvucY8g=;
        b=zY3pUx2+Q+LGaluTVg7aaPbDXV8CcN2m/AF7HfWweEphz2hkvZ829hgKhU3EApC3zy
         K7wx0+6oiT4xYNAwvMEZn4uCwJNSeDsbfatB5fFC/TuUo8u7ZzJGdJ7PtYtnoFbLaMkN
         zEQvM9fW2dnaOn/YICZtL/cHRlzD2QZUU+mVGfP+nUOKOqPynyBCIwTXcieSZ0v++ZTi
         X/L56nRJQKw60ySlR/LqSauXVOGtaa7zO8E3HxMmsbJxbCAedirEtcbb0EI9x+AMBRKk
         gQ3mWJ+nYPcujR2diHcQ+0SXGp3YKdsMGfhrAh1J+COBpNAhwONSkyP2cyWKubdoWUwK
         fx2w==
X-Gm-Message-State: AOAM530JRw7fX5fD6Ijz/v/eLvP8fpH/wRxqljpOg0rmhF2SqeiKDxZl
	FrMZKlGx4qoO0Y133NPFOa/nlgwELBIo0w==
X-Google-Smtp-Source: 
 ABdhPJy/U0ZQiX9SkU3m6iITHGIzqllKHeeWv0UJxGaj6viFdFcupJ2dsQB3PW1heP+ssyGykyFPGQ==
X-Received: by 2002:a17:902:edc7:b0:15b:4196:1957 with SMTP id
 q7-20020a170902edc700b0015b41961957mr8084682plk.161.1651422421696;
        Sun, 01 May 2022 09:27:01 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:9a0c:5968:29f0:efcf])
        by smtp.gmail.com with ESMTPSA id
 h19-20020a170902f2d300b0015e8d4eb243sm3063569plc.141.2022.05.01.09.26.59
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 May 2022 09:27:00 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 09/10] packagegroup-meta-networking: update pkg group
Date: Sun,  1 May 2022 09:26:42 -0700
Message-Id: <20220501162643.513646-10-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501162643.513646-1-akuster808@gmail.com>
References: <20220501162643.513646-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 01 May 2022 16:27:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96921

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../packagegroups/packagegroup-meta-networking.bb           | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
index 892ecc7746..143e487122 100644
--- a/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
+++ b/meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb
@@ -31,7 +31,6 @@ RDEPENDS:packagegroup-meta-networking = "\
     "
 
 RDEPENDS:packagegroup-meta-networking-connectivity = "\
-    crda \
     daq \
     adcli \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth x11", "blueman", "", d)} \
@@ -49,14 +48,13 @@ RDEPENDS:packagegroup-meta-networking-connectivity = "\
     vlan \
     vpnc \
     ez-ipupdate \
-    firewalld \
+    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python", "firewalld", "", d)} \
     freeradius \
     mbedtls \
     miniupnpd \
     mosquitto \
     nanomsg \
     nng \
-    netplan \
     networkmanager-openvpn \
     networkmanager \
     openconnect \
@@ -100,7 +98,6 @@ RDEPENDS:packagegroup-meta-networking-daemons = "\
 RDEPENDS:packagegroup-meta-networking-daemons:remove:libc-musl = "opensaf"
 
 RDEPENDS:packagegroup-meta-networking-devtools = "\
-    python3-ldap \
     python3-scapy \
 "
 
@@ -241,7 +238,6 @@ RDEPENDS:packagegroup-meta-networking-support = "\
     ndpi \
     ntopng \
     nuttcp \
-    nvmetcli \
     open-isns \
     openipmi \
     phytool \
-- 
2.25.1


