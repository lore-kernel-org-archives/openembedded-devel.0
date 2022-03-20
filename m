Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74500C433FE
	for <webhook@archiver.kernel.org>; Sun, 20 Mar 2022 08:08:21 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web11.16037.1647763700432301589
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EcuYLWKH;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id n18so10297680plg.5
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 20 Mar 2022 01:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7blnUeRnUnF2TKR2oV9Ej3Lg/ntSXepCXroEw20CJ0=;
        b=EcuYLWKHB0SKyyt2KMN96YwlVSu4L3Y0z3NzVbZCcZuzp/wCJqKRojPZdthyHOCqoJ
         9E5y67JA99HC/Ol+eXj1juzyDkyPq4l1ry3pNAajvBB2nX/9JqkO3SGQQX5Rdg982Qa9
         +LmGXGtpnFOLYKF5ymjrR6qt60D1M4so8Y/r4YaWdar2V9KZFxZCjQbEFoZFGMsbPbBJ
         nVS1ygt0qVOlFYkH7Wf6QiJlrvcqqeRggJBPYMYLgNXl8pC5VBtnCJ3LJnR7l9KWWQRd
         PECzUnZjtjPjfeC+YjrhY//Q4CFXmhYnsrKjVMlvy9+1lmb8FxZsF2XJz1G8wT/vG6mQ
         gNBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7blnUeRnUnF2TKR2oV9Ej3Lg/ntSXepCXroEw20CJ0=;
        b=nnfHFgb1rXRdAC7Fw5Ef90bcLVH7JyaclD3bATKDj3UI37v089xguNSUeiSRCFK+LV
         x79geU5SprWgPX9FTQryowQWNrmrBKb5BDWk62Yub+kY5Fb50EqRU2TYfpVQ9bkatp3f
         ZIUPf02DQF7rbmwIO3v4zweE2gz+LqnsXFKjEIgVCnWug/6ghe9CNejIhVMCE1SEf6i+
         tpxi3TYOIfvt6Uw7sEkrnML+DfP7XzrVjHtsRC4dw9rC9OaTfVNarOjHpv7u0nasSdkh
         F3fAzOpggnnSj/CtOhuTYMK+Hm3xNhx6WdStIkWfywfO5543AhYPeIYBA4JezEqE71G2
         aiZw==
X-Gm-Message-State: AOAM530fycnxVkd1iKAXoCmRa/Eu7ME1RY4X9JqiobhGqqtsSFE5ueNh
	UJZSwgfeooQ2dYcn3dvEJxw8osF7eDi4mw==
X-Google-Smtp-Source: 
 ABdhPJyDDP3OAv4GmNLi8d53bA5lRY9XTkT5MK3nWY1DLan/vwdfcVcEOcydvD3hBeJGXlYyygtnJA==
X-Received: by 2002:a17:903:18c:b0:154:9ee:cedc with SMTP id
 z12-20020a170903018c00b0015409eecedcmr7647512plg.123.1647763699604;
        Sun, 20 Mar 2022 01:08:19 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::781b])
        by smtp.gmail.com with ESMTPSA id
 s6-20020a056a0008c600b004f667b8a6b6sm15607763pfu.193.2022.03.20.01.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Mar 2022 01:08:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 04/17] http-parser: Define LIBDIR
Date: Sun, 20 Mar 2022 01:08:02 -0700
Message-Id: <20220320080815.825928-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220320080815.825928-1-raj.khem@gmail.com>
References: <20220320080815.825928-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 20 Mar 2022 08:08:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96068

LIBDIR is otherwise hardcoded to PREFIX/lib which is not correct for all
platforms. define PLATFORM explicitly, otherwise it pokes at build
system for it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-support/http-parser/http-parser_2.9.4.bb          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
index 122dfc0001..d4f76850d3 100644
--- a/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
+++ b/meta-networking/recipes-support/http-parser/http-parser_2.9.4.bb
@@ -17,6 +17,8 @@ SRCREV = "2343fd6b5214b2ded2cdcf76de2bf60903bb90cd"
 
 S = "${WORKDIR}/git"
 
+EXTRA_OEMAKE = "PLATFORM=linux"
+
 do_configure[noexec] = "1"
 
 do_compile() {
@@ -24,7 +26,7 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake install DESTDIR=${D} PREFIX=${prefix}
+    oe_runmake install DESTDIR=${D} PREFIX=${prefix} LIBDIR=${libdir}
 }
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.35.1


