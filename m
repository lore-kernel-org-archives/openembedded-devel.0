Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33676.1794851729824374340
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=M1m1K9L5;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso1141417eec.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851729; x=1795456529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTw9PN1tq6hNXJz9Tt7ZNPolcohcWjUoZjzfRCXs1nk=;
        b=M1m1K9L5yQnNX3H/kv8mSJFQMhb4SwNwYWy0XGnwUlfMVh3UL+GPfq16t3DBiy0wbT
         czuOSj1IICVo3hiEH4400/glFP9b1fDRTcO8wPdAWIf9i6FsZmdVBWsvV1Uz8GApupid
         ajwPDcvLqHhZs5RCD4XZC/LFJPzOVy9K84kHGqTLv+wnm4P4FfvC3/J9jlPBgNqWw0aj
         Ase7mFsEQMmCEU4qNGXDgxVaRXiE0lkf16a45p/A7mIum7OZIvrUFeL1heS0lRRzYcSb
         F+G3kwnHfucCO/+plOWk+KzgOYJLK5M0MltsaHh1jDNr3pxXPX6ehkLlXFyfltpb08GJ
         SSRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851729; x=1795456529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iTw9PN1tq6hNXJz9Tt7ZNPolcohcWjUoZjzfRCXs1nk=;
        b=qfS814GrZFeANdmKT2sMPEdrkzi8Y+sqa78lF5JsNISUJi7mz146C+F6dgc/Yzmybn
         KhjtlRo9wIxpApwPvDNDsFMCOqbjA0Z/5FNX7zUkYzbW8vrfXdkTjKFGb0zrA93qd/Nn
         +zWRRZQDdcBX6gJglHhneLclSaAPEoroZPF7gsIwjomdXiY7+76z0Y0+iHBtIuKbP82r
         XNVYlldChYcEKf4U9KyUk+ldU1qZiUEwnBoQu+F/M5oN0ikAlq2sJoxxl2uqMcvRj/NR
         EwmWUDWe+CXY0GPckdRFy1eMDHuVJnPl4XOUNopv6HVkT0XX5SCSgfzpoIQ1GpWHCFd3
         jymA==
X-Gm-Message-State: APuU4Z+vkV37ouZh8o4vYYK2eQS6z/gmDgwl/qNP23ziLCwrdrVO9IMf
	PXuwHTcaUA7NQBCiaPAi59bYCfvdTkEXjy57mEm2QD6EPW47gofKTh4KhVUi/mSv
X-Gm-Gg: AZFdTZfyouD/AnPBzJzqQXlwcoUVtll88z6r/SmdlO1mA5c81mCAzEcSdD61NsNCZFu
	tnNubzqZGDn9s6Nak26sum1IbkwxshFMzWYQChcf1qsRyVSn3phEIFQ7ym1mb0ni2o265+cNWCI
	JyMzIingJF5UJCKxiMOOvPZr2/wUgWpk3X++fuyNny9fauVk6XLpBZJWhWyjE6yRFHUIAVXbiQ8
	Y9DAzV9q+4N3leED9HNhSUDCFpiyvMRBN5oRsAJ5vnKcA0r+U/eYm5Kh87sHhMdBDcNITJwS30M
	NFWqi4Iql6Tc7/8ZkettyOi4BOIk4vhdh2vsAhHTyry2RTOY5xG1JgkaZBiHwRF2aiRNHjp9qLm
	vP5wUMMbzHLgPmzhciynDLTIKyzZrTjTFx3BiVDE0IXVjFfKlfWYa2QUEgCAQoUrWHOS5tPIB9y
	QXepWWYUZVJF9uitRIYG+1Q/H9tAoxu74IuLp1mScrAH+uYh+7qBqer8I8mWXCL4k2f1TFcD66z
	vnEuFUMvpTZHwu5tvrGKAkK3AdwS+ayz+hp1WuhhauXfA4jVAQ9iUYz1fWdRwj4RJlLzszTHCy1
	GhPZ/fFqVlL0aKcbF49kqzSjWwNyS1d29pqb9xtRLr7FWCzMxrINP4nbCxwuAj75YZcmNuCSxcF
	RSD2yWc4/beDvE8NUlJLyjp2PiKdwxG5CmlTIFwbqI3mBptGgCNJ0fhdNIOFveU0BqvisqDWt4N
	Pw1Rg8VMgScxCYTOnRRE8XZ05LKVsv2CzAUynisxs6PFSLMF1uzXMBSkeoTAJjQZZ4TmMpKpO4m
	y1t/xAkbonkYfElgHP5KHyv7+t6LIOioVta+QVF5VxMDLNIknuhvNY4OKLF8k48IJZSpMtO1BsD
	/fmw4TqU2NN1qL0F1oWIQWug7g==
X-Received: by 2002:a05:7301:5086:b0:36a:5042:85b1 with SMTP id 5a478bee46e88-37963376ef2mr11340227eec.2.1794851729089;
        Mon, 16 Nov 2026 09:55:29 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:28 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 061/105] python3-portalocker: upgrade 3.2.0 -> 4.4.2
Date: Mon, 16 Nov 2026 09:53:13 -0800
Message-ID: <20261116175359.342679-61-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132517
Content-Type: text/plain; charset="utf-8"

Upstream builds with uv_build now; inherit python_uv_build. Add
python3-typing-extensions to the ptest RDEPENDS, ship README.md for
test_readme.py, drop the redis lock tests which now need fakeredis (not
packaged), and deselect test_redislock_stub_import_and_raise_in_process
which reads portalocker/__init__.py from the source tree.

Changes:
- Breaking (4.0.0): Python 3.10 or newer required; build backend
  switched to uv_build (4.4.2 now requires uv_build>=0.11,<1).
- pywin32 is no longer installed by default on Windows; POSIX lock
  exception str() output changed; Lock resolves paths with abspath.
- Added PidFileLock; fixed TemporaryFileLock/PidFileLock unlock-then-
  unlink race that could let two processes hold one lock.
- Large set of RedisLock fixes (loss surfacing, fencing tokens,
  fork safety); stricter typing of Lock file handles (4.3.0).
- 4.4.0: passing a bool as timeout/check_interval is deprecated
  (TypeError in 5.0); 4.4.1: open_atomic anchors relative paths.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../python3-portalocker/python3-portalocker/run-ptest    | 3 ++-
 ...portalocker_3.2.0.bb => python3-portalocker_4.4.2.bb} | 9 +++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)
 rename meta-python/recipes-extended/python3-portalocker/{python3-portalocker_3.2.0.bb => python3-portalocker_4.4.2.bb} (63%)

diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest
index 8d2017d39c..dc3c910109 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker/run-ptest
@@ -1,3 +1,4 @@
 #!/bin/sh
 
-pytest --automake
+# reads portalocker/__init__.py from the source tree, which is not installed
+pytest --automake --deselect portalocker_tests/test_optional_redis.py::test_redislock_stub_import_and_raise_in_process
diff --git a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.2.0.bb b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_4.4.2.bb
similarity index 63%
rename from meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.2.0.bb
rename to meta-python/recipes-extended/python3-portalocker/python3-portalocker_4.4.2.bb
index 1d70b586c7..e528ec1541 100644
--- a/meta-python/recipes-extended/python3-portalocker/python3-portalocker_3.2.0.bb
+++ b/meta-python/recipes-extended/python3-portalocker/python3-portalocker_4.4.2.bb
@@ -4,11 +4,11 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=152634da660a374ca18c0734ed07c63c"
 
-SRC_URI[sha256sum] = "1f3002956a54a8c3730586c5c77bf18fae4149e07eaf1c29fc3faf4d5a3f89ac"
+SRC_URI[sha256sum] = "7ac85bb2aa3c7873bf2ac72586fc6154afa4671ac786994a16617a6b7ccb3e5e"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-inherit pypi python_setuptools_build_meta ptest
+inherit pypi python_uv_build ptest
 
 SRC_URI += " \
 	file://run-ptest \
@@ -18,6 +18,7 @@ RDEPENDS:${PN}-ptest += " \
 	python3-multiprocessing \
 	python3-pytest \
 	python3-redis \
+	python3-typing-extensions \
 	python3-unittest-automake-output \
 	redis \
 "
@@ -26,6 +27,10 @@ do_install_ptest() {
 	install -d ${D}${PTEST_PATH}/portalocker_tests
 	cp -rf ${S}/portalocker_tests/* ${D}${PTEST_PATH}/portalocker_tests/
 	rm -rf ${D}${PTEST_PATH}/portalocker_tests/test_combined.py
+	# the redis lock tests need fakeredis, which isn't packaged
+	rm -f ${D}${PTEST_PATH}/portalocker_tests/test_redis.py ${D}${PTEST_PATH}/portalocker_tests/test_redis_random_sleep.py
+	# test_readme.py runs the examples from README.md
+	install -m 0644 ${S}/README.md ${D}${PTEST_PATH}/
 }
 
 RDEPENDS:${PN} += " \
