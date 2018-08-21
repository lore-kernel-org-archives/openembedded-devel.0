Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 0D04079009
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 17:39:40 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t14-v6so2061258pgf.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Aug 2018 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=M7Ofu3HXDkOyzepMGwNOw7zL2bj8Bb6lm7153nMQGLA=;
	b=fyq+1FrQD0DdqvG1mTxzl77roknjyC47UcpahCNIv1q+LXPJV8Xk5VevxkQWKLA0z8
	Wue8t7PbhCX9Ha+dgk0u0x/rk0GzUN9RiNiJa6RbdHaP/ZxGmOMBnmI8mhXxxf8Ys6qh
	t7ekRQiZxBDGB37cZl2tOKorlfZQdhaLyEICbSnrDPQt4wnRg//XLBYK9VnhWMF3FMP/
	oaiGAjBm8UYeEYM1qJjVrmEeIHzjXXmmbgyd3/UBuXRyRKYtzDuYkn9gjwQ4R+GGh5QH
	fp68EJ9dXGEUlcJsCKEDI0c7P+kKOhfnWWwej+8Xi7s1HZOOdjLmbm60oohPq0RBdrDJ
	vdng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M7Ofu3HXDkOyzepMGwNOw7zL2bj8Bb6lm7153nMQGLA=;
	b=VT/4Off2JTV5RPinvDb7kdyVp+AB5Na5L+oUMVyLi+xuyBtOeZf9tdT6MU/vwmAPtv
	u0Ip6Qu7mRy1N02hWYU1y9+ucrhLeX27Gyw7uZtB4vYeE/nECzNHtknDNGZhgq3hQLYv
	wTZ65uxCcxFY/fXl2jeJ9xv6hYwIZsUTZqclGneMsZoLFeZv1TMCCOE+cKmNezC9REZ6
	vZ2rFtReQ5DHJpowYfVhAJeKBosO6u1nQMSIPmJE0H/O14YGWthMAzaFc+AU2pMl63eY
	guIwc9HJvSWJ761XcckeUq2qk3g7j1nyWCicmY7MNdYMqLLsdmGHeBKwXy1HJCpOGjXz
	cbhQ==
X-Gm-Message-State: AOUpUlHQVUAwHEAPID4gXbXPRrCjhTbPUE/XUOLsmFBmyubWXIPCARcc
	J/IhpXWxx1GIRVCbErXJXu7Y7LGb
X-Google-Smtp-Source: AA+uWPxE8bUXn3dwhHSBiq/OSFq2G18IRf0q09b9ZoUis4Hlc5XKKSfN5NBJS9UgcRJVjAGQlsCnww==
X-Received: by 2002:a62:e18:: with SMTP id
	w24-v6mr53698567pfi.145.1534873181637; 
	Tue, 21 Aug 2018 10:39:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	v13-v6sm5077837pfj.22.2018.08.21.10.39.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 10:39:41 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 21 Aug 2018 10:39:30 -0700
Message-Id: <20180821173930.12507-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-oe][PATCH] dos2unit: Remove after move to core
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
X-List-Received-Date: Tue, 21 Aug 2018 17:39:41 -0000

Its in OE-Core now

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/classes/dos2unix.bbclass              | 14 --------
 .../dos2unix/dos2unix_7.4.0.bb                | 34 -------------------
 2 files changed, 48 deletions(-)
 delete mode 100644 meta-oe/classes/dos2unix.bbclass
 delete mode 100644 meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb

diff --git a/meta-oe/classes/dos2unix.bbclass b/meta-oe/classes/dos2unix.bbclass
deleted file mode 100644
index 1bad998dde..0000000000
--- a/meta-oe/classes/dos2unix.bbclass
+++ /dev/null
@@ -1,14 +0,0 @@
-# Class for use to convert all CRLF line terminators to LF
-# provided that some projects are being developed/maintained
-# on Windows so they have different line terminators(CRLF) vs
-# on Linux(LF), which can cause annoying patching errors during
-# git push/checkout processes.
-
-do_convert_crlf_to_lf[depends] += "dos2unix-native:do_populate_sysroot"
-
-# Convert CRLF line terminators to LF
-do_convert_crlf_to_lf () {
-    find ${S} -type f -exec dos2unix {} \;
-}
-
-addtask convert_crlf_to_lf after do_unpack before do_patch
diff --git a/meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb b/meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb
deleted file mode 100644
index 8d3c578d0d..0000000000
--- a/meta-oe/recipes-support/dos2unix/dos2unix_7.4.0.bb
+++ /dev/null
@@ -1,34 +0,0 @@
-SUMMARY = "Convert text file line endings between CRLF and LF"
-DESCRIPTION = "The Dos2unix package includes utilities dos2unix and \
-unix2dos to convert plain text files in DOS or Mac format to Unix \
-format and vice versa."
-HOMEPAGE = "http://waterlan.home.xs4all.nl/dos2unix.html"
-SECTION = "support"
-
-LICENSE = "BSD-2-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=1b78fca784db24f4a40e30b300787f3f"
-
-SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix"
-
-# Release 7.4.0
-SRCREV = "1182533bde3c1fe65be2ead465e87671faa2c027"
-
-S = "${WORKDIR}/git/dos2unix"
-
-inherit gettext perlnative
-
-# The dos2unix NLS relies on po4a-native, while po4a recipe is
-# provided by meta-perl layer, so make it optional here, you
-# need have meta-perl in bblayers.conf before enabling nls in
-# PACKAGECONFIG.
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[nls] = "ENABLE_NLS=1,ENABLE_NLS=,po4a-native"
-
-EXTRA_OEMAKE = "${PACKAGECONFIG_CONFARGS} LDFLAGS_USER='${LDFLAGS}'"
-EXTRA_OEMAKE_class-native = "ENABLE_NLS="
-
-do_install () {
-    oe_runmake DESTDIR="${D}${base_prefix}" install
-}
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.18.0


