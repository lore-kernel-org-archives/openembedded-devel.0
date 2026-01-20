Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE4A6D2ECF7
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 04:47:01 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26.1768884416716560206
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 20:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jdatGpY1;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso5212597eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 20:46:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768884416; x=1769489216; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r5yOuraOBwLe75kOrVngcrkKpmRaTxboL6wpH7J6KTo=;
        b=jdatGpY1DoSVzMpzQOrJJs1Qj5sL2vumVU6QPxvxuT+VzsiZlAYZXDNXAoDYUP/2t/
         C1F3B66H42LHzRGy1wcDuKRbM6eLrMTOWK2IVis5h7Rys/k2g9DIFcx5dOen3bOv8Ao+
         xIWDrUWkRA88V7Orh/5au+deX9MB9eYIEuczyAdUo3yGUtj/qWayC9f5F3UfNuf+yTJ2
         f8vVT3FnHTCAB/Qn/2A0wiAMYKJxIRi0h9O5paeiwdOE+Zvv+asHKuiDUFfUgIFzIEja
         HI5kAlNXdnmd5tlPYYar4Q/xPiYbSOGyuZI6vjw0qnshO4h4VWPfjbM6dgfVKSU7cLMe
         OHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768884416; x=1769489216;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5yOuraOBwLe75kOrVngcrkKpmRaTxboL6wpH7J6KTo=;
        b=WyXjWWORGfiwn4o6WnV8eD4Bf41WAAqRMHiBCoZn2+dE8yq1TRu48dcEnShIQq0Iiq
         u77rXRhJZ5JlPobOxIrB40lSud95MTs6B0yO0ab5Wath9+evJlkKapOaqWs8LqyyNEl+
         5Bj1KqLscDDmYAuPse8mteC4ee51x6zFtwGYe0Exqcd0+8ikdMIJL1zcwxA4EbqcZ8it
         hCiCyTgNrSqgQYFfLVh11outWR8pkXnLVkhT7jGcRTbgwWdTVNT9bwdy2l7WfvPl78Go
         hRmYj9hIhw4aCThDSOAdbacS2oRVMRxFgOWoV/jGhraDC2bjrK91jt9vkDuaHnxk9xni
         I7Ig==
X-Gm-Message-State: AOJu0YwzlvgKRXmgnuOLCUMOQOASLr5ZtsXmOWxQgC/mMvai9Q+9PJBt
	5V3qeFfj72AaSFA3/cZHK8iFgPGtieAIM054U5CMRDK2sH3IsuAn7A1QpuqZNUrm
X-Gm-Gg: AZuq6aLRfWTbZxzV+UGWLlPLuAJ5X1QSnypcyErJCpCTD7XZLsOYUgFfUP/bmaEP83y
	st6CxMPgTBQGVym/sAfvlwlVZbLaLDSytYoaO0PdbEvQuGcUCdA83xv2/iCO63dG9GSDMecTrFQ
	lsQQTNTXAfgUxOrDuk6dDC2Eq84K0vy+8d/xvk38yIpCDbfelAjk+rXT+bcypQBNnOpFy2M1XOt
	SlPO8l8mm3dHhU/SFbwPYDbZDRQpiE4RNpry7G5yhLhIOFhWa1QOPDHAuCCXXGz4zAzrWtiX8au
	J8mCTN0cUZEj+DdWPMZbTvPz0tdiaA6KBnmh9c4FuUoKNb9XOdERyinp1Gkp+0maJ0k7zph37/v
	k/KUblyLCwIype+ZNbqHD9v5EsTN/Sg2V7GH6TZh6eFSpxy879lkUmnxyEXEefy4l/gQ6PE4w+D
	alJOFAYsF4/gK6tkAdEOg/48Nb7t++klKUagPelvMxdp/BoWCOXuvs5N+WSlZIKOHwIC6cID8rn
	LLgQciSGCKiQPFcysbkRsTG9BuDgJw=
X-Received: by 2002:a05:7300:dc85:b0:2b0:536a:ee0e with SMTP id 5a478bee46e88-2b6b4eb3a0bmr10148313eec.41.1768884415713;
        Mon, 19 Jan 2026 20:46:55 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::28b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3619a94sm15403075eec.20.2026.01.19.20.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 20:46:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-html5lib: Fix build with python 3.14
Date: Mon, 19 Jan 2026 20:46:53 -0800
Message-ID: <20260120044653.339786-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 04:47:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123653

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...sion-parsing-on-Python-3.14-ast.Str-.patch | 41 +++++++++++++++++++
 .../python/python3-html5lib_1.1.bb            |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14-ast.Str-.patch

diff --git a/meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14-ast.Str-.patch b/meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14-ast.Str-.patch
new file mode 100644
index 0000000000..4d3c8eec91
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-html5lib/0001-setup.py-fix-version-parsing-on-Python-3.14-ast.Str-.patch
@@ -0,0 +1,41 @@
+From 39db97412da6b9f4918ae1350ae9561be9af48ea Mon Sep 17 00:00:00 2001
+From: Andrew Sukach <andrew@sukach.org>
+Date: Fri, 12 Sep 2025 21:53:31 -0700
+Subject: [PATCH] `setup.py`: fix version parsing on Python 3.14 (ast.Str
+ removed)
+
+Python 3.14 removes the ast.Str node type. String literals now appear
+as ast.Constant(value=str).
+Update the AST check to accept both ast.Str (for older Pythons) and
+ast.Constant with a string value (for Python 3.8+), allowing html5lib to
+build successfully on Python 3.14 while remaining compatible with older
+version.
+
+Upstream-Status: Submitted [https://github.com/html5lib/html5lib-python/pull/589]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ setup.py | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/setup.py b/setup.py
+index f84c128..c393c9c 100644
+--- a/setup.py
++++ b/setup.py
+@@ -89,9 +89,14 @@ with open(join(here, "html5lib", "__init__.py"), "rb") as init_file:
+     for a in assignments:
+         if (len(a.targets) == 1 and
+                 isinstance(a.targets[0], ast.Name) and
+-                a.targets[0].id == "__version__" and
+-                isinstance(a.value, ast.Str)):
+-            version = a.value.s
++                a.targets[0].id == "__version__"):
++            if hasattr(ast, "Str") and isinstance(a.value, ast.Str):
++                version = a.value.s
++            elif (hasattr(ast, "Constant")
++                  and isinstance(a.value, ast.Constant)
++                  and isinstance(a.value.value, str)):
++                version = a.value.value
++assert version is not None
+
+ setup(name='html5lib',
+       version=version,
diff --git a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
index 8b32580d4a..3d7e44b87e 100644
--- a/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-html5lib_1.1.bb
@@ -2,6 +2,7 @@ SUMMARY = "HTML parser based on the WHATWG HTML specifcation"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1ba5ada9e6fead1fdc32f43c9f10ba7c"

+SRC_URI += "file://0001-setup.py-fix-version-parsing-on-Python-3.14-ast.Str-.patch"
 SRC_URI[sha256sum] = "b2e5b40261e20f354d198eae92afc10d750afb487ed5e50f9c4eaf07c184146f"

 inherit pypi setuptools3

