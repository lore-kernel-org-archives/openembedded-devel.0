Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 852C7C77B75
	for <webhook@archiver.kernel.org>; Mon, 10 Apr 2023 18:58:41 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.54245.1681153119041711349
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Apr 2023 11:58:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20210112 header.b=KyAChDoX;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id jg21so14292877ejc.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681153117; x=1683745117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5K9bnRrci2eYUece1R+dc97K2aWiIbx4QWgQnf/gi7M=;
        b=KyAChDoXHSD8TEGEi6PJjpqp2EfPhsmh0Pv8X5mnIZQiX1mstIAaN8QKEsqAzpFNEK
         irKGP6JSLjsb4HKiFj9dvQgoRLf2PHqQt4qjEO2hRhun/vBryrts0+PFzdV9G8qn/G1B
         4r69gTyhP+NqsFe64DA54M8lFXAOMOFDW3Lcrx6GsGBbaAYorDjp+BK6Hv4BdZ6Th6xS
         z7l16lbdo4Rv4Ni/fThzLa6zCJh5foSk2ayuOfkLxTciV7V0kOXk2ZivXUoyIXL5LoUE
         2oc6gCTYzoU4TxorkmXoo3OTEgd2irDPNpKgH6TlW2k6btX3ioJ5zrO9g/gcKdcTN16s
         cAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681153117; x=1683745117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5K9bnRrci2eYUece1R+dc97K2aWiIbx4QWgQnf/gi7M=;
        b=DZ5j4c0az89VftfwjozOkwRL6kEDKGvny1elZkQZYVj30coRoaviY6Mqx7GKd8hHEt
         syBdWgRWXLkpGF4kDgEF7rYFWxwHtNd7u6mYrVqtmg1NYfQgwxOc26+3Ue0NBNYkF9za
         vxvrXov/KUbsk6ZU/yy+1Z2V3bo5QdxruyRRKG2md/9UXt3YnYmGn20R9FO6osxPHWr2
         nG0cIkPGdSL3Ad2/x8K0DAjx079A3V1D+rewbhni1z40eaGcVdribUD/ypYVU0rBU+Qw
         lcg33sa0iZ23BIoR6OIp/U9uiDSc0CJ+fAFc+ematkMYku9WAsRjehTAkW6PQg+dPbC8
         GOzg==
X-Gm-Message-State: AAQBX9fMdbqdRZzenF3DDxu25ZZKsGiU8N4gRvZSkXTg9+d1vyM0Fa5f
	wOn2qJxbOl03Ouc2cX272KVvHnBheQ8=
X-Google-Smtp-Source: AKy350aoGKAM85HB5wvNDyG7FjcEs1VZtV1BX2Rgl0Zeck9tnf1X7rN9aDH5fBNLR7tc2E6hDHsdSg==
X-Received: by 2002:a17:906:3a16:b0:925:5eb8:92fd with SMTP id z22-20020a1709063a1600b009255eb892fdmr8378667eje.14.1681153117588;
        Mon, 10 Apr 2023 11:58:37 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id g23-20020a1709067c5700b00947c0df0fc4sm5393504ejp.19.2023.04.10.11.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 11:58:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>,
	Martin Jansa <Martin.Jansa@gmail.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][kirkstone][PATCH 3/9] restinio: fix S variable in multilib builds
Date: Mon, 10 Apr 2023 20:58:13 +0200
Message-Id: <20230410185819.2416704-3-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
References: <20230410185819.2416704-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Apr 2023 18:58:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102045

From: Martin Jansa <martin.jansa@gmail.com>

* do_populate_lic as well as do_configure fails in multilib builds, because S points to empty:
  lib32-restinio/0.6.13-r0/lib32-restinio-0.6.13/dev

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/restinio/restinio_0.6.13.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
index e715135dc3..03eff43dd2 100644
--- a/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
+++ b/meta-networking/recipes-connectivity/restinio/restinio_0.6.13.bb
@@ -9,11 +9,11 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=f399b62ce0a152525d1589a5a40c0ff6"
 DEPENDS = "asio fmt http-parser"
 
-SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/restinio-${PV}.tar.bz2"
+SRC_URI = "https://github.com/Stiffstream/restinio/releases/download/v.${PV}/${BP}.tar.bz2"
 SRC_URI[md5sum] = "37a4310e98912030a74bdd4ed789f33c"
 SRC_URI[sha256sum] = "b35d696e6fafd4563ca708fcecf9d0cf6705c846d417b5000f5252e0188848e7"
 
-S = "${WORKDIR}/${PN}-${PV}/dev"
+S = "${WORKDIR}/${BP}/dev"
 
 inherit cmake
 
-- 
2.40.0


