Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id B9A276B7CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 02:51:26 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id d72so8742552pga.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Dec 2018 18:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xPL8nBpvZPs5xN6xIOxdFH6lnhiUbi6jP7tW4FPYpIg=;
	b=nYxMdrThx4KV7abaEdGkdikMiBB5x04/bMpDcoerOXQ/rIngKu5oaOA1HiO5k6OQaw
	cCmL9V+zgrjPhcxmtKIW1xXNYLw7ZPngWQMaUJFSks09NfJkZX09RYz5gr5E6cluh32O
	/a64/Ppy1mYcj+HTOLPo5/etP5oak+Mdv3UjexfJUsTzXjvCHCzvsqvFuZeq5cLV5pO+
	g2zmeNsDWhakwNJeUMMfMWdLmllLoIN7vpq3sutUbegwVbpMOdEeXniJniDsabySQptk
	2zvHBhJ/8E9TzU/zCe9U1PzqXNS1UQcJoCUtqi6Ie0RQkyoip35PUgtezfXTNmIksOtX
	C7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xPL8nBpvZPs5xN6xIOxdFH6lnhiUbi6jP7tW4FPYpIg=;
	b=k0k5qTdcrdaUzUzvaNDX7plsvs3+x3lG+hWmn05/A/y/du1cBszSLkdkZOf/hB77AO
	Qjda8IdgQn+QlhYCztD8pAcOpGFyRVNaecyqu2tncEec+L1YSO6GK5zAB7MuDU5uyT89
	RLbmNPpsMmuP7QgWMNt4BnwCQzJOeRreC3tZqBd45jg/8wqhBQUgOFRPr6BLcr0BcKjI
	a1gC7EzLdhAMHznl+L00EeN03eQmGtb29r4ETY2M5Q+QiYG3bL7kD+Hp836ZoKl92FvD
	8ZZ9bdoDRzPkyp3pkkfdXTPfVN8nRxbokXB6+/qcIkiobdSf2ItNLjDNZz5rrzf8bGBx
	baiw==
X-Gm-Message-State: AA+aEWaJcdNn1PkPDCZAK3c8aH2NV+Q6ucVcA04PZ8vcySAzhdi1UgBq
	CgJa9aYLM5z4QSYjVROR23T8EFL/FeE=
X-Google-Smtp-Source: AFSGD/Xr3oXm/VJ+qGGvcXmlxBz6P3CJfzGEoBq028sPzBf3LqwhBKWikRwNZ2Vc7KdJPj6AtVhffw==
X-Received: by 2002:a63:c848:: with SMTP id l8mr17885834pgi.78.1545187887374; 
	Tue, 18 Dec 2018 18:51:27 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::19ec])
	by smtp.gmail.com with ESMTPSA id
	m3sm28000563pff.173.2018.12.18.18.51.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 18:51:26 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Dec 2018 18:51:06 -0800
Message-Id: <20181219025109.19159-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20181219025109.19159-1-raj.khem@gmail.com>
References: <20181219025109.19159-1-raj.khem@gmail.com>
MIME-Version: 1.0
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>,
	Miguel Gaio <mgaio35@gmail.com>
Subject: [meta-oe][PATCH 3/6] catch2: Upgrade to 2.5.0 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Dec 2018 02:51:26 -0000
Content-Transfer-Encoding: 8bit

Drop upstreamed patch and add a patch to fix build seen with clang
and gcc9

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-Fix-convert-from-char-on-ARM-build.patch | 46 -------------------
 .../catch2/0001-Remove-redundant-move.patch   | 36 +++++++++++++++
 .../{catch2_2.4.1.bb => catch2_2.5.0.bb}      | 16 ++++---
 3 files changed, 45 insertions(+), 53 deletions(-)
 delete mode 100644 meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
 create mode 100644 meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
 rename meta-oe/recipes-test/catch2/{catch2_2.4.1.bb => catch2_2.5.0.bb} (70%)

diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch b/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
deleted file mode 100644
index 3073775630..0000000000
--- a/meta-oe/recipes-test/catch2/catch2/0001-Fix-convert-from-char-on-ARM-build.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 5729874fa5059c39aa97cfa08fddf107b7a65c9e Mon Sep 17 00:00:00 2001
-From: Miguel Gaio <mgaio35@gmail.com>
-Date: Wed, 3 Oct 2018 10:22:16 +0200
-Subject: [PATCH] Fix convert from char on ARM build
-
-Some platforms set the signedness of char to unsigned (eg. ARM).
-Convert from char should not assume the signedness of char.
-
-Fix build issue with -Werror,-Wtautological-unsigned-zero-compare flags.
-
-Signed-off-by: Miguel Gaio <mgaio35@gmail.com>
-
-Upstream-Status: Accepted [Commit f1faaa9c107113692301ad8bb56084460ef1a2ff]
-
-Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
----
- include/internal/catch_tostring.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/include/internal/catch_tostring.cpp b/include/internal/catch_tostring.cpp
-index 4e0c027d..8cbabbf2 100644
---- a/include/internal/catch_tostring.cpp
-+++ b/include/internal/catch_tostring.cpp
-@@ -205,7 +205,7 @@ std::string StringMaker<bool>::convert(bool b) {
-     return b ? "true" : "false";
- }
- 
--std::string StringMaker<char>::convert(char value) {
-+std::string StringMaker<signed char>::convert(signed char value) {
-     if (value == '\r') {
-         return "'\\r'";
-     } else if (value == '\f') {
-@@ -222,8 +222,8 @@ std::string StringMaker<char>::convert(char value) {
-         return chstr;
-     }
- }
--std::string StringMaker<signed char>::convert(signed char c) {
--    return ::Catch::Detail::stringify(static_cast<char>(c));
-+std::string StringMaker<char>::convert(char c) {
-+    return ::Catch::Detail::stringify(static_cast<signed char>(c));
- }
- std::string StringMaker<unsigned char>::convert(unsigned char c) {
-     return ::Catch::Detail::stringify(static_cast<char>(c));
--- 
-2.19.1
-
diff --git a/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch b/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
new file mode 100644
index 0000000000..c3f5fc9ce7
--- /dev/null
+++ b/meta-oe/recipes-test/catch2/catch2/0001-Remove-redundant-move.patch
@@ -0,0 +1,36 @@
+From b2bd82a0c0d3d5dda588d12cc1672a03a9630784 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 17 Dec 2018 17:27:43 -0800
+Subject: [PATCH] Remove redundant move
+
+fixes errors like below
+
+/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux-musl/catch2/2.5.0-r0/git/include/internal/catch_session.cpp:52:29:
+error: redundant move in return statement [-Werror=redundant-move]
+   52 |             return std::move(multi);
+      |                    ~~~~~~~~~^~~~~~~
+/mnt/a/yoe/build/tmp/work/aarch64-yoe-linux-musl/catch2/2.5.0-r0/git/include/internal/catch_session.cpp:52:29:
+note: remove 'std::move' call
+
+Upstream-Status: Submitted [https://github.com/catchorg/Catch2/pull/1474]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/internal/catch_session.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/internal/catch_session.cpp b/include/internal/catch_session.cpp
+index 0920521c..b66d57ac 100644
+--- a/include/internal/catch_session.cpp
++++ b/include/internal/catch_session.cpp
+@@ -49,7 +49,7 @@ namespace Catch {
+                 multi->addListener(listener->create(Catch::ReporterConfig(config)));
+             }
+             multi->addReporter(createReporter(config->getReporterName(), config));
+-            return std::move(multi);
++            return multi;
+         }
+ 
+ 
+-- 
+2.20.1
+
diff --git a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb b/meta-oe/recipes-test/catch2/catch2_2.5.0.bb
similarity index 70%
rename from meta-oe/recipes-test/catch2/catch2_2.4.1.bb
rename to meta-oe/recipes-test/catch2/catch2_2.5.0.bb
index 0183c2e41a..14a1ebe80d 100644
--- a/meta-oe/recipes-test/catch2/catch2_2.4.1.bb
+++ b/meta-oe/recipes-test/catch2/catch2_2.5.0.bb
@@ -6,19 +6,21 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git \
-           file://0001-Fix-convert-from-char-on-ARM-build.patch"
-SRCREV = "9e1bdca4667295fcb16265eae00efa8423f07007"
+           file://0001-Remove-redundant-move.patch \
+          "
+# v2.5.0
+SRCREV = "6ccd467094973824d89efb16cbc553e279f79823"
 
 S = "${WORKDIR}/git"
 
 inherit cmake python3native
 
+do_install_append() {
+    rm ${D}${datadir}/Catch2/lldbinit
+    rm ${D}${datadir}/Catch2/gdbinit
+    rmdir ${D}${datadir}/Catch2/
+}
 # Header-only library
 RDEPENDS_${PN}-dev = ""
 RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
 
-do_install_append() {
-    rm ${D}/${datadir}/Catch2/lldbinit
-    rm ${D}/${datadir}/Catch2/gdbinit
-    rmdir ${D}/${datadir}/Catch2/
-}
-- 
2.20.1


