Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF60C47088
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:58 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.21843.1649623335340109528
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=JyKArL26;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.47, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f47.google.com with SMTP id y32so23383742lfa.6
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 10 Apr 2022 13:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRIeWHkmgi1jsONh4xHLLTPoMYZOGNdSE3b0A0tTkcw=;
        b=JyKArL26N73DLgF7PJF9SKyxw13onLD9Q2AIta9ZnxRwoG2nAjlMj/QVUNeKn95tKv
         GS5RUl0Mv6fg42jCOhl9XYXZqKIae0vvQbROoWMe1IccOAMBlPUeZyrrA06ibBm2q2qI
         O1JIr15PrbxgS8rfvvUICrMg1EthDq6KWggoIJNLNIBRrSLW9nV0Qd4YKtPeU/dhfGui
         Sv+Ax84IOfq+AjGgUrL8bKEAedU6VxbwxBZuQWiLMGZ1Khq5/hD+QBrhP66KaEaAfUhH
         bJXA9WGhgw9rlBx8HtR9JFcFK8jV8rx2OQMJ890Wa2cCFV2Pu59e1WAw+lnMuVg79et5
         73XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRIeWHkmgi1jsONh4xHLLTPoMYZOGNdSE3b0A0tTkcw=;
        b=5u7qLuIsz9ZoDNoyrZrm59XEdHUNR9NmpR/XKXOh93zThmF3uJaH2lDvaknJX92ZoX
         2/5hhl2uJLNRUNmIXHSHUeQWUFGQBW6WMJSQmwRmFURg3/WJwQRr4IhPOeguAWXYbnWV
         dnVww3ISfdNc5OekzEvggD+V0CoxrQqXBZg5/TKTDZI4wUNc4dbaouwk9FhBtryCRpLD
         Xtk2V4d9xZqVFVgFx8f5vV+S5BxBy78q5GVFpedJC35zFZ3+g4BP2Rm6AblcbxNNWH+h
         WsJZ3e0TDtvXstLKHtGcAJQqDJGmnTcRrcJSmb7S6qDQ+2vc77miQrYwSvuXZPeOVEHt
         zu2A==
X-Gm-Message-State: AOAM530CfHxoi4jPPp+PfI2/fb3FCUnha5nO8FTUreXLzuWpHLQbleb2
	MMySPIjKNlOjyZJzLX3dwRcyELu4eHX0OPMf
X-Google-Smtp-Source: 
 ABdhPJxk4cMx4NRfdQPnkNg3F8WWIduAVvLlaOivjPf62xtDY+lFU7dMbsy7tlfY/9rUCC7FFiquQA==
X-Received: by 2002:ac2:5f4d:0:b0:448:7d37:5838 with SMTP id
 13-20020ac25f4d000000b004487d375838mr19331176lfz.419.1649623333264;
        Sun, 10 Apr 2022 13:42:13 -0700 (PDT)
Received: from localhost.localdomain
 (c-7918524e.023-160-67626725.bbcust.telenor.se. [78.82.24.121])
        by smtp.gmail.com with ESMTPSA id
 be35-20020a05651c172300b0024b4a91032esm1036360ljb.70.2022.04.10.13.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 13:42:12 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-python][PATCH] python3-pulsectl: update to 22.3.2
Date: Sun, 10 Apr 2022 22:42:11 +0200
Message-Id: <20220410204211.4045208-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96519

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../{python3-pulsectl_22.1.3.bb => python3-pulsectl_22.3.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pulsectl_22.1.3.bb => python3-pulsectl_22.3.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pulsectl_22.1.3.bb b/meta-python/recipes-devtools/python/python3-pulsectl_22.3.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pulsectl_22.1.3.bb
rename to meta-python/recipes-devtools/python/python3-pulsectl_22.3.2.bb
index 9a5b9f948..c13c67789 100644
--- a/meta-python/recipes-devtools/python/python3-pulsectl_22.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pulsectl_22.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/mk-fg/python-pulse-control"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f1d10048469ff90123263eb5e214061d"
 
-SRC_URI[sha256sum] = "f28fe4b881dd2cc144d2d94f83ec60d8c59a52642a0ad3635cc4d0f8406f4858"
+SRC_URI[sha256sum] = "cc174e1ceebd4e6222c5b78f4f415f12e80753c9ab75ab354159b4cb5950b084"
 
 RDEPENDS:${PN} += " \
 	libpulse \
-- 
2.25.1


