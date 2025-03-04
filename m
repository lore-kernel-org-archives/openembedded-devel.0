Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8410AC282DC
	for <webhook@archiver.kernel.org>; Tue,  4 Mar 2025 13:54:25 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.22214.1741096463106208587
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Mar 2025 05:54:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hZlBSHFO;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-390d98ae34dso4590374f8f.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 05:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1741096461; x=1741701261; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SrhdAiE9JGkuiWYGSuZQW6QfFk/O+dTaCiRR0pOB3L0=;
        b=hZlBSHFOjA1QdN7x68JNxXzltXRHSp29P/K392vdAp/YMlvKPilrrfxBXcMHNVOA31
         L4wTGJH6UivtN/9RGi2hitPdg7hxXGZ6HhEMuvwKRlKC/P5gtvo0G+hSqv7EBS4sX/ZT
         DW26eNDJSxHU1jhG2yRzaCnC49fU077v3mVZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741096461; x=1741701261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SrhdAiE9JGkuiWYGSuZQW6QfFk/O+dTaCiRR0pOB3L0=;
        b=wdQRD3tV8DNbFpayRNcsb8om4R7T1JHsQMu6aDjNPf6k4kiJsmB4tUhqXqzm7qlpsV
         GWQfDccm3ix4lFqkpFBR3mpR3bVgL+UzkjHi8yu+VnS6+hqjmcw9gBoVwOaT+z6IRt0i
         tov2jBwQA+WE9m8G2z5RpkCg1W6oAPmO6Ukz3u41wsbgGtbm92Gq7qNOki//da34TG8T
         fEiPKou6HkY24nLVdrjUFwQGVnC6Q3RZpq2kvQIuPxLA7/BviC/JBzAsb+7LsTUSXGyN
         WHpXAne5jsrNsln4V+RXtbdgOBKnKn7BHf59XRBcpwmMu8nqA4tHn4TOJ6/y9D7WtJM9
         tYxA==
X-Gm-Message-State: AOJu0YwLM+dbZoaeuFYZblq7NHm3Y855L831fNX47VlzfW1jvleAf2Xq
	y1O5cf7l+VMY5B8JwLhDezc5lhFS/Q4OQ2PxqeNCaEsetbBS4a939iLKJ1R+2WBtuBwg/g5DCml
	E
X-Gm-Gg: ASbGncvoMBc0vget/vlfE0lyJuIqmHpJ71VfGD0qInqHLtJCSw0JZjnR0C+M9mTr41k
	i1wns9fQbdGB8atvVbaCV61GHImsuCgODzbgjs7MTxBFC8034TrZajF0j6EzocI5h+60mkvfeeP
	kNgYlMTYeP3+aEFFOGUB+u1IEmR8xCbIkiebTJtva7Xue4Tr6vWhzmm+DZAsizlECaI+WIAE00W
	JjiyfDzZflhIr81hJ/rSZOIlF9lxnP94tFOiLYa6EbOCNTXv3SvsmqiYnuSPV4eX/58Ei4jRVig
	tuvB0He+rdthWlUDsir1IMzIdXGMvBrqKjE8xetZDc7VDAXwmfmhSE+6M1g=
X-Google-Smtp-Source: AGHT+IGMrSPH6Dmkh8akjVkvacqap0AQS1pe56I52KOMyT5osRDN8qNmoefGNey9ypStIG7H19SuNg==
X-Received: by 2002:a5d:584d:0:b0:391:12a5:3cb3 with SMTP id ffacd0b85a97d-39112a53f00mr5291372f8f.3.1741096460853;
        Tue, 04 Mar 2025 05:54:20 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795d30sm17979983f8f.10.2025.03.04.05.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 05:54:20 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 3/3] python3-gcovr: Upgrade 8.2 -> 8.3
Date: Tue,  4 Mar 2025 15:54:16 +0200
Message-Id: <20250304135416.2142742-3-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250304135416.2142742-1-leon.anavi@konsulko.com>
References: <20250304135416.2142742-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Mar 2025 13:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115741

Upgrade to release 8.3:

- Replace setup.py with hatchling. To install from source at least
  version 21.3 of pip is needed.
- Drop support for Python 3.8.
- Add condition coverage to text summary report.
- Add --include to search files in search paths which should be
  added to report.
- Add option to generate LCOV format produced by version 1.x of
  LCOV tool.
- Extend logging for data merge errors with info about the data
  sources.
- Add condition coverage merge mode option --merge-mode-conditions
- Add --gcov-suspicious-hits-threshold to configure the value for
  detecting suspicious hits in GCOV files.
- Renamed JSON element destination_blockno to destination_block_id.
- Add --html-block-ids to show the block ids of the lines and
  branches in HTML report.
- Fixed an error handling bug throwing a TypeError exception on a
  gcov merge assertion failure instead of reporting the error and
  (if requested by the user) continuing execution
- Check format version of external generated gcov JSON files.
- Fix crash on Windows when trying to fix the case of the files.
- Fix LCOV report. Excluded lines where added with a count of 0.
- Fix line exclusion not clearing all child coverage data.
- Fix summary stats in JaCoCo report.
- Fix path issue when reading/writing Coveralls report.
- Fix issue with negative counters in GCOV JSON export.

License-Update: Update year

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...yproject.toml-Support-newer-versions.patch | 30 +++++++++++++++++
 .../python/python3-gcovr_8.2.bb               | 23 -------------
 .../python/python3-gcovr_8.3.bb               | 32 +++++++++++++++++++
 3 files changed, 62 insertions(+), 23 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-gcovr_8.2.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-gcovr_8.3.bb

diff --git a/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
new file mode 100644
index 0000000000..cf5ddf31cc
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gcovr/0001-pyproject.toml-Support-newer-versions.patch
@@ -0,0 +1,30 @@
+From 7963caede294c7615ab0a60900e37790731279cc Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Tue, 4 Mar 2025 13:30:48 +0000
+Subject: [PATCH] pyproject.toml: Support newer versions
+
+Support newer versions when building through bitbake.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ pyproject.toml | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pyproject.toml b/pyproject.toml
+index e162ba062..89798fa23 100644
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -1,7 +1,7 @@
+ 
+ [build-system]
+ requires = [
+-    "hatchling==1.26.1",
++    "hatchling>=1.26.1",
+     "hatch-vcs==0.4.0",
+     "hatch-fancy-pypi-readme==24.1.0"
+ ]
+-- 
+2.39.5
+
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.2.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.2.bb
deleted file mode 100644
index bbafa36acf..0000000000
--- a/meta-python/recipes-devtools/python/python3-gcovr_8.2.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "generate GCC code coverage reports"
-HOMEPAGE = "https://gcovr.com"
-SECTION = "devel/python"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b307623752f2e1189349885b95b326e5"
-
-SRC_URI = "git://github.com/gcovr/gcovr.git;branch=main;protocol=https"
-SRCREV = "045fb8d51806bd7f9e3df4e4edffa3bb816cf77f"
-
-S = "${WORKDIR}/git"
-
-inherit setuptools3
-
-RDEPENDS:${PN} += " \
-    python3-colorlog \
-    python3-jinja2 \
-    python3-lxml \
-    python3-multiprocessing \
-    python3-pygments \
-    python3-setuptools \
-"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
new file mode 100644
index 0000000000..a9b29a4458
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-gcovr_8.3.bb
@@ -0,0 +1,32 @@
+DESCRIPTION = "generate GCC code coverage reports"
+HOMEPAGE = "https://gcovr.com"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ae27363fce24765bc79a095313a3b002"
+
+SRC_URI = " \
+    git://github.com/gcovr/gcovr.git;branch=main;protocol=https \
+    file://0001-pyproject.toml-Support-newer-versions.patch \
+"
+SRCREV = "fe536afac4da31e86909191ef31708755ab8cf83"
+
+S = "${WORKDIR}/git"
+
+inherit python_hatchling
+
+DEPENDS += " \
+    python3-hatchling-native \
+    python3-hatch-vcs-native \
+    python3-hatch-fancy-pypi-readme-native \
+"
+
+RDEPENDS:${PN} += " \
+    python3-colorlog \
+    python3-jinja2 \
+    python3-lxml \
+    python3-multiprocessing \
+    python3-pygments \
+    python3-setuptools \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


