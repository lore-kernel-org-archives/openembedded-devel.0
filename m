Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BEBC021A8
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 13:28:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.15622.1739366881288824003
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Feb 2025 05:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=medyVdKf;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43957634473so11834865e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 05:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739366879; x=1739971679; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8R3rB33oL6w0xX2qjgB3c5jJ0OWYyffXKixLkN22W0=;
        b=medyVdKfhWlcwBDKzDYBjoRfBasD/ZksJ0kHuqT56WUi6UOH8HKuzRETqI+qXL2Gur
         PEbD/kt2OpjydC+z5ovLFBLUWEKwAFDFEfj3P39JzVpW+VO5Q0QNjRGQtrCa/yPnqHQP
         L2Rglc2nCATJGEtxE3Q5/XGAEpvqBHJR2gdOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739366879; x=1739971679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8R3rB33oL6w0xX2qjgB3c5jJ0OWYyffXKixLkN22W0=;
        b=cNsZsEVOfCqMEaWlXm0Ea2cXDq7WJ7pAR0mK0XSq70QrltVAQr0LbAX0favlgQSzF1
         FhOFBzvLQwtZc2kUYGpI6DnPyXlOrx7AbHeHLaoS4XhIVKLVFOpeH39wWbAg/eeuGnkO
         eKYeqSNLzzYtjDNlp0rc0560fhNQF4Gr/2TDtRX5s9q+eaOJkxQJUCMKJKvIlMVD29uT
         CBGZWXBHYhUIucDxhmRcWW6jG3JlQy1/vjCSvfjgrcWc99LEkTkSE2SVvgO5bLDcKsPx
         n0AT2h7FDUJuXUslA0EzK54Cs1PF7ZMVbQGjsdQafjgsvL5guSTHGJbok0cTejzKdbzG
         jN4g==
X-Gm-Message-State: AOJu0Ywv5YlupBjdQ0q3mnIx26aMJGMrYWEtfrWJWEhofE/k6uNZ/08D
	S6LnHYnTVwfedTHgDnRk9X8uvHu74zRjOWsjU3Ie1XX40I4/0GX0IV4IDsw8zVJCqhtSkdGmEQz
	i
X-Gm-Gg: ASbGnctR13DNobw8tn2AxHfPaukBOONY2l1KXHCwuQG/HzU2sK3Q/4vdcfHpUewR9K4
	QuFZz/QABVT8HvixeiEkQWN94awfQ20lygl79DuznQL3YWEJNQGrqvZN//ypTubroBXkRMR5x6c
	LRuP2MAi1BcPgzOy8RH356/9OaEnh+aR7OzeKdF7bb3zqvRr9Fsr5b1x6mSWVtJYRs5Qln7xye/
	Wsg4fdGVQ9040lzhliYny6H0tRYxKPFk9NEtFq66TPHvSmMxsYK7tUd/0v73Rjq5/suf47yc6ej
	pk5BazP8+DDFQoM8c7HXilL/WuQwFA==
X-Google-Smtp-Source: AGHT+IGzBZtppJYV5aUqiW64Vhy5KIabUQmQ8J+GUFkN+MMXu60tHe/WgCGCeDi6hEU5Jti2WDWduw==
X-Received: by 2002:a05:600c:34cf:b0:439:3f09:9f57 with SMTP id 5b1f17b1804b1-439581beda5mr28271775e9.28.1739366879501;
        Wed, 12 Feb 2025 05:27:59 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc9ce31e8sm14781835f8f.5.2025.02.12.05.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 05:27:59 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-pylint: Upgrade 3.3.3 -> 3.3.4
Date: Wed, 12 Feb 2025 15:27:53 +0200
Message-Id: <20250212132753.957846-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250212132753.957846-1-leon.anavi@konsulko.com>
References: <20250212132753.957846-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 13:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115447

Upgrade to release 3.3.4:

- Fixes "skipped files" count calculation; the previous method was
  displaying an arbitrary number.
- Fixes a crash that occurred when pylint was run in a container on
  a host with cgroupsv2 and restrictions on CPU usage.
- Relaxed the requirements for isort so pylint can benefit from
  isort 6.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/{python3-pylint_3.3.3.bb => python3-pylint_3.3.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_3.3.3.bb => python3-pylint_3.3.4.bb} (97%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.4.bb
similarity index 97%
rename from meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.3.4.bb
index f3654360de..92378d7fda 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "c28580be76fe1ec55a6cac41833c0bd68070d2f7"
+SRCREV = "c2b01c3d0b6410d4c93eb1f32fb28f2116b1e68f"
 SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
             file://0001-Adjust-test-expectations-for-ptest.patch \
             file://run-ptest \
-- 
2.39.5


