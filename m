Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A261C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 10:47:54 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.16307.1661165265081286381
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 03:47:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CJViIwTD;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id bq11so6096017wrb.12
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 03:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r18y0wBD//2v5XrFgFjQg3VqlMsZXS8+pIhRjjuF3VY=;
        b=CJViIwTD30HetQaJwxvLqCzX8PUNYAL05e6Q3vp1myY+2x9zDBTr66V61c7ZR/3BfV
         vl/mbcdCk8tGyAAWkd4PHQZFqH2mhrQ4+aGvNyjFmhkjhTxEfHBkmeHFBsAS4/wvFVAa
         OtUASoy/kMjVnQI3s7Kc4cZ7WSSKTQrQ5bySKoQ3A9P8h1IzNMJM1yr16CNptYwSV2AU
         ST8DXFaxzYx1raOobVOs/Tx+aqCpLdX2LCdXFPVk0V0/Nagpk+QQ3wzpNpqZfCgTniLe
         YVf0sEEb5Ejk5b4WCInTglJ2BvXiKkqo1Q22L65uAFt28et2C0aXFB3gE6SMjcU1ZUqY
         dkrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r18y0wBD//2v5XrFgFjQg3VqlMsZXS8+pIhRjjuF3VY=;
        b=GA3tImEtf3/oAMCBXoKG1syAOFxVU6RJA6n0t+AHY5i6w28d4PVmiOe7HDx6FcgqIn
         APZs0oIvrDq5sKZiRbI4HdsR6sEpoANo4YGnpPnVSm+oXzdgfIfWu81sWB1v+FtqZC/e
         94BqrUx/V0o6BioOUJEpRnaNBV/vYBZkjod1+f9iAzXDqCUraWaO8StbOK6k6dpsJHDE
         jhkCGlhK7n+5k2L3s0MxZFY0ZlF4xrmxAvimxQVBZOJJJTA8B/XbtODHywnP6vfOj1kx
         90gfjmZngfxx/vhP7pgEUhUsPiTRmBVU74CHjIOpp+PkxeBED+4r8cA4Z0pocZRP0bje
         BQqg==
X-Gm-Message-State: ACgBeo1IvCjgczrrYE+nNElRDbXu8ZuQvn8ZJ4kFwqWoafqsvWrCHDOb
	zb85Ln/0s+Whv2RQm6FxZ644UqxHCD8=
X-Google-Smtp-Source: 
 AA6agR7a7UDjJqqEsw3GyiU7VEAyxhnil68vu/lcJtoxPZkIuuixje6TKpCLqvUSl1HmZ0UHV0e0LQ==
X-Received: by 2002:adf:ce8d:0:b0:225:1fb3:db17 with SMTP id
 r13-20020adfce8d000000b002251fb3db17mr10491873wrn.645.1661165263160;
        Mon, 22 Aug 2022 03:47:43 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 g12-20020adfa48c000000b00224f5bfa890sm11795283wrb.97.2022.08.22.03.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 03:47:42 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-networking][master][kirkstone][PATCH 2/2] wireguard-tools: Add
 a new package for wg-quick
Date: Mon, 22 Aug 2022 10:47:00 +0000
Message-Id: <20220822104700.1475721-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822104700.1475721-1-jose.quaresma@foundries.io>
References: <20220822104700.1475721-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 10:47:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98364

- This will move the dependencie of bash to wg-quick

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../wireguard/wireguard-tools_1.0.20210914.bb      | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
index 0c686aae2..20435338c 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20210914.bb
@@ -16,11 +16,19 @@ do_install () {
         install
 }
 
+PACKAGES += "${PN}-wg-quick"
+
 FILES:${PN} = " \
+    ${bindir}/wg \
     ${sysconfdir} \
+"
+FILES:${PN}-wg-quick = " \
+    ${bindir}/wg-quick \
     ${systemd_system_unitdir} \
-    ${bindir} \
 "
 
-RDEPENDS:${PN} = "bash"
-RRECOMMENDS:${PN} = "kernel-module-wireguard"
+RDEPENDS:${PN}-wg-quick = "${PN} bash"
+RRECOMMENDS:${PN} = " \
+    kernel-module-wireguard \
+    ${PN}-wg-quick \
+    "
-- 
2.34.1


