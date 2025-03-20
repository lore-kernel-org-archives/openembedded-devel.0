Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85863C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 12:32:38 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.6262.1742473952623006141
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 05:32:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=Il8Du3re;
 spf=pass (domain: konsulko.com, ip: 209.85.208.54, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5dc89df7eccso1318414a12.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1742473951; x=1743078751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+WITULQYfsSkF0D5rf/asqIAqQ+K+b7f1vJhmD+951o=;
        b=Il8Du3regzkYoR51WIXDiOOXfFxhvK9xGkFbnfOqH++NIIBdfMijZ58MZ78nG/yC9b
         sBxBRY1FiHxvmmq2PwHU/wy4uIJLrBoNutHVtbE3dG9Z2+H6IS6jmfwzkLZT3OzCgMWY
         dr1NTs9GLq2vZ/9UlAPZVfXX4kslj5zUZNYcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742473951; x=1743078751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+WITULQYfsSkF0D5rf/asqIAqQ+K+b7f1vJhmD+951o=;
        b=QCA5g/iX/NLhBxh3Dkby+Jc6XBRX4RY//nbLyTNjOmqgJ/gDc4P1w1x/N8ythJ2NO8
         RWTS0WSrTzmEscoc/14DgbunuM9T8WTnDgsp93QCcKT9N/R8BO9vQSvXZHvo5L4PfdhU
         ZTDD6o1RpEet+zn8S9FsQaCADFUpjzxDFhuD4iMPoWZOoPauQU6cpCnX+7LNt3bXZi1X
         dDF4+/HAwwj/e5jf6OmZhgpCwt8xw4e2zuuTTBnT9SJZ9OHHFhSDaSjT3CRB/ho+JP1P
         6H+1VZWYQ2sqHYLB7gc9PEenmTSK/s2M8TOfA+++0QUd04zVZm7uXqoDuYMRDEKGmCwE
         2jLw==
X-Gm-Message-State: AOJu0YwMGem9JVN+POyMv96Bs5tY2cJshJ3nqbDHLb2+bCymAM5hPQrz
	U32jNHjmKNzo4hskPY2jhu3gRFuHwMEi0RvuUWPMdBMiYZs7P2p8Mjc1GbdxOrga1Ko67G9NdvS
	/
X-Gm-Gg: ASbGncv7TSazK/18FVqtOyOV394hv+8LWHRun903POdUo+pKitTDDWabMMqvZvwccTu
	+/3mTlDgXnLnDRNHGV8L6T9HakivUjYkIqz34d5CZ3WCr4gSHuhWfHScXbno4TOiFWz4peoufrb
	+QgF8hs1G5DVSfPMvG7rSS2hJ7Y0uLyjY90HTlBQ8huqc4kupxDDqHh6Yf7EuoTqznE/lCjMo25
	V5QzBHsS/sYhFAFg3GCpKfZZrkqUW8vXDnAIApz/PN8c9ru6CyKhzba48OOHuUJU0ySyvtqopwR
	n58OFsHlSLDj0PNVniI/6lKC+4zrYJ5SOaYqKYcroD8+Usc1sAYoNMLFSJY=
X-Google-Smtp-Source: AGHT+IFcd/692Bn0kzikocNkGP2YFdjbNfbcM4JLfjlS6icRbs511IcjxzMU0/RWqv8chep0DimPSw==
X-Received: by 2002:a05:6402:350b:b0:5e7:b02b:6430 with SMTP id 4fb4d7f45d1cf-5eb80fa46aamr5548089a12.23.1742473950639;
        Thu, 20 Mar 2025 05:32:30 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afdfe6sm10714372a12.76.2025.03.20.05.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 05:32:30 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-pylint: Upgrade 3.3.4 -> 3.3.6
Date: Thu, 20 Mar 2025 14:32:27 +0200
Message-Id: <20250320123227.2198743-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250320123227.2198743-1-leon.anavi@konsulko.com>
References: <20250320123227.2198743-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 12:32:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116136

Upgrade to release 3.3.6:

- Fix a false positive for used-before-assignment when an inner
  function's return type annotation is a class defined at module
  scope.
- Fix false positives for use-implicit-booleaness-not-comparison,
  use-implicit-booleaness-not-comparison-to-string and
  use-implicit-booleaness-not-comparison-to-zero when chained
  comparisons are checked.
- Fix a false positive for invalid-getnewargs-ex-returned when the
  tuple or dict has been assigned to a name.
- Remove getopt and optparse from the list of deprecated modules.
- Fixed conditional import x.y causing false positive
  possibly-used-before-assignment.
- Fix a crash when something besides a class is found in an except
  handler.
- Fixed raising invalid-name when using camelCase for private
  methods with two leading underscores.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...l-Keep-tool.setuptools.license-files.patch | 48 +++++++++++++++++++
 ...ylint_3.3.4.bb => python3-pylint_3.3.6.bb} |  5 +-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
 rename meta-python/recipes-devtools/python/{python3-pylint_3.3.4.bb => python3-pylint_3.3.6.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
new file mode 100644
index 0000000000..28ed0c8951
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pylint/0002-pyproject.toml-Keep-tool.setuptools.license-files.patch
@@ -0,0 +1,48 @@
+From 2a08adb0e90219626dac0b6d05a21265e460eae2 Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Thu, 20 Mar 2025 12:09:42 +0000
+Subject: [PATCH] pyproject.toml: Keep tool.setuptools.license-files
+
+Keep legacy license declaration and tool.setuptools.license-files
+to avoid the following errors:
+
+| ValueError: invalid pyproject.toml config: `project.license`.
+| configuration error: `project.license` must be valid exactly by one definition (2 matches found):
+
+| ValueError: invalid pyproject.toml config: `project`.
+| configuration error: `project` must not contain {'license-files'} properties
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index 0cf1ade57..7a4665ce0 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -8,8 +8,7 @@ name = "pylint"
+ description = "python code static checker"
+ readme = "README.rst"
+ keywords = [ "lint", "linter", "python", "static code analysis" ]
+-license = "GPL-2.0-or-later"
+-license-files = [ "LICENSE", "CONTRIBUTORS.txt" ]
++license = { text = "GPL-2.0-or-later" }
+ authors = [
+   { name = "Python Code Quality Authority", email = "code-quality@python.org" },
+ ]
+@@ -65,6 +64,9 @@ scripts.pylint-config = "pylint:_run_pylint_config"
+ scripts.pyreverse = "pylint:run_pyreverse"
+ scripts.symilar = "pylint:run_symilar"
+ 
++[tool.setuptools]
++license-files = [ "LICENSE", "CONTRIBUTORS.txt" ]
++
+ [tool.setuptools.packages.find]
+ include = [ "pylint*" ]
+ 
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-pylint_3.3.4.bb b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-pylint_3.3.4.bb
rename to meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
index 92378d7fda..f70049c898 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_3.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_3.3.6.bb
@@ -3,9 +3,10 @@ HOMEPAGE = "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRCREV = "c2b01c3d0b6410d4c93eb1f32fb28f2116b1e68f"
-SRC_URI += "git://github.com/pylint-dev/pylint;branch=main;protocol=https \
+SRCREV = "7ac5a4d4f77576df3a00e63f86ca86e0e1780b47"
+SRC_URI += "git://github.com/pylint-dev/pylint;branch=maintenance/3.3.x;protocol=https \
             file://0001-Adjust-test-expectations-for-ptest.patch \
+            file://0002-pyproject.toml-Keep-tool.setuptools.license-files.patch \
             file://run-ptest \
            "
 
-- 
2.39.5


