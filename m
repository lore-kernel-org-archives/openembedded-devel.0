Return-Path: <yishai1999@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D0CC83033
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 08:44:11 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.5714.1751359446148628550
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Jul 2025 01:44:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fU5HKFYX;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: yishai1999@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a54700a463so3212818f8f.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751359444; x=1751964244; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3WSKn+zqxjyuJxeiGwFlKR0w8dseildRAev24T1UFQ=;
        b=fU5HKFYXCa48qUYRV3oXHZS4kjtrm6rO5CGOs5HBBs5si2M6Quy3ONJgfR6OMRQyVI
         dTtUlezhqaxeafQl0Qk8SpURlXTSsQcjAc3IN0avtaFrnOCrwjFX7pe0AAKthLmiDlAK
         S+zMuT5ZdOUBPrz6KXpBw1mYVt9b67UsavELglgW0Lol88G5Gp1TGw8uGbj29HKQ4+M3
         7h7PTncuDB0oOc3pV4GWeTQw6Uq5IpxMH4dscvG75AgvWRsP52WNdmPl7dgB1Pxve6V8
         VBz2kVfEcPrVKGJgGLqZmz/wp1eN8EGh8ye1pS6vWIwbZSpcE64ikgxek1aNsGZU8m2W
         6k/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751359444; x=1751964244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3WSKn+zqxjyuJxeiGwFlKR0w8dseildRAev24T1UFQ=;
        b=f+eK5MT+pDP8ylBgxl6xQjgGs0oj1KC8eA+y2zPIgybfql5byZ7Cel+nxuQ4tKSXYX
         6TG0Mufpvzc+F2OzLV3PzT32MuHPFdbjGVcrshyo4TVVEqReyMhc8eOYjPwtJSkFQael
         1jdhEPkKpogv+g1g6aPnyXyi879gOB4f4TcrxonWQCwqZ+IjUls1VoPnu+Oml7Fvn4i1
         1Q0Fe3V9BtSKAX17mgjId903TeFoVufvvU54kTzjuoB8PEAhdkqkzPC1ljn1cnIiKoWB
         9yb+yztcfLrX1fLsSeqdGYO66U55JU+HBVBIFm+GslrlxLD/teXgKzS+1bwaQjaC1jux
         RCjg==
X-Gm-Message-State: AOJu0YxgWxIua5un5rvU+O4tq8mBtwvdrrebkksCLoQCmHsFFTEFBLeB
	qWsKUi/LXOuj8E4Nnnrp0cGimjIBPZbprfjtd0jOqQEC3gWXAVUqQF/9xLDm1A==
X-Gm-Gg: ASbGncuhvn4uM8wjTmi7DASBu9hAiiwHvbJMbN/DGd5THbQpHd0eXS00xddMkQu68Vp
	kIuPd6AOj3Hs0JXCcRXCuhTUXmJJHdN0VmgBszQCHX1zpIzyZ3LqDHg5Aq/m97c6tfSHV5jC5vw
	fbihVgRZr04YRGkP8ntUhdUfrtPBc+6vfih+xP27lc2m5mCwbBgObl0jsWxsUS0CvaKbYJ1KExQ
	UPvgqtPyZClfyYlTI9Ak/tO3DmGFeANePgRqIND1PqaPFimg48b2GXe8mzv2q+VBJ2NOzOKPE+l
	Ryuj7wIMAr9JN6OzmP9KOdL4XxPGsZ+bSbboCh94TxOcZyiBWlGY5LYF5AF8jsPIldkJRw==
X-Google-Smtp-Source: AGHT+IE7fiQBEStYcUkjG2Ztsj6cI601uOC8D6kej8t6ex17zVt7suQFj9pYU8vHuZYLrN76lfkBPQ==
X-Received: by 2002:a05:6000:4603:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3afb0247991mr1215095f8f.21.1751359444084;
        Tue, 01 Jul 2025 01:44:04 -0700 (PDT)
Received: from bigboy.CASA.NET ([199.203.94.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e59659sm12597880f8f.77.2025.07.01.01.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 01:44:03 -0700 (PDT)
From: Yishai Jaffe <yishai1999@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yishai Jaffe <yishai1999@gmail.com>
Subject: [PATCH 2/3] json-schema-validator: support native build
Date: Tue,  1 Jul 2025 11:43:51 +0300
Message-Id: <20250701084352.4165484-3-yishai1999@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701084352.4165484-1-yishai1999@gmail.com>
References: <20250701084352.4165484-1-yishai1999@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Jul 2025 08:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118190

Add support for native build of json-schema-validator

Signed-off-by: Yishai Jaffe <yishai1999@gmail.com>
---
 .../json-schema-validator/json-schema-validator_2.2.0.bb        | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
index 241fd328d..c6e910a13 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.2.0.bb
@@ -16,3 +16,5 @@ DEPENDS += "nlohmann-json"
 
 inherit cmake
 EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON -DJSON_VALIDATOR_BUILD_TESTS=OFF -DJSON_VALIDATOR_BUILD_EXAMPLES=OFF"
+
+BBCLASSEXTEND = "native nativesdk"

