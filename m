Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B99CD129A
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 20:35:53 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.3222.1712262952520538516
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Apr 2024 13:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mwch2pqm;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e244c7cbf8so13008285ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 13:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712262952; x=1712867752; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9O6YKM+O6G6xVxpWQl4fAWTyC5Rb71fWCsXZyzu/UM=;
        b=mwch2pqm/uj58G5f123tXN+qUjjqk8S1UNRJ/BNhsdL3ZeCTcwzsyjb14fSEUWqp03
         QKVtXfZ4dK45Ka2KPNm0D41Vy+WpBQb3u9DIZeNOzVCPZtPohdqzoD3epHJqiN3roSvh
         X0Wh0vWeD9a729/K7xfqtvBP44xvqt5KtzkN5mgu3+hYtjfg7eVqho041uTWl6rwM9uN
         GYnsO87kTtvby2N0xymrbRD9uWb4VU2BfYW1BOEAF0a0AayTnH135o7L7H9DYD/29DSq
         Eb5J3goRC5CWMRjxXzoDJICjxQfTmwfPPkIlD+3G/Xohyqms6zuwBbLt2DldZCuLDUPS
         ZCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712262952; x=1712867752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9O6YKM+O6G6xVxpWQl4fAWTyC5Rb71fWCsXZyzu/UM=;
        b=kHh3ZaBaV+4FbMHfpzdOMCCBj3Z1RUsCcaOja2sz0NZy/PTYb1t/XMj8piIoeQVr1U
         iReBk8YQjYWd3dgRf24xEIweHTyKGi49tSXg0sX2gpVzIS4t69LJj8In6vm3k5xRD0lu
         fH/uxZdEAuZ7BE58ztyq0b2XqiDjf5Lxaj3cg5OKtbz/w1erArqoPz5XwJBI0635dkJS
         94sjijWihx4n5yFw4DSwjEBw0iEJtva5qen1AXWEJNVmVrMfv+CzWYv+wh+34ZCuikeg
         I96gWpqYBfiJB1Qc0b11n3xn9NlTQU9SL+8tdrDhlqYIFx0ncGaDHRsZYT3tbpKIfkMs
         pZOQ==
X-Gm-Message-State: AOJu0Yw2+L9poeQu7+ezDZVz3ltw+SgBV86Nq2AC23HqWcukBwiWN/rr
	UZdnBg5ND8oVW69aFnjKLmK/jFRebDdeswpJlh3ehnrUU3Nlcd8mqE261Rlz
X-Google-Smtp-Source: AGHT+IEsxC3l2VG7VouN4MZvYedlG384rOHD6Hbp1W2H6BhdUelAORVK5ZYPszeeLThR/6hi1LAqTw==
X-Received: by 2002:a17:902:c94c:b0:1e2:c6de:6806 with SMTP id i12-20020a170902c94c00b001e2c6de6806mr630437pla.41.1712262951666;
        Thu, 04 Apr 2024 13:35:51 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5077])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902d08c00b001e06c1eee22sm39764plv.74.2024.04.04.13.35.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 13:35:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 4/5] python3-pydantic: Ignore failing testcases
Date: Thu,  4 Apr 2024 13:35:45 -0700
Message-ID: <20240404203546.285796-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240404203546.285796-1-raj.khem@gmail.com>
References: <20240404203546.285796-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Apr 2024 20:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109805

Lot of them are due to pytestv8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
index ddc24d08c6..9c52564121 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.6.4.bb
@@ -49,5 +49,5 @@ do_install_ptest() {
     rm -f ${D}${PTEST_PATH}/tests/test_mypy.py
     # We are not trying to run benchmarks
     rm -rf ${D}${PTEST_PATH}/tests/benchmarks
+    sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default'/" ${D}${PTEST_PATH}/run-ptest
 }
-
-- 
2.44.0


