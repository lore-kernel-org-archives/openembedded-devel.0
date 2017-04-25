Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7622F77A50
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:47:39 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id z67so20166438itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Iki3NCO4/nI5cRyNJV1Xjc+wvL71hh5QKfuS38xbPGY=;
	b=UhG+qNrD6r5372SSQ4pRl5UDp5gwcA42VpdmuIWbcJTVkQW+UounSolEkikiistaGw
	glxuz5OMQMlgZhN+l4YkDULdjKgs3zn80C4ShnPFb1VYii22qCXXkRmVAiuGBhRaMABD
	3HAzQm1jDl1rCLYqtZre8+IzmIaaobosKkkkN97nWpZaW40bDitQnJ1b1ksY1mD748NF
	9/QI3gc41XLiHV2WrfR5EE3os6Tt5ruNFNgPH+K6VBpS6p6tqA8DH4lNuwhUZHZQFT0G
	YfsjAIm4CKPzfD3Rz1kAMf9wlmTMiiJZyg3mN2PF/mRdq/tjTjE0stX2C+kirP+SYay6
	+Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Iki3NCO4/nI5cRyNJV1Xjc+wvL71hh5QKfuS38xbPGY=;
	b=PsWWh+b1KDBL2V5ewwrSK6FS58op3KvbXoOx6wpTaWo5H7hmxM6sE5Tcu+TtINRAYd
	T95gOUF9ZO5YTQuVnrgkVfgbAVB3UgIGizTWcGmdwPXzn3GmY8JE84hZyV0lMjNlPuSJ
	zCZCzItM6pyRaeSUry73U00iLtGkARuYwhK/Q9aQJPZiz9MbiIVfxNs3HWrovRV2xH31
	JE87Otn/EKi7hlrDkHlIa101Er9KMLzcEKgbhFPc38pUJdfwNLSmBfD8C2F8yfH0QpF5
	TQIh+GJf8dHiRwr7+KI62mzz+ll49wL7Cxn6P2W2EjvEznKlCShEKlvF9d7p6cKIQnpO
	yH/w==
X-Gm-Message-State: AN3rC/59FUwxscx/9rvJiDAvrC+d1UkSuB/R6eBZajt94VEK4bvd3VHP
	2CCWyIEKO20Bvkzi
X-Received: by 10.36.246.72 with SMTP id u69mr17753963ith.79.1493092060229;
	Mon, 24 Apr 2017 20:47:40 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm1244118itm.6.2017.04.24.20.47.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Apr 2017 20:47:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Apr 2017 20:47:13 -0700
Message-Id: <20170425034719.8630-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170425034719.8630-1-raj.khem@gmail.com>
References: <20170425034719.8630-1-raj.khem@gmail.com>
Subject: [meta-oe][ 05/11] efivar: Backport patches to remove double const decls
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
X-List-Received-Date: Tue, 25 Apr 2017 03:47:40 -0000

Helps fixing build with gcc 7

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...some-extra-const-that-gcc-complains-about.patch | 44 +++++++++++++++
 ...-version-new-way-symbol-versioning-breaks.patch | 66 ++++++++++++++++++++++
 meta-oe/recipes-extended/efivar/efivar_0.24.bb     |  2 +
 3 files changed, 112 insertions(+)
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch
 create mode 100644 meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch

diff --git a/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch b/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch
new file mode 100644
index 000000000..4ae8cb90f
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0001-Remove-some-extra-const-that-gcc-complains-about.patch
@@ -0,0 +1,44 @@
+From 29a2dea16113b5a8e51de46437c6a9f7426c5867 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 6 Feb 2017 14:28:19 -0500
+Subject: [PATCH 1/2] Remove some extra "const" that gcc complains about.
+
+One of these days I'll get these right.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+---
+ src/include/efivar/efiboot-loadopt.h | 4 ++--
+ src/loadopt.c                        | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/include/efivar/efiboot-loadopt.h b/src/include/efivar/efiboot-loadopt.h
+index 07db5c4..efc29c6 100644
+--- a/src/include/efivar/efiboot-loadopt.h
++++ b/src/include/efivar/efiboot-loadopt.h
+@@ -32,8 +32,8 @@ extern ssize_t efi_loadopt_create(uint8_t *buf, ssize_t size,
+ 
+ extern efidp efi_loadopt_path(efi_load_option *opt, ssize_t limit)
+ 	__attribute__((__nonnull__ (1)));
+-extern const unsigned char const * efi_loadopt_desc(efi_load_option *opt,
+-						    ssize_t limit)
++extern const unsigned char * efi_loadopt_desc(efi_load_option *opt,
++					      ssize_t limit)
+ 	__attribute__((__visibility__ ("default")))
+ 	__attribute__((__nonnull__ (1)));
+ extern uint32_t efi_loadopt_attrs(efi_load_option *opt)
+diff --git a/src/loadopt.c b/src/loadopt.c
+index 64e333f..ec50722 100644
+--- a/src/loadopt.c
++++ b/src/loadopt.c
+@@ -336,7 +336,7 @@ teardown(void)
+ 
+ __attribute__((__nonnull__ (1)))
+ __attribute__((__visibility__ ("default")))
+-const unsigned char const *
++const unsigned char *
+ efi_loadopt_desc(efi_load_option *opt, ssize_t limit)
+ {
+ 	if (last_desc) {
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch b/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch
new file mode 100644
index 000000000..737b78b01
--- /dev/null
+++ b/meta-oe/recipes-extended/efivar/efivar/0002-New-gcc-version-new-way-symbol-versioning-breaks.patch
@@ -0,0 +1,66 @@
+From 31e655d2b5f66e772d9714422b7332bbaa60d2e6 Mon Sep 17 00:00:00 2001
+From: Peter Jones <pjones@redhat.com>
+Date: Mon, 6 Feb 2017 14:41:58 -0500
+Subject: [PATCH 2/2] New gcc version, new way symbol versioning breaks.
+
+Apparently I get to redo this every time there's a compiler release.
+Yaaaaaay.
+
+Anyway, the current method is to define the two compat things from the
+land before time as @libefivar.so.0 symbols and list them there in the
+link map.  Then we have the real one defined with another name, and set
+as efi_set_variable@@LIBEFIVAR_0.24.  Then to make there actually be a
+efi_set_variable symbol to link against, we create it as a weak alias.
+
+This is all completely absurd.
+
+Signed-off-by: Peter Jones <pjones@redhat.com>
+---
+ src/lib.c | 17 ++++++++++++-----
+ 1 file changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/src/lib.c b/src/lib.c
+index 6a9b392..afa7d94 100644
+--- a/src/lib.c
++++ b/src/lib.c
+@@ -49,7 +49,7 @@ _efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
+ {
+ 	return ops->set_variable(guid, name, data, data_size, attributes, 0600);
+ }
+-__asm__(".symver _efi_set_variable,_efi_set_variable@");
++__asm__(".symver _efi_set_variable,_efi_set_variable@libefivar.so.0");
+ 
+ int
+ __attribute__((__nonnull__ (2, 3)))
+@@ -59,17 +59,24 @@ _efi_set_variable_variadic(efi_guid_t guid, const char *name, uint8_t *data,
+ {
+ 	return ops->set_variable(guid, name, data, data_size, attributes, 0600);
+ }
+-__asm__(".symver _efi_set_variable_variadic,efi_set_variable@");
++__asm__(".symver _efi_set_variable_variadic,efi_set_variable@libefivar.so.0");
+ 
+ int
+ __attribute__((__nonnull__ (2, 3)))
+ __attribute__((__visibility__ ("default")))
+-efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
+-		 size_t data_size, uint32_t attributes, mode_t mode)
++_efi_set_variable_mode(efi_guid_t guid, const char *name, uint8_t *data,
++		       size_t data_size, uint32_t attributes, mode_t mode)
+ {
+ 	return ops->set_variable(guid, name, data, data_size, attributes, mode);
+ }
+-__asm__(".symver efi_set_variable,efi_set_variable@@LIBEFIVAR_0.24");
++__asm__(".symver _efi_set_variable_mode,efi_set_variable@@LIBEFIVAR_0.24");
++
++int
++__attribute__((__nonnull__ (2, 3)))
++__attribute__((__visibility__ ("default")))
++efi_set_variable(efi_guid_t guid, const char *name, uint8_t *data,
++		 size_t data_size, uint32_t attributes, mode_t mode)
++	__attribute((weak, alias ("_efi_set_variable_mode")));
+ 
+ int
+ __attribute__((__nonnull__ (2, 3)))
+-- 
+2.12.2
+
diff --git a/meta-oe/recipes-extended/efivar/efivar_0.24.bb b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
index 602fd81b4..877ca9045 100644
--- a/meta-oe/recipes-extended/efivar/efivar_0.24.bb
+++ b/meta-oe/recipes-extended/efivar/efivar_0.24.bb
@@ -16,6 +16,8 @@ SRCREV = "963cb2e5adc145fe00717f94e382f2973f80e753"
 SRC_URI = "git://github.com/rhinstaller/efivar.git \
            file://0002-disable-static-build.patch \
            file://allow-multi-definitions-for-native.patch \
+           file://0001-Remove-some-extra-const-that-gcc-complains-about.patch \
+           file://0002-New-gcc-version-new-way-symbol-versioning-breaks.patch \
 "
 SRC_URI_append_class-target = " file://0001-efivar-fix-for-cross-compile.patch \
                                 file://0003-efivar-fix-for-cross-compile.patch \
-- 
2.12.2


