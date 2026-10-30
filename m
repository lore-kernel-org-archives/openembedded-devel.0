Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8911.1793358208597875676
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Oct 2026 04:03:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R/eQ+Qqi;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48c45111bebso245625f8f.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 04:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1793358207; x=1793963007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26tOR3+ivxEySjXh5fhLYunCAlNryUzy1mGwaVlVWDY=;
        b=R/eQ+QqiCYz9VXhM+fh1L4bkKhxD7/Ty9j635BvD/yAKZdawmW7z4rZvf6a4A06j5G
         KosPHnwccUqmDnDLA+T48wgqnxitsTtEHwCIkm0QsE5PhbJwxy0VR1oG9UEbKBte3MQk
         4LLJyenRB8Mqysz5KUWBu3/NeIzv8BEPxK1rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793358207; x=1793963007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26tOR3+ivxEySjXh5fhLYunCAlNryUzy1mGwaVlVWDY=;
        b=uiIN05dv/bxGFCTePDFQAFUQoxVwGjXGqq1u2Ye/sMVN+pUQS616f4sfY7ENoUY5Iu
         DzTdYDQSUEyi8/6TUfkIIqx/OMscsYxLCRBoffDB74fnlNtQUyJdHelFaWTLgx8SXV7N
         1MgDZ/NNyvLq4eTITdbZEYAZIUZsAEOorkFj8QIHQzbU4DZ8+Y46UZBxhEXFYHitGID5
         9o6Vfxzx9xgDVsHf2jPzVyZlS8ByNq9NxpG64WtVCDnSIhop4f63scVWgDoFyiurhTFY
         YDvQqRwHosBI+ukVxIXIZ8EIRWwyJgg0ZH9eLv+0AWc5LbYbztuJwq0RKiHTfYp/Erbp
         iUtw==
X-Gm-Message-State: AFq9FYJSjjYgiUkt+QV9AlqyIArP5FFoGI7kEPGJySGzBrw9VLeYouTS
	NDm7pSulJ11meW3W5F87Ddf58Qdy+PBndUqnijW74Xjd9JPLrko9jO+kAB+OJ21OWb0T5OsBaGT
	ieAHB
X-Gm-Gg: AYBFou1sumO7NrKXZP80yAa8grn2KGptt7PskN4ivugVKcplVZTL9ON4LPNJ4lV+CBY
	l5zXpslmJ4wyLpgKhhZAR2EezgfIxuDoTwGjH0N0sy7S5KDEc301aqi7A5/hIb2JfsYfL+ajDVX
	ix2pm1p2cNU1PHcNoM/MqqzMPLdsxwJcT6/jqpcDBO2dLyLX/e9zLRLRrtD+AWv58vTzBYzizbJ
	KHs4Yi7uz0GNom/1bl/+9FSnBS7qRvx9m31tg8wfhqgZU4NSgSNw6tgE77boSVG8yKbTwvqk3hz
	dkhlYFOQWMQqwAgjVe4qOGN9NXYjQtPpZ7AuLuILzCR/uyYslKlgDyvqsXNXJoOLDByWql2umf2
	9WZaK0aK2TkUCA2xclqPZfQC0LkS1fZ6kuQlnFO/dafJ0KvNXSYodXvszxFyjxEEklU35g/GpUw
	qNPszbGSR5emLEdLK/YFVDMRXH4azZBTUPBkZN2SWiJzHxMLBSx14Np6mCXchUGtfDcg2rjk6uA
	JdkptZ+oR5eoCSUDULmg+IiksOwv5Ft6feA+ARd+vqMC1FCpuCfVoKLjArlmk5rK6xpdSstRrO2
	XJkR+9Js4svBO4Za1THc45QG2imQkAuK94H1hpfzCOj8v/+C3pBlwNny5p34EgIyUXt86iJ/Ozv
	Ymr+O4+ljX46UtmtuAGGXAnqt5r36EUN6SE2CN8lncbCXeq69fJOxvw==
X-Received: by 2002:a05:6000:22c8:b0:487:15a3:1cab with SMTP id ffacd0b85a97d-48e6e307164mr4847990f8f.18.1793358206738;
        Fri, 30 Oct 2026 04:03:26 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b78a4csm2642151f8f.23.2026.10.30.04.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:03:26 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 12/25] python3-opentelemetry-api: Upgrade 1.45.1 -> 1.45.2
Date: Fri, 30 Oct 2026 13:02:56 +0200
Message-ID: <20261030110309.1124614-12-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030110309.1124614-1-leon.anavi@konsulko.com>
References: <20261030110309.1124614-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 30 Oct 2026 11:03:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131694
Content-Type: text/plain; charset="utf-8"

Upgrade to release 1.45.2:

- opentelemetry-api: limit traceparent header length to 512
  characters in TraceContextTextMapPropagator during extraction

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...emetry-api_1.45.1.bb => python3-opentelemetry-api_1.45.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-opentelemetry-api_1.45.1.bb => python3-opentelemetry-api_1.45.2.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb b/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb
rename to meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb
index 6e2018a808..4d903d1373 100644
--- a/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.1.bb
+++ b/meta-python/recipes-devtools/python/python3-opentelemetry-api_1.45.2.bb
@@ -4,6 +4,6 @@ observability framework for cloud native software."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "aa38ed19bcc084ba42782a73255b3582283eced7ad6dddbd6695189e69adfb75"
+SRC_URI[sha256sum] = "d7b0008e21e5fd61cbe7a7f34ca3b6905a78ab677d9bc395e299359c75cda6b4"
 
 inherit pypi python_hatchling
-- 
2.47.3

