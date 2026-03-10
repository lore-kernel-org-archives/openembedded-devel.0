Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28146FD2D76
	for <webhook@archiver.kernel.org>; Tue, 10 Mar 2026 13:03:38 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.39534.1773147808641407825
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 06:03:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bFk09Pm5;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so13203445e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 06:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147807; x=1773752607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=WkD0WXMoWwhp3v6KJfxueQVG/p6LuAjdYERZaHPxet4=;
        b=bFk09Pm5A5+ecyM6mWaZJgis8eyG0zsTLvLBOlSkMpxW/NoHFuCIpwIDaMUxkdGjYE
         /dDV2/trndxkuSBZcP7U4fbgA9wTFizbdrJJwpffCEpgDyVOJe4bZy8ZuizSMULv4cbi
         eVnv3nah0wz+6HiUOKR4IxTZK1nVSVdoMtIUk9svqSllbHC1xFcnTVREjEQp4K07jT3+
         GnBpZ71fwJvG9D/DoiGNql67R5zO2K2zLRBJta+WgawnC02fLfQQ+nSxOZ9nykqZONmW
         S6w0Pdm6PqS5LKw3eT+PW4Gn0Vx6uaJ19O8M/kxaVG4TsEUvOnsBEpsZImQ+2QOswk75
         VLLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147807; x=1773752607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WkD0WXMoWwhp3v6KJfxueQVG/p6LuAjdYERZaHPxet4=;
        b=bnWN9vrYn4qatyyR0u/Eyjj8var4+zeTNjYaLkysfKvVyQFjBs2wvBqapvxTsuYs7U
         4wzqpAEZt3XKiYYHjv+vP0SsBam5Nia0H89LTSOJKIFyryccMMjesOxKbm/gzpot0wv4
         i4tXQWO9qJ7o2wsgMgamPFsufMrEcocOs+u4Wcv29j/DHpdTb4bnEPtAEwNrURq9lphM
         ChZkEUl1pyeleXy/wsvvhK9zK8W77JkR0J5/a5fhZocmujEw6QRBiiUJ8BjS0yrcLXPY
         hSQNDAAGp7Di6rUImdcBk5fplkAkMT24PBZ42BMlOc72PFiVR+USeU0mnKCinh19QhtR
         MrZw==
X-Gm-Message-State: AOJu0YzRJgH3fMd+VIMq3dxG+1HfmAbl62kO+OlHlHXx8X+r9LtwKNCU
	AFAE6xB/LXRTAx7/4b9PuDq/kkeHmNRhE27vjgJtKxQh1nErrs6KWpcsOAIo+A==
X-Gm-Gg: ATEYQzyqndffGEm50gdyuCzC2InpBc0tBvkOLUGFyneClntNp4yjekqVc2Ivh98uZ9S
	4VgYtzc5+qnXH+hPYupYqG2/T63b7BM/KhKda0fd5qzW6SwzhO6X0zO5OEJCdCRmYxdgr4VMJw9
	klqT272duhbnDbzM3+4kZXRorv/n8rjL+Xn3nhCPUoX6RbOOKK/yZ9jc1n2dBtvFEgFtBs4sc7l
	gL9KBhg/udUpmPsAMd3Zr35UMT+1PZd9Tv8stlcK/dRP0V7ciJd9/Ix1l57YU6OYmEdop0BcD64
	HuEb2x7qhitoNLKqsiep7tf29bZOC6+tGU6V9GfTzErjIkCOBO3ySKTbiUazPva4XmNT9xaR0xn
	imBY39I5Qil507XFGGT11bTqhMSakOv942X1QDsLY37q/kJKKmXO85mBL9K0tgwSRgK90djPd5L
	iINFlRbBe7txeWjK53TxQ6
X-Received: by 2002:a05:600c:528c:b0:485:3d3e:1675 with SMTP id 5b1f17b1804b1-4853d3e2074mr82656445e9.8.1773147805821;
        Tue, 10 Mar 2026 06:03:25 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541a7f1f5sm132162445e9.4.2026.03.10.06.03.24
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:03:25 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] php: upgrade 8.2.29 -> 8.2.30
Date: Tue, 10 Mar 2026 14:03:23 +0100
Message-ID: <20260310130323.1321604-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 13:03:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125029

Drop patches that are included in this release.

Changes: https://www.php.net/ChangeLog-8.php#8.2.30
- Curl: Fix curl build and test failures with version 8.16.
- Opcache: Reset global pointers to prevent use-after-free in zend_jit_status().
- PDO: PDO quoting result null deref - CVE-2025-14180
- Null byte termination in dns_get_record()
- Heap buffer overflow in array_merge() - CVE-2025-14178
- Information Leak of Memory in getimagesize - CVE-2025-14177

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../php/php/CVE-2025-14177.patch              | 84 -------------------
 .../php/php/CVE-2025-14178.patch              | 65 --------------
 .../php/php/CVE-2025-14180.patch              | 69 ---------------
 .../php/{php_8.2.29.bb => php_8.2.30.bb}      |  5 +-
 4 files changed, 1 insertion(+), 222 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
 delete mode 100644 meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
 rename meta-oe/recipes-devtools/php/{php_8.2.29.bb => php_8.2.30.bb} (98%)

diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
deleted file mode 100644
index 6b5ffe0029..0000000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2025-14177.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 7aac95c5280ea395ccfcd624cae7e87749ff6eeb Mon Sep 17 00:00:00 2001
-From: Niels Dossche <7771979+ndossche@users.noreply.github.com>
-Date: Tue, 25 Nov 2025 23:11:38 +0100
-Subject: [PATCH] Fix GH-20584: Information Leak of Memory
-
-The string added had uninitialized memory due to
-php_read_stream_all_chunks() not moving the buffer position, resulting
-in the same data always being overwritten instead of new data being
-added to the end of the buffer.
-
-This is backport as there is a security impact as described in
-GHSA-3237-qqm7-mfv7 .
-
-CVE: CVE-2025-14177
-Upstream-Status: Backport [https://github.com/php/php-src/commit/c5f28c7cf0a0]
-
-(cherry picked from commit c5f28c7cf0a052f48e47877c7aa5c5bcc54f1cfc)
-Signed-off-by: Anil Dongare <adongare@cisco.com>
----
- ext/standard/image.c                  |  1 +
- ext/standard/tests/image/gh20584.phpt | 39 +++++++++++++++++++++++++++
- 2 files changed, 40 insertions(+)
- create mode 100644 ext/standard/tests/image/gh20584.phpt
-
-diff --git a/ext/standard/image.c b/ext/standard/image.c
-index 2bd5429efac..15761364c34 100644
---- a/ext/standard/image.c
-+++ b/ext/standard/image.c
-@@ -403,6 +403,7 @@ static size_t php_read_stream_all_chunks(php_stream *stream, char *buffer, size_
- 		if (read_now < stream->chunk_size && read_total != length) {
- 			return 0;
- 		}
-+		buffer += read_now;
- 	} while (read_total < length);
- 
- 	return read_total;
-diff --git a/ext/standard/tests/image/gh20584.phpt b/ext/standard/tests/image/gh20584.phpt
-new file mode 100644
-index 00000000000..d117f218202
---- /dev/null
-+++ b/ext/standard/tests/image/gh20584.phpt
-@@ -0,0 +1,39 @@
-+--TEST--
-+GH-20584 (Information Leak of Memory)
-+--CREDITS--
-+Nikita Sveshnikov (Positive Technologies)
-+--FILE--
-+<?php
-+// Minimal PoC: corruption/uninitialized memory leak when reading APP1 via php://filter
-+$file = __DIR__ . '/gh20584.jpg';
-+
-+// Make APP1 large enough so it is read in multiple chunks
-+$chunk = 8192;
-+$tail = 123;
-+$payload = str_repeat('A', $chunk) . str_repeat('B', $chunk) . str_repeat('Z',
-+$tail);
-+$app1Len = 2 + strlen($payload);
-+
-+// Minimal JPEG: SOI + APP1 + SOF0(1x1) + EOI
-+$sof = "\xFF\xC0" . pack('n', 11) . "\x08" . pack('n',1) . pack('n',1) .
-+"\x01\x11\x00";
-+$jpeg = "\xFF\xD8" . "\xFF\xE1" . pack('n', $app1Len) . $payload . $sof .
-+"\xFF\xD9";
-+file_put_contents($file, $jpeg);
-+
-+// Read through a filter to enforce multiple reads
-+$src = 'php://filter/read=string.rot13|string.rot13/resource=' . $file;
-+$info = null;
-+@getimagesize($src, $info);
-+$exp = $payload;
-+$ret = $info['APP1'];
-+
-+var_dump($ret === $exp);
-+
-+?>
-+--CLEAN--
-+<?php
-+@unlink(__DIR__ . '/gh20584.jpg');
-+?>
-+--EXPECT--
-+bool(true)
--- 
-2.43.5
-
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
deleted file mode 100644
index 46fa8679e8..0000000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2025-14178.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From a46c3692d37f8c539b3b00ea4ab7ebc2d7db5507 Mon Sep 17 00:00:00 2001
-From: Niels Dossche <7771979+ndossche@users.noreply.github.com>
-Date: Sun, 9 Nov 2025 13:23:11 +0100
-Subject: [PATCH] Fix GHSA-h96m-rvf9-jgm2
-
-CVE: CVE-2025-14178
-Upstream-Status: Backport [https://github.com/php/php-src/commit/c4268c15e361]
-
-(cherry picked from commit c4268c15e361ccd79289a3909f332ab2153f72e7)
-Signed-off-by: Anil Dongare <adongare@cisco.com>
----
- ext/standard/array.c                             |  7 ++++++-
- .../tests/array/GHSA-h96m-rvf9-jgm2.phpt         | 16 ++++++++++++++++
- 2 files changed, 22 insertions(+), 1 deletion(-)
- create mode 100644 ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt
-
-diff --git a/ext/standard/array.c b/ext/standard/array.c
-index a1a92934084..30b9a425b20 100644
---- a/ext/standard/array.c
-+++ b/ext/standard/array.c
-@@ -3903,7 +3903,7 @@ static zend_always_inline void php_array_merge_wrapper(INTERNAL_FUNCTION_PARAMET
-	int argc, i;
-	zval *src_entry;
-	HashTable *src, *dest;
--	uint32_t count = 0;
-+	uint64_t count = 0;
-
-	ZEND_PARSE_PARAMETERS_START(0, -1)
-		Z_PARAM_VARIADIC('+', args, argc)
-@@ -3923,6 +3923,11 @@ static zend_always_inline void php_array_merge_wrapper(INTERNAL_FUNCTION_PARAMET
-		count += zend_hash_num_elements(Z_ARRVAL_P(arg));
-	}
-
-+	if (UNEXPECTED(count >= HT_MAX_SIZE)) {
-+		zend_throw_error(NULL, "The total number of elements must be lower than %u", HT_MAX_SIZE);
-+		RETURN_THROWS();
-+	}
-+
-	if (argc == 2) {
-		zval *ret = NULL;
-
-diff --git a/ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt b/ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt
-new file mode 100644
-index 00000000000..2e3e85357e1
---- /dev/null
-+++ b/ext/standard/tests/array/GHSA-h96m-rvf9-jgm2.phpt
-@@ -0,0 +1,16 @@
-+--TEST--
-+GHSA-h96m-rvf9-jgm2
-+--FILE--
-+<?php
-+
-+$power = 20; // Chosen to be well within a memory_limit
-+$arr = range(0, 2**$power);
-+try {
-+    array_merge(...array_fill(0, 2**(32-$power), $arr));
-+} catch (Error $e) {
-+    echo $e->getMessage(), "\n";
-+}
-+
-+?>
-+--EXPECTF--
-+The total number of elements must be lower than %d
---
-2.43.7
diff --git a/meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch b/meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
deleted file mode 100644
index 110ba99b15..0000000000
--- a/meta-oe/recipes-devtools/php/php/CVE-2025-14180.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 86f18141dd016a7927083cc122c71f1a8877b414 Mon Sep 17 00:00:00 2001
-From: Jakub Zelenka <bukka@php.net>
-Date: Sat, 11 Oct 2025 19:37:26 +0200
-Subject: [PATCH] Fix GHSA-8xr5-qppj-gvwj: PDO quoting result null deref
-
-CVE: CVE-2025-14180
-Upstream-Status: Backport [https://github.com/php/php-src/commit/5797b94652c3]
-
-(cherry picked from commit 5797b94652c366521bff55f8e1a26ed6188f31b8)
-Signed-off-by: Anil Dongare <adongare@cisco.com>
----
- ext/pdo/pdo_sql_parser.re                    |  6 +++++
- ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt | 28 ++++++++++++++++++++
- 2 files changed, 34 insertions(+)
- create mode 100644 ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt
-
-diff --git a/ext/pdo/pdo_sql_parser.re b/ext/pdo/pdo_sql_parser.re
-index 6bb0837fb31..7f4721d12a6 100644
---- a/ext/pdo/pdo_sql_parser.re
-+++ b/ext/pdo/pdo_sql_parser.re
-@@ -287,6 +287,12 @@ safe:
-							}
-
-							plc->quoted = stmt->dbh->methods->quoter(stmt->dbh, buf, param_type);
-+							if (plc->quoted == NULL) {
-+								/* bork */
-+								ret = -1;
-+								strncpy(stmt->error_code, stmt->dbh->error_code, 6);
-+								goto clean_up;
-+							}
-						}
-					}
-
-diff --git a/ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt b/ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt
-new file mode 100644
-index 00000000000..736354cab13
---- /dev/null
-+++ b/ext/pdo_pgsql/tests/ghsa-8xr5-qppj-gvwj.phpt
-@@ -0,0 +1,28 @@
-+--TEST--
-+#GHSA-8xr5-qppj-gvwj: NULL Pointer Derefernce for failed user input quoting
-+--EXTENSIONS--
-+pdo
-+pdo_pgsql
-+--SKIPIF--
-+<?php
-+require_once dirname(__FILE__) . '/../../../ext/pdo/tests/pdo_test.inc';
-+require_once dirname(__FILE__) . '/config.inc';
-+PDOTest::skip();
-+?>
-+--FILE--
-+<?php
-+require_once dirname(__FILE__) . '/../../../ext/pdo/tests/pdo_test.inc';
-+require_once dirname(__FILE__) . '/config.inc';
-+$db = PDOTest::test_factory(dirname(__FILE__) . '/common.phpt');
-+$db->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
-+$db->setAttribute(PDO::ATTR_EMULATE_PREPARES, true);
-+
-+$sql = "SELECT * FROM users where username = :username";
-+$stmt = $db->prepare($sql);
-+
-+$p1 = "alice\x99";
-+var_dump($stmt->execute(['username' => $p1]));
-+
-+?>
-+--EXPECT--
-+bool(false)
---
-2.43.7
diff --git a/meta-oe/recipes-devtools/php/php_8.2.29.bb b/meta-oe/recipes-devtools/php/php_8.2.30.bb
similarity index 98%
rename from meta-oe/recipes-devtools/php/php_8.2.29.bb
rename to meta-oe/recipes-devtools/php/php_8.2.30.bb
index 08e7e80c84..13403855d7 100644
--- a/meta-oe/recipes-devtools/php/php_8.2.29.bb
+++ b/meta-oe/recipes-devtools/php/php_8.2.30.bb
@@ -20,9 +20,6 @@ SRC_URI = "http://php.net/distributions/php-${PV}.tar.bz2 \
            file://0009-php-don-t-use-broken-wrapper-for-mkdir.patch \
            file://0010-iconv-fix-detection.patch \
            file://0001-Change-whether-to-inline-XXH3_hashLong_withSecret-to.patch \
-           file://CVE-2025-14177.patch \
-           file://CVE-2025-14178.patch \
-           file://CVE-2025-14180.patch \
           "
 
 SRC_URI:append:class-target = " \
@@ -37,7 +34,7 @@ SRC_URI:append:class-target = " \
           "
 
 S = "${WORKDIR}/php-${PV}"
-SRC_URI[sha256sum] = "51979e8d198cbade2aad4ffe9f53dd3f04f9602d3089e5979985e058ade4267c"
+SRC_URI[sha256sum] = "104820b6c8fc959dde4b3342135f42bdabf246e86918a16381a17d8447c866fa"
 
 CVE_STATUS_GROUPS += "CVE_STATUS_PHP"
 CVE_STATUS_PHP[status] = "fixed-version: The name of this product is exactly the same as github.com/emlog/emlog. CVE can be safely ignored."

