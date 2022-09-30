Return-Path: <mathieu.dubois-briand@hyprua.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CCE7C433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 10:15:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web09.3989.1664532952207221705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:15:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@hyprua-org.20210112.gappssmtp.com header.s=20210112
 header.b=BRSF0xXg;
 spf=none, err=SPF record not found (domain: hyprua.org, ip: 209.85.221.47,
 mailfrom: mathieu.dubois-briand@hyprua.org)
Received: by mail-wr1-f47.google.com with SMTP id x15so5618635wrv.1
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Sep 2022 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hyprua-org.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=SVmdCiuTJngr8OMvWgtoe5dtbLGr6ociTpBqrdg0/+Y=;
        b=BRSF0xXgTsITEGfqUY0wzS6Kek+2q/WGdOzam5veMnDSMYce/Jq2TlSERW1fR5LtJO
         oUPGRdKZ+xs6yG1KS8ztLaGryXIIxl0nEgBXt/uB9NGmYsOpeAw2OGMhViAZtw2A7Fq6
         0Cto/AAo6uynzDZYb4jD4lV5tLo55McWIhD89/92cNz9AMkW8PxtikkJbcVdLM5EGhUb
         nd5YmktaPFjmR2HBodchTD6fPT3oWyOwMnPKXZla+cW2qFsX6HjQdvKIfLktfxcS5+16
         4GuZdDuwZa/4PZpwxV/wlt+KsC80ES6YCqNIha0yNhnDyjMvgzUAw1BOSz3JWLStkzbY
         1Uzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=SVmdCiuTJngr8OMvWgtoe5dtbLGr6ociTpBqrdg0/+Y=;
        b=LZYNJzH/qwuL3b8M3Q0XzOX6qz+eysylCBmWC/mwe1936GX1BCmwukxW5l8MzVQsRf
         dNjyWj5ArEHe6c9cpaPoH3QCA9w8dnA1z0rlaVRZHV9CElhYmhTeLCJG21n8p5W3yuNv
         szCjHBSRrOTilWzECKh0Wyk2GlKF4P2kE5aCtoTUQt9mwHD3AT544Or8uPWu4ATzBB4V
         J7l31iZh4GNJiEJeUo0Q4QFRhkqdVhCh9aYi25dznyqEk39LWQ8qX3Aa0y7Sce15B+hD
         V8S5SbKwmOuzlwc99VZ35jeXoVr8ZbFDuIpZtGgeptiVdPQywejkWnNaA62BUBKJwKDj
         F8wQ==
X-Gm-Message-State: ACrzQf2ddJztzeDmWW2h0WVHPj8dgl7RtaEN8BVZPFifLwQ/yKT9A292
	jsqj5drkUF96Ak4YrjLUZ0EvAbq3+TGpnc+T+Fc=
X-Google-Smtp-Source: 
 AMsMyM4FbnjXf/Mjwx8aK5rOeHwh+CAu+dKKmNwek+j75Sx/zL1DzmczGwOMMBtIP2/myr6l8ncjRQ==
X-Received: by 2002:a5d:5089:0:b0:229:3151:2865 with SMTP id
 a9-20020a5d5089000000b0022931512865mr5029898wrt.81.1664532950004;
        Fri, 30 Sep 2022 03:15:50 -0700 (PDT)
Received: from WIPC21110265.. ([2a04:cec0:1074:c7f5:a030:e974:fd06:787c])
        by smtp.gmail.com with ESMTPSA id
 h9-20020a1c2109000000b003b4fac020c8sm6195811wmh.16.2022.09.30.03.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 03:15:49 -0700 (PDT)
From: Mathieu Dubois-Briand <mathieu.dubois-briand@hyprua.org>
X-Google-Original-From: Mathieu Dubois-Briand <mbriand@witekio.com>
To: openembedded-devel@lists.openembedded.org
Cc: Mathieu Dubois-Briand <mbriand@witekio.com>
Subject: [PATCH] networkmanager: Update to 1.22.16
Date: Fri, 30 Sep 2022 12:15:04 +0200
Message-Id: <20220930101503.4009742-1-mbriand@witekio.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Sep 2022 10:15:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99021

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


