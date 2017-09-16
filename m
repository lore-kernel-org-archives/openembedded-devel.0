Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f180.google.com (mail-pf0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id F308B78588
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:17:50 +0000 (UTC)
Received: by mail-pf0-f180.google.com with SMTP id m63so2839715pfk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 08:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=QnMiEWjSKtZzLcXjhyQWDGRsQ9ffDPFaZ+ldSg926pc=;
	b=i6h5GYWQQWO61Cs6z6vWaKYXpsx6K5qk0pA24t3VP3pspr4OygAWc5CVaAXJFfM5Au
	wHc2U0Ll/rO2g/MhpcDKgCSXSHdf5KbunjyB/1MSEZc/E09tMC61s7va/jV683TiKfy/
	AweqEvjhqTu4T2x74ZOqNN1ftbEh190UDeHhygFB25Tf4lMp7i1b8z/HjbT/QQv0kRRc
	r+oL/vw6dxnGzDx/uT6h2FIj4sY1OHrSWqodsoMsCLsZwdDWxhVHo2mxamsRDyFVFEUA
	r3VrTaRKELKAsaA8iwmxweoyXhwyfgBBlPL5QXGovV5jpu8l08Qat0AkRMffps/NRWbn
	Esuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=QnMiEWjSKtZzLcXjhyQWDGRsQ9ffDPFaZ+ldSg926pc=;
	b=ep/GwMJsEQ6w4FpH0Lf1LKAmQnP3Svpz45g4mnElMLPvHK5aEOicTlMIDjHJyuy+O+
	03rYdiNnK7ffLpSDnY8kxjjkvZKyUvvyy8ij18/N6xyvZUwRO8PQKY2zSEw4KQxco88t
	GDF6e1KpiMO/58WDXDcCi2jhtqNRsqANo9nGzqTvAoajff4Anpz+Ch6yNPlJeKGqgawf
	jYJIxY6XfMxWAFs8WV5j1+dqUtwWimtsFNTYh9aYCyetjyslLkbNvPsamw7z0UsWY61H
	+2VbYB9eFRKnZthUIHbHH8aPMdvosP4EjAGgZjhhNOCtHlkpEYZ/XJ0mruoZ+0ZcYe1a
	1d8w==
X-Gm-Message-State: AHPjjUjd4yWUNYDA1VXHfNkCEZs9XjeZku2mam8mMzuETKrJredazHBA
	EtChxK5Bo5NK6ln+
X-Google-Smtp-Source: ADKCNb7tmLX15abysT6njEAqshC94GZqjeIu+H316t7ibJHXMaIbBOuFiBVcE46mRBb5WOy+vWk1ZA==
X-Received: by 10.84.133.99 with SMTP id 90mr23933207plf.148.1505575071942;
	Sat, 16 Sep 2017 08:17:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::a20b])
	by smtp.gmail.com with ESMTPSA id
	n29sm6685978pgf.22.2017.09.16.08.17.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Sep 2017 08:17:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Sep 2017 08:17:44 -0700
Message-Id: <20170916151744.1786-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] autoconf-archive: Delete ( moved to oe-core )
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
X-List-Received-Date: Sat, 16 Sep 2017 15:17:51 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../autoconf-archive/autoconf-archive.inc          | 15 --------------
 .../autoconf-archive/delete-some-m4-files.patch    | 23 ----------------------
 .../autoconf-archive_2016.09.16.bb                 | 17 ----------------
 3 files changed, 55 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
 delete mode 100644 meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb

diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
deleted file mode 100644
index 9684d1f99..000000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive.inc
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "GPLv3"
-HOMEPAGE = "http://www.gnu.org/software/autoconf-archive/"
-SECTION = "devel"
-
-DEPENDS += "m4-native"
-DEPENDS_class-native = "m4-native gnu-config-native"
-DEPENDS_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
-RDEPENDS_${PN} = "m4 gnu-config gnome-common"
-RDEPENDS_${PN}_class-native = "m4-native gnu-config-native"
-RDEPENDS_${PN}_class-nativesdk = "m4-nativesdk gnu-config-nativesdk"
-
-SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.xz"
-
-inherit autotools
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
deleted file mode 100644
index 2aa788bf9..000000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive/delete-some-m4-files.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Delete two m4files ax_code_coverage.m4 and ax_check_enable_debug.m4
-to avoid installing conflicts. These two files can be installed by
-gnome-common from oe-core, even if the files in gnmoe-common is
-copied from autoconf-archive(the reason is that the old version
-autoconf-archive don't provide the two files).
-After upgrading to the new version, we need to drop them in meta-oe
-and then set rdepends to gnome-common(oe-core)
-
-Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
-
-Index: a/configure.ac
-===================================================================
---- a/configure.ac     2016-09-16 06:00:00.000000000 +0800
-+++ b/configure.ac     2017-04-18 17:43:05.946290554 +0800
-@@ -19,7 +19,7 @@
- 
- AC_PROG_SED
- 
--M4FILES="m4_esyscmd([echo -n m4/*.m4])"
-+M4FILES="m4_esyscmd([echo -n m4/*.m4 | sed -e 's:m4/ax_code_coverage.m4 ::g'|sed -e 's:m4/ax_check_enable_debug.m4 ::g'])"
- AC_SUBST([M4FILES])
- 
- TEXIFILES="m4_esyscmd([cd m4 && echo -n *.m4 | sed -e 's/\.m4/.texi/g'])"
diff --git a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb b/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
deleted file mode 100644
index 561b57b4f..000000000
--- a/meta-oe/recipes-devtools/autoconf-archive/autoconf-archive_2016.09.16.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require autoconf-archive.inc
-
-
-PARALLEL_MAKE = ""
-
-LICENSE = "GPLv2 & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-
-SRC_URI[md5sum] = "bf19d4cddce260b3c3e1d51d42509071"
-SRC_URI[sha256sum] = "e8f2efd235f842bad2f6938bf4a72240a5e5fcd248e8444335e63beb60fabd82"
-
-SRC_URI += "\
-        file://delete-some-m4-files.patch \
-"
-
-EXTRA_OECONF += "ac_cv_path_M4=m4"
-BBCLASSEXTEND = "native nativesdk"
-- 
2.14.1


