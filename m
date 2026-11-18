Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10133.1794999713826992397
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Nov 2026 03:01:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=hV3StbnZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: awais.belal@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so11279265e9.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 03:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794999712; x=1795604512; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=a6h1rfMrci9iG7sOa2q0pqtTnLLUaS8YMCbiIOZFPLw=;
        b=hV3StbnZiv+Ngvs6WuhTIHn4fPYX6bPQ24ZgwzE1rPDJF+9DukxWrhL/Up0MAwqNiF
         W3k1uz68PuK/soRJFikvUfMbhPJNMvrlSNfLNBJ3mxZSBzJ0A3x/FXUlP7w+dev6wrr2
         IHmvrw350/gBw2UJ8zpeWDxxrHGhWd2bxj3aZpjGNydqNCgKCdM7CRcQj/1huU6/M3zD
         blDbZuZNGH96XWq7+TQn+mqHA9uXT5pZc1F3o+Ccdv/yS6jjaj6dghEGvK/P9Y4JT60l
         wgyOTysIa+3B0KKyuhRF5QSoF2totOShDOw8HJP4xigpt389Vnzt9HfiKelBHv2T4M56
         QwJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999712; x=1795604512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a6h1rfMrci9iG7sOa2q0pqtTnLLUaS8YMCbiIOZFPLw=;
        b=bcpvK6IlHeNfCMM7jUDsj9+Zq3hm4S2s5XqzHbEJC8PLhkonGq0U8nSMtOW3Y65KZo
         pnWXGzYZY2I23VRxVnC0E9TUqKworVBqdr9hnlcbmfC6XxvuMHABjXrbxW0CeB94br1G
         0HvHYGR8evBB12dJz7/IJZFMVm6yI6kSd6KA6vmRENvV/l27HGs4079Kd6HChTagWZnD
         Qb5Crcoe1DwcLcxdOecvCeedRZLpxrfXvWDE6lDjbFYexLIVCd1NVf3OdE2RLVd1S02j
         Oj8+eXLVBuwRgIw4VZqzqNOcnt6qDGXJX5tc0gU5zqMRehDYQ6UobgtuHgPKSqvyFZOe
         aNlA==
X-Gm-Message-State: APuU4Z/w2EtJYTinCCeOm+6gm38gSJU2eQAiDycN2cPoK31Gg9BXn2fq
	qwvm8FVrtkmSHKlfi7uOzxmSs+Ulvmbtdjx3Tfgt0GnMBQceTaxKwaiKbttfvFne
X-Gm-Gg: AYBFou18jOV4jkwZf1NRZycywPTz3bgk8knY6ebUUaidqLZPSOuDxlxugQ9xlVYUqqX
	/O2OK2jQ8x0fEJtcznA8YDfkioWYIvJ2nPY5CdGTaDeRb60wYi5yUFiWvL/aLqlfSyylnecR6SX
	/y3pRd75NYw06KiK1ToQAZ9f7IQk9d/Qf1CmJG6o7fqohPNKSa7wM2zHYDitfq34O/ji80AB1aI
	rF2X+fh/x6zQzdJgtQOECjvXGQBHvBuATxj6t3ga+0/SvHUG6tVOq+/XT0G7GgJnEN4RNFZt4lx
	L42m2UE7fUngVc2U5kxalZHSjrxYZLIzzEdz7W2pyiZcKfZcIVMNwRvOfh/feLyfhnxNx8j2Un6
	jChgug3wnwJpWEczE3CaWiwXpfrq+MH9jQtMkPq6hi8JUf51uWYCmIdr07zFWToHqYFJW0XnyAx
	gT5VfwbXwQutaAA7urY4U3rYNaTl8FtbIPeusgigz9eLFauagkGgL4XlZLL2vyqUnB9EUiOidnV
	HRVO/3g0BbvmA3KS/ISHk8doqkgjt+ULgYK9BbMtFPVsJmbRQ2W7Wv0jIUy/NWzdbFoBqKA3s3t
	/g6x5QQqd6R9YZCWFTTsmpRFqX9vqklVzPh+lcuxm6u38LD0V4SOqbVkPOj298vAfOkmtfSq1R4
	=
X-Received: by 2002:a05:600c:3b1f:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4bb7da14ccfmr39923795e9.13.1794999711753;
        Wed, 18 Nov 2026 03:01:51 -0800 (PST)
Return-Path: <awais.belal@gmail.com>
Received: from elitebook.tailad32a6.ts.net ([101.53.238.142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7e57f6f9sm23139885e9.2.2026.11.18.03.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 03:01:50 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Awais B <awais.b@rufilla.com>
Subject: [meta-oe][wrynose][PATCH 0/7] mongodb: backport fixes to wrynose from master
Date: Wed, 18 Nov 2026 16:01:13 +0500
Message-Id: <20261118110120.3913031-1-awais.belal@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 11:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132637
Content-Type: text/plain; charset="utf-8"

From: Awais B <awais.b@rufilla.com>

These commits are backported from master to allow building mongodb on wrynose
cleanly.

Awais Belal (2):
  mongodb: fix build with python 3.12
  mongodb: update to 4.4.29

Gyorgy Sarvari (2):
  mongodb: upgrade 4.4.29 -> 4.4.30
  mongodb: ignore CVE-2025-14911

Khem Raj (3):
  mongodb: Fix build with current python, SCons, clang and OpenSSL
  mongodb: Backport fix for SERVER-49099
  mongodb: Keep build paths out of buildInfo

 ...stead-of-pkg_resources-for-version-p.patch |  51 +++++
 ...001-free_mon-Include-missing-cstdint.patch |  28 ---
 ...econfig.py-python-3.12-compatibility.patch |  57 ++++++
 ...call-to-CheckLibWithHeader-as-a-keyw.patch |  56 ++++++
 .../0003-boost-Fix-build-with-clang-23.patch  | 176 ++++++++++++++++++
 .../0004-ssl-Fix-build-with-OpenSSL-4.patch   | 117 ++++++++++++
 ...ove-the-Node-swap-function-in-Biggie.patch |  58 ++++++
 .../mongodb/mongodb/oe-buildinfo.vars         |  11 ++
 .../recipes-dbs/mongodb/mongodb_git.bb        |  20 +-
 9 files changed, 539 insertions(+), 35 deletions(-)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-Use-packaging-instead-of-pkg_resources-for-version-p.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-free_mon-Include-missing-cstdint.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0001-moduleconfig.py-python-3.12-compatibility.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0002-SConstruct-Pass-call-to-CheckLibWithHeader-as-a-keyw.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0003-boost-Fix-build-with-clang-23.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0004-ssl-Fix-build-with-OpenSSL-4.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/0005-SERVER-49099-Remove-the-Node-swap-function-in-Biggie.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-dbs/mongodb/mongodb/oe-buildinfo.vars

-- 
2.34.1

