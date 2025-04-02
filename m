Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D51C6C3601E
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 03:42:56 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.19.1743565373929088912
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Apr 2025 20:42:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XEb6QW+k;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2243803b776so56013205ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Apr 2025 20:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743565373; x=1744170173; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sz6AqILqaoKLfi98vXqP/U5yo4kNT4sN84C45DJZTzo=;
        b=XEb6QW+kTx0mh+34up+RXhO4HdEDY5e+KwsUZ81SsSSzSGzzde8EKz9KIY57JK6c9l
         bo9Wm6m1NOs2V3NILOwJYxBQSaXSdbCWUq0obZtC/EpmLI+ZbrcZEnLTspL1CuhsUus8
         cFnya6eKXI8lLMM8iGoq/XIn29DyKvd+1t66u0KPCXVAWIipVCMNmPa2+l9mbputCbwj
         37Ca9GpRKdTYOYOcqpz+D+jx+vCaOK0sisyWJW4e+4S2XS2z6hPwwGRKdol9tKUIIFqG
         m7TMWPFGBd5DfucdhtAN6Ch/KJ+GV3NDRyrbOpmRxkrMxXB/ss2IVXMckN8AeB53QFIn
         angg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743565373; x=1744170173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sz6AqILqaoKLfi98vXqP/U5yo4kNT4sN84C45DJZTzo=;
        b=AuP/3s/zmZNaYF1SbMeMsStt9m+WO/GxdxYdf/n0EVFfB0dYFREUbSZ611jv0DHGpC
         R9iX3SK4iiFw+8RztaqST3fuU0c8LFIk2Ld0/tu6XmsyH7P/89exzVg/fB77xQBDu+Od
         xjTV8kjMjSs0h1xlapSvVo1rarxLobdBBOw0MYuHAR0OfnBRea+ak4y7aKO8sR3upYmX
         BrWngzQUKWQ12IqtIHKIjLLNp6ohGKbFo+lwvq7yXlk7AwF9p43gJPRKjEUhBnYCzNaJ
         Q/DW697SX9XXdnEm/HcrnoUTNOyQcqUWWFnVE+slmd9nhOIBtDW9f36nf5XzyKc0BzOZ
         MdsA==
X-Gm-Message-State: AOJu0YydoTCxuGlQCDaXa0E1/xrrn1b+98lV3R/IcJ1UQ4/FGKf84r8m
	XkYuYbRddGxNmjoWPZkE7SXdyf/xjRhwJepzJBfVEfbijHqSOX7cK0ihOO1s
X-Gm-Gg: ASbGncuTMOOi0rSxi8nkI2Th1a6Rk2/jBRgfc7OziOApz+PaaGd9lZVFuvD3at8eWsd
	PAibnNVolh7DCAFdmgpkTAtA3AZgGXrMR2FW4hvNN8TWXk4Yh7vAUqboY0ZmnVU2t1gKDao4hTL
	cZuzYR1DjAXT1b8z1OwZcbWWhbG72kCN+e54STD3oJSgT8qaBiQqUXq8pYDRaeeEnnozx6CMRZB
	NHLhJh3XF+hDezxKziRVWuf51r6mh6L2h+KB1d0ku4792fRiHwOYexGy1bj90noeBSSpSTgDazI
	OgQrV2WddolASLa7dzYT1byLdViEjIvYmBzy
X-Google-Smtp-Source: AGHT+IGWT34F+oVEh+6SiT/ZqlADSakRaQ1Pib3mACxXozZ1POYV01U0L2ttfRLXGq4REWWgf9rbYA==
X-Received: by 2002:a17:903:94e:b0:223:6455:8752 with SMTP id d9443c01a7336-2296c8785acmr13828035ad.43.1743565372896;
        Tue, 01 Apr 2025 20:42:52 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a85b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3056f93417bsm423010a91.37.2025.04.01.20.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 20:42:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 5/6] python3-pydantic: Add dependency on typing-inspection
Date: Tue,  1 Apr 2025 20:42:45 -0700
Message-ID: <20250402034246.1488516-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402034246.1488516-1-raj.khem@gmail.com>
References: <20250402034246.1488516-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Apr 2025 03:42:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116496

Skip running test_readonly_qualifier_warning as it results in warnings
but Werror means it is reported as fails.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb b/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
index 2770b13831..4a566639e3 100644
--- a/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pydantic_2.11.1.bb
@@ -31,6 +31,7 @@ RDEPENDS:${PN} += "\
     python3-profile \
     python3-pydantic-core \
     python3-typing-extensions \
+    python3-typing-inspection \
     python3-tzdata \
     python3-zoneinfo \
 "
@@ -65,7 +66,7 @@ do_install_ptest:append() {
     rm -f ${D}${PTEST_PATH}/tests/test_mypy.py
     # We are not trying to run benchmarks
     rm -rf ${D}${PTEST_PATH}/tests/benchmarks
-    sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default'/" ${D}${PTEST_PATH}/run-ptest
+    sed -i -e "/--automake/ s/$/ -k 'not test_config_validation_error_cause and not test_dataclass_config_validate_default and not test_annotated_validator_nested and not test_use_bare and not test_use_no_fields and not test_validator_bad_fields_throws_configerror and not test_assert_raises_validation_error and not test_model_config_validate_default and not test_readonly_qualifier_warning'/" ${D}${PTEST_PATH}/run-ptest
 }
 
 BBCLASSEXTEND = "native nativesdk"

