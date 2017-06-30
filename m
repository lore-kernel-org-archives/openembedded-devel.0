Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 003E578268
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 13:00:21 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id f127so63502382pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 06:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wJny9ZIiK4YIDVW4A/3CAz6XfQeW5hsq+C1XpgObdjc=;
	b=NW/EhjDgy04q6k0BingwGE/4A+Zn5a+FMuBnhlU1k/H6xYRVvkV6OFRUMQF8DSbCce
	ifuO26WxNHJX/sBe/Smo/qKAM9iWsJqINHjjnHMrsRrafWph9RFZBfRUaa1K1EslLKfN
	6Ux+4GRKzNVevdjG5z6uuizSnvj2nC841A8y2+ZhQ6242qWS9r3I1u8H5luJB0YJBI0Y
	92uxN+z0P0Nv6+gLIFJ57FgCZ98BN951jgH9bw0bQdXdMU7+Jk4FfW1DmNdZ+NKp6Kt6
	bkgG/nAo1jP96neXwY7f4TWxvFCTM34BTmLGBa4Uy1yBZVHVcl1/4E/SpLW2qfzRLioa
	ID9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wJny9ZIiK4YIDVW4A/3CAz6XfQeW5hsq+C1XpgObdjc=;
	b=H5bZsrTRySWXmglf2YKGd1hlNm0kyGIa0yuftS4hO+jyTYnLO3jVEM0QARUEA9w/iI
	W2s9nbdGcp0fjSqo2ZctLLBXgToQYf6OjfzpEMq4fklFQ9T22lna6fJYmdasZ6dHfQ3r
	LklYK9FfrV3RPs7JiQopnBfs9syRLooe6abAjwGOP9TMn8WV+tke4BHq1Xcr1RUbt+v/
	BnOx4vy8JjSUffELZa1KQSLTzUpX5ktNPd37FUgIwLRd1lwm2ITKAJKWIt2aqqJG+q3L
	GjS+ndv6EQ5nKfj0bu0Mj+qEp/nq3ZtkQU0mmXYrwQveXpnxLu7ZjrTs51f+tTThuOg4
	yGlg==
X-Gm-Message-State: AKS2vOw5626gWg9R9aZI+Yk6Uj74PZNvIUpnAP9HL78K4pLgLT+ORH/o
	ELQigQRR/q4X+/Rf
X-Received: by 10.98.133.16 with SMTP id u16mr11250469pfd.140.1498827621733;
	Fri, 30 Jun 2017 06:00:21 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	t26sm10735590pfl.41.2017.06.30.06.00.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 06:00:20 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 05:59:47 -0700
Message-Id: <20170630125957.3342-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170630125957.3342-1-raj.khem@gmail.com>
References: <20170630125957.3342-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/17] gimp: Upgrade to 2.8.22
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
X-List-Received-Date: Fri, 30 Jun 2017 13:00:22 -0000

Fix API issue due to new gegl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gimp/gimp/0003-Fix-use-of-gegl-API.patch       | 34 ++++++++++++++++++++++
 .../gimp/{gimp_2.8.20.bb => gimp_2.8.22.bb}        | 14 ++++-----
 2 files changed, 41 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb => gimp_2.8.22.bb} (70%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch b/meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
new file mode 100644
index 000000000..7da78e205
--- /dev/null
+++ b/meta-oe/recipes-graphics/gimp/gimp/0003-Fix-use-of-gegl-API.patch
@@ -0,0 +1,34 @@
+From e1c8f4b8323e3965271a93529eab5774c1a7083c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 29 Jun 2017 10:32:14 -0700
+Subject: [PATCH 3/3] Fix use of gegl API
+
+newer version of gegl does not define GEGL_IS_PARAM_SPEC_MULTILINE
+
+| core/libappcore.a(gimpparamspecs-duplicate.o): In function `gimp_param_spec_duplicate':
+| /usr/src/debug/gimp/2.8.22-r0/gimp-2.8.22/app/core/../../../../../../../../../workspace/sources/gimp/app/core/gimpparamspecs-duplicate.c:70: undefined reference to `GEGL_IS_PARAM_SPEC_MULTILINE'
+| collect2: error: ld returned 1 exit status
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ app/core/gimpparamspecs-duplicate.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/app/core/gimpparamspecs-duplicate.c b/app/core/gimpparamspecs-duplicate.c
+index c0b7426..2efaf23 100644
+--- a/app/core/gimpparamspecs-duplicate.c
++++ b/app/core/gimpparamspecs-duplicate.c
+@@ -67,7 +67,7 @@ gimp_param_spec_duplicate (GParamSpec *pspec)
+                                      spec->default_value,
+                                      pspec->flags);
+ 
+-          if (GEGL_IS_PARAM_SPEC_MULTILINE (pspec))
++          if (gegl_param_spec_get_property_key(pspec, "multiline"))
+             {
+               g_param_spec_set_qdata (new, multiline_quark,
+                                       GINT_TO_POINTER (TRUE));
+-- 
+2.13.2
+
diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
similarity index 70%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
index 9588ab016..1ecd2b715 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
@@ -27,13 +27,13 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '',
 
 inherit gnome gtk-doc
 
-SRC_URI = " \
-    http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
-    file://0001-configure-ac-do-not-check-for-freetype-config.patch \
-    file://bump_Babl-GEGL_versions.patch \
-"
-SRC_URI[md5sum] = "d405640c426b234d6efc36fb4f5bae57"
-SRC_URI[sha256sum] = "939ca1df70be865c672ffd654f4e20f188121d01601c5c90237214101533c805"
+SRC_URI = "http://ftp.gimp.org/pub/gimp/v2.8/gimp-${PV}.tar.bz2 \
+           file://0001-configure-ac-do-not-check-for-freetype-config.patch \
+           file://bump_Babl-GEGL_versions.patch \
+           file://0003-Fix-use-of-gegl-API.patch \
+           "
+SRC_URI[md5sum] = "7e4fd7a53b1d3c32dff642ab1a94b44d"
+SRC_URI[sha256sum] = "9187a35cc52b110d78124d7b27b68a68ade14a794c2721314bac6134d2a5638a"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.13.2


