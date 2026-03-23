Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D3DFF483EB
	for <webhook@archiver.kernel.org>; Mon, 23 Mar 2026 19:51:18 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3772.1774295474878508785
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Mar 2026 12:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TsQRQ6Yd;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a8fba3f769so21159695ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 12:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774295474; x=1774900274; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NgM5+6wR/z2U0YwUCaNYC5P9Szg9KUXYBudGpfdGEJ0=;
        b=TsQRQ6Yd2/mKy4jDvu/u5eKGEQhx5l6uv4MGm1ZaZvH1/tNewUK/vOls4eATHuhzSa
         2w2ZW6jvjFsT1Uy2KC/zx/5nf2MiRDZgP1d1nPzxdZjcy3y0LTD0sppEB3gtgvL5bxFl
         Z1Cht9kzroMNV7r4muLLJ2tBD1lQ1+EY3NYwXZahS2+eEVqEcD/PZUMneZ9rP4FlQ5Ry
         s3g2MgAwi8P4jyUocf7gyKIAB+A/F1qTufP65jyZP76IqhgVbPHhaihHo9pA1KjpsOKH
         2FpeBBfC66Vm3jxguwV/QZwpJC2oJLLqnhchMogXo0m6A1PkImidUADc3fo42tu/HjHX
         m0GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774295474; x=1774900274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgM5+6wR/z2U0YwUCaNYC5P9Szg9KUXYBudGpfdGEJ0=;
        b=mdc5Ee8iwxdMOhPoJuwrh6cC8mLpZrEABF3IZ8KVtmhNxCrKPML4HFt2G/AF5aWfH0
         fYBKtCAijWVES7f0RZeUGdpRRv8vyLGpiNXPOT0A7qq1+AnCmBZlSiEptccgAR9mPpHI
         Yz1VV963RGjOVCxQVGHR66lhoc697DuxMWvFE6dmqxD2UshrmmuW9Jd4vC5dZNy7uYw4
         a9HQyEYwKnGVHvE1VN7d7chUXuojmiTfdsyTXMLHpQHgyaEThacEA5PeXK7dD9w8Z7sQ
         CXCp2WYriSLKn5j1MJPgXU9Rz+FD9tijJR72svo3fAyFuiF5amk8eJaZ+PAbV8oxJZfQ
         YHKA==
X-Gm-Message-State: AOJu0YxGqsiSa0FXgPCNGHYjvm/6AzRQz64qXJSWVAMcjVjApBVBAYBw
	WJUGtGdKsSbxtU9cTIKoTS/eJiHewykk61szizB/ojxxYXSLot0hDeKvkFnh0g==
X-Gm-Gg: ATEYQzy0HdgS3SxJQrrTZ3JnnN4H9X2Rs3WU/fvbeIJCAFy4T15vos13iLD96fvfnfC
	B6ir5R9PQEdA+XYgJG6NA4GeiP7oGcqdAJMbDiwXnB9n89Ab7XvSMiIdqQe0TUXdcNzT0SiTj9l
	i8f2K84MKWamDVqjvz4Y9Cr6fh/zpTaI5UKI5wpJzD/2GnsEWFO+TFM1gDsN76oxeVmGw32q474
	TtA+8YbsTG6k1ACwSuen7yifYQoZ7H2ysEnfKSJKbsYWLgli4C4Un8fwSkVfVznBo7A2JixoS8b
	Dfcb9fT+HE+VvVDu/ZTg/d8YgPo6E8d7Euow9IHXXIwnBVGHZrwfns4PvjpASyo4TzpINC+y9XU
	2qPDJdqntu+Eqc0hJgLA2ZPaYMAtmWqw9amfXWT4/6IyLq3anIzO3q5tptty+K/rP7qGyYSXEai
	IDMayOfrduryX1hH27kHQMcy+1ViVKZhLsy+4=
X-Received: by 2002:a17:902:f64a:b0:2b0:9292:60c6 with SMTP id d9443c01a7336-2b09292655amr71171755ad.52.1774295473824;
        Mon, 23 Mar 2026 12:51:13 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c56bsm170876215ad.57.2026.03.23.12.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:51:13 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH v2] wolfssl: upgrade 5.8.4 -> 5.9.0
Date: Tue, 24 Mar 2026 08:51:05 +1300
Message-ID: <20260323195105.2621471-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Mar 2026 19:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125526

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Conatins many CVE fixes:
https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.0-stable

Dropped CVE_STATUS for version 5.8.4 specific CVE conflicts.

Ptests:

START: ptest-runner
2026-03-23T10:28
BEGIN: /usr/lib/wolfssl/ptest
Wolfssl ptest logs are stored in /tmp/wolfss_temp.Y7VEJ2/ptest.log
Test script returned: 0
unit_test: Success for all configured tests.
PASS: Wolfssl
DURATION: 130
END: /usr/lib/wolfssl/ptest
2026-03-23T10:30
STOP: ptest-runner
TOTAL: 1 FAIL: 0

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/{wolfssl_5.8.4.bb => wolfssl_5.9.0.bb}           | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.8.4.bb => wolfssl_5.9.0.bb} (86%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
similarity index 86%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
index f16c8c1e68..a2d6455d93 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.8.4.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.0.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "59f4fa568615396fbf381b073b220d1e8d61e4c2"
+SRCREV = "922d04b3568c6428a9fb905ddee3ef5a68db3108"
 
 
 inherit autotools ptest
@@ -46,6 +46,3 @@ do_install_ptest() {
     cp -rf ${S}/certs  ${D}${PTEST_PATH}
     cp -rf ${S}/tests  ${D}${PTEST_PATH}
 }
-
-CVE_STATUS[CVE-2025-11931] = "fixed-version: The currently used version (5.8.4) contains the fix already."
-CVE_STATUS[CVE-2025-12889] = "fixed-version: The currently used version (5.8.4) contains the fix already."

