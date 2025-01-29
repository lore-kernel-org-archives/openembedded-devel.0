Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176C8C0218D
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:40:56 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.10684.1738150847485895573
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Ex0xQkGa;
 spf=pass (domain: konsulko.com, ip: 209.85.128.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so68587615e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150846; x=1738755646; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo4Z60c5AXA4vRs8Andn58t+O3IDLp6mgtDWBeRIcXM=;
        b=Ex0xQkGavEg04Oxa8WcWW4EfOP6op/uz6aiTTJBwrAKwSLbyoTu1LCg0U0K+KabiiN
         b9bOIRnaSQt/TOwugCGkQ1riyNMq+63iTmDdWCK1JqBMqXxuPK4VSfO6VsANLHA13O67
         /ooyNuf7poVE7g2yqQefqZO49i6Sy/zsLvpSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150846; x=1738755646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yo4Z60c5AXA4vRs8Andn58t+O3IDLp6mgtDWBeRIcXM=;
        b=bToyjYDQFhHsfwoPj6+5g1s7i4y/5TfmwxS60mD+EG5pKJhXByMqC9KDVQeZt7BcKx
         nBv1IXlcVt5GyuJ5GnoeeY4ODK5EBewwFUG7UfwzTCJv2lx6aCtB31/dB6hnZ/4obxug
         xT87BcO95RGOdZtoPjnHJyKLGjvGImG25E1eIugPXOkRYWRoVPyxBg06O8O7JQ5PvC8X
         iYPlTYa1aHEQHfMkVdp3RgLK8Kj0JvTaS68efidJqEJnSUJ5RI0vnrWs05KmlYnisVbE
         fI0cKEZzaVaunOVrk6YUynvze8/5RT+wD4NTkF1qgw0JoVo9ea/2TMwKQhpbaaeIqirJ
         QKOw==
X-Gm-Message-State: AOJu0YxGy8ByBT5EMOLxni5c6QM/w1jeRdh9mmUs5ic8FCmAFdnX2DHg
	uyxt+gpvNS3/E7N7MFiWtpUNPFzdbwggJ0azibN4arFnPz2YAOWXmlZDOLFDD553e65asgrve06
	L
X-Gm-Gg: ASbGncuPy51WRPUKST/jMDz7idNltuM4Lt7fx/SmGqI7vWNJZECWCEhSQQr73k7L9oX
	TpD5xoKGpK9E3dwUdCz1sXtqf1hozbfTWBNKD4D4McvDrszQSlpflPUW9nRLoN4/qfwC4V6VpJ+
	z9eiXhMyTqzU0dTJojeSLF+BvEohAO8Tb0UEOjZmgeNjnZh5YSiR3d778e/lKUJNOI1OgHNzj7M
	mB7tSjR3ho52+3JdZDslOQE+FhGs5ryR1HW3+FXvkLIgBWKnOTd9yhhuc1KVLPAp2XL+v4f3Oa+
	hbLXzrK9FSZ7BqOZn2AgPIljFJXItw==
X-Google-Smtp-Source: AGHT+IH7eWcCvk3VVyw+7UAmsXdtQQH/XF9nQq97nrt7yA6SD4xfNXymFL7OibKNlMm96CBVGuWIpA==
X-Received: by 2002:a5d:64a1:0:b0:385:f0dc:c9f4 with SMTP id ffacd0b85a97d-38c51967de4mr2135705f8f.20.1738150845176;
        Wed, 29 Jan 2025 03:40:45 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:44 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 5/7] python3-pydantic: Add native and nativesdk
Date: Wed, 29 Jan 2025 13:40:37 +0200
Message-Id: <20250129114039.3562870-5-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129114039.3562870-1-leon.anavi@konsulko.com>
References: <20250129114039.3562870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:40:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115135

To build python3-lief we need python3-pydantic-native.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
index cf211972da..77568a368a 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.10.5.bb
@@ -67,3 +67,5 @@ do_install_ptest:append() {
     rm -rf ${D}${PTEST_PATH}/tests/benchmarks
     sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default'/" ${D}${PTEST_PATH}/run-ptest
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


