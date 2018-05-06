Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 69E6B74D36
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  6 May 2018 06:18:09 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id z129-v6so13903135pgz.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 May 2018 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=HkGAR/Z5NWz/v1B2KieOOPKeHdjw85opTzgTqC0QYZc=;
	b=cINn+Q8/C2EuGNWoAdn8t2feicwLxPztu42C1r3yU7lix/ETV66xdKkH2tUCyqepaM
	Z2Zd0bYNcNfsPJvL1tS37LNFzdw8DFFCUVtN/61i1259EdF+ssWnUkxDuao0z4VcAq32
	JmVdnwEBBc9mwhUoFuTAt/67Zu3EFmWfD8wEnmgeoQ0OXVkwAIjqxVXxPpDSdRSjbA0s
	7gZMMLRxaEz1ANYQ7PfVtq18mT01rW4X1Qvoxm8TIcbOmhGKN2cAebBbkF+oKbc5wfX2
	fPcSqn38oxXNXfG8zyzfMlE5ob4zC7/FnwxB4qnnPkFnn63xt7dgBfFpXjSEKaXmFwy9
	zJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=HkGAR/Z5NWz/v1B2KieOOPKeHdjw85opTzgTqC0QYZc=;
	b=YmxuLp22oUpeARe/jgUwZWzlSCwmg1w75/EWb/av/VjATNzrDGFHnrnyXSqHojyyI/
	qDIyjmpqzTp/kDDHLcxdYevSI1R+TdPJYBaI9AG/cxh6f9HuZgg+2pstalLA4ttnxTk7
	xf90SXHMRHX/JzTn4t/d2wLKjgIWU0IYnp1bL2m7NUzyCX3/fxg1Ypg4P1Kzp6UF+8AF
	+F3xB7rEXEa7LzOVlZi+imhCP3EEgK8JEd9tHrlPjoJsAJSeXKFiEOtsWJt0cRECrh1G
	UOuPGKPdbIF5iIUiG5xUKWslioEYtpWC/eMLt+GzNMFwNqGnRGYttGsDMK6+qGGrpLi9
	CLDw==
X-Gm-Message-State: ALQs6tA7Kso1SIOfqnYJ3vxwLcEAh3q1khlMcZEVekYCBQNTKFukL11M
	oW2nKNghT9HHkJw/jWdf8k8CPg==
X-Google-Smtp-Source: AB8JxZqWXl2IPWA8GNo4c9pU29oVz8M72BbLFqWnImBxcmASvqpnIoVwwSJZRYLsj1Z06sgMhkueVQ==
X-Received: by 2002:a17:902:2ac3:: with SMTP id
	j61-v6mr33074558plb.224.1525587490658; 
	Sat, 05 May 2018 23:18:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	s65sm46674457pfj.124.2018.05.05.23.18.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 23:18:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  5 May 2018 23:17:59 -0700
Message-Id: <20180506061804.19509-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [meta-gnome][PATCH 1/6] evolution-data-server: Update to 3.26.6 and fix build with icu 61
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
X-List-Received-Date: Sun, 06 May 2018 06:18:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nded-way-to-handle-the-icu-namespace.patch | 46 +++++++++++++++++++
 ...6.3.bb => evolution-data-server_3.26.6.bb} | 17 +++----
 2 files changed, 55 insertions(+), 8 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
 rename meta-gnome/recipes-gnome/eds/{evolution-data-server_3.26.3.bb => evolution-data-server_3.26.6.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
new file mode 100644
index 000000000..d3b0ac673
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
@@ -0,0 +1,46 @@
+From 698a0e104dcbe4b630df848fd4af7c59f76cdc37 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 5 May 2018 17:46:52 -0700
+Subject: [PATCH] Use recommended way to handle the icu namespace
+
+Fixes build with icu >= 61
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libedataserver/e-alphabet-index-private.cpp | 2 ++
+ src/libedataserver/e-transliterator-private.cpp | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/src/libedataserver/e-alphabet-index-private.cpp b/src/libedataserver/e-alphabet-index-private.cpp
+index d3e44f4..ddffd99 100644
+--- a/src/libedataserver/e-alphabet-index-private.cpp
++++ b/src/libedataserver/e-alphabet-index-private.cpp
+@@ -33,9 +33,11 @@
+ 
+ /* ICU headers */
+ #include <unicode/alphaindex.h>
++#include <unicode/ustring.h>
+ 
+ using icu::AlphabeticIndex;
+ using icu::Locale;
++using U_ICU_NAMESPACE::UnicodeString;
+ 
+ struct _EAlphabetIndex {
+ 	AlphabeticIndex *priv;
+diff --git a/src/libedataserver/e-transliterator-private.cpp b/src/libedataserver/e-transliterator-private.cpp
+index bb15593..573446f 100644
+--- a/src/libedataserver/e-transliterator-private.cpp
++++ b/src/libedataserver/e-transliterator-private.cpp
+@@ -33,8 +33,10 @@
+ 
+ /* ICU headers */
+ #include <unicode/translit.h>
++#include <unicode/ustring.h>
+ 
+ using icu::Transliterator;
++using U_ICU_NAMESPACE::UnicodeString;
+ 
+ struct _ETransliterator {
+ 	Transliterator *priv;
diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
rename to meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
index 2303b8f18..db5dca95b 100644
--- a/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.3.bb
+++ b/meta-gnome/recipes-gnome/eds/evolution-data-server_3.26.6.bb
@@ -18,14 +18,15 @@ inherit distro_features_check gnomebase cmake gtk-doc gettext gobject-introspect
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += " \
-    file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
-    file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
-    file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
-    file://iconv-detect.h \
-"
-SRC_URI[archive.md5sum] = "568a21a4df4e0ec985c849b38fc66908"
-SRC_URI[archive.sha256sum] = "63b1ae5f76be818862f455bf841b5ebb1ec3e1f4df6d3a16dc2be348b7e0a1c5"
+SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@gnome_verdir("${PV}")}/${GNOMEBN}-${PV}.tar.${GNOME_COMPRESS_TYPE};name=archive \
+           file://0001-CMakeLists.txt-Remove-TRY_RUN-for-iconv.patch \
+           file://0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch \
+           file://0003-contact-Replace-the-Novell-sample-contact-with-somet.patch \
+           file://iconv-detect.h \
+           file://0004-Use-recommended-way-to-handle-the-icu-namespace.patch \
+           "
+SRC_URI[archive.md5sum] = "ae7bbf543b2c3ff79af27e0edea5d472"
+SRC_URI[archive.sha256sum] = "e43aa1847ddc02965f560261ef88d18fb8704eddaa55555bf96b884a33e510ec"
 
 LKSTRFTIME = "HAVE_LKSTRFTIME=ON"
 LKSTRFTIME_libc-musl = "HAVE_LKSTRFTIME=OFF"
-- 
2.17.0


