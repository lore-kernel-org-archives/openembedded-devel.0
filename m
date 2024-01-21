Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DFC7C47422
	for <webhook@archiver.kernel.org>; Sun, 21 Jan 2024 06:06:41 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.42409.1705817199372756217
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jan 2024 22:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HWwXMDjY;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2906bd9f2ebso451336a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 20 Jan 2024 22:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705817198; x=1706421998; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zoCO1RmEE4/PsNHa1FoSXyhW+LqBAO5YzQlodQzHF0w=;
        b=HWwXMDjYVzJexIa3XncOAP61dC7AsxsIKA/Yx7kY6vqz/eXcdTtu89KoH7YNv4OBQ4
         sz7p/OO+ajx4kjR/BiW0OAe8NQjQnRiep0Ca0PTbBJgOs2ezak136v4xmE1o5cqLX176
         dspv3YWiHnGTmD3N2pe8DR4h8oMppDq9gQONrnVWDjaP2YQRZcc3IqBvrMnPGLHajg4+
         B3Crze6IcAEVOpQG9sOsYwLc7xD3ZCC+d3B1QPu8rDI99y716FWA0AI2OBjcbtsci6Tf
         8WC198kIvcToOa2RtQbseCqmwZZNfvhUPcB3YUChNZUHVVVMWMBOnuuycoQvTtrndGn3
         hp5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705817198; x=1706421998;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zoCO1RmEE4/PsNHa1FoSXyhW+LqBAO5YzQlodQzHF0w=;
        b=bkIS0308gZpiaIApBC3TrPRn2putIH9vaBlsJWd2iiBuwMpamijZcstYZi7v+9CRbD
         fazEJDfFzYPLQT6wMhiGtfpWQ8zy4Pl+C17O1VGAx38ns4kxF62iEUr/uga6wWUcDzhY
         AL5YlokglABtrbx7OMY0ZvRvgHJE9FDOCiKQLCW7/mmNTZwPJF31s35IOJEw/kHqkBWg
         /yQ4+q65HX7illVzik9+7eQu0qoQ+iPJX/QGMhCchzdnSHAMygyNxBRj9GCPYvOpRHgH
         vfqANtx9HPEZizD99UrVvEszStisoCi+Sm83KwXCUQdOAp7Zs80WUOjlwLrvlPbsURz7
         fkPQ==
X-Gm-Message-State: AOJu0YwW4aNjxGS0KttGTmmbDUGJkd80p9EpA4UcfnrbXQdK/CCfNeER
	5GxvIC/620Z+g2PLnsOiWfljNU5/rw17C0A1NOvnpf1McEO/Eh0psfLYwYMwTcs=
X-Google-Smtp-Source: AGHT+IHwJkpZAY1bMQRXsyr02GuVccBe54EvsIumWYP8ddSZDMxGt24zOldsZO1+ngy9qdQqnLMISQ==
X-Received: by 2002:a17:90a:d913:b0:28d:7981:926e with SMTP id c19-20020a17090ad91300b0028d7981926emr2866894pjv.9.1705817198161;
        Sat, 20 Jan 2024 22:06:38 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::edfc])
        by smtp.gmail.com with ESMTPSA id dj11-20020a17090ad2cb00b0029051dad730sm4383911pjb.26.2024.01.20.22.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jan 2024 22:06:37 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-multidict: Fix running ptests
Date: Sat, 20 Jan 2024 22:06:35 -0800
Message-ID: <20240121060635.2564856-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Jan 2024 06:06:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108366

Add missing runtime dependency on pytest-cov
and move the test to PTESTS_FAST_META_PYTHON since it takes < 20 seconds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-python/conf/include/ptest-packagelists-meta-python.inc    | 2 +-
 .../recipes-devtools/python/python3-multidict/run-ptest        | 3 +--
 meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb | 1 +
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-python/conf/include/ptest-packagelists-meta-python.inc b/meta-python/conf/include/ptest-packagelists-meta-python.inc
index 2c75d511b3..44507b394e 100644
--- a/meta-python/conf/include/ptest-packagelists-meta-python.inc
+++ b/meta-python/conf/include/ptest-packagelists-meta-python.inc
@@ -22,6 +22,7 @@ PTESTS_FAST_META_PYTHON = "\
     python3-intervals \
     python3-ipy \
     python3-iso3166 \
+    python3-multidict \
     python3-parse-type \
     python3-platformdirs \
     python3-polyline \
@@ -71,7 +72,6 @@ PTESTS_PROBLEMS_META_PYTHON ="\
     python3-jsmin \
     python3-license-expression \
     python3-msgpack \
-    python3-multidict \
     python3-ordered-set \
     python3-parse \
     python3-pillow \
diff --git a/meta-python/recipes-devtools/python/python3-multidict/run-ptest b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
index 5cec711696..e4f3b623ab 100644
--- a/meta-python/recipes-devtools/python/python3-multidict/run-ptest
+++ b/meta-python/recipes-devtools/python/python3-multidict/run-ptest
@@ -1,3 +1,2 @@
 #!/bin/sh
-
-pytest
+pytest -o log_cli=true -o log_cli_level=INFO | sed -e 's/\[...%\]//g'| sed -e 's/PASSED/PASS/g'| sed -e 's/FAILED/FAIL/g'|sed -e 's/SKIPPED/SKIP/g'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS"){printf "%s: %s\n", $NF, $0}else{print}}'| awk '{if ($NF=="PASS" || $NF=="FAIL" || $NF=="SKIP" || $NF=="XFAIL" || $NF=="XPASS") {$NF="";print $0}else{print}}'
diff --git a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
index 23d3eb3155..b057e05f65 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.4.bb
@@ -19,6 +19,7 @@ SRC_URI += " \
 
 RDEPENDS:${PN}-ptest += " \
 	${PYTHON_PN}-pytest \
+	${PYTHON_PN}-pytest-cov \
 "
 
 do_install_ptest() {
-- 
2.43.0


