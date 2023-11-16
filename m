Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64657C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:37:49 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.11366.1700152660955090811
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:37:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gAhSVtRu;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-53df747cfe5so1576065a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700152659; x=1700757459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WKJ/dhKkP9gxmjXbUVQt54892mHSInBgW5NUyRYo7No=;
        b=gAhSVtRuw98EQvtgQsj0BJWfBiZpw+KXEjQJyqdo5dHf/e3bO5sQk7zcP8rZmWKtzn
         1oKq0Q1QgvPnzZTrnxvAN4L5SHhsAb7FF1tt5vJfsN/RxMkjzXRCN8rgxqzFJa1KnYIl
         UzVEHHQ8XxYSpbRwjznC/UJFibWytGrwuFfQE3A2wYMR9MaBU/YVReG67wr7d2Wn63zG
         uQDix0ugiaeLcmb91uhD0uturdIvk16DJUE6UuFQymcBEt2J2SU/ZDjnPKzym7O9qQB4
         GXdarMUGrJBfx+pkum6syCuIYOFktXLxDEKBC/AmBhazWPPNsGGcMTLhpEFx80U6aIHo
         JuIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700152659; x=1700757459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKJ/dhKkP9gxmjXbUVQt54892mHSInBgW5NUyRYo7No=;
        b=KwuYLCLj7t6lXkfxEEZVF/qWmHEMwAdFOxemxu2vxhgaMNOXZa+XFee53OVndZoVf3
         ojDXInrOyNvlyv6pPqlEGnQKHr3bugKW7eI4erHne80qOqx1twl6VItoj2y0bMnAh6wz
         GnB2bYznYmPz64ZOreuK1O9ce1ZmvvOt1AFbKrHedi1gwXgtbhRjB8/PrMH0O92D4nfj
         aZXfQUEAPH47hCSJFqLdah1PBHXN2WwReq5Il8zwPg+Tz1swoBFSAI1ClEwN/r9GqWYj
         us5trB3LNK2vAag+VOYZ48HdOsv4CAz/k3B6Ude5AivTKkVrQTgVuBS1wYazUz5T4HM4
         klAQ==
X-Gm-Message-State: AOJu0YxEZ7ReK+VaK4b7MDXRMs81whWSDQUeSd95dwNL/iR9HCOnOVdj
	uYWXVNWSHIp9zXFrcvmMZ4vdUtrUCdyF/Q==
X-Google-Smtp-Source: AGHT+IEL2DdKitxNVWz28+Iv10KDlng/3pZlYKlMWWKoA333xm43mxrALIPsk6pHuNfNzZswXnC35Q==
X-Received: by 2002:a17:906:7c4e:b0:9ae:4776:5a3a with SMTP id g14-20020a1709067c4e00b009ae47765a3amr11627470ejp.39.1700152658406;
        Thu, 16 Nov 2023 08:37:38 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.108])
        by smtp.gmail.com with ESMTPSA id kf2-20020a17090776c200b009dda52b1147sm8597427ejc.126.2023.11.16.08.37.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 08:37:37 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] capnproto: upgrade 0.10.4 -> 1.0.1
Date: Thu, 16 Nov 2023 19:35:24 +0300
Message-Id: <20231116163524.1095372-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106817

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../capnproto/{capnproto_0.10.4.bb => capnproto_1.0.1.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_0.10.4.bb => capnproto_1.0.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.bb
index bbdc3b597..99a76d454 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_0.10.4.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.0.1.bb
@@ -5,8 +5,8 @@ SECTION = "console/tools"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
-SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-0.10.4;protocol=https"
-SRCREV = "a91ec65323c2577732224d0cf6f5bf1e79d3a724"
+SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https"
+SRCREV = "c7f810a76ca88ff28613fa165927e0269255aab0"
 
 S = "${WORKDIR}/git/c++"
 
-- 
2.25.1


