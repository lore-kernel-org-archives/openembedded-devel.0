Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2608CC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 16:20:50 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.165186.1692202849708191806
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 09:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lE1IdQw4;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68842ebdcf7so2475317b3a.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 09:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692202849; x=1692807649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8KdaCu7wy/YRbmwPqIL7uoQsrD9RncO4N2DTZo3WIFw=;
        b=lE1IdQw47oLUARniyH3jtDJe0yyvcgMU50A0cK/ghNhyC1S6JjmIT+lAWLJLHpUzoF
         QEXa3zzp8Kh2G7pSw0yS66Af39YrdDG0kr9g/OTsp5VNRu7Xnk4E1KJnuSgj+8UlLiGS
         AiVvNmipmiDcAnj0jlSGF5gBbA2oz9+TgkcXov0vZoh6igSGWUpSiNTJQh/5JLjRMB99
         z+1f2Ip1n85J+goAg9XWiL0Y4UiPKyzN5XntUqM4c3Izdjkrq57WdZsb8b+9/o/SsEgD
         iuC1QnviLs3syEv+vuEVef429eCUf2dsYbidXfaGc22c7Oxef7UCNXc3v50xJ74l1/S5
         mnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692202849; x=1692807649;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KdaCu7wy/YRbmwPqIL7uoQsrD9RncO4N2DTZo3WIFw=;
        b=A8zsN1JRunrfqZz99rH1waEiAKx6g5F7SIbXvI70RvSLkXeaMK5lWJLiYgE875hwyY
         5g4k+017HN5RieuyQzDM4aMtW30IR/xYA3jVdFFxSEUxvDCFHONZMRAjMfIPCL5wilys
         P7c5nTS4REYatD3j02ZIC6D02Fk56v037gH+6CRCUIcS28tyIMP/hxrFzc3P1yGRscEy
         j8sbCioBQS9dXF4QHBz1YMND/Ho9XT/RTAgJuDMN3WnXW12WDHuS2E8KeCdOmVTxg6aQ
         SAfKfnhWLfPYDiNrUH/pc9wHfmPJY7ik0cFYDdiwzMdZ9S2VWQbQrHkYfctZNSNKypn8
         54Rg==
X-Gm-Message-State: AOJu0YyNT0edJ9qyiT5hrSGW78g99DirtNNAGRkNMDuOLeRRP5YzFgk5
	0jVt4bZosAhQzPVIkVnX1++niSBKPfnzew==
X-Google-Smtp-Source: AGHT+IHSY9baK/lgBQRlAemLGxsawWdl7f7Eb3NyoyEgeZk/6ZDySBaA/ARZwjqISl3FeGgLZ6WQMA==
X-Received: by 2002:a17:90b:ed3:b0:268:13ef:ddc with SMTP id gz19-20020a17090b0ed300b0026813ef0ddcmr1925279pjb.3.1692202848872;
        Wed, 16 Aug 2023 09:20:48 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::ed55])
        by smtp.gmail.com with ESMTPSA id ce21-20020a17090aff1500b00256799877ffsm11403383pjb.47.2023.08.16.09.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:20:48 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] mariadb: Adjust the cmake option to disable pam auth module
Date: Wed, 16 Aug 2023 09:20:46 -0700
Message-ID: <20230816162046.4020392-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 16:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104433

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-dbs/mysql/mariadb.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
index f364f47bf0..bceaca64fe 100644
--- a/meta-oe/recipes-dbs/mysql/mariadb.inc
+++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
@@ -67,7 +67,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} lz4 openssl"
 EXTRA_OEMAKE = "'GEN_LEX_HASH=${STAGING_BINDIR_NATIVE}/gen_lex_hash'"
 
 PACKAGECONFIG:class-native = ""
-PACKAGECONFIG[pam] = ",-DWITHOUT_AUTH_PAM=TRUE,libpam"
+PACKAGECONFIG[pam] = "-DPLUGIN_AUTH_PAM=TRUE,-DPLUGIN_AUTH_PAM=FALSE,libpam"
 PACKAGECONFIG[valgrind] = "-DWITH_VALGRIND=TRUE,-DWITH_VALGRIND=FALSE,valgrind"
 PACKAGECONFIG[krb5] = ", ,krb5"
 PACKAGECONFIG[lz4] = ", ,lz4"
-- 
2.41.0


