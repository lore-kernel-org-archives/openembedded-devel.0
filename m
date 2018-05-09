Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E21474A0E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 May 2018 19:00:27 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id c11-v6so4836182plr.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2018 12:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F6j4LXSFZ6FFgCy4qcZRgY3CvObKNv+G+I5JLx4YHng=;
	b=ikvQ9Z2vAe86c6n66yVmw8x08oVq4qmahjLmS1zA5lJBSSYp/iMq42F0UFSqKBozh7
	/DJnccWPBcgxSdgCUv0lW2TqbpNPi5vfEBmsE43m+dZOK7CtZCa/oQjuDr4/tacovo44
	gV+NTXbzmf/65DCJdRrUyGz12bGJAcBf1BZ5Gw8QtqUtqoKrgNMP7rh9k4+/fkwj1QNT
	PQRXNa1faxCJEqfNXpTWMJRN0+W3hI9baBCDSsYAUuZpO8eyVJqPeeW+B3K2B3tYblQ1
	jKqDFgySj8qjlXJmx67IGs078VZ9fJgIOgQyXTp+mBgeZEFUaFurQNOjOxHJ/Is/vJ8X
	olOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F6j4LXSFZ6FFgCy4qcZRgY3CvObKNv+G+I5JLx4YHng=;
	b=UQussjx5d5EOVjjJ97at3NLqDRNLve1RP52YxqVNkt68PB22GacClz2//ZWWkUAZk1
	SETtWSPsUrzX4Y5TcVnWqmAqiYU+QMff8sq4weNhOJZVraInqaIu0O37ITMWMzLtIYwZ
	oxS+ykEBsl2yb2Lr7qPEfVfsiBJwpWMH+x8Krw1YnsZb8v16u8SBQ3y1ViAPAdooiK7T
	eezfWAwC58UaM6LGknY9KjlYz4w4g5SsCgIaAdz0Hp1PHjLFHQKQPk7ubmrhpbkfAMxg
	/l+vf2qHYei4aktHEdB8tXjLlGrCm6hdmVkgCxBxM8VZVoNTsvE7MvXkGN0xgwQ4S+he
	QSSg==
X-Gm-Message-State: ALQs6tBYL4I+P6LaHBlLZZgMiqxEjIENMvhUZIEVcl4XALnRoHki93dJ
	MsH+RUdwyDoE+U0zsJ+csBuTvg==
X-Google-Smtp-Source: AB8JxZprkt4me25J9si0jaisNtezXwynyOFZMhm8m+1UtgcXclVsV+wyt07fzABYxAxDw5mevqm+Wg==
X-Received: by 2002:a17:902:8:: with SMTP id
	8-v6mr45706934pla.287.1525892428667; 
	Wed, 09 May 2018 12:00:28 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	131sm27732437pfa.128.2018.05.09.12.00.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 May 2018 12:00:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 May 2018 12:00:04 -0700
Message-Id: <20180509190011.30006-9-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180509190011.30006-1-raj.khem@gmail.com>
References: <20180509190011.30006-1-raj.khem@gmail.com>
Subject: [meta-gnome][PATCH 09/16] evolution-data-server: Update to 3.26.6 and fix build with icu 61
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
X-List-Received-Date: Wed, 09 May 2018 19:00:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...nded-way-to-handle-the-icu-namespace.patch | 46 +++++++++++++++++++
 ...6.3.bb => evolution-data-server_3.26.6.bb} | 17 +++----
 2 files changed, 55 insertions(+), 8 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
 rename meta-gnome/recipes-gnome/eds/{evolution-data-server_3.26.3.bb => evolution-data-server_3.26.6.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch b/meta-gnome/recipes-gnome/eds/evolution-data-server/0004-Use-recommended-way-to-handle-the-icu-namespace.patch
new file mode 100644
index 0000000000..d3b0ac6735
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
index 2303b8f180..db5dca95b9 100644
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


