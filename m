Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9DBCD98F1
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 09:28:33 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11591.1781688507676347449
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 02:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=tNrR2O3R;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490b64c8311so54003345e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 02:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1781688506; x=1782293306; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DUJiRj36FHJhlla/NryOeFHNbYbL12xySK/cbiSWxyM=;
        b=tNrR2O3Rzrk570qwNAPeDMoAt/na5PUdhCz6BiO/1gmxl2onshT7nXmHJHVF5NkQo7
         xu71M2dQL6hx7bTPvcHm3E+bJD1Vg6k/zEhrIbr+zWz0k5pr25egsoUFrkfNnuKMgT2L
         svy84SEbeJg6x+vKB/F7G/hofusfyRqQPHX70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781688506; x=1782293306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DUJiRj36FHJhlla/NryOeFHNbYbL12xySK/cbiSWxyM=;
        b=OKJsJhGdYc6gOiJQ4K6MDaZGarOOC+knHbB3CL5gfYk/d42y+q8ba/k77tTvj2/0Qh
         euhwpiUu4UyYWk2Oj9iEN8VeIP6B5uyA/GxaKcE/ef6dVWQad/8ssYz8dmRQOXx8XtFq
         ERk79R/+9FrpDDP/7GIbv4/Ab+ECCfq29pQNIng5OK9kB4UzSteAJDqMm2FZ0TZbBJZO
         a17vPATZKIb7Tg2J8dHWeiy5qeRkNDcNKjZ+oN+pmv0qmIiFGcU5Ctbd8SLeAtf/mSFv
         yDpj88vg046giWJUTz0ggy6L2v5R/8COEy9TmH6jtwWSXXzBn09E8dARYe7Xibo1pUSg
         0s9Q==
X-Gm-Message-State: AOJu0YzYnY6rBaVEPRiZ6kt68/ufWWVFKBvR3FhiqXhKrc8mPHGr4No2
	DGEBxeiibUZPN6UlRRXqAtyfDO7CgGNk7x5pTk1Z7ok87cJTyEE85TDmPAkXznAl4aAz/amzna0
	4ecby
X-Gm-Gg: Acq92OEln2PQLJViiU/1NYywBdqrt+Q1TdLpOQoKpz87i7MfVVVU+QVRvxiy+K8YQ/R
	F8toR0K/skQW+f+gnS4ClNtYlqvxsAExEqc4BXJDyiDMtoU9I5JdWaxgp6sgCqA4LEoj/2lmiHR
	klGOKLNBZmMDnHEB9tSLXLkarVml3GDYkQz7DAwt6VGoT0d6o8lnX3N08G6FQGO4KQnAa9Lldp1
	7qzf4vyyeo8+GP5C/mANEltsLYazvLkWY0P9NQJ9bN3d3V8YLV3JDKq38atFfVEj17rNLN0xfAN
	fc2NVulLWu8FyQSLWHWas9HcWwE2KMzgmPRf4VdHy61gcXgztw8Z4UkOvM3lQxIvRilFCnawfkg
	YRbteuL0UfDTWvic+8TyAVxzGt/gFQoKH7s95HVgms1ei7JFRFcgq+e4/6dXBc07dQPzJ8QA4vJ
	0r5zIBl4nyZ1GjcSwLNAVy3dOZZw==
X-Received: by 2002:a05:600c:8189:b0:492:32a0:7f92 with SMTP id 5b1f17b1804b1-492333aabe8mr56689545e9.12.1781688505698;
        Wed, 17 Jun 2026 02:28:25 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4601esm154647225e9.1.2026.06.17.02.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:28:25 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-dateparser: Upgrade 1.4.0 -> 1.4.1
Date: Wed, 17 Jun 2026 12:28:17 +0300
Message-ID: <20260617092817.4090239-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260617092817.4090239-1-leon.anavi@konsulko.com>
References: <20260617092817.4090239-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 09:28:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127657

Upgrade to release 1.4.1:

- Remove fastText language detection support: the fasttext extra is
  dropped and detect_languages() now raises ImportError. Migrate to
  the langdetect extra, which also unblocks numpy 2.x compatibility
- Make digit quantifiers possessive in the relative-date regexes to
  prevent quadratic backtracking (ReDoS) on long digit runs
- Add the USE_GIVEN_LANGUAGE_ORDER setting to try languages and
  locales in the order given rather than by frequency
- Preserve explicit signs on individual components when parsing relative
  dates that combine decades with years, such as "-1 decade +2 years"
- Fall back to other provided languages in search_dates when the
  detected language yields no dates
- Parse relative date expressions with spaces between the sign and
  number, such as "now - 2 hours" and "now + 1 day"
- Use the parser-relative now for the current month when filling in
  incomplete dates so the month and day stay consistent
- Fix Norwegian Bokmål (nb) parsing of relative date expressions such
  as "3 måneder siden" and "om 2 månede
- Parse abbreviated English month expressions such as "1mon ago" and
  "3mons ago"
- Preserve surrounding whitespace when removing skip tokens during
  translation to avoid spurious double spaces
- Move project metadata and build configuration to pyproject.toml
- Add alternative Korean date expressions for today, yesterday,
  tomorrow, and "N months ago/later"
- Expand Czech date translations with additional inflections, word
  numbers, decade and century expressions, and clock phrases
- Replace internal OrderedDict usage with the built-in dict

Fixes:

WARNING: python3-dateparser-1.4.1-r0 do_check_backend: QA Issue:
inherits setuptools3 but has pyproject.toml with setuptools.build_meta,
use the correct class [pep517-backend]

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...hon3-dateparser_1.4.0.bb => python3-dateparser_1.4.1.bb} | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-dateparser_1.4.0.bb => python3-dateparser_1.4.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-dateparser_1.4.0.bb b/meta-python/recipes-devtools/python/python3-dateparser_1.4.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-dateparser_1.4.0.bb
rename to meta-python/recipes-devtools/python/python3-dateparser_1.4.1.bb
index 27f9da83b6..2602356207 100644
--- a/meta-python/recipes-devtools/python/python3-dateparser_1.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateparser_1.4.1.bb
@@ -3,11 +3,9 @@ HOMEPAGE = "https://github.com/scrapinghub/dateparser"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d3ed25571191e7aa3f55d0a6efe0051"
 
-SRC_URI[sha256sum] = "97a21840d5ecdf7630c584f673338a5afac5dfe84f647baf4d7e8df98f9354a4"
+SRC_URI[sha256sum] = "f265df13c0380e2e07543ba74b67c0681aaa1096981ffcd35227e1aa0cb81c7c"
 
-PYPI_PACKAGE = "dateparser"
-
-inherit pypi setuptools3
+inherit pypi python_setuptools_build_meta
 
 CLEANBROKEN = "1"
 
-- 
2.47.3


