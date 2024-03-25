Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98209CD11DB
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:58:31 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.1680.1711396701239160344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:58:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R2VLfccU;
 spf=pass (domain: konsulko.com, ip: 209.85.208.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-56890b533aaso5649739a12.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1711396699; x=1712001499; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQMjABynzoZYjWGw3FMxyCeFpEUb/MsJ0/iqBCQpIO0=;
        b=R2VLfccUIMGkRh18vzbQwXWpLzD/xEYZKLWozkh4SsxiGkoOYH72oXKZb44MNgYwed
         15DtY/ACLtE31iv0wQw4Hva+SkkCgUvcnVmrMNoBF4Qa6knIMB2rBX82xffstJCOGhTn
         Dw3vjiqMecuy6oAbIkYLPJ1cWRI6sCIo80nbA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396699; x=1712001499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CQMjABynzoZYjWGw3FMxyCeFpEUb/MsJ0/iqBCQpIO0=;
        b=rQIt8F18fFzVTXSJx4+m7f6NjlbokgtVwhpkSsOpljjt5PvXIj872Fjg1H19QaqSWq
         k5K3PQiPpu/WEWCVVY/5I9oCKWFlobsWeKoxAwvVIWLPfvB9bp/lRJIfQYbgSud+kVwK
         XeDiPTHsfgAdk19g5UI5zWl/Toj4wyH7yNh7s+apZJl4QIRVpJskAW2+qj8r9en/FCDz
         mzdgUp/RPJKoWQtugjonVL/XVLlroPL8qbDoR1dFnMXHTYAkA4qZYDa/F5Hx3sYGq5VT
         U9dzPKw1QBiasC2+sG1XUFfv5dHxBSR5+zsDZfrVyazCkburuo97Ml23eMvqzt30tI/S
         gCeQ==
X-Gm-Message-State: AOJu0Yzd1EEeC4qKTzEKv7ssAKMCpAPSOGmsvBCb+2uX631a2tky9YGO
	sWCXQxnYPDeBd2gvfUA3VbHbyT2Y4arlRPiMzb6TTLN5C+FCegI1CJF0vOr8b94UevdCmnda5VI
	y
X-Google-Smtp-Source: AGHT+IE3dMLpIxCnINqBr4r1/7wdqwJeRQ4SkrdjuN8b072heMWe5UvaAO2fYiWKaS9k5ACzRGlprA==
X-Received: by 2002:a50:954e:0:b0:567:a2d8:ca92 with SMTP id v14-20020a50954e000000b00567a2d8ca92mr5840240eda.23.1711396699393;
        Mon, 25 Mar 2024 12:58:19 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id r13-20020a056402018d00b0056c18b79cd3sm898574edv.22.2024.03.25.12.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:58:19 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/3] python3-croniter: Upgrade 2.0.1 -> 2.0.3
Date: Mon, 25 Mar 2024 21:58:13 +0200
Message-Id: <20240325195814.2825816-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325195814.2825816-1-leon.anavi@konsulko.com>
References: <20240325195814.2825816-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:58:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109606

Upgrade to version 2.0.3:

- Add match_range function
- Fix leap year (29 days in February)

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...ython3-croniter_2.0.1.bb => python3-croniter_2.0.3.bb} | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-croniter_2.0.1.bb => python3-croniter_2.0.3.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-croniter_2.0.1.bb b/meta-python/recipes-devtools/python/python3-croniter_2.0.3.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-croniter_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-croniter_2.0.3.bb
index 7f418b063..ad80574a9 100644
--- a/meta-python/recipes-devtools/python/python3-croniter_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-croniter_2.0.3.bb
@@ -5,8 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b8ee59850b882cbf623188489ea748e2"
 
 PYPI_PACKAGE = "croniter"
 
-SRC_URI[sha256sum] = "d199b2ec3ea5e82988d1f72022433c5f9302b3b3ea9e6bfd6a1518f6ea5e700a"
+SRC_URI[sha256sum] = "28763ad39c404e159140874f08010cfd8a18f4c2a7cea1ce73e9506a4380cfc1"
 
 inherit pypi setuptools3
 
-RDEPENDS:${PN} += " python3-dateutil python3-natsort"
+RDEPENDS:${PN} += " \
+	python3-dateutil \
+	python3-natsort \
+	python3-pytz \
+"
-- 
2.39.2


