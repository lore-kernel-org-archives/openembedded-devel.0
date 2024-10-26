Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75986D149FE
	for <webhook@archiver.kernel.org>; Sat, 26 Oct 2024 03:05:02 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web11.4173.1729911898092465531
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Oct 2024 20:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMW6U2o9;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2e2e87153a3so1904654a91.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Oct 2024 20:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729911897; x=1730516697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxdqMB/A/v0/ZMZCAOo7kEZHjtWwcrRRajRYuHAKkTg=;
        b=FMW6U2o9W6v5x1IsFOam12kCCd6yeXgZgGDbmbifVG5Fa2bmZYxK17TPzgemYrp8yY
         Fq7tHDn3jaD6p1rFoe4B2KblnBY9addddgB/xI5UsGQfd0j2Ie1/6FZBZVAsNoFuemMu
         yHbtFA+sczUSP69c3KRl4AJJ8pBZs84T7DZNQyzCWYsyO4ZA/XQNWbtYClaTefRKJ6Ir
         /8kC4sKF8zO45o4nMZuEH/k6NguD+y6FPVjroLpZmLE+lNesce8M4YOqZL+qVrn3PERE
         SGPe4NwmdGmTOxpeta2KfZDg2XHgPnhUzFf9tpvHgzSyVH0H5TES2WKV9fpDTeQs8wAS
         MImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729911897; x=1730516697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxdqMB/A/v0/ZMZCAOo7kEZHjtWwcrRRajRYuHAKkTg=;
        b=hnSwFmgq5l0hxhblAbhqYUaYczxmVPaF8bBiiDVZOX6mgfy8SxOQzyHsVwxQ4BFDxg
         tSIMCOp0JKOPfT9FxVtxOpRU76o/6EgTsG0MXsutacdLg2+LYHiuq3DTzazdDDWIOK7/
         9JheyyTn6eRJl4tfSo92caZp0ufvRDttboCO0YHOqMyOjNR4nKmf7Ep7mxzV69BzkCws
         xEtRtGOfL5FAWOAbgLh5iKI6XlX9xGxg0yiKB6kVpJf/DGv6o3+pgNmH/Ey90UEYpoLt
         YXvRGj+xfPmZnRaltGMTj1/HKtsSH3JqD2MArttry5Xn7H1Gv+cvxBwZHRGMNjfYNTbX
         if2A==
X-Gm-Message-State: AOJu0YytZJVUql1joobhueAunaCQO1mXTtvidwY+aRjxII+VL2Hjij1q
	1YcV4e1mznD5YEkOkZc2eavQfh5YVUOyQkvp5MXrh6FDAXKYUlYOVXe0WX4D
X-Google-Smtp-Source: AGHT+IE0AQlmIRksXGrSpAyO9V9kx/2WInbcJuysYHWGIHsQ8SRVmOPvFzt3bAx34+PDq3NWf6gnYA==
X-Received: by 2002:a17:90a:e617:b0:2e2:af54:d2fe with SMTP id 98e67ed59e1d1-2e8f11b9ed4mr1879403a91.34.1729911897051;
        Fri, 25 Oct 2024 20:04:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::7c83])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3771a1fsm2307317a91.57.2024.10.25.20.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 20:04:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 2/4] python3-google-auth: Upgrade to 2.35.0
Date: Fri, 25 Oct 2024 20:04:51 -0700
Message-ID: <20241026030453.2517894-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241026030453.2517894-1-raj.khem@gmail.com>
References: <20241026030453.2517894-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Oct 2024 03:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113232

2.35.0 (2024-09-17)
Features
Add cred info to ADC creds
Add support for asynchronous AuthorizedSession api
Bug Fixes
Remove token_info call from token refresh path

2.34.0 (2024-08-13)
Features
auth: Update get_client_ssl_credentials to support X.509 workload certs
Bug Fixes
Retry token request on retryable status code (#1563) (f858a15)

2.33.0 (2024-08-06)
Features
Implement async StaticCredentials using access tokens
Implement base classes for credentials and request sessions
Bug Fixes
metadata: Enhance retry logic for metadata server access in _metadata.py
Documentation
Update argument for Credentials initialization

2.32.0 (2024-07-08)
Features
Adds support for X509 workload credential type

2.31.0 (2024-06-27)
Features
Adds X509 workload cert logic
Bug Fixes
Added py.typed to MANIFEST.in
Pass trust_env kwarg to ClientSession

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...oogle-auth_2.30.0.bb => python3-google-auth_2.35.0.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.30.0.bb => python3-google-auth_2.35.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.30.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.35.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.30.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.35.0.bb
index c51be16505..f0ef3c6773 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.30.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.35.0.bb
@@ -5,21 +5,23 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3 ptest
 
-SRC_URI[sha256sum] = "ab630a1320f6720909ad76a7dbdb6841cdf5c66b328d690027e4867bdfb16688"
-
+SRC_URI[sha256sum] = "f4c64ed4e01e8e8b646ef34c018f8bf3338df0c8e37d8b3bba40e7f574a3278a"
 SRC_URI += " \
         file://run-ptest \
 "
 
+PYPI_PACKAGE = "google_auth"
+
 RDEPENDS:${PN}-ptest += " \
+        python3-aioresponses \
         python3-cryptography \
         python3-flask \
         python3-freezegun \
         python3-grpcio \
         python3-mock \
-        python3-oauth2client \
         python3-pyopenssl \
         python3-pytest \
+        python3-pytest-asyncio \
         python3-pytest-localserver \
         python3-pyu2f \
         python3-requests \

