Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id A66BB77E44
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:09:58 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id e7so55858394pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jul 2017 14:10:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aNX69GBy8MYvbpHpCmt/bhNmn2wfCyfECB2CsruHUk0=;
	b=kw6Ywhj61er0J8zwJ/cFgZMxmxLYoxbWnlfAKbrwdlqdueAcqyFeeG6lqsgwezzISH
	J2Uv2Z1zDhwMj/czNj4PAIj4fv5A0k6nR3cGMa+QKdhjQ2r7fJbq3zyo3PUg1PAGhF3a
	SBvxLmWzXL3k9bZyzWZ2Lmv6RsPyLCqj0xigJaMTQIm2nCTMTKrQemXFVMl1HArQSnrB
	aPv1kh81mCYr8b9j9FywDRhT6PlxOtRqn5TpZTE8jsSAvJB6pLRlKq5QGk4a4qUZMdmv
	hVH7ARqjV7ARiKAMbmsYx5kAhmolfQ4ENbzJuMW7enFa/8WndBNyyitNlLkt1j2tSsEN
	QE5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=aNX69GBy8MYvbpHpCmt/bhNmn2wfCyfECB2CsruHUk0=;
	b=WPbskZoxxTJZ14vkOQUr35m4CEDFVLUxgVyWUW8G29P+6vIwMxoIaQHoqhPa83gIpi
	GZ6uwr0rq1GAhRyAn4+yaRP6/lnkGu0iwBVrnPxE0D/e6s78Js3jzJUKKdsb5QpawxCB
	xYAOzLPtiult01H/DCti4JyroJsq3xIpmvXcnysrODv57MDR5AFrMF/dwK4E6oVbDzyX
	MfAUVHSPEfSAD4+nvHaClzWx16lzost0vMIH3uk2If2OfUsa/p8+tt7m8mZUSlCMT/Dn
	uy2bDcKApa/0sFsnC3v/Q4Y4JKoopwYqqw+NAfqsDJ/EdjV2La9SLglR4plq77PCrC/j
	5wbA==
X-Gm-Message-State: AIVw113JLbKtaWNi5Q6t7oa1ddt9mjwyT/3wkOMFmj6crSeyZ120Uv4G
	TqNn8pEQ4FBoajqU
X-Received: by 10.99.117.68 with SMTP id f4mr16623328pgn.56.1499720999591;
	Mon, 10 Jul 2017 14:09:59 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::7028])
	by smtp.gmail.com with ESMTPSA id
	z82sm29136904pfk.1.2017.07.10.14.09.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Jul 2017 14:09:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jul 2017 14:09:47 -0700
Message-Id: <20170710210947.24353-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170710210947.24353-1-raj.khem@gmail.com>
References: <20170710210947.24353-1-raj.khem@gmail.com>
Subject: [meta-browser][PATCH 3/3] firefox: Fix host library contamination on x86_64
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
X-List-Received-Date: Mon, 10 Jul 2017 21:09:58 -0000

On x86_64 build system starts to poke into build system libraries
and its especially seen with glibc 2.26 since it has deprecated
certain symbols which are not available in libc

e.g.

/usr/lib/libresolv.so.2: undefined reference to `__res_maybe_init@GLIBC_PRIVATE'
collect2: error: ld returned 1 exit status

So its linking to libresolv.so from host system is clear due to this error
because its then using libc.so from cross build which is glibc 2.26
and doesnt have that symbol.

Explicilty specify -lresolv on linker cmdline for components where its
needed.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../firefox/firefox/add-libresolv.patch            | 40 ++++++++++++++++++++++
 recipes-mozilla/firefox/firefox_45.9.0esr.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 recipes-mozilla/firefox/firefox/add-libresolv.patch

diff --git a/recipes-mozilla/firefox/firefox/add-libresolv.patch b/recipes-mozilla/firefox/firefox/add-libresolv.patch
new file mode 100644
index 0000000..4bd0131
--- /dev/null
+++ b/recipes-mozilla/firefox/firefox/add-libresolv.patch
@@ -0,0 +1,40 @@
+Index: firefox-45.9.0esr/webapprt/gtk/moz.build
+===================================================================
+--- firefox-45.9.0esr.orig/webapprt/gtk/moz.build
++++ firefox-45.9.0esr/webapprt/gtk/moz.build
+@@ -24,3 +24,7 @@ DISABLE_STL_WRAPPING = True
+ CXXFLAGS += CONFIG['TK_CFLAGS']
+ 
+ OS_LIBS += CONFIG['TK_LIBS']
++OS_LIBS += [
++    'resolv',
++]
++
+Index: firefox-45.9.0esr/ipc/app/moz.build
+===================================================================
+--- firefox-45.9.0esr.orig/ipc/app/moz.build
++++ firefox-45.9.0esr/ipc/app/moz.build
+@@ -129,6 +129,9 @@ if CONFIG['MOZ_WIDGET_TOOLKIT'] == 'gonk
+         'binder',
+         'utils',
+     ]
++OS_LIBS += [
++    'resolv',
++]
+ 
+ if CONFIG['GNU_CXX']:
+     CXXFLAGS += ['-Wshadow']
+Index: firefox-45.9.0esr/js/xpconnect/shell/moz.build
+===================================================================
+--- firefox-45.9.0esr.orig/js/xpconnect/shell/moz.build
++++ firefox-45.9.0esr/js/xpconnect/shell/moz.build
+@@ -35,6 +35,9 @@ if CONFIG['OS_ARCH'] == 'WINNT':
+ CFLAGS += CONFIG['TK_CFLAGS']
+ CXXFLAGS += CONFIG['TK_CFLAGS']
+ OS_LIBS += CONFIG['TK_LIBS']
++OS_LIBS += [
++    'resolv',
++]
+ 
+ if CONFIG['GNU_CXX']:
+     CXXFLAGS += ['-Wshadow']
diff --git a/recipes-mozilla/firefox/firefox_45.9.0esr.bb b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
index 55b2f3c..3f2fbe0 100644
--- a/recipes-mozilla/firefox/firefox_45.9.0esr.bb
+++ b/recipes-mozilla/firefox/firefox_45.9.0esr.bb
@@ -44,6 +44,7 @@ SRC_URI = "https://archive.mozilla.org/pub/firefox/releases/${PV}/source/firefox
            file://0003-do-not-link-against-crmf-library-it-is-not-there.patch \
            file://gcc7.patch \
            file://remove_AC_PATH_XTRA.patch \
+           file://add-libresolv.patch \
 "
 SRC_URI_append_libc-musl = "\
            file://0001-mallinfo-is-glibc-specific-API.patch \
-- 
2.13.2


