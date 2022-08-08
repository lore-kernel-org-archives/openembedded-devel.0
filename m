Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036D7C25B0C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 14:25:09 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.26268.1659968703040427161
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bCAkgFl+;
 spf=pass (domain: gmail.com, ip: 209.85.214.179,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id w14so8689003plp.9
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Aug 2022 07:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=G4uAsqP5YZGf2U1f+SH2uiOUliOig+Yb7Vb7EG6MHj8=;
        b=bCAkgFl+SRWV1OkkbUY03beaajLA9PMowFKb+K3AzMuI1kUXOYdazq9BkTHOtV/0oa
         4ssc1rteXb1+K6WqQ7mch6z73PqelJTRkp6eALjsNgAXUDUNhQoIc5THDx1TBMQCas6I
         jJq8Q9Jwg81q6CwWo/7Xoy4PIJ5wTMlAnVJLG5pxLnnQhzo+7di4l6+qvJ20440xw6Xa
         RZH+lkZ13irMa8VK7b8sVtqOOgBqOXWp42BgwV2hSvlQZZE2xopUZhjscfhu2hCYtdk0
         1UO3Viwbi3SYXRY0M69WqqSutUd2AKb8Prq2+yyq/5nkBQD3drh2WH8+f2wOkRfD6Vxk
         QwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G4uAsqP5YZGf2U1f+SH2uiOUliOig+Yb7Vb7EG6MHj8=;
        b=x9Z2betN5oSLFq2fOF7ruGQ/Qsg5elh+A521taEBsD6o88cUboi8SmLVWXanjPwZ3D
         p2RmORVYR5vw1aapQt3kiQskBT4D9CaqsqJJ/tYKUQKq64Lu/dbpTm1SKdLpWQMsP50h
         wEmXShSnQP6adKPDMSrIhWt/z30DGDONREub1iBGj5LuGdRfaNSEB1HGxUyBuBF2qSU+
         9XjYLs1y7DaEp+mPwFekAjO7We4NaMbJMqY506I/G40MKmPBNEGir1dfOwF8SpJhzDVU
         mxB/vOiInQ6K6TlSvkh1i+hKpQq5ZB4y44IPu9cEy3n9Mvphh5UUYckh6Ch4HKagzzxV
         UV0g==
X-Gm-Message-State: ACgBeo2qPBWp+0PSUIA6NI14IJXNkJFfQLdqg5Zr3BwOMTVrEu1GnVjg
	Hs+njjtg16vVQdOcHPW1VvjnT5+3k4c=
X-Google-Smtp-Source: 
 AA6agR7qEiufCp9/JsKAlmrCIi92gYAsW/ba1ckAiUflkTuyNaSDlB15MDKdz/XyTzTpqu7Um6CKdg==
X-Received: by 2002:a17:90a:4fc7:b0:1f5:8d67:c7b7 with SMTP id
 q65-20020a17090a4fc700b001f58d67c7b7mr15904814pjh.106.1659968702063;
        Mon, 08 Aug 2022 07:25:02 -0700 (PDT)
Received: from keaua.caveonetworks.com (c-67-181-203-136.hsd1.ca.comcast.net.
 [67.181.203.136])
        by smtp.gmail.com with ESMTPSA id
 u8-20020a1709026e0800b0016f1204cde8sm8757492plk.301.2022.08.08.07.25.00
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 07:25:01 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 03/13] polkit-group-rule-udisks2: fix override syntax in
 RDEPENDS
Date: Mon,  8 Aug 2022 07:22:42 -0700
Message-Id: 
 <5b7f7f31ffd330a7ac7b78f436ce07587d33af1c.1659968069.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1659968069.git.akuster808@gmail.com>
References: <cover.1659968069.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Aug 2022 14:25:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98163

From: Yi Zhao <yi.zhao@windriver.com>

RDEPENDS_${PN} -> RDEPENDS:${PN}

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 10b508deacd8ff588b1511d077fcdd708deb653a)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
index ae024d0328..db2ed015b4 100644
--- a/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
+++ b/meta-oe/recipes-extended/polkit/polkit-group-rule-udisks2.bb
@@ -7,7 +7,7 @@ require polkit-group-rule.inc
 # The file originates from https://github.com/coldfix/udiskie/wiki/Permissions
 SRC_URI = "file://50-org.freedesktop.udiskie.rules"
 
-RDEPENDS_${PN} += "udisks2"
+RDEPENDS:${PN} += "udisks2"
 
 do_install() {
     install -m 0755 ${WORKDIR}/50-org.freedesktop.udiskie.rules ${D}${sysconfdir}/polkit-1/rules.d
-- 
2.25.1


