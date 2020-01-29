Return-Path: <raj.khem@gmail.com>
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id 115ED600A3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:23:35 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t17so2831250ilm.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1w6p78tHo7Kh3caz3Icq2yO0Z/qIwsigoE7kEguI5jI=;
	b=q8/VX5+m8IIAqWvYdYxTs4k8bOSajK0j8DgbdRZhinGyY6Xtip49ujLmsagANhvgtu
	1yBAl0a6+EJ+Lw6S9VHWLy665NCP0/EXkz3nCrEQYQYPF73TTOTARDRuzlIoVbVPtsBx
	SZNIbmzuLNoXfuuhDRNEdZRTQVrReTG72/e7K1mAhGZXTR4xrJ9cevai4EdEH5Vpijvb
	zRWwXjQ5emoX0NFZzBV1P/racWZiJEikH6pnrN01Z7HOqXMpifh/UhL38xjJKIpvVAUy
	C8Sb4DPtFlFqVfCshDSDZFzPWUXIp7Tl76WPXo0ss++u0NQ5tACchX7iBzQ0g92/ARun
	N9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=1w6p78tHo7Kh3caz3Icq2yO0Z/qIwsigoE7kEguI5jI=;
	b=qak1l2MCiDpokOzftXJ8NUncdsnov1mz3c8uyxry6w57feCetVowhi+BclAYzTbyn5
	Y//YKg568fxem3ncyQZq33TdbIwpHaJ7fPNfvBSA23AUbzxOrMFt0sS8Ji979o76KLpN
	miO+rnfjC1qO6cR9PKw3enU3eF5jXdN8yh9rbuVMvsNczEm10ISqcPDQHLZsOwE4U3Si
	hbbleoUvybH5MtID5hXJOeYLzETDL0EalpRe0vbNxpKpxlleKHX4ekEbdsfMX98Da3x9
	Sx9hJNvCFYPzXs8+dLoU0O3iZ2l8eV7T+oJdxDO80nQ72+WWSAn4JtYLoaoc66yyXtSF
	ntvg==
X-Gm-Message-State: APjAAAXKS0ETcV/+S/DE81bZtrM1DOaRwwzsP0B0thHjNyN5mCyMwVAp
	r6mkmybDIOV1UFKFv4GcUdhm/wWBUZQ=
X-Google-Smtp-Source: APXvYqxgOctAEMzHfPFhk7Bx8lqPcwo18hljE6S5QQTjTtc+pbqOOdgWtRQBq66Gp8woQa8nV/Wbbg==
X-Received: by 2002:a63:d441:: with SMTP id i1mr11749705pgj.426.1580281983028; 
	Tue, 28 Jan 2020 23:13:03 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::c362])
	by smtp.gmail.com with ESMTPSA id
	g9sm1305019pfm.150.2020.01.28.23.13.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 28 Jan 2020 23:13:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Jan 2020 23:13:03 -0800
Message-Id: <20200129071303.3328743-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129071303.3328743-1-raj.khem@gmail.com>
References: <20200129071303.3328743-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 3/3] indent: Do not build docs
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
X-List-Received-Date: Thu, 30 Jan 2020 12:28:33 -0000
Content-Transfer-Encoding: 8bit

It fails to build currently, with texinfo-dummy

|   File "/mnt/a/tmp-yoe/work/riscv64-yoe-linux-musl/indent/2.2.12-r0/recipe-sysroot-native/usr/bin/makeinfo", line 100, in <module>
|     stub_msg                                                                  | AssertionError: Don't know how to get default output file name from input file
!
| This stand-in version of makeinfo is not yet fully capable of emulating
| the real version from the GNU texinfo suite. If you see this message, file a
| bug report with details on the recipe that failed.
|                                                                               | make[2]: *** [Makefile:814: indent.html] Error 1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Fix-builds-with-recent-gettext.patch      | 14 +++++++++++---
 meta-oe/recipes-extended/indent/indent_2.2.12.bb   |  4 +++-
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch b/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
index e48dfb33c0..e9dadace02 100644
--- a/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
+++ b/meta-oe/recipes-extended/indent/indent/0001-Fix-builds-with-recent-gettext.patch
@@ -9,8 +9,6 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  Makefile.am | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index 548fea7..cf01c5e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -1,7 +1,7 @@
@@ -18,7 +16,17 @@ index 548fea7..cf01c5e 100644
  AUTOMAKE_OPTIONS = no-texinfo.tex
  
 -SUBDIRS = intl src doc po man
-+SUBDIRS = src doc po man
++SUBDIRS = src po man
  
  BUILT_SOURCES = 
  
+--- a/configure.ac
++++ b/configure.ac
+@@ -58,7 +58,6 @@ fi
+ AC_HEADER_DIRENT
+ 
+ AC_OUTPUT([ 
+-   intl/Makefile
+    po/Makefile.in
+    Makefile
+    src/Makefile
diff --git a/meta-oe/recipes-extended/indent/indent_2.2.12.bb b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
index 0a866574bd..0f4f4c2206 100644
--- a/meta-oe/recipes-extended/indent/indent_2.2.12.bb
+++ b/meta-oe/recipes-extended/indent/indent_2.2.12.bb
@@ -10,6 +10,8 @@ you want a program to format your code."
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
+DEPENDS = "virtual/gettext"
+
 SRC_URI = "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://0001-src-indent.c-correct-the-check-for-locale.h.patch \
            file://0001-Makefile.am-remove-regression-dir.patch \
@@ -20,7 +22,7 @@ SRC_URI[sha256sum] = "e77d68c0211515459b8812118d606812e300097cfac0b4e9fb34726642
 
 inherit autotools gettext texinfo
 
-CFLAGS_class-native += " -Wno-error=unused-value"
+CFLAGS_append_class-native = " -Wno-error=unused-value"
 
 FILES_${PN}-doc += "/usr/doc/indent/indent.html"
 
-- 
2.25.0


