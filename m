Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5D7CCF2F0
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 11:41:50 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33614.1768822901734824860
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 03:41:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cC+IjRCo;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b874c00a39fso743999966b.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 03:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1768822900; x=1769427700; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3oitD4NqKli1q3u6gr1/0QkHiduE9THeK6Pz2nrDIM=;
        b=cC+IjRCoikIf7+QiqktBmCJaoaH8mHHHKg/kup0jDF2LXDNG12u+bcA32EuaIgFSOY
         LndfqTODLVguhGuY8s1FSSzArbb4+C4dES0NRVTSzWj2DTDIfRL1IPcU1QEX0c/LJ83P
         nhg8Vm4YXbDZZxx7Q4/e6NexfKpzRPqQPZtPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768822900; x=1769427700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y3oitD4NqKli1q3u6gr1/0QkHiduE9THeK6Pz2nrDIM=;
        b=mQ5IVGHIF5TOiqxKN1eey4+s0uZPdAKu5dfN8CCr7MhXRDlxO669aafr+3kG6uY0oP
         bh0FzwBVZzhcCv1zut9+SvzYQRBTCpSMq2HyvcdDVKMf9pj3z3kRsUftbN4T5iyF8QXB
         GrkbSuVnW/k1xTr6VEnDO9q5y3hl37aaKja6r9w1tPO8NP79g81ak2Nv6hu8OE2ybHbz
         1r5tSojhYDudaHq0xxjE45FTNhOFuWvp2iuvCet19LiXykZN9ekUCdmobBq+SrT66RvG
         Wj8fP43LPvigrn9G7aJKHUfPPLjLWOERzJfVp7nnLCyrx7EltMsSlf7cPURSXJiZxouD
         vwxw==
X-Gm-Message-State: AOJu0YzrbW4gJUnHqnjRxjZ7jfexgObRCV0VlonWVntdV2dSvb3d2Lyk
	Tgmw576ikzwYeP6FZx4uaOY5Kcy7Sa/WRrOpi6b/0Nvb78nGwbtD8nRB1YvRH1TI7rTk1r76b6s
	M8YKR
X-Gm-Gg: AY/fxX5UCOyQhPUT9sGHpkMLDWfZ4sWo/QHRM3baDQAFMTWVFLafZWEuWQUCUbUzDdc
	Eg3yLNv8UjADZJuckuL8qyociDuhR94g7T9nuGk1HV+tHzGpa4NhhQGFHPz4T88oxiylNuGxliM
	6geQOQoJ9HyU3XOMd/KwAGh3SYAl2bB9bs4mafE93MlxpMbALwkXTb6tdobe7AtkMwWeYfuO94A
	c0b7ahOsLkWaCpn2FIvXjdDwiuNBf+iwhX4lAJ6a023CaCFsvba3gZlEgl8kBFyjpHY+gesJ/31
	Wd3XuYZcxOiGaOztwc2swA65T2VaxkrSLpJ0zxTU1Xbxq9TbfqX7llkTberepxL9gBWN9SZUbr8
	juDUOL/rRSXm3JAUZfZ/sE910nWO6nby0Qq+/QAqNPNeg/BEjKXhqpJIokv5BBUzdnWmt9CXAsM
	hVWsiwZ4YO2YStBqGJhG39hyPW
X-Received: by 2002:a17:907:80d:b0:b87:703c:139d with SMTP id a640c23a62f3a-b8793857c5amr900934166b.3.1768822899586;
        Mon, 19 Jan 2026 03:41:39 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168c6dsm1087773766b.19.2026.01.19.03.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:41:39 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 2/2] python3-black: Upgrade 25.12.0 -> 26.1.0
Date: Mon, 19 Jan 2026 13:41:36 +0200
Message-ID: <20260119114136.1592429-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119114136.1592429-1-leon.anavi@konsulko.com>
References: <20260119114136.1592429-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 11:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123637

Upgrade to release 26.1.0:

Introduces the 2026 stable style, stabilizing the following changes:

- always_one_newline_after_import: Always force one blank line after
  import statements, except when the line after the import is a
  comment or an import statement
- fix_fmt_skip_in_one_liners: Fix # fmt: skip behavior on one-liner
  declarations, such as def foo(): return "mock" # fmt: skip, where
  previously the declaration would have been incorrectly collapsed
- fix_module_docstring_detection: Fix module docstrings being
  treated as normal strings if preceded by comments
- fix_type_expansion_split: Fix type expansions split in generic
  functions
- multiline_string_handling: Make expressions involving multiline
  strings more compact
- normalize_cr_newlines: Add \r style newlines to the potential
  newlines to normalize file newlines both from and to
- remove_parens_around_except_types: Remove parentheses around
  multiple exception types in except and except* without as
- remove_parens_from_assignment_lhs: Remove unnecessary parentheses
  from the left-hand side of assignments while preserving magic
  trailing commas and intentional multiline formatting
- standardize_type_comments: Format type comments which have zero
  or more spaces between # and type: or between type: and value to
  # type: (value)

The following change was not in any previous stable release:

- Regenerated the _width_table.py and added tests for the Khmer
  language

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-black_25.12.0.bb           | 23 ----------------
 .../python/python3-black_26.1.0.bb            | 26 +++++++++++++++++++
 2 files changed, 26 insertions(+), 23 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-black_25.12.0.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-black_26.1.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-black_25.12.0.bb b/meta-python/recipes-devtools/python/python3-black_25.12.0.bb
deleted file mode 100644
index 9bdf8df3e4..0000000000
--- a/meta-python/recipes-devtools/python/python3-black_25.12.0.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "The uncompromising code formatter."
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
-                    file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
-                    file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
-
-DEPENDS = "python3-hatch-vcs-native python3-hatchling-native"
-SRC_URI[sha256sum] = "8d3dd9cea14bff7ddc0eb243c811cdb1a011ebb4800a5f0335a01a68654796a7"
-
-inherit pypi python_hatchling
-
-DEPENDS += "python3-hatch-fancy-pypi-readme-native"
-
-PYPI_PACKAGE = "black"
-
-RDEPENDS:${PN} = "python3-click \
-				  python3-mypy-extensions \
-				  python3-packaging \
-				  python3-pathspec \
-				  python3-platformdirs \
-				  python3-tomli \
-				  python3-typing-extensions \
-				  "
diff --git a/meta-python/recipes-devtools/python/python3-black_26.1.0.bb b/meta-python/recipes-devtools/python/python3-black_26.1.0.bb
new file mode 100644
index 0000000000..bcb0f0f408
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-black_26.1.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "The uncompromising code formatter."
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d3465a2a183908c9cb95bf490bd1e7ab \
+                    file://docs/license.md;md5=d826b3c5269f21a8a0272af3f00d15c0 \
+                    file://src/blib2to3/LICENSE;md5=bbbad7490e921f9a73c0e891305cb4b3"
+
+SRC_URI[sha256sum] = "d294ac3340eef9c9eb5d29288e96dc719ff269a88e27b396340459dd85da4c58"
+
+inherit pypi python_hatchling
+
+DEPENDS += " \
+    python3-hatch-vcs-native \
+    python3-hatchling-native \
+    python3-hatch-fancy-pypi-readme-native \
+"
+
+RDEPENDS:${PN} = " \
+    python3-click \
+    python3-mypy-extensions \
+    python3-packaging \
+    python3-pathspec \
+    python3-platformdirs \
+    python3-tomli \
+    python3-typing-extensions \
+    python3-pytokens \
+"
-- 
2.47.3


