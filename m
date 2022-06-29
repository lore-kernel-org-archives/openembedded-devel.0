Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D948C433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 16:06:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web09.13534.1656518785217823420
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 09:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dqm3YpN8;
 spf=pass (domain: gmail.com, ip: 209.85.218.43,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id u12so33495999eja.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jun 2022 09:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ojl6y8j9lHXVfpoJ+pefkkiClCE7xVaODeP7aZwUkQ=;
        b=dqm3YpN8bg4Oid2i8gYYBIX4cYa3ejmni91WUzFW4LmUcoweSiSKF0B1daBtzvB8nG
         iAhaQZDRgqLTiHKeEKpIUFCyZTcljhn0x8bNjP0Fx1oq4gdmi/sE3WtejtYZJwdJ0tdP
         73n/BouyfZ10L2e/VEV2Ftt5w2wPA4yb141myniDi89Pqm55j1rsa8eH1grQB1bNH3GU
         binuWc84bEDspBfNZzpMeGaXO2Aq7ruWVV8YTfEv6pHszEmGCWjjjGK7lRKAueRh18G3
         Ut2xGB0oM61DBnLPJ+UW5iBQ+HQVsAz2lhCweqNEPLE/opANEGVUhxWNot1TzB+JUU9X
         OgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8Ojl6y8j9lHXVfpoJ+pefkkiClCE7xVaODeP7aZwUkQ=;
        b=YgESUVK8E8BtTXlX6EUXptg/6ifIlAZMtX36HNhDEeZqIp1phEPzH+R9LoL5FgOj27
         9AdBNoMTuJoIZGOwPTTUI8zO2TrNITU5Jrd1gjZpwqhluGfpPTpEEKzJD5nBGgK8qOkh
         1gbxPJu8BzgNxw71IVYF7YtqvFwyXAVNa84fBsU07tw959RFgwpkP8VQe02K+9DZK47h
         lQUwq8qn3810SfpbZ1OdThzwtIKjTqlwUZEWLYyQFstPPJVo0KcdS4T+f5MuxrqsKD2r
         784Sh2v1+GAG3t2w0GbK8XPtHgcf/dIaedT9l2Bs/tyTSB+AAvFMGI7QMriFZesGTn0d
         bY9A==
X-Gm-Message-State: AJIora9oYAtt9V2wrQqZztgZrXE3YGKwV2jkW5wBo4+f5sG7lokUZmng
	C09XOTtssivqwjMZ3AmV3l+4mnroGAs=
X-Google-Smtp-Source: 
 AGRyM1vf/iILtYts5boqfX0XWYx4mjpehfyzURzCmD9vtsOnAbJ5vvBftZX/BwE6g/v7OGBs31MGmQ==
X-Received: by 2002:a17:907:1b06:b0:6fe:b48d:801f with SMTP id
 mp6-20020a1709071b0600b006feb48d801fmr4022151ejc.322.1656518783352;
        Wed, 29 Jun 2022 09:06:23 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 k12-20020a17090666cc00b007041e969a8asm7942939ejp.97.2022.06.29.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 09:06:22 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>,
	Alex Kiernan <alexk@zuma.ai>
Subject: [meta-oe][PATCH] jansson: Upgrade 2.13.1 -> 2.14
Date: Wed, 29 Jun 2022 17:06:16 +0100
Message-Id: <20220629160616.12283-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jun 2022 16:06:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97619

Releases have moved to github in 2.14.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Alex Kiernan <alexk@zuma.ai>
---
 .../jansson/{jansson_2.13.1.bb => jansson_2.14.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/jansson/{jansson_2.13.1.bb => jansson_2.14.bb} (52%)

diff --git a/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
similarity index 52%
rename from meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
rename to meta-oe/recipes-extended/jansson/jansson_2.14.bb
index d6e56ea7687c..945b31f5805b 100644
--- a/meta-oe/recipes-extended/jansson/jansson_2.13.1.bb
+++ b/meta-oe/recipes-extended/jansson/jansson_2.14.bb
@@ -4,10 +4,11 @@ BUGTRACKER = "https://github.com/akheron/jansson/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afd92c4cfc08f4896003251b878cc0bf"
 
-SRC_URI = "http://www.digip.org/jansson/releases/${BPN}-${PV}.tar.gz"
+SRC_URI = "https://github.com/akheron/${BPN}/releases/download/v${PV}/${BP}.tar.bz2"
+SRC_URI[sha256sum] = "fba956f27c6ae56ce6dfd52fbf9d20254aad42821f74fa52f83957625294afb9"
 
-SRC_URI[md5sum] = "570af45b8203e95876d71fecd56cee20"
-SRC_URI[sha256sum] = "f4f377da17b10201a60c1108613e78ee15df6b12016b116b6de42209f47a474f"
+UPSTREAM_CHECK_URI = "https://github.com/akheron/${BPN}/releases"
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
 
 inherit autotools pkgconfig
 
-- 
2.35.1


