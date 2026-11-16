Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34306.1794851681196393000
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:54:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=zDBbHfEV;
 spf=pass (domain: gmail.com, ip: 74.125.82.177, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-37628596783so6270047eec.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851680; x=1795456480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFnz269R0RURnH5B4jseUnYlqaByP7am1EmVILYMX1Q=;
        b=zDBbHfEVO2OB24fgQuUR/pMiNGwF1ElZ39lX8VTiP82ashnmC6x63YlCc6PEgbIwJo
         PN7xcLt0pYDVSo1baGtDxl/vzVU5eiU+vqxY4ol/hoiGJ76T8SO4Lp/k+U/RpE7WVbnJ
         KMI86EdDff3k8FS2Dwz1NZO4xrNb/gZROmOuYwoyOuF+iEAvT2CuWYPPBpD6X21Iav2q
         hUH+FyO4PuVD0DkbgtPlT+Kp2WnGzTMZXK7SXhRNkLZtEJxayhex9fErEvWlyv76P+YS
         GQ8NXJPYz1HqO5F2Ay1VkuZHAaGV8TnDEfwUl62zvh6QhyBUv1UtgWoXz9InzzkJMCqW
         hteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851680; x=1795456480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFnz269R0RURnH5B4jseUnYlqaByP7am1EmVILYMX1Q=;
        b=zHCjHLWxgkhwPnNHhoSGDzTnVFd+0+JJ5gI3gP7jVUvBKCdf9YP+dmXAdys3/SS/OP
         ZpxkyrDIJRJ9q5rJW+gG0jxVceBmJuMLA3aCCXWspRiHFLI/8mKmkKyec4OD1e+hstp6
         DdpvnDATjanTw9ilJxh65+UxopiuttVYy0WCbErpC2UhHpwh2YokufwD/xq+hglg/eiT
         b2QXujt5h3uA5MlzfIG39Ie8Tp+DRbj+bqJZgxOFTfLvG7kV9RXgvBdYO2aoMU25dwqO
         JBtVQiaj2S488jYaG89BpIGqn18b49Fc5hFRNW01CdSjd+5iMbifkqjh30Gx11wN6wYR
         rBGw==
X-Gm-Message-State: APuU4Z8XeQvfxJzZjLLWuUMze1hTD/SY1pyZ2Kv4db7/3AhMPHMP0cYf
	5MTqdv7vEyA9B/FUupwdI1dFVkG06BbQxQx0YKMetyb184FOwpoQobfYjKQV4wa6
X-Gm-Gg: AZFdTZfKrx/gXgI2qoUXRadJSmHs2c9rRO/fD9u66JiyEfWUBLtBlZi/V5cL9E0XAEp
	243tvwEiBQoYjuuL8WNK8PAhQYw59lFLQMsDcCBLFqlA8Klbcv2aHzXbtpZXXhJ+SqGEfBYeyPV
	+SIrn7JjlYUWETPryWWILvkZj1a5zaUdalZA5ZWuN1hm+1BV5UELbsqOgMSmjZmpF1/UJ/6iw1E
	eZ1GUvCYm7xBISfMJyg9IPWfYgvQe1wrLOqtf7OxxIQn2/a95oyR1rs73rCdSY06X/Jk6+tMqkg
	vg22WX3h+eBviQF7SZegm9BzgFnH4u/cG0y2aTPTHyAdu+3aXlp+ALPWuh/bhwIUP4VU5PZ2dOB
	FtkhdVZEBPtHAz4cLW++8efVIlDU7dr890M6acjy8YhEZTINmAVYdXzxkRoK0n4No9wO0crxoSk
	YOMQUMI4mQkVsolNEgg+oW405DnjkE33gAURZTif08LmgTUS69oSflNMYrJgQLZ5lXLmgi6dztr
	aYoJ4kKI6UyOMV71f0MpXNik48KJqyBEjscCGMSfOYmO5EhCW2nTI8zOocGE7rWNUNF+wsgeDSR
	peBSSsMpzNlekQhh+PyqTB5kS/luAqx7XNLZoXXgyEjBtEhwpalf7Ld2NCdbOKucYg6f8r64NIh
	dX5B+JEXc1kXNI7Odt4RnDAy9uW0YqqHZ4SQ1n53fTANS33SddPcFFY23KkoK3Y3ImfNkwtvXoA
	TZwpqRN7oK9bvbCZ4yhUJOGkWCqSmzIIR3wN3gr7Apju03eSWopeH9eZ1EYpV936Rsw8u3bsmR7
	t6cRK37FHGQBJZSKbAYrl6dLsnG7jbHJtvMCzt5JhVpEDBUFDjr9diVPTx3t2yzZZuyReeeBUzJ
	Hnzyh0GW0G303FbkGN8Y5qq+ag==
X-Received: by 2002:a05:693c:4146:20b0:36f:551:2bd5 with SMTP id 5a478bee46e88-379e16d093cmr10662990eec.32.1794851680260;
        Mon, 16 Nov 2026 09:54:40 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:54:39 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 025/105] python3-dominate: upgrade 2.9.1 -> 3.1.0
Date: Mon, 16 Nov 2026 09:52:37 -0800
Message-ID: <20261116175359.342679-25-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:54:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132481
Content-Type: text/plain; charset="utf-8"

Drop the backported patch, it is part of this release. The sdist doesn't
ship the dominate.community package, so drop its tests from the ptest.

Changes:
- 3.0 series: requires Python 3.10+ (3.9 dropped), adds Python 3.14;
  asyncio code uses get_running_loop() instead of get_event_loop().
- Async DOM contexts copied per task are now kept separate.
- Fixes: unescape() on out-of-range numeric entities, preserve numeric
  zero attribute values, inline link whitespace, lazy node rendering,
  child node deletion by index.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...d7fdb171f80ed6ce97e6ca4409723975c47f.patch | 40 -------------------
 ...ate_2.9.1.bb => python3-dominate_3.1.0.bb} |  9 +++--
 2 files changed, 5 insertions(+), 44 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
 rename meta-python/recipes-devtools/python/{python3-dominate_2.9.1.bb => python3-dominate_3.1.0.bb} (60%)

diff --git a/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch b/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
deleted file mode 100644
index e3d0d485ee..0000000000
--- a/meta-python/recipes-devtools/python/python3-dominate/58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 58f7d7fdb171f80ed6ce97e6ca4409723975c47f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C5=82=20G=C3=B3rny?= <mgorny@gentoo.org>
-Date: Sat, 3 Aug 2024 16:07:38 +0200
-Subject: [PATCH] Update tests for docstring dedenting in Python 3.13
-
-Update the `get_expected()` function to account for the fact that
-Python 3.13 automatically dedents all the docstrings, and therefore
-does not require explicitly removing the indent (which effectively
-removes too much indent).
-
-Fixes #199
-
-Upstream-Status: Submitted [https://github.com/Knio/dominate/pull/202]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tests/test_svg.py | 7 ++++++-
- 1 file changed, 6 insertions(+), 1 deletion(-)
-
-diff --git a/tests/test_svg.py b/tests/test_svg.py
-index e5bbec3..ea7d98f 100644
---- a/tests/test_svg.py
-+++ b/tests/test_svg.py
-@@ -1,3 +1,5 @@
-+import sys
-+
- import dominate.svg
- from dominate.tags import *
- from dominate.svg import *
-@@ -14,7 +16,10 @@ def base():
- 
- 
- def get_expected(func):
--  return func.__doc__.replace('\n  ', '\n').strip()
-+  doc = func.__doc__
-+  if sys.version_info < (3, 13):
-+      doc = doc.replace('\n  ', '\n')
-+  return doc.strip()
- 
- 
- def output_test(func):
diff --git a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb b/meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb
similarity index 60%
rename from meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb
index a0dd638087..b05ece3435 100644
--- a/meta-python/recipes-devtools/python/python3-dominate_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dominate_3.1.0.bb
@@ -2,13 +2,14 @@ SUMMARY = "Dominate is a Python library for creating and manipulating HTML docum
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
 
-SRC_URI[sha256sum] = "558284687d9b8aae1904e3d6051ad132dd4a8c0cf551b37ea4e7e42a31d19dc4"
+SRC_URI[sha256sum] = "926989c819db2fe91e590590a2902183685edd94829c8cfba5fd71af57c1a982"
 
 inherit pypi ptest-python-pytest python_setuptools_build_meta
 
-SRC_URI += " \
-    file://58f7d7fdb171f80ed6ce97e6ca4409723975c47f.patch \
-"
+# the sdist lacks the dominate.community package these tests import
+do_install_ptest:append() {
+    rm -rf ${D}${PTEST_PATH}/tests/community
+}
 
 RDEPENDS:${PN} += "\
     python3-numbers \
