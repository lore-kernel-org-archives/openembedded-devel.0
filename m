Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11833.1795763045398885945
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=ASy9Auvf;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b413d04c93so4484720a91.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795763045; x=1796367845; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGsUkPe/juAr1ogcoU5VzrTn9qDSWGZF7YE/4RrN6SM=;
        b=ASy9AuvfL8/NHL21t1XQjAPt8z0/aKQwhgS2C6Pg+TKKaK63j0fqCrjnVyCiRK5JXI
         5puE1BgaM/YyN6Ijd92pTXZnUcfnJQU1SKNuu6zzjD0mR+A32PFEqQrqNj7k23F+6HCO
         Fb4X9+d85JQANPgDfuHbkO2pwbu7aewxkMITQbc6/Jvue1ZaJrODlbCw7xxbwLIUJghF
         Mddj72IMhfsj1wX7oXadGWnu3T6cIYUlHgsF7NASyjyPk2RU2jMNy6x1BpXNSw1j6V3G
         luWTiNtB4Yowvl6bGcNnD6kRFWr1uPuhX4bXHx2RPzewxMVSf8utj+H+CadmarPeBBcl
         H/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795763045; x=1796367845;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGsUkPe/juAr1ogcoU5VzrTn9qDSWGZF7YE/4RrN6SM=;
        b=2rsYH0BfAFKpYwT4m+qEiDghYEpe2BAhRG+XiVGefjSXx1ZxUo3BV9poPPjxO/YNRK
         XHT0kuk019iW5RgX9hxCv5H5PIjbQTEE0brg6RXKMRFLuoLlf9rqgAsmaDsRjSDDbGL+
         Mzq9phMo+8FhYvY8UiTcTJ+JIKEDDTgIitq8ZmKE+Hf0XNpemGa+Vbg/e7iVzzEYJ+4D
         qBKfZz4T2YHe1iKcu9bg9gaR4FBePJFi1OFZAfy20Epb7IEetDyqJQiumt1a3NILNR3l
         N7J4PC2o+5/nu/NLJEUZJzhBYTs6eEyHMrLYMbwbh0f+ptNUZRg+9878FjTXb9GTZKWb
         TUuw==
X-Gm-Message-State: APuU4Z8VmQ+TGIY9q0hGjg88RD6/qchMa2Z1zoLOW6MlCHsmlOPOfrb9
	hVcenu8zQSApGYrRsxUwE/lrSZlKfGm4k6Hf4G0hpxENKkFmcblIoeyM/xCaFeJM
X-Gm-Gg: AZFdTZfXvARrYHcKeLWyaERPyraafG7QWtbgwVMxrZBrdyRbjEWhjgG2YVN/cvWyBUu
	vspv5Ohbp/gVNs5SCz7f4AuDe7XRM+/bvndszz9zzdU3er95u35kjVj+ZfE1K8+e/enA+xckvEG
	ocx397HhswuA2aK8oHkwXprcONEW0hIlWmmodW4r3BKmuZq4185Xvu6XI22j2cfDCc1kL5THC7i
	Z8d7nhiGqih4jNGGjC0STolO98SW+E+wwjEcN/hGY1Lc76HFV3k5J3KokbdXBCzjA/1eIdl23uf
	IF6+gh8HMinxxFY0oKbngTDU/MpWKNcjz0BaG9sGzlsDOhPoVBSK58rCRhDtdS92b/jZELW39Ec
	0gfbiN1ycr3ydqLtZ06M4i4tXajhUrl+OkafEfFseZ0y4UF7UlhUm8yDjgYwz539YKwNugH+CKh
	s9H7Yg+2M9uLBAKSUKCP6TRoBfQsEahhRgmPdTq3LAe7wpcOw1T1CD2fQfFZUlXWPALC+ztBKmm
	TE5lp+9+Ff6rV5gbLL8AWdo0im+YJxCChRuGGdCVO7MgyzWY5aBFS8KGOLVLUEq4g+5/Y+jFeqm
	TToU1ok8dkSveHfFZAEBAMCyLBgxDVXelZWS5PC/cgrnqotlfZfRuQDha35PVWYVwtHv96oZWjv
	gRmLoQH+lAiICKmnwjJPwCjW48YFlqMjM32igfAdRMX0/RQrqzK8wRFqimPQfMMZV2Ic6wMmoja
	oX/RRR/M1ezpr1SYnoNIqa7ZVUl7av6evIUbfL8n/0NxKD0bWXrXyy2SeCVjKKBTWfhF2E9pJgk
	AqhX9KopKGO7Bv8liOPFjwjTjzYg8w6d2Trleq0c7GLAmfJYEgHD4HG8cMRhVmcFXswHtaZnQ+q
	NSNY
X-Received: by 2002:a17:90b:3b52:b0:3ab:9c73:130 with SMTP id 98e67ed59e1d1-3b41c9e4b34mr22246395a91.33.1795763044539;
        Thu, 26 Nov 2026 23:04:04 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm39785288a91.2.2026.11.26.23.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:04:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-xfce][PATCH 2/2] xfce4-dev-tools: upgrade 4.21.2 -> 4.21.3
Date: Thu, 26 Nov 2026 23:03:57 -0800
Message-ID: <20261127070359.2405078-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127070359.2405078-1-khem.raj@oss.qualcomm.com>
References: <20261127070359.2405078-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133371
Content-Type: text/plain; charset="utf-8"

Upstream replaced autotools with meson. The m4 macros still install to
${datadir}/aclocal; the copy in ${datadir}/xfce4/dev-tools/m4macros is
gone, which nothing in the layers uses.

Switch to meson, fetch the .tar.xz now published, and add
docbook-xsl-stylesheets-native for the xdt-csource man page that is now
generated. Rework the xdt-csource test patch for meson, strip host tool
paths from xfce-do-release, and drop the manual aclocal install. The
upstream check uses the default version directory scan.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...0001-Run-native-xdt-csource-on-tests.patch | 30 +++++++++----------
 ...ls_4.21.2.bb => xfce4-dev-tools_4.21.3.bb} | 18 +++++------
 2 files changed, 24 insertions(+), 24 deletions(-)
 rename meta-xfce/recipes-xfce/xfce4-dev-tools/{xfce4-dev-tools_4.21.2.bb => xfce4-dev-tools_4.21.3.bb} (55%)

diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch
index 74b1679ab4..e34ff7b16c 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools/0001-Run-native-xdt-csource-on-tests.patch
@@ -6,28 +6,28 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
-Tests cannot be opted out so let them pass.
+Tests cannot be opted out so let them pass; use the native xdt-csource
+in cross builds.
 
 Upstream-Status: Inappropriate [OE specific]
 
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 ---
- tests/Makefile.am | 2 +-
+ tests/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/tests/Makefile.am b/tests/Makefile.am
-index fa0832c..7c46bbf 100644
---- a/tests/Makefile.am
-+++ b/tests/Makefile.am
-@@ -26,7 +26,7 @@ DISTCLEANFILES = test-xdt-csource-data.c
- BUILT_SOURCES = test-xdt-csource-data.c
+diff --git a/tests/meson.build b/tests/meson.build
+--- a/tests/meson.build
++++ b/tests/meson.build
+@@ -5,7 +5,7 @@ test_xdt_csource_data = custom_target(
+     'data' / 'data.txt',
+   ],
+   output: 'test-xdt-csource-data.c',
+-  command: [xdt_csource, '--extern', '--build-list', 'data_bin', '@INPUT0@', 'data_txt', '@INPUT1@'],
++  command: [find_program('xdt-csource', native: true), '--extern', '--build-list', 'data_bin', '@INPUT0@', 'data_txt', '@INPUT1@'],
+   capture: true,
+ )
  
- test-xdt-csource-data.c: Makefile $(srcdir)/data/data.bin $(srcdir)/data/data.txt
--	$(top_builddir)/xdt-csource/xdt-csource --extern --build-list data_bin $(srcdir)/data/data.bin data_txt $(srcdir)/data/data.txt > test-xdt-csource-data.c
-+	xdt-csource --extern --build-list data_bin $(srcdir)/data/data.bin data_txt $(srcdir)/data/data.txt > test-xdt-csource-data.c
- 
- clean-local:
- 	rm -f *.core core core.*
 -- 
 2.26.2
-
diff --git a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.2.bb b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.3.bb
similarity index 55%
rename from meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.2.bb
rename to meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.3.bb
index b8a206047f..5ccbd0a22e 100644
--- a/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.2.bb
+++ b/meta-xfce/recipes-xfce/xfce4-dev-tools/xfce4-dev-tools_4.21.3.bb
@@ -4,25 +4,25 @@ SECTION = "x11/libs"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "glib-2.0 libxslt-native meson-native"
+DEPENDS = "glib-2.0 libxslt-native docbook-xsl-stylesheets-native"
 DEPENDS:append:class-target = " ${BPN}-native"
 
-SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.bz2 \
+SRC_URI = "https://archive.xfce.org/src/xfce/${BPN}/${@'${PV}'[0:4]}/${BP}.tar.xz \
            file://0001-m4macros-Check-for-a-function-provided-by-libX11-in-.patch \
            "
 SRC_URI:append:class-target = " file://0001-Run-native-xdt-csource-on-tests.patch"
-SRC_URI[sha256sum] = "a43f726a082b589186d9e6ed076101d41249d1e22bbe61448037550190d7f75a"
+SRC_URI[sha256sum] = "e3137493ed47e36a4a177843e9043c7959eaf412e50600de4ab62d3454f50902"
 
-inherit autotools pkgconfig
+UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit meson pkgconfig
 
 do_install:append() {
-    install -d ${D}${datadir}/aclocal
-    install -m 644 ${S}/m4macros/*.m4 ${D}${datadir}/aclocal/
+    # drop the host tool paths found by meson from the release helper
+    sed -i -e 's|${HOSTTOOLS_DIR}/||g' -e 's|${STAGING_BINDIR_NATIVE}/||g' ${D}${bindir}/xfce-do-release
 }
 
-FILES:${PN} += "${datadir}/xfce4/dev-tools/m4macros/*.m4 \
-                ${libdir}/cppcheck \
-               "
+FILES:${PN} += "${libdir}/cppcheck"
 
 RDEPENDS:${PN} = "bash"
 
