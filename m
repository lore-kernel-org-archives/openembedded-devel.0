Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6268.1792499565750916024
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Oct 2026 05:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=azMThGpc;
 spf=pass (domain: konsulko.com, ip: 209.85.128.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso15621285e9.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 05:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792499564; x=1793104364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hqTryIHzmH9uQ3YNq9YEx3OhCXuy9bPzY0JWc9XfWQQ=;
        b=azMThGpcUkbZNTrxOaAl6LoZ2VDDNzYVmHUT7kgZ79bMLrVbJPTx5GT/gQEuRbIE8a
         fEkSnNclECWr6XIQFGpNGpBEXtRjTJCkqfzl8qRbrWn7vukceocK3XXkx8pW9i+yMJ2Z
         lzxdk6YmuhIOHe3/VO2wWJyy0RpRUTEpCErsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792499564; x=1793104364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hqTryIHzmH9uQ3YNq9YEx3OhCXuy9bPzY0JWc9XfWQQ=;
        b=bVMhfsMSuib/K16SeejsDbOZ61dGkPpxoTuBZgRvIsl2iT2+ijuMTndYPOylCdMYBg
         D9S6m1t6cPaDUfYw+KfLHarTubMEWMzwbJF5b4O+W/J1S6BFcGVQVP3emNtn7HCt9o5g
         yNqrk2JINQGpb6AxJYPltMDwA/zWMROkJVmNN5Ve+HATkq6QcUwgvL/AbY4/1O54lK0m
         ifMp+6w0xpM/rXEJrMDu16PL7aDvvi/wcI90dw2aedHYso+mwmUM9/7hWxSMW9x77h4b
         /4oGIMrxyMIEsXscxIwvQwt3us3X1/R4uwqSXkEASPomG9A6EolnkBGGVY9L3wwTHZ8f
         6QdA==
X-Gm-Message-State: AFq9FYLVZbxcusauqoRdOPxZdwBhE7l4D9TRfof/xiYGi362y0YdsFZ3
	gQ3iCp2uWn9d4rN1p5dBS6rKBhNhen0O0NlFa5MkVA3WdOb+A9UPGXp1xnezYcGXH0AMexI5JWA
	qqA1n
X-Gm-Gg: AYBFou1p5+mYIm7TEuu/iaPP/NxPMIzhGZc6yoiS8qV83/NCln+JKuuBWVPhNok4ThE
	fMCM+bORoaaUiH051MOTE11mRUlbXXwMzQAk4X4PTgd7rykGlwgsrHUlkHFFhdIVFC6Pb0VxLLo
	vbDu2U2vbLyCor5+a5eUthuk1Oawd0R12sAhxpsCn2zgDX3xLOUOOOxLdco3CtFgIm8lc8axeRV
	ZM3cT351GK4qvRKWxv2ay1QkntBBl7KP25lEOigVgrtMM7otp3AAn2s3nuodo6J0gNcu6O3+2Ra
	/cF84Pw6Lz7e38LFsuz1ujXfr8iNgpzg08kacYpQxsnph8DXhlKGvvBo+EqeFhofP09UUYX8Ohd
	Qk4UiAX9HBhWRhs/FmT/7q68c+p0s7fKJ4twwRTJLJnJm81+mDwxY+dEiHZe8l+/ZfpxvIQVLKM
	0AXtORPAYYl/pFSpqslfsPrVojbdP/ePZg1tevxNoIoZzegtlLN+mcJws/IKBY78hpfwj8ssx2d
	1WjNAbpIvLp9BdwLVbmdS+rZ1wQNFBszukLsgI4LCjF5vtJmku6tCeBKXg9A7KwuZfkE8xozCkj
	ewXjyLPmYUJzSeRuYO1bQKM=
X-Received: by 2002:a05:600c:a10c:b0:4a0:1a7f:2abb with SMTP id 5b1f17b1804b1-4a1d75fe221mr182500465e9.11.1792499563952;
        Tue, 20 Oct 2026 05:32:43 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cdc342sm75422675e9.13.2026.10.20.05.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:32:43 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 14/14] python3-gcovr: Upgrade 8.6 -> 8.7
Date: Tue, 20 Oct 2026 15:32:26 +0300
Message-ID: <20261020123226.4033600-14-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261020123226.4033600-1-leon.anavi@konsulko.com>
References: <20261020123226.4033600-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 20 Oct 2026 12:32:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131172
Content-Type: text/plain; charset="utf-8"

Upgrade to release 8.7:

Breaking changes:

- Jinja2 environment for HTML report is now created with
  undefined=StrictUndefined to raise an error if a variable is not
  defined in the template.
- Links to lines in HTML reports now use L<line> instead of a
  l<line>.
- Rename config key txt-metric (string) to txt-metrics (list of
  strings in TOML and multiple entries in gcovr.config). Remove the
  deprecated aliases -b, --txt-branches and --branches.
- Adjust column width of total count in text reports.

New features and notable changes:

- Improve HTML report:
  - Improve wrapping of the counter in the default theme.
  - Replace meter with div elements in the default theme (like in
    GitHub themes).
  - Add jinja2 rendering for CSS files.
  - Add new HTML themes boost.green and boost.blue.
  - Show excluded lines, branches, ... in the summary only if there
    are any.
  - Remove the branches summary and columns if there are no
    branches in the report, e.g all branches are excluded by
    patterns or comments.
  - Replace default theme with github theme which is the new
    default one. If the prefix github. isn't used a warning is
    printed which will turn into an error in a the next version.
- Add compare mode for JSON, text and HTML reports.
- Stub missing line coverage for branches in LLVM source based code
  coverage format.
- Add support for TOML files with --config
- Add --fail-under-condition-or-decision with
  --fail-under-condition and --fail-under-decision as synonyms,
  change the key for the configuration file.
- Add support for multiple metrics in one text report and add
  support for condition coverage.
- Warn if a option is used which has no effect when processing
  tracefiles.
- Add options to restrict where GCOV is executed to prevent
  generating temporary files in arbitrary directories. Write
  protected files are now skipped by default.

Bug fixes and small improvements:

- Fix runtime problem introduced with 8.4.
- Fix boost HTML details and simple output.
- Fix boost HTML support for Conditions, Decisions and Calls
  optional stats.
- Add excluded metrics to boost HTML template.
- Fix alignment in summary header of HTML single page report.
- Fix link to lines in HTML single page report.
- Preserve coverage for procedures declared in Fortran modules.
- Fix missing branches and conditions for uncovered lines in HTML
  report.
- Fix KeyError when merging tracefiles in which only some report a
  function position.

Documentation:

- Add section about gcov options which should not be used to FAQ.
- Add separate option groups for each format.

Internal changes:

- Add CSS and JS files to all folders where a HTML reference file
  is present.
- Refactor internal data model from a flat list to a tree which
  matches the folder structure of the source files. Also add a
  properties element which is cleared after each report format to
  store meta data for the report generation and update the dicts in
  the HTML report to use it.
- Activate sorting of includes for ruff.
- Add gcc-16, clang-21 and clang-22 to the test suite.
- Use different python versions for testing in docker depending on
  Ubuntu version.
- Activate most checks of ruff.
- Update CI runner images.
- Always use GCOVR fixture in tests.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-Support-newer-versions.patch          | 4 ++--
 .../python/{python3-gcovr_8.6.bb => python3-gcovr_8.7.bb}     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_8.6.bb => python3-gcovr_8.7.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
index 2e422cd8fc..ae0685c0d0 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
@@ -1,4 +1,4 @@
-From 99d7788bab614ff5a451f09204139b4cae40be3e Mon Sep 17 00:00:00 2001
+From a4a0cbc4659e4979b770a089f5e197dd2d175e9b Mon Sep 17 00:00:00 2001
 From: Leon Anavi <leon.anavi@konsulko.com>
 Date: Tue, 4 Mar 2025 13:30:48 +0000
 Subject: [PATCH] pyproject.toml: Support newer versions
@@ -13,7 +13,7 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/pyproject.toml b/pyproject.toml
-index f8e54eb03..e6242f042 100644
+index c2c046603..c393d2137 100644
 --- a/pyproject.toml
 +++ b/pyproject.toml
 @@ -1,9 +1,9 @@
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.6.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.7.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-gcovr_8.6.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_8.7.bb
index 3098681bef..5bd4e031aa 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.6.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.7.bb
@@ -8,7 +8,7 @@ SRC_URI = " \
     git://github.com/gcovr/gcovr.git;branch=main;protocol=https \
     file://0001-pyproject.toml-Support-newer-versions.patch \
 "
-SRCREV = "e01ad73582821b5f90e079482164f8e885121e57"
+SRCREV = "7fc1fc829b77a3fd7828abcd976b2e56ff1f28c2"
 
 
 inherit python_hatchling
-- 
2.47.3

