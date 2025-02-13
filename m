Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E13EC0219D
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:04:40 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7021.1739437477383357167
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:04:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=L/EvTR9v;
 spf=pass (domain: konsulko.com, ip: 209.85.128.41, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a39e659cso3911155e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 01:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1739437475; x=1740042275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lpfP1TzelkVCJtadUdciWt8M02FTtcR6FtfIgyFDK18=;
        b=L/EvTR9vnEtgKGYUP/aPDKWOFVxGye4528RIol6FIW8DLo4r+J5HpK8r0Hazglb/Id
         lUjMxHEpqb6hdrYyO5UINETeveTDYpTdE3+3Te5WXFYEo72wvK1yrRmxpXHxMXYO9Mq3
         iLya6XEeVlxP1CV4YXgL4MpREpWQjRSmU+L7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437475; x=1740042275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpfP1TzelkVCJtadUdciWt8M02FTtcR6FtfIgyFDK18=;
        b=TXzxOHxhuuqI5S7LntxS2FkIfduLaIlBBLXygZrG/3LIspWJ9ORiIRMPHA2kNH4noH
         VJFNCXorcv47r9Ku9nQaT+zb9Dp+pREthgvzKSq6LOw29WXkQi/Z2xPj5TQi4G89u0NE
         zOceOxtrV73ahTZUoH4O97W0VcNe50huVyXbONEGsE3vStmRbGzKwuSR4FQvNbwIbd6R
         QSqaWfJgOeIMZKPa8zv9eG275wetWvYNcFMF1mp2KtMqotE7NUvBx+9QeoWBcUfUw6ah
         cQUBEI0WotB6onsq9Ym8cGnGBA6Aw8UWTZ0fsUhKlM2yiW7aBhKXDjKfW3rYbcp6Q8Vp
         EAsw==
X-Gm-Message-State: AOJu0YzcSAZDh/MaZdb53D95o+8bKjCb0KCkQC5N3aoO1fcwPF94G2Km
	xXUZNwPz+s6iAD885higjELqejHtCdUOmFseYVG2LsWK5Q3LdrwsvQEytzSH60k/MSMZ13vO3f5
	l
X-Gm-Gg: ASbGncva6eunrtZa4Q6113A8hltl4R9nl40tFz6BPdydTRMZd5tDBItcLJLZOmAPEy2
	6w4RQvv405acNiQgn/38a3JOumQgERR6184c95f21xbLiNuQlEHxOyIStFeHUXxHtITasinv1S8
	GtRKBBmr5y/Woh6XghKMgUDn0l3zP2RU3HQ5HgRJRPQ2Pxo1hePI6+5XuzyoxmWnxKBqN7ckEm9
	mH1xYEhqvYhioKaPCNjLj8ffgEhXLIGdtRUlCdOf3OdK19wHx3RuBlwk1cnlYOfnqOKMg87hMbG
	wdJZf5Y7LYFzkydYNoWKqhQ6sTNPrA==
X-Google-Smtp-Source: AGHT+IGG81kopTLQnNTR+Jl2tDvtGFl9yenqEFhUhKOyY8fBIAOMZhtovLTUj4FZqb+epZPKqVxUXg==
X-Received: by 2002:a05:600c:1c92:b0:434:f739:7ce3 with SMTP id 5b1f17b1804b1-43958173ef5mr59243085e9.8.1739437474685;
        Thu, 13 Feb 2025 01:04:34 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a06e309sm42507005e9.24.2025.02.13.01.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 01:04:32 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/5] python3-isort: Upgrade 5.13.2 -> 6.0.0
Date: Thu, 13 Feb 2025 11:04:26 +0200
Message-Id: <20250213090430.3750793-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Feb 2025 09:04:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115455

Upgrade to release 6.0.0:

- Python 3.13 support
- Updates round 3
- Speed up exists_case_sensitive calls
- nit: Fix deprecation message link
- Ensure that split_on_trailing_comma works with as imports
- Black profile: enable magic comma
- Fix google style test
- Update line_length and single_line_exclusions in google profile
- Updates round 2
- Dependency updates round 1
- Run pre-commit autoupdate
- Allow --diff to be used with --jobs
- wemake has 80 chars hard limit, not 79
- Fix errors on main
- Fixed syntax error
- fix: typo
- Fix sort_reexports code mangling
- fix: correct group by package tokenization
- Fix isort-action usage documentation
- Fix CDN for Ace
- Fix help text
- docs: fix spelling mistake

License-Update: Use file LICENSE

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../{python3-isort_5.13.2.bb => python3-isort_6.0.0.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-isort_5.13.2.bb => python3-isort_6.0.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-isort_5.13.2.bb b/meta-python/recipes-devtools/python/python3-isort_6.0.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-isort_5.13.2.bb
rename to meta-python/recipes-devtools/python/python3-isort_6.0.0.bb
index 60d44181c0..436a7bade8 100644
--- a/meta-python/recipes-devtools/python/python3-isort_5.13.2.bb
+++ b/meta-python/recipes-devtools/python/python3-isort_6.0.0.bb
@@ -2,11 +2,13 @@ SUMMARY = "A Python utility / library to sort Python imports."
 HOMEPAGE = "https://pypi.python.org/pypi/isort"
 LICENSE = "MIT"
 SECTION = "devel/python"
-LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=8227180126797a0148f94f483f3e1489"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=197c46995787b46a2dbf0d519c1754cf"
 
-SRC_URI[sha256sum] = "48fdfcb9face5d58a4f6dde2e72a1fb8dcaf8ab26f95ab49fab84c2ddefb0109"
+SRC_URI[sha256sum] = "75d9d8a1438a9432a7d7b54f2d3b45cad9a4a0fdba43617d9873379704a8bdf1"
 
-inherit pypi python_poetry_core
+inherit pypi python_hatchling
+
+DEPENDS += "python3-hatch-vcs-native python3-hatchling-native"
 
 RDEPENDS:${PN} += " \
     python3-compression \
-- 
2.39.5


