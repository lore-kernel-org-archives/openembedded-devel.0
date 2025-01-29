Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB43C02194
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:41:06 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.10499.1738150847008830583
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=SoLgDAg5;
 spf=pass (domain: konsulko.com, ip: 209.85.221.47, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38be3bfb045so426653f8f.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150845; x=1738755645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=udbzsRT16xPt9eP3XiOeTVFycQe1EvRsEQAsSK4jygE=;
        b=SoLgDAg5cjnbSoUYLueYw3L4mk3hCqUQhZgDKDEv88hTIky1zbLKZ3n9xuHHI24lBl
         7bYFmTrO/tiwPgwMQGUExiuO6GmVAtclg7es8HCUvO/ufiNQKBiyucpwlBJFlSP+kHhp
         A1WjFEBtWivHLOlOO6p22Htfi/Vs725diazsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150845; x=1738755645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udbzsRT16xPt9eP3XiOeTVFycQe1EvRsEQAsSK4jygE=;
        b=J6ciYgrsWIfIqzUgtE0ceuXIpzEq52vLPWz/t3IcUI9G+33jYzYgPMUCvQOtB9i95d
         SwriNCUj7DOUH6HtsH9NU9kdy/Kqvzcrlb66cYEA5PHlziakToDyuTG9WkJYxKqiLPOQ
         gL1t/qKXgAEH/bwzFU1SamjmxeR24C3B1Rj6sIUxqS4myyIai8w8UjUxGs2MZYO139dI
         20oAvL3yjFojhAN5SOhZ/DGnQQL61q5FLc5OZHLFUC2PjLeeEfJjkfMp6M1LAQEt1wuy
         lr+dXfyczD6xGA4y3FCd4eO6nOEjbWrC7Ept2+JT0aQPiuotvWckiOteHdcLqzCnMbL7
         nYoA==
X-Gm-Message-State: AOJu0YxuvXze1w4Vi2jca0gEJOZx85W2yLY89WqyfkPPUgoTdOzLR6cK
	R69giHAM3ehls6dsH63DO/a4h0b27QvEkA0OIRzXha3own+kXteXNd88fNgUu4maqsXt+IUzM7I
	d
X-Gm-Gg: ASbGnct1IFPV6Mn/7e/ou7TSIXVyXbYvjV9GEkSNjp1AdaFt9+WLbhWIcxouuZ4Pk3Z
	PqZHo+syjoRwt6Omy9Ua7BKWXrwg2AwiAsRcd+w/Ou1poa/hxFs24kqXdpZ/eK3X58CWnAvL7QL
	K4fUZdrOc68ytlQk0m+fOnc6ocCt70vIc1y7pn+k+WuzUy6EYk0RMkvwo6oRcCKT6F2y/ie8a8V
	yaimSIMo5T457dtf8U9LVfRO6zxLWkvyYEwjTb0X1lCUVdgkiViDJ0xFFdZ4urv/AGVfWBgJzwx
	ttnD+PMjIMO6eHxSgvLVxctPTMI9sw==
X-Google-Smtp-Source: AGHT+IFJlcEykjXEpaMyWpM8NutfNY7QnxHBw9C3MeWf+BiVphYyXi/dUs2bBZuydkKkH095j5EtuQ==
X-Received: by 2002:a5d:598d:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38c50fe8025mr1694584f8f.9.1738150844447;
        Wed, 29 Jan 2025 03:40:44 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/7] python3-pydantic-core: Add native and nativesdk
Date: Wed, 29 Jan 2025 13:40:36 +0200
Message-Id: <20250129114039.3562870-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129114039.3562870-1-leon.anavi@konsulko.com>
References: <20250129114039.3562870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115134

To build python3-lief we need python3-pydantic-native.
To build python3-pydantic-native we need python3-pydantic-core-native.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../recipes-devtools/python/python3-pydantic-core_2.27.2.bb     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
index 063730372b..7b84a3a6f7 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic-core_2.27.2.bb
@@ -44,3 +44,5 @@ do_install_ptest:append () {
     cp -rf ${S}/tests/ ${D}${PTEST_PATH}/
     sed -i -e "/--automake/ s/$/ -k 'not test_model_class_root_validator_wrap and not test_model_class_root_validator_before and not test_model_class_root_validator_after'/" ${D}${PTEST_PATH}/run-ptest
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


