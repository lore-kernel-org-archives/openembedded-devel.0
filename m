Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35DE3E6F068
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 07:40:12 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.96689.1766475610197715670
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 23:40:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=Mzlizsen;
 spf=pass (domain: mvista.com, ip: 209.85.214.182, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d67f1877so59313595ad.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 23:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1766475609; x=1767080409; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tk4rNbvmSmtD9b5xygUzLGvJq9txb7ovJxytUZpWlVM=;
        b=MzlizsenwSX4lhNLrvBN/G/eaIzrODHR4CC3o/GEaYBV/zG0u8p9zU/i2ZdpBnc63B
         EJPAlSuIGBu9Mn/yhDX+i99JbeAX8icpbFgsf5+KMmRt3YJPGQok7XJeCV86idZf2Txq
         OG37HowG9LifyT57Rnb3iEQ269HFOQkaxMIiU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766475609; x=1767080409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tk4rNbvmSmtD9b5xygUzLGvJq9txb7ovJxytUZpWlVM=;
        b=VsyfEwYibYckgNDU8irDeRMsj7mxS3hkCyN2+rkbHrYc+KNIqFqLrvSEvtm7SUIyuF
         1JiF58O4IKjIuGYwaoxA4Cykbwy71fI8hSDFyuynqyMQIn82hMYnpR37tgI19Htyx1XM
         D8hig9uRt7005Zva2eGoHwK09UkmVBlq8DuQuxBgNjWcyQvK9UeJj/20+MYfZzwdwwi5
         ukGfmGramVYa6oVdhbTiUUnIfSlJm3USiaH+YcNTy7Sor4YzOGP4wNau8YmSfHLg1++q
         E3yKqmdfHfuHRH7qbSG7N2SguaTARIrH2LGHBkTeGFYciPdjHRhJ7tf8trp8MyeLCUUf
         mHnA==
X-Gm-Message-State: AOJu0YxZ4hFzFPtpWJqeQJomPZ/Z4d/docdmBdscEAjVtT0pkQ5VV6mW
	vQJkyB8UH/8EU6ZChdNsmD2AVC8Culs/gnq3jWfD6if5Fo29dZZ3AxeE0Pmi9CW9bg0JVYVQUbQ
	2GTtiMEA=
X-Gm-Gg: AY/fxX73+bfaQKqKCFbohzk1cnn1RxQu6lu4cPkxD4Psv5CKyHMK8CI8/IDmBm0avkK
	PkyWuLdUDK57WYnIl09I3LsoU5YHI1lioT/Ld0/NdCBSqGlhZzex3iKme8TjTQ8rNsXj8Hmv9fx
	dXjH468K2o75mirHl1W+70FAr5jPAQhF5SPb3surEYWcY0lYPtW2WEcaz++520i4m6XliNEUdIX
	y68WUKwDpTB71XBLT8JT7elM75ab/B1VmZA7EX0BLwzzRzPaVWnYneT0DcLCeUQinqbWAXKL3y9
	TODEcDX0WPINicIWugo2+f8oZlAIFCSwzVtCdgSr/uVG25ASljs1XzftbDniNlZsvLKtERl8dR2
	A8tJvWjbpwiug0xVrcrSdfne5J99UL4c+JtHyElO8wry4lx6IgY+eIU/IFUy5wcZDpqkNBFCplr
	8FFDV3GfDYpGuqs8FIF/z+ZM0=
X-Google-Smtp-Source: AGHT+IFQPYn+tblUoI1bC2LNSIVUWmJOgzUraL3QuLTCPoGmLNWO5uizDUKoVJrm6+z1wprBTPr3Kw==
X-Received: by 2002:a05:7022:6290:b0:11d:f440:b758 with SMTP id a92af1059eb24-121722de94dmr19311240c88.25.1766475608980;
        Mon, 22 Dec 2025 23:40:08 -0800 (PST)
Received: from MVIN00352.mvista.com ([2406:7400:54:bb59:804b:f81c:9b84:2beb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254ce49sm53592906c88.15.2025.12.22.23.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 23:40:08 -0800 (PST)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][patch] postgresql: upgrade 16.10 -> 16.11
Date: Tue, 23 Dec 2025 13:09:57 +0530
Message-ID: <20251223073957.1875374-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 07:40:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122825

Includes fix for CVE-2025-12817, CVE-2025-12818

Changelog:
https://www.postgresql.org/docs/release/16.11/

Refreshed 0003-configure.ac-bypass-autoconf-2.69-version-check.patch for
16.11

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../0003-configure.ac-bypass-autoconf-2.69-version-check.patch  | 2 +-
 .../postgresql/{postgresql_16.10.bb => postgresql_16.11.bb}     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-dbs/postgresql/{postgresql_16.10.bb => postgresql_16.11.bb} (86%)

diff --git a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
index 7707d238e7..f5ee9a2e2b 100644
--- a/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
+++ b/meta-oe/recipes-dbs/postgresql/files/0003-configure.ac-bypass-autoconf-2.69-version-check.patch
@@ -18,7 +18,7 @@ index 4f25567..b6b1eff 100644
 +++ b/configure.ac
 @@ -19,10 +19,6 @@ m4_pattern_forbid(^PGAC_)dnl to catch undefined macros
  
- AC_INIT([PostgreSQL], [16.10], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
+ AC_INIT([PostgreSQL], [16.11], [pgsql-bugs@lists.postgresql.org], [], [https://www.postgresql.org/])
  
 -m4_if(m4_defn([m4_PACKAGE_VERSION]), [2.69], [], [m4_fatal([Autoconf version 2.69 is required.
 -Untested combinations of 'autoconf' and PostgreSQL versions are not
diff --git a/meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb b/meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
similarity index 86%
rename from meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
rename to meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
index b1b8411dc7..3dd3df2889 100644
--- a/meta-oe/recipes-dbs/postgresql/postgresql_16.10.bb
+++ b/meta-oe/recipes-dbs/postgresql/postgresql_16.11.bb
@@ -11,6 +11,6 @@ SRC_URI += "\
    file://0005-postgresql-fix-ptest-failure-of-sysviews.patch \
 "
 
-SRC_URI[sha256sum] = "de8485f4ce9c32e3ddfeef0b7c261eed1cecb54c9bcd170e437ff454cb292b42"
+SRC_URI[sha256sum] = "6deb08c23d03d77d8f8bd1c14049eeef64aef8968fd8891df2dfc0b42f178eac"
 
 CVE_STATUS[CVE-2017-8806] = "not-applicable-config: Ddoesn't apply to out configuration of postgresql so we can safely ignore it."
-- 
2.43.0


