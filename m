Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5DC4C19F2D
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 10:31:18 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.4899.1660213877901261236
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 03:31:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BKyoyuLw;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gb36so32687475ejc.10
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Aug 2022 03:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=WS80mmbPTnihDe33YABAx2N/8roBtyt6ReTUdIN64AQ=;
        b=BKyoyuLwhcXeNlrKOMbDCcdqa0kje4uGCT50omthAD1vtQQj0KPwTE2KLpIqHLM4Md
         GTQRejH7yms5O2pVTRQEc0DQNO8ziV4v/LP4bv8InXZKu/ys/LmUJugU7xRcgZMBJrDE
         WUgFrp5Tz+KG38pMgrfzetuFmY1NFug1bPkI1SAJiB/iAX+N62UNnPZn2+5QzwKcdGK9
         4yRvFWLIro25uNEk0NyjuGOvPbQh1gKDHlokXJm15MAcsY5DYyTBAbyWvTW2vGYYIAZa
         6PNuUsUFmmuzvsHxvVxi15EGphEohkfr6gz9m2YfpUBAroGsgXzE2DsT8crTJLS5zGGX
         84hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=WS80mmbPTnihDe33YABAx2N/8roBtyt6ReTUdIN64AQ=;
        b=wW5nPrutmiu/BQb7dNl3IA2fkbSs0u/2pTeTKwX8VY4yaYGkJvBtdCK+uZyJHupopk
         gfRvOArl/HyVMx5qtblTkck5Z3j8qQvjUq//gVoVZZAUTDAQuK+MdcXHfHvWUnyqnOon
         bPn4ygY4gHxDnSL7ZO+cF8bqm+GqyEJqc4+PATKsFMgTvQ59d1+C9AwuCH1mW+MZln67
         sZx5w5ftY7fDwEpmv3obzTwIgew2R+KzDp4L0fyTZLuh+v8hjXq01AKcGRBrXw8xWfXO
         PBEmxIYFMBW8X26Q0f8YPDT8vz6G0yj6pqWu+gp/L7FfbpqBvAiWVqQN6HL5GvWAEODO
         GJvQ==
X-Gm-Message-State: ACgBeo3oOUei+LL3xxQqoSsALGPKgA8ORXga9whJREyaj8y9U9BHiPYT
	0wV6pDPJ+X4dPThgzh4ggEFAne1cL3I=
X-Google-Smtp-Source: 
 AA6agR6loKo3UnNDUHOAH0yy/QHlbg6fOWYJH8xBrusl0lrZIksWj/w26JL5V4xp4H11VqPMns66hg==
X-Received: by 2002:a17:907:7f05:b0:730:e4ad:e5df with SMTP id
 qf5-20020a1709077f0500b00730e4ade5dfmr21678324ejc.663.1660213875997;
        Thu, 11 Aug 2022 03:31:15 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 r2-20020a1709061ba200b0072f441a04a6sm3411674ejg.5.2022.08.11.03.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 03:31:15 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: Cleanup PACKAGECONFIGs
Date: Thu, 11 Aug 2022 11:31:08 +0100
Message-Id: <20220811103108.5530-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Aug 2022 10:31:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98194

Add ed25519-libsodium to PACKAGECONFIG, mark glib/gnutls/openssl as
mutual conflicts.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 meta-oe/recipes-extended/ostree/ostree_2022.5.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
index b3d9ec56b774..a21c473f0a73 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -70,16 +70,17 @@ PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
 PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
-PACKAGECONFIG[glib] = "--with-crypto=glib"
+PACKAGECONFIG[ed25519-libsodium] = "--with-ed25519-libsodium, --without-ed25519-libsodium, libsodium"
 PACKAGECONFIG[gjs] = "ac_cv_path_GJS=${bindir}/gjs"
-PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
+PACKAGECONFIG[glib] = "--with-crypto=glib, , , , , gnutls openssl"
+PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls, , , glib openssl"
 PACKAGECONFIG[gpgme] = "--with-gpgme, --without-gpgme, gpgme"
 PACKAGECONFIG[libarchive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libmount] = "--with-libmount, --without-libmount, util-linux"
 PACKAGECONFIG[manpages] = "--enable-man, --disable-man, libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[mkinitcpio] = "--with-mkinitcpio, --without-mkinitcpio"
 PACKAGECONFIG[no-http2] = "--disable-http2, --enable-http2"
-PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl"
+PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl, , , glib gnutls"
 PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse"
 PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux"
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
-- 
2.35.1


