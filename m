Return-Path: <open.source@oleksandr-kravchuk.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11C62C433FE
	for <webhook@archiver.kernel.org>; Fri, 29 Oct 2021 09:41:42 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web08.3289.1635500500912033974
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com
 header.s=20210112 header.b=57nT7bH0;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com,
 ip: 209.85.167.44, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f44.google.com with SMTP id c28so19837000lfv.13
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Oct 2021 02:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/eZl7Tpif/e2RvbCSHYt/pklc0uhqha+5FkRczn6Ck=;
        b=57nT7bH0ovaM4iIryMKHlqQSC0BlywCFTTLd4B68rsL7fmCDo0jaKBiXcjwu5Mmyz3
         +PxRJJ6XiNsw7aJ5OO9zZnyWH5bYFKb45cnysNZhiptTJEGaWfOTVVX9KKWc6IyoVwPY
         iNyos7CBcr1cNp5TzE6ruY2E9VYy89NJUeIfn020oE8y1SDg72VN96RlxddkFAfL5j9N
         F0dxVuF2Vq4MwrSv6hqHDTgY2eLbQ9AoqQ3gPk4AR68NPXSHa51GRO8fv+NG53kBnrCZ
         zD+ynGxu/sB7Z1XWd87mSQ5q8KAcEdcMRqdMh4LtdoSWM2JDbD4ma/Cd/NVyLvSQU6yz
         ouYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/eZl7Tpif/e2RvbCSHYt/pklc0uhqha+5FkRczn6Ck=;
        b=bjZWP7FhlpTgciRybfavSlRSVXU+pkpDBIJbJSLiJrCosLkO0yOIkDVjaf2ya6+2WJ
         6PCZEBGjeSlpm73jfiCYY9E6rWKUIDzkf/0A3CeNGXptyOGXgguuNsnB1k139xcg3rGl
         HBlkPa3KqHJfwu/CkEusChEDaKXFIOe9sL7yTr7eUGV3C28ppSN76y60xHuBIdSFm6aX
         BnBXUzmOjN76idePw2ilNLxF2s42+jEdMI/WNbxBwriqL0t9Mv9d+3qSU+WiCEPM8kGW
         IyOzvhGIXXr4NxXknbatQbYjy6yuTSeMYuH+5mGb/CvUexYvzYKHGls/XtnipCyoMJ1o
         5IpA==
X-Gm-Message-State: AOAM530vr/X6iqEVkCXVVsl/tmc4g4AeBIL1GH/Flj8GvdRFMKMhxfSA
	Z5RFJtj8vei3Q7PDyUMUSc5V9hT7UDyWpYOE
X-Google-Smtp-Source: 
 ABdhPJz9tto2BH6mR7ITQNmQgI51DjYXEusH4BcdhONz/ldrO+PpkV9P5DcSsyiYo6HoZxwQLvYgQQ==
X-Received: by 2002:a05:6512:224e:: with SMTP id
 i14mr9000291lfu.318.1635500498716;
        Fri, 29 Oct 2021 02:41:38 -0700 (PDT)
Received: from localhost.localdomain
 (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id
 q6sm557548lfg.188.2021.10.29.02.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 02:41:38 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [meta-oe][PATCH 2/2] protobuf: update to 3.19.0
Date: Fri, 29 Oct 2021 11:41:22 +0200
Message-Id: <20211029094122.1414092-2-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029094122.1414092-1-open.source@oleksandr-kravchuk.com>
References: <20211029094122.1414092-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Oct 2021 09:41:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93645

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../protobuf/{protobuf_3.18.0.bb => protobuf_3.19.0.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.18.0.bb => protobuf_3.19.0.bb} (98%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
similarity index 98%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
index 46ebef978..94e8695af 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.18.0.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.19.0.bb
@@ -10,9 +10,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "89b14b1d16eba4d44af43256fc45b24a6a348557"
+SRCREV = "17b30e96476be70b8773b2b807bab857fd3ceb39"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.18.x \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=3.19.x \
            file://run-ptest \
            file://0001-protobuf-fix-configure-error.patch \
            file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
-- 
2.25.1


