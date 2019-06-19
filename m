Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
	[209.85.215.179])
	by mail.openembedded.org (Postfix) with ESMTP id 61AB06D50C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 04:24:00 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id l19so8869348pgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 21:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=63DT37qtIa0UBCl8mHOIYxjCCKRgCHAdFFBX57unxkU=;
	b=jEBHt7f3xgPJEondEs6k/jn09nJ9FoLKL52ymPRtAsm2AhFdabeiy/1C0QrrcxN1JJ
	VPEqaY02KuXV7JC6dpmXb/cosUrlMx3dzFsKjmv/srZ4ULLvuJz24JAPQUe469coVYR0
	cd1ktA1eb5gWdMKjixn0Q5nM8k9HnK+/lN5Wr0XvIotvRl3Ox9+ptaG+JowXm7JIZ5rN
	0NGBRGHB+95rwS2h/ILpEtN8ibrEEsOpZS3AjZYrCZtt96OcTPZb2DpO1xJd8eKkVNzd
	kI5TvazNNzHfwyw1CgfkF5aKjXNJkh+ShaTReWS7nkwmHyqm3zoyKhA1j5lIy8qDFDuS
	bVTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=63DT37qtIa0UBCl8mHOIYxjCCKRgCHAdFFBX57unxkU=;
	b=Vz8wSQElZmHDZD88EAV0QllIniWA/991mvQcMdTlfPP0YvyIna9QvXsKkif1ifgROd
	E5pc7O6BNJBgS9/H8VgnmXScclblrnON0cgPtQpKN3cc0NsfZvytcmEUCYjecRvwDKMm
	XMTvK1cX+1kUET4g5hTrynLMd7BcLWObXSXHHxUfrhH1AIJY0168SW28n+YlB9pfVB6S
	e6psT7EchbzokyqC3FvbeZmukWoiskfxLipKqqcl+Cr8YIfObMQvBS4y3gHwK2cwTrW6
	BmP2qMxmFibML277FBlKQVznxe/Uw8VR3v/bHZTUzhZFby5VOlViLcRYFK0VKn6ZalV1
	5Lbw==
X-Gm-Message-State: APjAAAUFfGW1Cst8sj7SbNNwKNa639Y2+BCHJQUvvgaP1MY+MLfVK/U9
	+rAg0xX7NFtZMETcI1w3O1ABxQuhhuI=
X-Google-Smtp-Source: APXvYqxdl0m76wh/TLOl+9zroaiN5b08/X466i9pKavkFlAdhTvpJ4hn8zIviafmcrQkgamfo1usmA==
X-Received: by 2002:a17:90a:3086:: with SMTP id
	h6mr9211951pjb.14.1560918241001; 
	Tue, 18 Jun 2019 21:24:01 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::32b0])
	by smtp.gmail.com with ESMTPSA id
	r7sm26092845pfl.134.2019.06.18.21.24.00
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Tue, 18 Jun 2019 21:24:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Jun 2019 21:23:51 -0700
Message-Id: <20190619042352.22919-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/2] gmime: Add recipe
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
X-List-Received-Date: Wed, 19 Jun 2019 04:24:00 -0000
Content-Transfer-Encoding: 8bit

gmime is needed for pidgin-sipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pidgin/gmime/iconv-detect.h               |  5 ++++
 .../recipes-support/pidgin/gmime/nodolt.patch | 10 ++++++++
 meta-oe/recipes-support/pidgin/gmime_3.2.3.bb | 23 +++++++++++++++++++
 3 files changed, 38 insertions(+)
 create mode 100644 meta-oe/recipes-support/pidgin/gmime/iconv-detect.h
 create mode 100644 meta-oe/recipes-support/pidgin/gmime/nodolt.patch
 create mode 100644 meta-oe/recipes-support/pidgin/gmime_3.2.3.bb

diff --git a/meta-oe/recipes-support/pidgin/gmime/iconv-detect.h b/meta-oe/recipes-support/pidgin/gmime/iconv-detect.h
new file mode 100644
index 0000000000..714cb5aa9d
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/gmime/iconv-detect.h
@@ -0,0 +1,5 @@
+/* This is an auto-generated header, DO NOT EDIT! */
+
+#define ICONV_ISO_INT_FORMAT "iso-%u-%u"
+#define ICONV_ISO_STR_FORMAT "iso-%u-%s"
+#define ICONV_10646 "iso-10646"
diff --git a/meta-oe/recipes-support/pidgin/gmime/nodolt.patch b/meta-oe/recipes-support/pidgin/gmime/nodolt.patch
new file mode 100644
index 0000000000..1f9bdd3041
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/gmime/nodolt.patch
@@ -0,0 +1,10 @@
+--- a/configure.ac
++++ b/configure.ac
+@@ -150,7 +150,6 @@ AC_EXEEXT
+ AC_PROG_LIBTOOL
+ dnl when using libtool 2.x create libtool early, because it's used in configure
+ m4_ifdef([LT_OUTPUT], [LT_OUTPUT])
+-DOLT
+ 
+ dnl Checks for header files.
+ AC_CHECK_HEADERS(sys/mman.h)
diff --git a/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb b/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
new file mode 100644
index 0000000000..8c6f0b010a
--- /dev/null
+++ b/meta-oe/recipes-support/pidgin/gmime_3.2.3.bb
@@ -0,0 +1,23 @@
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DESCRIPTION = "Runtime libraries for parsing and creating MIME mail"
+SECTION = "libs"
+DEPENDS = "glib-2.0 zlib"
+
+inherit gnome autotools gobject-introspection
+
+SRC_URI += "file://iconv-detect.h \
+            file://nodolt.patch"
+
+SRC_URI[archive.md5sum] = "69ae21a0b1df966a7d39a9431856ac81"
+SRC_URI[archive.sha256sum] = "6a0875eeb552ab447dd54853a68ced62217d863631048737dd97eaa2713e7311"
+
+EXTRA_OECONF_remove = "--disable-schemas-install"
+
+export ac_cv_have_iconv_detect_h="yes"
+do_configure_append = "cp ${WORKDIR}/iconv-detect.h ${S}"
+
+# we do not need GNOME 1 gnome-config support
+do_install_append () {
+    rm -f ${D}${libdir}/gmimeConf.sh
+}
-- 
2.22.0


