Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA40C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:34:38 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.3993.1664534075306460017
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=7C14QZdn;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.128.44,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wm1-f44.google.com with SMTP id e18so2622873wmq.3
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SVmdCiuTJngr8OMvWgtoe5dtbLGr6ociTpBqrdg0/+Y=;
        b=7C14QZdnWra3KEJxRYzmewjSZgHQa6aWWNCq7avKFN8cRGRxd42KCh/Tx5mtdXv6pU
         lMyyqWxKqn1/1Q1/aIZ4ioEl7NCgjhARaxRWov4ddiVk9NwU0rQpeVOhP7djyBgxd440
         UsYUkBo4pxRpSAWV1xX6KQwE4oADe1gymJgz1rmqyHqm5vdAcwRK17z8BDIruc9Z+Z/A
         2vWtYASbQWygs+zNRgaqDBjtTDl6MoKEeBB/J4zw3mhMwv/OvtkU7YZd05s+umOwVxgR
         dquNdY5ig3g4IcQr1H9dCd3y2WsnApy2sYdt42Vmt5FdFIWvYvi+h5Uvh8mh1UFKtmJ7
         BPng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SVmdCiuTJngr8OMvWgtoe5dtbLGr6ociTpBqrdg0/+Y=;
        b=qrMTzINhKAAJQOmu3FENygCV6sCjMQyw8rX3DAw6OAkbbOJ4/kiBqAo//2RmoJ4U+t
         i3/+OZy8O9UGXwv0hXIGhgOO/QFyk9PiPOqjoUhZntbqkLsIh1K+YiMjJsVteZLiK5Iy
         +GOhs9kQa3UxKEL/t84XIsO3mChrXrb3V2XEeGUt96euFqoOuahZIlu1ajyDK+b+Afeb
         z7UGN7Po6/6OPXYStjvVAcHSU6rElU+2RyS0fpwTQ2t6NbucLzdcyICV+azCV8VQ9clS
         /aT0QrzjxvFYRG11z0M5juP2+vAHaYe7adpDCrEAKegl3zNXpaCdEL4HwiD9whASnaeD
         1w1g==
X-Gm-Message-State: ACrzQf25PSuK9nkl9a4OkKf4T2fmgoepzp13frqL/kOU4hW07qqvedGb
	9cWJQcIJIu8+SlpYuP3NyFwkeoR74ur7GAxQOs0=
X-Google-Smtp-Source: 
 AMsMyM6MrZLaMjKO1RiWg+wBYAFY6VkmQk3ySMcddFzjFi9mKeCuFHqcmvXO7wAWNyte5tMo2O+GjQ==
X-Received: by 2002:a05:600c:444b:b0:3b4:fdbd:5965 with SMTP id
 v11-20020a05600c444b00b003b4fdbd5965mr5378063wmn.128.1664534073184;
        Fri, 30 Sep 2022 03:34:33 -0700 (PDT)
Received: from WIPC21110265.. ([2a04:cec0:1074:c7f5:a030:e974:fd06:787c])
        by smtp.gmail.com with ESMTPSA id
 d10-20020a5d6dca000000b0022917d58603sm1646632wrz.32.2022.09.30.03.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 03:34:32 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [meta-networking][dunfell][PATCH] networkmanager: Update to 1.22.16
Date: Fri, 30 Sep 2022 12:33:44 +0200
Message-Id: <20220930103343.4012796-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 10:34:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99024

Update network manager stable branch to last version, allowing to fix
CVE-2020-10754.
---
 .../{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
index 33a2b7c0ce93..a28372dd1f9e 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
@@ -33,11 +33,12 @@ SRC_URI_append_libc-musl = " \
     file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
     file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
+SRC_URI[sha256sum] = "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
 EXTRA_OECONF = " \
+    --disable-firewalld-zone \
     --disable-ifcfg-rh \
     --disable-more-warnings \
     --with-iptables=${sbindir}/iptables \
-- 
2.34.1


