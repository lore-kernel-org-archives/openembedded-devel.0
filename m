Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FF5C02181
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 23:29:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.7135.1736465395025788127
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 15:29:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ax5K2Aaf;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-216426b0865so24427715ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 15:29:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736465394; x=1737070194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AwDp3T08fuqxOnPNbMBkBBhLkSTXwIRs3SL0cwnUzug=;
        b=Ax5K2AafMlEBWoCEaRqHz1OFZtJW2pjeH68waqbV4kXp/ObyR1pMPgmMS+QPujjNpI
         u7RHPCdTiCjjtaHgAOjFs8OqJvfy83ZvZdW7KljtA56G/wPBtdOdxl7XDwcTDM1fkRV+
         upxuQx2oJ3JiNCY+EJ60umSfR4ghPehuSyYFRE9Wd2au7+VjPhtRs/8ZmWxfd0Az8b6f
         d1vRxUyEwpEaSFsB4TuDhqMnsdHU7UH5XzRy5GskUXHgYa9umNfZ8Y7tQijhKPbQEQJq
         ijjKS+/LBKHENBiEDAORYIllLRIhOegSLfuvqUnPNlUpi9D+Jl5vcnb5B3VBFfxoIMvw
         B+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465394; x=1737070194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AwDp3T08fuqxOnPNbMBkBBhLkSTXwIRs3SL0cwnUzug=;
        b=cP0Uf6a1Vekwyo6UayxzznWJNl3WJdxxyyb8iC1xvro9ddF6b5vKjvb+C8/t7eFdwk
         4np9wksftfasOSEBvAqCrbFW5d8JWKPDzs0IDW0/91PkyCDeiFY/oBOMvOsh3xEDnUGm
         0nvpFiNXYQdgqb31MazWZPvXX2JfjMiihiBliobQ4q1bAV+JZKReY18YXLROOiLL5/0+
         StXa00FT903weQv/CRzWjOvkJZvt40rx11vNXhuVBWB0+akaEEWm8R3JyPSXPrlDBqMI
         svTegkMDVdH3SKOruABI5YyQBlIB2nLk+10KnSsDny6RK8SmljFphwbEwwampYamW3eF
         OqtQ==
X-Gm-Message-State: AOJu0YxnCh8zPfTeLCytggPBb7UpEMg7v2zmdEjDCw/I1oo9JW6F4q2b
	qzEVnsUdQYJQJvA82TYIIIFn3JmpW5T34v9wfgroCcKuGBoKSn6ZfVA6IDM8
X-Gm-Gg: ASbGncsB1/GKhWSURLxc0PPFjFwBP/Gs9OcvcLyUmzxTXPW9zG0FjpVdWGacaBktD4H
	CRodf/uZfyoJcDhhkUZhHQhZ4gxFxYXS0x7Bco/0CSzQcA3skX7mwmMssWcpVd41DTUp6ph0fwl
	dRJVdxqT3QfKqvGum+scB1ySpjXlAejKlM5ahGVTZ6irO6RgdhRSqxgddWD93RmrQBVfD1r3zCr
	+Q0AXus5NnDJbmgT9cFv6yHlS20aOg6yh0NsLBedcUeBNRT
X-Google-Smtp-Source: AGHT+IGoKPml/WGA1QHAX91tyXiRZBfhDm2RnJRG+3r4/OnItsN3jxjlViaeg+OtpLX1VqvUVY5eLw==
X-Received: by 2002:a05:6a20:9193:b0:1e1:b883:3c56 with SMTP id adf61e73a8af0-1e88cfd2184mr15554488637.23.1736465394061;
        Thu, 09 Jan 2025 15:29:54 -0800 (PST)
Received: from apollo.localdomain ([2601:646:8201:fd20::1344])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31d6a0b140sm1804500a12.60.2025.01.09.15.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:29:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH 6/6] python3-pyrad: Fix build with poetry 2.x
Date: Thu,  9 Jan 2025 15:29:46 -0800
Message-ID: <20250109232946.1556083-6-raj.khem@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109232946.1556083-1-raj.khem@gmail.com>
References: <20250109232946.1556083-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 23:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114762

Backport a patch that reformats pyproject file to the taste of poetry 2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../python/python3-pyrad/208.patch            | 51 +++++++++++++++++++
 .../python/python3-pyrad_2.4.bb               |  4 +-
 2 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-pyrad/208.patch

diff --git a/meta-python/recipes-devtools/python/python3-pyrad/208.patch b/meta-python/recipes-devtools/python/python3-pyrad/208.patch
new file mode 100644
index 0000000000..b08f183583
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pyrad/208.patch
@@ -0,0 +1,51 @@
+From d17438da2008f48aa13cc95a626c990bf645799a Mon Sep 17 00:00:00 2001
+From: Luca Barbieri <lucabarb@gmail.com>
+Date: Wed, 8 Jan 2025 10:35:22 +0100
+Subject: [PATCH 1/2] Fix pyproject.toml format
+
+Fix pyproject format to correctly build with poetry-core 2.0.0
+Upstream-Status: Submitted [https://github.com/pyradius/pyrad/pull/208]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ pyproject.toml | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+--- a/pyproject.toml
++++ b/pyproject.toml
+@@ -2,16 +2,16 @@
+ requires = ["poetry-core>=1.0.0"]
+ build-backend = "poetry.core.masonry.api"
+ 
+-[tool.poetry]
++[project]
+ name = "pyrad"
+ version= "2.4"
+ readme = "README.rst"
+ license = "BSD-3-Clause"
+ description="RADIUS tools"
+ authors = [
+-  "Istvan Ruzman <istvan@ruzman.eu>",
+-  "Christian Giese <developer@gicnet.de>",
+-]
++  { name = "Istvan Ruzman", email = "istvan@ruzman.eu" },
++  { name = "Christian Giese", email = "developer@gicnet.de" },
++ ]
+ keywords = ["AAA", "accounting", "authentication", "authorization", "RADIUS"]
+ classifiers = [
+     "Development Status :: 6 - Mature",
+@@ -28,7 +28,7 @@ include = [
+   "example/*"
+ ]
+ 
+-[tool.poetry.urls]
++[project.urls]
+ repository = "https://github.com/pyradius/pyrad"
+ 
+ [tool.poetry.dependencies]
+@@ -36,5 +36,5 @@ python = "^2.7 || ^3.6"
+ six = "^1.15.0"
+ netaddr = "^0.8"
+ 
+-[tool.poetry.dev-dependencies]
++[tool.poetry.group.dev.dependencies]
+ nose = "^0.10.0b1"
diff --git a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
index 801233a026..fbe7a0924a 100644
--- a/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-pyrad_2.4.bb
@@ -6,7 +6,9 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e910b35b0ef4e1f665
 PYPI_PACKAGE = "pyrad"
 SRC_URI[sha256sum] = "057de4b7e89d8da57ba782c1bde45c63ebee720ae2c0b0a69beaff15c47e30d9"
 
-SRC_URI += "file://use-poetry-core.patch"
+SRC_URI += "file://use-poetry-core.patch \
+            file://208.patch \
+            "
 
 inherit pypi python_poetry_core
 

