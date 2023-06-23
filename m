Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84399EB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 17:41:38 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.4717.1687542097415846432
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jun 2023 10:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=sU+feeVw;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: beniaminsandu@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-98d2fb1bb23so108417466b.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 10:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687542096; x=1690134096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7lgMsOjtXCElFfYDQyC9Yg5Xrcr/oSftzeNwF3dxmrY=;
        b=sU+feeVwjsXbDky4Vn+ryLpzvIE8iPRgdVD+uWtxwYnbIfAHj2kr7ekNdFibsqdZme
         MvgN+CNjEpTVDfeQKpXPq02+pcHgdyo+0EO6/dKGt131PI+tVABF6WbCVp8vYAHqzJmR
         Tl1+mnmapiBL6Q0yx0gO5A2BseyD/0ahzOJkiAWvkIIynSbUHts6I4pURevdZF8NyoGS
         SCCF2pidgKXWASeEg7YKhi4fF86eg2oPzgAV/F8K5LqntvousCGvEZzYqIZJEDfPEKlS
         DQa+xr42KNQ/W0+5J/ABOvKd59fkxg8k3BOuK8OoUJ+6g0eVfcQI7FpE0XPm2BLJwgli
         ViAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687542096; x=1690134096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7lgMsOjtXCElFfYDQyC9Yg5Xrcr/oSftzeNwF3dxmrY=;
        b=EMuCwEykd0TdoorzZYXqN8/Oi/bokD4RLYH7btleQRND1UfAI6sx7zG2Jx9/mloQYc
         o2p2McBOxSbmpDykyu6qnQxHYyrUIuDmnpf74NoxYjMxTaFl3HR1A7P9bReaCPzSylyR
         +h9/LJWNnVIZpgJtCDproeX51miX7obXEr6koKWaEbznf618H4Bb0ejkXxZITsSGsVWF
         JLPhyW0Jsw1cpnKpJVSeUE/m7KqqRsknKWXpD6BJ4Xh8RDMCfYsRLJUgkNApr4IopeuW
         Ib/VZOvdGFFfwEf0G5iCc9Es7qjERL7tU3hFdW3aYBw9YCF/xGRcqWd4QwVX47UXRxry
         rmBw==
X-Gm-Message-State: AC+VfDx4vdsHcCxtG3V0S4jE50RXtmZoVNn5ucQRCMyt87UQE2F5UaHA
	833+U2QvzGF13ogAb49e0T69ageAYhnliQ==
X-Google-Smtp-Source: ACHHUZ4/H2pX+5G/jL6YFNGUtLWrDWMiwV97OqUMigNLlnUra/XLSewYXD1QAuJ1fm1v5p7H27AJLg==
X-Received: by 2002:a17:907:9303:b0:988:6bd2:b0bc with SMTP id bu3-20020a170907930300b009886bd2b0bcmr15102904ejc.2.1687542095605;
        Fri, 23 Jun 2023 10:41:35 -0700 (PDT)
Received: from localhost.localdomain ([5.13.151.121])
        by smtp.gmail.com with ESMTPSA id ks25-20020a170906f85900b0098864f474cesm6224327ejb.126.2023.06.23.10.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 10:41:35 -0700 (PDT)
From: Beniamin Sandu <beniaminsandu@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Beniamin Sandu <beniaminsandu@gmail.com>
Subject: [meta-networking][PATCH] unbound: add option to build with libevent
Date: Fri, 23 Jun 2023 20:41:12 +0300
Message-Id: <20230623174112.12521-1-beniaminsandu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jun 2023 17:41:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103554

Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
---
 meta-networking/recipes-support/unbound/unbound_1.17.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
index 9855a557a..ff3d879ea 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
@@ -16,7 +16,7 @@ SRCREV = "90831af981221bbce1cd7b15055562336760e484"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-DEPENDS = "openssl libevent libtool-native bison-native expat"
+DEPENDS = "openssl libtool-native bison-native expat"
 RDEPENDS:${PN} = "bash openssl-bin daemonize"
 
 S = "${WORKDIR}/git"
@@ -28,6 +28,7 @@ EXTRA_OECONF = "--with-libexpat=${STAGING_EXECPREFIXDIR} \
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 PACKAGECONFIG[dnscrypt] = "--enable-dnscrypt, --disable-dnscrypt, libsodium"
 PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
+PACKAGECONFIG[libevent] = "--with-libevent=${STAGING_EXECPREFIXDIR},,libevent"
 
 do_configure:append() {
 	sed -i -e 's#${RECIPE_SYSROOT}##g' ${B}/config.h
-- 
2.25.1


