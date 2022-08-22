Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6E6C32789
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 16:35:26 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web09.20340.1661186116463688402
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 09:35:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IxV9mBtf;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u5so6106792wrt.11
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Aug 2022 09:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=r18y0wBD//2v5XrFgFjQg3VqlMsZXS8+pIhRjjuF3VY=;
        b=IxV9mBtfY+Z2fRLMA7VzhknCqv2PbkmoUC559YNVmKTXgTUzLJ39m6tzHFgk4DcRWi
         PN2mq7nCsqbeWov8xpx9DDoDY6APrJk6gal6IwlOjFuqS4JlO0pMeb/mRw0mDdjXm8Ep
         REWX4Zm08XJcmWg+qFykvZFeT2TvYNW3ceRlSXbcM/aFWjyvOlfjAbkR5q64bIuCCfq6
         wzz0dWghK2/jPoKkPiN3qLnqVc2mBRNCqLZyo5TQbgaJHn/Yy+896ACmXgJOP5Nbiix3
         Elfj4Xi+3ntD8eYP/tR67qCAtqDSD2XiS5leyXy5GZ+47yfNoeTR1OrYdGnpM70+bPdy
         15cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=r18y0wBD//2v5XrFgFjQg3VqlMsZXS8+pIhRjjuF3VY=;
        b=Im3qUtDiRVNgKz4HV6AIBJwkLIV3t/61eySyAzOLVrX7vd8HfsB8owNXMrT6PQ6e7s
         8nVo7x8iSQCLZkBG/QovIoXti6r7T1Q7D8v2sSXOMXhBVFbWgun8WVMygRAgsH6ZEdHH
         wGKeJeadQsguGH12hZ2MhwbaPvaVzdshIQJt1XvOtmhk3l20Dq8ZCWdi+G/T2VcHNWde
         LN4JxMeQentJ7z4FriPUEtoG2ksLKYqW71NefDWRSNlyoo+97xia1FvajGQD9Sk+sroI
         Ust52XRb+oLDX5K9jV7btcqgehcF1GxfRR+5OE3tutJt4KinZwlvs0EOTNpfcV7SQ/MK
         ZkLQ==
X-Gm-Message-State: ACgBeo3fysXJGr/ZoGmYtaSjTW0oQI397K9I5LqziL1HOr5yLAGzgfBN
	nw7gIvlRKqOEiPPbPQkL8NRRsqruQUenU/hT
X-Google-Smtp-Source: 
 AA6agR4XeY7sml/T102c81gBCtJNoj73gNOQ+AGhjfnzJS8npkNcRXaNAgHtPy0iNDDB/40AxA+J7A==
X-Received: by 2002:adf:cd87:0:b0:225:3fcf:3662 with SMTP id
 q7-20020adfcd87000000b002253fcf3662mr7751049wrj.70.1661186114664;
        Mon, 22 Aug 2022 09:35:14 -0700 (PDT)
Received: from og-worker-dev-01.infra.foundries.io.net
 (51-159-19-113.rev.poneytelecom.eu. [51.159.19.113])
        by smtp.gmail.com with ESMTPSA id
 s16-20020a5d4ed0000000b002207a5d8db3sm12312282wrv.73.2022.08.22.09.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Aug 2022 09:35:14 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: ricardo@foundries.io,
	daiane.angolini@foundries.io,
	Jose Quaresma <jose.quaresma@foundries.io>
Subject: [meta-networking][master][kirkstone][PATCH v2 2/2] wireguard-tools:
 Add a new package for wg-quick
Date: Mon, 22 Aug 2022 16:34:34 +0000
Message-Id: <20220822163434.3138129-2-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822163434.3138129-1-jose.quaresma@foundries.io>
References: <20220822163434.3138129-1-jose.quaresma@foundries.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Aug 2022 16:35:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98373

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


