Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8E6FD26D71
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 15:59:40 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13260.1767974374183454958
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 07:59:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=rNLYNnrD;
 spf=pass (domain: konsulko.com, ip: 209.85.208.52, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6505cbe47d8so7064883a12.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1767974372; x=1768579172; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpXxrR0GK1PI4iFlBO6CFpcibqEhNaEa1fZMrx4kp9c=;
        b=rNLYNnrDT9QeZ/uqmrT9YypIZJusGzTLOlqA3ba27UuYOcG/naGKFCNjBpKGDB9zjD
         F/FnSy3w/6f3KTwXZ5E4xUVeEMO28DCP3Jh7ySwA59jgMvL31PDJTPkhKzcvDfSdAXDG
         9mvYMCeqzACTXK8/1qv9CXq1yG2KlUViZ0KFQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767974372; x=1768579172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qpXxrR0GK1PI4iFlBO6CFpcibqEhNaEa1fZMrx4kp9c=;
        b=hvncmZQGgPsJseP4lkcxt2hrfSNVwQADCqe/hASiNe7ndrIHFNa3ncWMGeEZ9s4q2Y
         jNs4Ozu9z8JEtxeJpnFm5ViW/bDnga32lUciRxl1azd8mBMHsQGG2OHlt2YOMhmgvzhj
         j+GkAPK20AHp1DQQLB59oj5/y9r/MiQZUEzVzqj5orIJbha/5o53hOmxvnlUHD0sa1p8
         uVLDxsTzRzNeeY0M7JbyhtVvdR6gbt7TnCCTxm8SjFF3uK341dxQlba3G/db5SRSMwsJ
         b/l/UxtuiK/nfNrhEkk4wQOxbDwN+5ca/WYgHyOrECy8DQ7NJ2cOAIvvhaaIHvljrt9y
         4HNw==
X-Gm-Message-State: AOJu0YxeO29egcgMkWrgfb01bduAE/oQ5iHbozXtP05+yiCbM0+UMAqU
	qoU+i4BT6ZRVEsFeW8F0oCHi5rU0At9AzGpKUIZC5rGCFMtZiEmnBfiJMdPx5qd8CMU8gy/gWcN
	a2L5A
X-Gm-Gg: AY/fxX4hhSyRQ+a6jMLpYf/CiSyzZG4rGfIx2PXKvJb7ZkfSkEGy34iuBSs5PDQlC5R
	qpBgmK7PVSJY6hPXD35N067qQ2pNPc9TP5SWI8U8cqQuf0CU2Sa/b+rR/iRAhhW6bulH1ZmjA54
	sLawlb3qLcnVZT2ih96/rmgUDwt2LAyFxW8MFZnppzC0Kujm9WZ0sWEVT4VCeqekmHwC+s4C7ax
	YG2MB7HBa1OopK6hoz2hLoBmUD46ahcAs8wQsOndam+sdPQZcclXeWNC+FYtNMXS8L2awKFL8xP
	ENTPBbgmytT34c50wgbaZ6BFCth1HS0TxMeEzah4f2hqgJ7BxNWIVw72eOXPCiWJ8tUfLKevVKV
	QqmcTUBVOYJHaIZ+WmluB6uge50vA+mRSZ7mD0gdEZQ20GwrKbpM94wGNEpsIRu03hCYa3GB5eQ
	sX9K73sp6MMKilo/6WoEe4uthZRezuBKL3dUE=
X-Google-Smtp-Source: AGHT+IHkJ6/vNYZwcdtz7XCVxPuV5q4dS3lwBX7eNH/VqwgtcY4zNWXqxHHkHncdko6lz5oVsOepHg==
X-Received: by 2002:a17:906:6a1b:b0:b83:3294:af63 with SMTP id a640c23a62f3a-b8445031bd4mr885336566b.1.1767974372260;
        Fri, 09 Jan 2026 07:59:32 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf6d4acsm10781444a12.30.2026.01.09.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 07:59:31 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 4/4] python3-gcovr: Upgrade 8.3 -> 8.5
Date: Fri,  9 Jan 2026 17:59:27 +0200
Message-ID: <20260109155927.3850975-4-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260109155927.3850975-1-leon.anavi@konsulko.com>
References: <20260109155927.3850975-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 15:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123309

Upgrade to release 8.5:

Breaking changes:

- The option --lcov-test-name doesn't accept values with spaces
  anymore.
- The option --lcov-format-1.x is deprecated and mapped to
  --lcov-format-version=1.x.
- Changes to HTML templates.

New features and notable changes:

- Due to added support for LLVM source based code coverage format
  some configuration file keys got changed. The old gcov named
  options are still supported but they also affect the LLVM
  toolchain.

Bug fixes and small improvements:

- Fix coveralls report if there are several coverage elements per
  line.
- Fix not excluded conditions if branches are excluded by comments.
- Fix reported excluded branches in LCOV report.
- Fix exclusion filter --gcov-exclude.
- Add --json-trace-data-source to include the trace data source in
  the JSON report independent from --verbose.
- Remove generated gcov files on error and catch additional gcov
  error message.
- Change default HTML theme excluded line color.
- Move theme colors to a separate CSS file so they can be overridden
  with a simple --html-template-dir directory with only the
  style.colors.css file.
- Fix regular expression for detecting a version mismatch between
  gcc and gcov.
- Improve logging messages for GCOV execution errors to not print
  information twice and add trace messages for gcov execution.
- Fix handling of lines after function specialization.
- Improve performance by changing logging messages (level and lazy
  interpolation).
- Fix text report for covered decisions.
- Fix runtime problem introduced with 8.4.
- Fix wrong entries in data source attribute of JSON report.
- Fix nested HTML report without coverage data.
- Add warning if coverage data is empty.
- Add warning if function lines are missing in external generated
  GCOV files.
- Extend support for zipped reports. If last suffix is .xz then
  LZMA is used to compress the report.
- Fix function exclusion in report generation.
- Do not ignore lines without functions, e.g. from inlined code.
- Ignore all whitespaces instead of only spaces for detection of
  noncode lines.
- Add support for temporary merging line coverage objects without
  modifying the data model.
- Change internal behavior of --exclude-function-lines to exclude
  the line of function definition instead of removing it completely.
- Ensure that all functions have a line coverage element in LCOV
  report.

License-Update: Update years

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../0001-pyproject.toml-Support-newer-versions.patch | 12 ++++++------
 .../{python3-gcovr_8.3.bb => python3-gcovr_8.5.bb}   |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-gcovr_8.3.bb => python3-gcovr_8.5.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
index b06acdf333..2e422cd8fc 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
+++ b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
@@ -20,12 +20,12 @@ index f8e54eb03..e6242f042 100644
  
  [build-system]
  requires = [
--    "hatchling==1.26.1",
--    "hatch-vcs==0.4.0",
--    "hatch-fancy-pypi-readme==24.1.0"
-+    "hatchling>=1.26.1",
-+    "hatch-vcs>=0.4.0",
-+    "hatch-fancy-pypi-readme>=24.1.0"
+-    "hatchling==1.27.0",
+-    "hatch-vcs==0.5.0",
+-    "hatch-fancy-pypi-readme==25.1.0",
++    "hatchling>=1.27.0",
++    "hatch-vcs>=0.5.0",
++    "hatch-fancy-pypi-readme>=25.1.0"
  ]
  build-backend = "hatchling.build"
  
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.5.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
rename to meta-python/recipes-devtools/python/python3-gcovr_8.5.bb
index 4f0b6bb150..68cc9bc274 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.5.bb
@@ -2,13 +2,13 @@ DESCRIPTION = "generate GCC code coverage reports"
 HOMEPAGE = "https://gcovr.com"
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ae27363fce24765bc79a095313a3b002"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ba06c93410cc51bafc66fa06456879bf"
 
 SRC_URI = " \
     git://github.com/gcovr/gcovr.git;branch=main;protocol=https \
     file://0001-pyproject.toml-Support-newer-versions.patch \
 "
-SRCREV = "fe536afac4da31e86909191ef31708755ab8cf83"
+SRCREV = "71eedb8f300612d4095f2ffa4ac60e3fdd58c192"
 
 
 inherit python_hatchling
-- 
2.47.3


