Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DBACCD195
	for <webhook@archiver.kernel.org>; Sat, 18 Oct 2025 12:57:17 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.5337.1760792232401188216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 18 Oct 2025 05:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lOG25+rR;
 spf=pass (domain: gmail.com, ip: 209.85.221.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42701aa714aso1715487f8f.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 05:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760792231; x=1761397031; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=c1nzcjwgA1AYhFF3MJJ1GKg3quTem5ZtjrDYd9MdnsE=;
        b=lOG25+rR/z2dy3MENQlzrK9K77laL9zM3Xs8ml56qa05IHQMx59t4WL9FyxlqRnmws
         D025RX2bYOfQFxTh+KhfV67JdVvtleyYlLLaynR3j86YHExZ/OwVe/RcY4KHg9aIGngH
         LV1hR6JYYX+1SlrmofwSZryWRbdUC1iPQ8nSlpZwJkINfp441Pj2FJC0HJbGgwL91MGF
         ZsMcc/WUAplL8Dkcs/zGxzYwadorJJ76e0xegMWPpoJzSomOKSbifZ5zHAUSZnG9i08H
         cN6WjrwyHBP8g/L0PAuky68ZBT6+zd1odhcKhMUHvhSb0/KIdQDo89b1hr6RATAdvZ3W
         oHWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760792231; x=1761397031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1nzcjwgA1AYhFF3MJJ1GKg3quTem5ZtjrDYd9MdnsE=;
        b=tFb5in7Pfk+b8r+yHmdWIUb66dN8CohiVVrB9+OicvjB4wRkyZks0uzEU4fqYgYBqS
         HTCIBUJyYtnjdh5+MT54SplsA4RzIGdOJVFSbSc/nCcsw9xu0X9kC7S/kkufiZ7iILNO
         rPn/0xuo4gypbJNAB8vKiicmSGvt8ep/epvy92IIigV2uuJsi8uYDr0zVYzlo2da2gmI
         l2F5EJGYv7QPLhxakk4cSgorBwh2PZdlhrtKPExgeAS0zbvNMHi+KjTWUGNeQtIcVcjP
         T6utfX0lRGWfDO+231Kjz6lPh6jA3cd+JnHjnNg3ouVZq7Hg4Bge15EonosGKUHFROVX
         yMtw==
X-Gm-Message-State: AOJu0YwouoQ7qhqVGB/XXUOb/fLz9UtToNHH5x65qsjab7p8w5L5YwU4
	gMcBmVWTvKMg8Mw8CcBMaWfbJvbNL8wHKg+128IgTxoNXZk5cE4u87Q4B0I99A==
X-Gm-Gg: ASbGnctnnau2oMProkBcjTz9+uZcD6tDNaOlzvzzi7SMfdYBxKbDnGTHvfW82o/xbwW
	s12rpWnZ1OAKzY9RfgTndaPgWvaFRPJEPyjEPnCnY5r6uKprm1DzI9rnRms65Z6cgH8kjZEu+l9
	lvfP1KaD5oNvv5PwoxvhcnxS728mi4cjgtc9HKqe87VbIJH/pSfGJCchDBc51+pFqitGTueq+2F
	oUfgdGjnLR4I28P6iPZSAKoGnf7Ky6WtdGCuwJjVrV3Oo/YHR6S0/CmMWMcDE34zMXEiILLrK0d
	jbPaMvnJyVwpQHAjpdKMne0DDO3oe52ygWPz93yXYmrZy55UMafP9WViK4+SmniFNIQcnIh1yl7
	SKkeZkTgAqi3bz7vMhWxu0rN0ftGmWf2IUc7dFSPV/P8bx0BLwNFugTX5kcv1mz5XIze5Y8XPQ/
	gSIZ2l4Vxo
X-Google-Smtp-Source: AGHT+IHOhKe2vqmX928vYA6S5EDWSAmsLT5RluEitcay1IxlJCsDtu5aG9225KPFMzkQtUASrjapXA==
X-Received: by 2002:a05:6000:428a:b0:425:8559:5d17 with SMTP id ffacd0b85a97d-42704d9457amr4372856f8f.30.1760792230408;
        Sat, 18 Oct 2025 05:57:10 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144239bdsm169351065e9.3.2025.10.18.05.57.09
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Oct 2025 05:57:10 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] pv: fix ptests
Date: Sat, 18 Oct 2025 14:57:09 +0200
Message-ID: <20251018125709.1381888-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Oct 2025 12:57:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120785

Setting the RDEPENDS with "=" erased the base dependencies
(notably ${PN} itself) from the list, making the tests fail, unless
the dependencies were installed explicitly.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-support/pv/pv_1.6.20.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/pv/pv_1.6.20.bb b/meta-oe/recipes-support/pv/pv_1.6.20.bb
index 867a621d1a..2ecf62e3d0 100644
--- a/meta-oe/recipes-support/pv/pv_1.6.20.bb
+++ b/meta-oe/recipes-support/pv/pv_1.6.20.bb
@@ -17,7 +17,7 @@ inherit autotools ptest
 LDEMULATION:mipsarchn32 = "${@bb.utils.contains('TUNE_FEATURES', 'bigendian', 'elf32btsmipn32', 'elf32ltsmipn32', d)}"
 export LDEMULATION
 
-RDEPENDS:${PN}-ptest = "coreutils"
+RDEPENDS:${PN}-ptest += "coreutils"
 
 do_install_ptest() {
     install -d ${D}${PTEST_PATH}/tests

