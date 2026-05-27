Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C83ACD5BD5
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:49:12 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16798.1779875351081733672
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:49:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bOw5zVJA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875351; x=1811411351;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UN3tlrgUGpYk4U6zScBlA+RsiVwY1p1iR86+Zz17rQw=;
  b=bOw5zVJAR4cVjtH8mvvmPcN+IEabQLr9a0eLpGTgmYVglPqFxTH+jdw+
   8RxO5jGbrS5vQsxKBeubc6x3s3+yHvVFB/reaFKyQ4nRC/qa3BS/peIhZ
   m+jQS15p5xOCZXtqZOoKx5MvJ28fddu1sWRHal6xNZFH9DQPF3uZfEyxu
   LT2zvTjWXEs/lvrnBsfIEe8Hu5EVJW6hSgTlAN8+wR0c2mZ6pZHSOl7IC
   MpS6TCMg1N/n1LG4wOymI7m7+zilncEeV2alvfMNHSk09zZhxCjz0e9In
   GDrkCRrMOxc+H4kWwhD68rfRPjBiTytPKZaocvqUKFf9m+87kGJanku9h
   w==;
X-CSE-ConnectionGUID: h/p7FB5TTQKS4O981uOw4g==
X-CSE-MsgGUID: CnAk316tSISj+L8kirPJvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="228171202"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="228171202"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:49:09 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 8DD931C1C717
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:09 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 45192C252F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:09 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 48B9682A2C9;
	Wed, 27 May 2026 09:49:07 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/56] python3-m2crypto: upgrade 0.47.0 -> 0.48.0
Date: Wed, 27 May 2026 17:47:40 +0800
Message-ID: <20260527094805.2039-31-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:49:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127238

From: Wang Mingyu <wangmy@fujitsu.com>

0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch
removed since it's included in 0.48.0

Changelog:
=============
- doc: another move this time to Codeberg (and communication to
  Matrix)
- test(smime): parametrize test_write_pkcs7_der
- test(smime): fix test_signEncryptDecryptVerify
- fix(util): return bytes from passphrase callbacks
- fix(SSL.Checker): add IDN Chinese name
- test(ssl): add IDN certificate fixture coverage
- test(ssl): cover IDN hostname matching in Checker
- doc: update expected Name format in migration guide
- fix(smime): S/MIME signature verification for Outlook and Thunderbird
- fix(provider): handle OSSL_STORE_INFO_PUBKEY compat. for OpenSSL < 3.2
- fix: cast X509_dup in sk_X509_deep_copy to avoid type mismatch
- fix(smime): S/MIME signature verification for Outlook and Thunderbird
- fix(smime): remove obsolete Python pre-3.6 constructs
- ci: run on Codeberg with forgejo_runner
- doc: clarify the status of the project
- fix(provider): adjust the CI run on Gitea for the older OpenSSL on
  Debian
- fix(evp): narrow digest and BIO pointers for mypy
- fix(init): acommodate modern packaging API
- doc: IRC channel is on Libera, Ergo was a wrong idea
- fix(tests): remove duplicate definition of IS_DEBIAN in test_ssl
- fix(test_bio_ssl): fix TLS 1.3 deadlock and add socket timeouts
- fix(test_bio_ssl): replace sys.exit() with self.fail() to prevent test
  process crash
- ci: publish to PyPI with Sigstore attestations via Trusted Publishing
- fix(authcookie): handle CookieError from Python 3.13.12+
  (CVE-2026-0672)
- ci(leap): use setup.py bdist_wheel to bypass old pip PEP 517 wrapper
- fix(util): replace is_32bit with struct.calcsize and update tests
- ci: add FreeBSD SourceHut CI build script
- fix(swig): avoid clang GNUC pragma block before _lib.h
- fix(provider): don't abuse TemporaryDirectory to be mkdtemp, use that
  directly.
- fix(provider): gate provider APIs for OpenSSL 1.1.1
- feat(provider): add key generation and destruction methods
- docs(provider): add comprehensive documentation to Provider module
- fix(provider): better exception handling
- doc: add a simple AGENTS.md
- feat(engine): add availability check, lifecycle helpers, and safer
  cleanup
- doc(engine): Improve documentation and example of using Engine module

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...lang-GNUC-pragma-block-before-_lib.h.patch | 49 -------------------
 ...o_0.47.0.bb => python3-m2crypto_0.48.0.bb} |  5 +-
 2 files changed, 2 insertions(+), 52 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch
 rename meta-python/recipes-devtools/python/{python3-m2crypto_0.47.0.bb => python3-m2crypto_0.48.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch b/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch
deleted file mode 100644
index 7aa768f44d..0000000000
--- a/meta-python/recipes-devtools/python/python3-m2crypto/0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From df210da932c2cab9d3a80ee88c70611d77824a15 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Wed, 18 Mar 2026 02:26:56 +0000
-Subject: [PATCH] fix(swig): avoid clang GNUC pragma block before _lib.h
-
-Clang defines __GNUC__, so the old guard emitted PRAGMA_* tokens before
-they were defined, breaking builds on macOS/clang; move the block after
-<_lib.h> and exclude clang while keeping the GCC<5 workaround.
-
-Fixes: https://todo.sr.ht/~mcepl/m2crypto/392
-
-Upstream-Status: Backport [git.sr.ht/~mcepl/m2crypto/commit/504ca8f438afb0f5041d2b5163e5f666a9a1b742.patch]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- src/SWIG/_m2crypto.i | 13 ++++++++-----
- 1 file changed, 8 insertions(+), 5 deletions(-)
-
-diff --git a/src/SWIG/_m2crypto.i b/src/SWIG/_m2crypto.i
-index d89d355..5426446 100644
---- a/src/SWIG/_m2crypto.i
-+++ b/src/SWIG/_m2crypto.i
-@@ -43,15 +43,18 @@ typedef unsigned __int64 uint64_t;
- %}
- 
- %{
--#if defined __GNUC__ && __GNUC__ < 5
--PRAGMA_IGNORE_UNUSED_LABEL
--PRAGMA_WARN_STRICT_PROTOTYPES
--#endif
--
- #include <openssl/err.h>
- #include <openssl/rand.h>
- #include <_lib.h>
- 
-+/* _lib.h defines PRAGMA_* helpers; only needed for old GCC (clang defines
-+ * __GNUC__ too, but doesn't need this workaround).
-+ */
-+#if defined(__GNUC__) && !defined(__clang__) && (__GNUC__ < 5)
-+PRAGMA_IGNORE_UNUSED_LABEL
-+PRAGMA_WARN_STRICT_PROTOTYPES
-+#endif
-+
- #include "compile.h"
- 
- static PyObject *ssl_verify_cb_func;
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb b/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
rename to meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
index 0ebe30f81c..a94c3f8d33 100644
--- a/meta-python/recipes-devtools/python/python3-m2crypto_0.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-m2crypto_0.48.0.bb
@@ -4,10 +4,9 @@ HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSES/BSD-2-Clause.txt;md5=8099b0e569f862ece05740aef06c82a2"
 
-SRC_URI[sha256sum] = "9256300be1e0412be802aa1f827e0ce7f94deb1099b8ccdcfd9867a7f0f975bf"
+SRC_URI[sha256sum] = "178e290f558ddf0379aaefd34c0a8ddb21f21502594e588f928dda85f1ad202b"
 
-SRC_URI += "file://0001-setup.py-Make-the-cmd-available.patch \
-            file://0001-fix-swig-avoid-clang-GNUC-pragma-block-before-_lib.h.patch"
+SRC_URI += "file://0001-setup.py-Make-the-cmd-available.patch"
 
 CVE_STATUS[CVE-2009-0127] = "disputed: upstream claims there is no bug"
 CVE_STATUS[CVE-2020-25657] = "fixed-version: the used version (0.46.2) contains the fix already"
-- 
2.43.0


