Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id BB93D7F8BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id n1so8002444wra.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=4kxmXPnwHr4Nrh/Aq0A06mbynkI2PWqYwNI0emEkey0=;
	b=FF7/fOCBgY+6hKJc5+At4obgX7fupXcINC6QOMo5yTkyi9y5RFLuvCaYR7cwH68VBe
	1rkbv4t381RbW7bhvAK3pChId56VCNBryoHz9ALShJDXFEBw1Vr71t3yGeh5ZCfWsJbX
	gpeUqIavXV07G8brgDHxR6oU9YXW2ziBQUJ69p0eot2813Tjg2G0yFt1MVYgTiHiPsxp
	+mDYwgEZ8FzqGM7RZ3aLMnfLhpP669ISp3Hily+fr84qKBwtC4SDRvw4uYHYZTLl+jBz
	0hpgy/vl3VhB1nUlhxATqBBZdebSmIJjpEd2WhPx51+EiiVOlMuIMmlAkehdZqJ5vyXE
	o5sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=4kxmXPnwHr4Nrh/Aq0A06mbynkI2PWqYwNI0emEkey0=;
	b=AfOGWkl5ztI8tJ3iGrJUMp8Orn2YLAaxZnTpi5Tr4xle2kCvtrYEXkQmpX1/xNj1FI
	N2nhEJc+I0PGhPj9SV428Jj9YjBZe4kBexFQKtLQ3Srhr09RhvOpnjDOfGXhqGjpTYy3
	gp1ypmlKqNF0PDHhqKK7Y3bHMZNuZSnsRBNWA2q2wMlh8wwVPDaYATunkGO4rpuqse9r
	MA2IaDeonXX5eXeNusuxbMBKSV6h1rLBUjNwFnEdYxmSiw8Hxexpab4BU2yqrvqiJkJG
	2uSI6gll+58F2YO8K3Pd7QoYhXwS9x7Mgr8jO9+WMLWc0OrqXTMVvdHcnLsMrOXQmKFQ
	GGGA==
X-Gm-Message-State: APjAAAXIiU853QI7h9LGtE4aufXbhNv0bAHITSG8YMvEsBg0H2SI82vd
	vlACiLsaL31aWr5Vb2miIft8N4Ri
X-Google-Smtp-Source: APXvYqwkRC+brzqmpS0oO3sKTf4YAKV2NP+ehH8Mkj1nL/xI/ZGLRgp7wgD6w5XD1nQbcw1zSL0ABA==
X-Received: by 2002:adf:f3c5:: with SMTP id g5mr10209083wrp.5.1573760981106;
	Thu, 14 Nov 2019 11:49:41 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.40
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:40 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:16 +0100
Message-Id: <20191114194930.2786-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 02/16] gtksourceview2: remove
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gedit 2.x was the only recipe using it

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gtksourceview-classic-light_1.0.bb        |  3 --
 .../gtksourceview/gtksourceview2_2.10.5.bb    | 32 -------------------
 2 files changed, 35 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb

diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
index 7dabd1e39..bcc3106d9 100644
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
+++ b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview-classic-light_1.0.bb
@@ -9,8 +9,6 @@ SRC_URI = "file://classic-light.xml"
 S = "${WORKDIR}"
 
 do_install() {
-    install -d ${D}${datadir}/gtksourceview-2.0/styles
-    install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-2.0/styles/
     install -d ${D}${datadir}/gtksourceview-3.0/styles
     install -m 0644 ${WORKDIR}/classic-light.xml ${D}${datadir}/gtksourceview-3.0/styles/
     install -d ${D}${datadir}/gtksourceview-4/styles
@@ -18,7 +16,6 @@ do_install() {
 }
 
 FILES_${PN} = " \
-    ${datadir}/gtksourceview-2.0/styles \
     ${datadir}/gtksourceview-3.0/styles \
     ${datadir}/gtksourceview-4/styles \
 "
diff --git a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb b/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
deleted file mode 100644
index 012f8e3bc..000000000
--- a/meta-gnome/recipes-gnome/gtksourceview/gtksourceview2_2.10.5.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Portable C library for multiline text editing"
-HOMEPAGE = "http://projects.gnome.org/gtksourceview/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "gtk+ libxml2 intltool-native gnome-common-native glib-2.0-native"
-
-PNAME = "gtksourceview"
-
-S = "${WORKDIR}/${PNAME}-${PV}"
-
-inherit gnomebase lib_package gettext distro_features_check
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-# overrule SRC_URI from gnome.conf
-SRC_URI = "${GNOME_MIRROR}/${PNAME}/${@gnome_verdir("${PV}")}/${PNAME}-${PV}.tar.bz2;name=archive \
-           file://gtk-doc.make \
-           file://suppress-string-format-literal-warning.patch \
-           file://0001-test-widget.c-fix-non-literal-format-string-issues.patch \
-           "
-SRC_URI[archive.md5sum] = "1219ad1694df136f126507466aeb41aa"
-SRC_URI[archive.sha256sum] = "c585773743b1df8a04b1be7f7d90eecdf22681490d6810be54c81a7ae152191e"
-
-do_configure_prepend() {
-    cp ${WORKDIR}/gtk-doc.make ${S}/
-    sed -i -e s:docs::g ${S}/Makefile.am
-    echo "EXTRA_DIST = version.xml" > gnome-doc-utils.make
-}
-
-FILES_${PN} += " ${datadir}/gtksourceview-2.0"
-- 
2.21.0


