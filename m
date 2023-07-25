Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DA1C001DF
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 19:09:55 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.28967.1690312194548357421
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jul 2023 12:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=uTp727Yl;
 spf=pass (domain: baylibre.com, ip: 209.85.219.43, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-63cebd0a7c5so15785476d6.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 12:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690312193; x=1690916993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EHPnQAZzyCFVdzUdF5aN8conJR700DUp5stvEtYPQlU=;
        b=uTp727YlSoUH+g02UOt0+jZU2byQZRD1dB285PwPadA1at++UTfNGkknKXgZkSZYsA
         UGFHU992/D7KkL5HVgRsOzHc1ut7zGkKGfXoqiBQuLT+TT9xmUzWCScCnLg1dHfrTVbj
         CtHmYbMMstuVzWZZSFsxTWK3SePsbLV88F3Ydl3xzNO31prxvVnSX9nBSkW1Yn5TkOIQ
         yyxS1EdjbzckpiBpH+GTcOpmLYEtOzrrS31VHOGFCvjYg4mLWySPLemwzkd1pnjnDS+c
         PMjOrwGSVo3SAQ6hY1E20jVkIhFxEXJHG/J0hX7z9hLLUMxVxE9C/kGjzO5lb0PG/Dj8
         vyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690312193; x=1690916993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EHPnQAZzyCFVdzUdF5aN8conJR700DUp5stvEtYPQlU=;
        b=Pkb2HSgEKHT0v0iXMdFHUwRWIP4R/knvbs6ygruxNBVMdgqMQbJ9y2hKppkSYPUkcE
         viQfB0Xr2/50A4zhWF+FLB3AVKRFCaxZe624Z1v/gwLT5UTGPCtVeMuDrc29sWYsCQgO
         Q0+fEZlZkCRLztd8h9YPpvi+7a2EiCxPI9fk3JtmJh9CcwjgHCz2E4Y5M3KLboRetCNQ
         xokxptYj7GE1srIeKiaLwzFbJHfpzG9ioSBy91M1K9u/SwlP7QXmYf7Ce9K29Nwr3eZN
         GbQtaJILbd44KllpUSj5pCKLx2WZasOOgATpCFFMgva0j4HfDMemIo/LbRKsKzww4PHe
         fW2A==
X-Gm-Message-State: ABy/qLY87IwXZeEGZ51aztm/SUrmOju6RyfRGBswFHT//tkWvaQ5mVUH
	7z2AvBFwSQ8Nsu1NYQCWqw/ON57NIsN3S0+HY/A=
X-Google-Smtp-Source: APBJJlGTmP6vdswftOl9fOWpJwEs7VY9OhZiZ71WXQvQMTQ7IGIHHD+UWP2oAnoa7kaWzHWBX/iijg==
X-Received: by 2002:a05:6214:a6f:b0:63c:6d0d:fd3b with SMTP id ef15-20020a0562140a6f00b0063c6d0dfd3bmr3251741qvb.62.1690312193378;
        Tue, 25 Jul 2023 12:09:53 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id z9-20020a0cf249000000b005ef81cc63ccsm4526109qvl.117.2023.07.25.12.09.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 12:09:53 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 7/7] python3-sqlparse: upgrade 0.4.3 -> 0.4.4
Date: Tue, 25 Jul 2023 15:09:43 -0400
Message-ID: <20230725190947.660933-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725190947.660933-1-tgamblin@baylibre.com>
References: <20230725190947.660933-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jul 2023 19:09:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104024

- Use python_flit_core instead of setuptools3
- Modify 0001-sqlparse-change-shebang-to-python3.patch to apply on 0.4.4
- Remove CVE-2023-30608.patch since it's now upstream:

[tgamblin@megalith sqlparse]$ git tag --contains c457abd
0.4.4

Changelog (https://github.com/andialbrecht/sqlparse/blob/master/CHANGELOG):

Release 0.4.4 (Apr 18, 2023)
----------------------------

Notable Changes

* IMPORTANT: This release fixes a security vulnerability in the
  parser where a regular expression vulnerable to ReDOS (Regular
  Expression Denial of Service) was used. See the security advisory
  for details: https://github.com/andialbrecht/sqlparse/security/advisories/GHSA-rrm6-wvj7-cwh2
  The vulnerability was discovered by @erik-krogh from GitHub
  Security Lab (GHSL). Thanks for reporting!

Bug Fixes

* Revert a change from 0.4.0 that changed IN to be a comparison (issue694).
  The primary expectation is that IN is treated as a keyword and not as a
  comparison operator. That also follows the definition of reserved keywords
  for the major SQL syntax definitions.
* Fix regular expressions for string parsing.

Other

* sqlparse now uses pyproject.toml instead of setup.cfg (issue685).

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-sqlparse-change-shebang-to-python3.patch | 80 ++-----------------
 .../python3-sqlparse/CVE-2023-30608.patch     | 51 ------------
 ...rse_0.4.3.bb => python3-sqlparse_0.4.4.bb} |  5 +-
 3 files changed, 7 insertions(+), 129 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch
 rename meta-python/recipes-devtools/python/{python3-sqlparse_0.4.3.bb => python3-sqlparse_0.4.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
index 94121340d5..0c9f29a6b8 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
+++ b/meta-python/recipes-devtools/python/python3-sqlparse/0001-sqlparse-change-shebang-to-python3.patch
@@ -1,4 +1,4 @@
-From 7fd00ab8c1b663052d57e735b6b956d5c92fbaed Mon Sep 17 00:00:00 2001
+From f236a30dc8528b6f114201580f1efdcc1c447d43 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Mon, 9 Mar 2020 13:10:37 +0800
 Subject: [PATCH] sqlparse: change shebang to python3
@@ -12,80 +12,10 @@ dropped.
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
- 0001-sqlparse-change-shebang-to-python3.patch | 51 +++++++++++++++++++
- setup.py                                      |  2 +-
- sqlparse/__main__.py                          |  2 +-
- sqlparse/cli.py                               |  2 +-
- 4 files changed, 54 insertions(+), 3 deletions(-)
- create mode 100644 0001-sqlparse-change-shebang-to-python3.patch
+ sqlparse/__main__.py | 2 +-
+ sqlparse/cli.py      | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/0001-sqlparse-change-shebang-to-python3.patch b/0001-sqlparse-change-shebang-to-python3.patch
-new file mode 100644
-index 0000000..ad6c50f
---- /dev/null
-+++ b/0001-sqlparse-change-shebang-to-python3.patch
-@@ -0,0 +1,51 @@
-+From 10c9d3341d64d697f678a64ae707f6bda21565bb Mon Sep 17 00:00:00 2001
-+From: Changqing Li <changqing.li@windriver.com>
-+Date: Mon, 9 Mar 2020 13:10:37 +0800
-+Subject: [PATCH] sqlparse: change shebang to python3
-+
-+Upstream-Status: Pending
-+
-+Don't send upstream since upstream still support python2,
-+we can only make this change after python2 is offcially
-+dropped.
-+
-+Signed-off-by: Changqing Li <changqing.li@windriver.com>
-+---
-+ setup.py             | 2 +-
-+ sqlparse/__main__.py | 2 +-
-+ sqlparse/cli.py      | 2 +-
-+ 3 files changed, 3 insertions(+), 3 deletions(-)
-+
-+diff --git a/setup.py b/setup.py
-+index 345d0ce..ce3abc3 100644
-+--- a/setup.py
-++++ b/setup.py
-+@@ -1,4 +1,4 @@
-+-#!/usr/bin/env python
-++#!/usr/bin/env python3
-+ # -*- coding: utf-8 -*-
-+ #
-+ # Copyright (C) 2009-2018 the sqlparse authors and contributors
-+diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
-+index 867d75d..dd0c074 100644
-+--- a/sqlparse/__main__.py
-++++ b/sqlparse/__main__.py
-+@@ -1,4 +1,4 @@
-+-#!/usr/bin/env python
-++#!/usr/bin/env python3
-+ # -*- coding: utf-8 -*-
-+ #
-+ # Copyright (C) 2009-2018 the sqlparse authors and contributors
-+diff --git a/sqlparse/cli.py b/sqlparse/cli.py
-+index 25555a5..8bf050a 100755
-+--- a/sqlparse/cli.py
-++++ b/sqlparse/cli.py
-+@@ -1,4 +1,4 @@
-+-#!/usr/bin/env python
-++#!/usr/bin/env python3
-+ # -*- coding: utf-8 -*-
-+ #
-+ # Copyright (C) 2009-2018 the sqlparse authors and contributors
-+-- 
-+2.7.4
-+
-diff --git a/setup.py b/setup.py
-index ede0aff..dc6a323 100644
---- a/setup.py
-+++ b/setup.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (C) 2009-2020 the sqlparse authors and contributors
- # <see AUTHORS file>
 diff --git a/sqlparse/__main__.py b/sqlparse/__main__.py
 index 2bf2513..6a3a115 100644
 --- a/sqlparse/__main__.py
@@ -107,5 +37,5 @@ index 7a8aacb..9c727e8 100755
  # Copyright (C) 2009-2020 the sqlparse authors and contributors
  # <see AUTHORS file>
 -- 
-2.17.1
+2.41.0
 
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch b/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch
deleted file mode 100644
index f5526c5b88..0000000000
--- a/meta-python/recipes-devtools/python/python3-sqlparse/CVE-2023-30608.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From c457abd5f097dd13fb21543381e7cfafe7d31cfb Mon Sep 17 00:00:00 2001
-From: Andi Albrecht <albrecht.andi@gmail.com>
-Date: Mon, 20 Mar 2023 08:33:46 +0100
-Subject: [PATCH] Remove unnecessary parts in regex for bad escaping.
-
-The regex tried to deal with situations where escaping in the
-SQL to be parsed was suspicious.
-
-Upstream-Status: Backport
-CVE: CVE-2023-30608
-
-Reference to upstream patch:
-https://github.com/andialbrecht/sqlparse/commit/c457abd5f097dd13fb21543381e7cfafe7d31cfb
-
-[AZ: drop changes to CHANGELOG file and adjust context whitespaces]
-Signed-off-by: Adrian Zaharia <Adrian.Zaharia@windriver.com>
-
-Adjust indentation in keywords.py.
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- sqlparse/keywords.py | 4 ++--
- tests/test_split.py  | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
---- sqlparse-0.4.3.orig/sqlparse/keywords.py
-+++ sqlparse-0.4.3/sqlparse/keywords.py
-@@ -72,9 +72,9 @@ SQL_REGEX = {
-         (r'(?![_A-ZÀ-Ü])-?(\d+(\.\d*)|\.\d+)(?![_A-ZÀ-Ü])',
-          tokens.Number.Float),
-         (r'(?![_A-ZÀ-Ü])-?\d+(?![_A-ZÀ-Ü])', tokens.Number.Integer),
--        (r"'(''|\\\\|\\'|[^'])*'", tokens.String.Single),
-+        (r"'(''|\\'|[^'])*'", tokens.String.Single),
-         # not a real string literal in ANSI SQL:
--        (r'"(""|\\\\|\\"|[^"])*"', tokens.String.Symbol),
-+        (r'"(""|\\"|[^"])*"', tokens.String.Symbol),
-         (r'(""|".*?[^\\]")', tokens.String.Symbol),
-         # sqlite names can be escaped with [square brackets]. left bracket
-         # cannot be preceded by word character or a right bracket --
---- sqlparse-0.4.3.orig/tests/test_split.py
-+++ sqlparse-0.4.3/tests/test_split.py
-@@ -18,8 +18,8 @@ def test_split_semicolon():
- 
- 
- def test_split_backslash():
--    stmts = sqlparse.parse(r"select '\\'; select '\''; select '\\\'';")
--    assert len(stmts) == 3
-+    stmts = sqlparse.parse("select '\'; select '\'';")
-+    assert len(stmts) == 2
- 
- 
- @pytest.mark.parametrize('fn', ['function.sql',
diff --git a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
index a402f991f7..e4ac403eb5 100644
--- a/meta-python/recipes-devtools/python/python3-sqlparse_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlparse_0.4.4.bb
@@ -5,16 +5,15 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2b136f573f5386001ea3b7b9016222fc"
 
 SRC_URI += "file://0001-sqlparse-change-shebang-to-python3.patch \
-            file://CVE-2023-30608.patch \
             file://run-ptest \
 	    "
 
-SRC_URI[sha256sum] = "69ca804846bb114d2ec380e4360a8a340db83f0ccf3afceeb1404df028f57268"
+SRC_URI[sha256sum] = "d446183e84b8349fa3061f0fe7f06ca94ba65b426946ffebe6e3e8295332420c"
 
 export BUILD_SYS
 export HOST_SYS
 
-inherit pypi ptest setuptools3
+inherit pypi ptest python_flit_core
 
 RDEPENDS:${PN}-ptest += " \
     ${PYTHON_PN}-pytest \
-- 
2.41.0


