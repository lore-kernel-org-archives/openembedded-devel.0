Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04264C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 08:41:36 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.206025.1724056895398562288
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Aug 2024 01:41:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lUsxzBiO;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-42808071810so32201085e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724056893; x=1724661693; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5iMM+se+hAwVLA4N3687yRXacSKOq1UI/KY9/a7l6nI=;
        b=lUsxzBiOp7FDacdtzZdg72iL1S5BpUX8mpK8TbIiIgN2qXV94FP6x2POU1ifOJJlGG
         Ai8szMrTcWVVXOzytfutODlWjbct64J809OFkEFwMfjKCpglm/t6/faixIn+fXZbMoAb
         F2MzeQKMVHc5wf1rqlvwPb4bWbBHQCZXlfzj+Rc/aAiBqbZSTycljYvFVBlgjc5VAC+b
         bfyEB+u9eK8vHMiZCKdMwZw4rpUQjZR3G0V9F8/RU+b5Umvtbqv71PMSGGOv6DxlAEwc
         c8/kiSbF6UDkjv1y0trR4KmMDNBOscLeH2nDxmNOM4Km5cS0UCGPfE/KGhuaA2POWRue
         HicA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724056893; x=1724661693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5iMM+se+hAwVLA4N3687yRXacSKOq1UI/KY9/a7l6nI=;
        b=tBhkZmw8PrpOse5Wv/KWUOwPO7+2CxADSM/8DlB9mVG6Z0YcNXhZCoCzZYeLWhpubK
         9969s4FlKgympyyjW3XYpff827FEkRTBUWeKXa9tNJTJfsrcGb1wStmLSxpHkY7ii89p
         hmIMcGg4f+NZ6O1Iuij/KU9vVN4LkNmsP0vxHEJDJ65dOslMVkj6yPDAyTdXwWrJt+Fs
         hkxHov7CjqP4E4EY0ZfTdbMwfJ9uDACZTnyi/I8Xsa3XqiHHovn8lCFDbUDrWoyGuTuJ
         WhMbhuf3jnbGbGAn9DKC5UwUGDtYBQTfld/wyvyPMkSNDVlg0h1LsuD+VftA60COGy+U
         4XgQ==
X-Gm-Message-State: AOJu0YyvSQSlOGL9icYTCHT+qmz1wpolwm7w5YfMR541l6o+pakYYRDF
	o/wxsWDqnlnCmNflfXHOKbVJhbAJ1P+Bx/IRGhmwGS6wfFSszI/2qvVRVA==
X-Google-Smtp-Source: AGHT+IHSp96k4bdV7EdhEsob+PxjkI7kB5Ir30XeTKxyYdRdsMMoyvqwx2OH1GQdAFhVUyilQ4hR6w==
X-Received: by 2002:a05:6000:14c:b0:368:7f4f:9ead with SMTP id ffacd0b85a97d-37194315d69mr7257111f8f.7.1724056892878;
        Mon, 19 Aug 2024 01:41:32 -0700 (PDT)
Received: from af-t14s.fritz.box (212-51-147-160.fiber7.init7.net. [212.51.147.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718983a2eesm9880202f8f.19.2024.08.19.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 01:41:32 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-oe][PATCH] networkmanager: remove modemmanager rdepends
Date: Mon, 19 Aug 2024 10:41:18 +0200
Message-ID: <20240819084118.392393-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Aug 2024 08:41:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111846

This reverts commit: 5edb8335dc46450fd6bcdbb3fcf55336b32bd422

The Networkmanager package must not depend on ModemManager. Only the
Networkmanager-wwan package should depend on the ModemManager package.

The mobile-broadband-provider-info is fully optional and it is often not
required for embedded devices. Let the user choose if it gets installed
or not. Adding it explicitely to IMAGE_INSTALL is simple. Adding an
RRECOMMENS would work as well. But adding an RDEPENDS is bad.

In general, NetworkManager packaging is intended to provide a set of
binary packages suitable for building many different images.
NetworkManager is designed to be used for binary packages distributions
where it is not possible to rebuild NetworkManager just to install
Modemmanager. Also for OE, where a rebuilding is possible, a rebuild is
a disadvantage. So please do not destroy this flexibility by adding
RDEPENDS, which are firstly wrong and secondly only suitable for your
specific needs.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 .../networkmanager/networkmanager_1.48.6.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
index 215f5a424..e9284a29b 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.48.6.bb
@@ -102,7 +102,7 @@ PACKAGECONFIG[polkit] = "-Dpolkit=true,-Dpolkit=false,polkit"
 PACKAGECONFIG[bluez5] = "-Dbluez5_dun=true,-Dbluez5_dun=false,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "-Dsession_tracking_consolekit=true,-Dsession_tracking_consolekit=false,consolekit,consolekit"
-PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info,modemmanager mobile-broadband-provider-info"
+PACKAGECONFIG[modemmanager] = "-Dmodem_manager=true,-Dmodem_manager=false,modemmanager mobile-broadband-provider-info"
 PACKAGECONFIG[ppp] = "-Dppp=true -Dpppd=${sbindir}/pppd,-Dppp=false,ppp"
 PACKAGECONFIG[dnsmasq] = "-Ddnsmasq=${bindir}/dnsmasq"
 PACKAGECONFIG[nss] = "-Dcrypto=nss,,nss"
-- 
2.46.0


