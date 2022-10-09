Return-Path: <devendra.tewari@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A72C9C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 23:34:40 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web11.804.1665358470238482946
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 16:34:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=guaCaqGL;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: devendra.tewari@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id o64so11261819oib.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Oct 2022 16:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Izbuw9pAHWRe2eL+Niq49ZK1NQVWhJJaPCjaCJhYWI0=;
        b=guaCaqGLm95jR4m+jKPVC9x6yv++eAiLB32jGsA6zlps/qfKVXEN67i7gw0T6UQrD0
         ZzGwx6ZPm3Ohp5Nny1rOHtcdBbcbz/AMhspcNjW76DyYuoPYPfWq7nbyror96N2zmeFl
         gZOTWUQfoBzIk0+mu9y/XriweVtmGtnLdSPT22qPs8IhRssWrQpYw7v3OFFpuWqqWP+U
         3FKSyneLS8F2X+pdCWF/jymaIRrgN7g6QI6Z/Zr66s1KN8AXz1mtvFuxukIp0ZntbRSY
         xibq/DPbY2nL86/I7zHAafKP5Pf1/z5TBIG9eqinOGPiTfb6TF/BMA7cjQbpitk3w+H4
         yrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Izbuw9pAHWRe2eL+Niq49ZK1NQVWhJJaPCjaCJhYWI0=;
        b=ZwqtmhxtdWGd5+cTdRC1YMn/KHWP1l2nwbbAHwhcOvEuRqSrJERtm/jEbAnNus/qKc
         JN0kKoIP0EB9sSVzBdqgSzJwNA7ZGDEdeyZKl88mRPC9ZiEYiPGfNaSQHK4h45vSAoF5
         RX9KVYJkdJrPlIFLkpXxs8QUD2Cft9Shw+RQT7feNFRUkZLJNAVwhFaG+4D7+UMrgdVu
         hMjTZO0+UzYXHTVKjUaThZBrBQuGlGyQhCYKKHTtLaznsQxR8PgRNhnJ4exziGDrwuPI
         kijQouYImX7AnsJ55JydwDyB+MDy+liQghjeajWJoiSTQcAJBifDXQy/wtLXU2AnRF0w
         ehOQ==
X-Gm-Message-State: ACrzQf3o5hdwSlxrgge5zunVh4ZzX7zEw7G0jru1pnBX4Mu67p0P8o+d
	UHah0rgUdYm9vGOz012BQbW2FbKMfgc=
X-Google-Smtp-Source: 
 AMsMyM6z1jUvz7E3dPMYCILq77zjeFebj7Rk5cWPQgLD3V9uVTeZOT72rEs8Dk4cgqGyzgyyxi37mA==
X-Received: by 2002:a05:6808:208d:b0:354:d8e:b335 with SMTP id
 s13-20020a056808208d00b003540d8eb335mr7885976oiw.46.1665358469203;
        Sun, 09 Oct 2022 16:34:29 -0700 (PDT)
Received: from ma-mailsvcp-relay-lapp04.apple.com ([187.105.4.40])
        by smtp.gmail.com with ESMTPSA id
 l11-20020a05683004ab00b0061b8653b0c9sm4259014otd.22.2022.10.09.16.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Oct 2022 16:34:28 -0700 (PDT)
From: Devendra Tewari <devendra.tewari@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Devendra Tewari <devendra.tewari@gmail.com>
Subject: [meta-multimedia][PATCH] libcamera: Remove boost from DEPENDS
Date: Sun,  9 Oct 2022 20:34:05 -0300
Message-Id: <20221009233405.95507-1-devendra.tewari@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Oct 2022 23:34:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99113

Signed-off-by: Devendra Tewari <devendra.tewari@gmail.com>
---
 meta-multimedia/recipes-multimedia/libcamera/libcamera.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
index 2d3f5e94937..53cd94cbf0e 100644
--- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
+++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
@@ -18,7 +18,7 @@ PV = "202105+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls boost chrpath-native libevent libyaml"
+DEPENDS = "python3-pyyaml-native python3-jinja2-native python3-ply-native python3-jinja2-native udev gnutls chrpath-native libevent libyaml"
 DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
 
 PACKAGES =+ "${PN}-gst"
-- 
2.37.3


