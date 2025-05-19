Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09D8C2D0CD
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 11:44:33 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.49167.1747655068019650816
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 May 2025 04:44:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EqfkzZ32;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7080dd5fe92so33812787b3.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 04:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747655067; x=1748259867; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNabuOifsHowDVA+pViZNOnOsHxTnGXs1lJ1xS9EBes=;
        b=EqfkzZ32nAx/TY8KW/XCs4tWXMSX5Xfv1T7+RJULx75RnkNJfh64jksQbBybIUVb3V
         1jOFie+eMQbJQTZY3wjZuIy2ska/ZD6fsC09SVTNcqzxIpfVDwuTEe5KU/04Djui9xpW
         VkhGhv+8d3uYl4ax1EBTAhfTalcQpDhMczPX7MhftISV9rxJGQdis35ha6CP2+oNcMvP
         yCxxmVOE03DmndEXD+HwWD/sqhnPyEaM6aJMeIAOuzoitLSPAPPa3tUVelz4Mx7qo88K
         SBNJKwIelNSuT3V+NbWJqZVwun09D4c3zin4JpR63xtMp/491L63Of7IUVgfTKkzfLMi
         kgNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747655067; x=1748259867;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNabuOifsHowDVA+pViZNOnOsHxTnGXs1lJ1xS9EBes=;
        b=R+3fcJEbeM6newmbSsxLQjBdjU1Lp0cLE1EsOfOEmaEBCOYRBTpQ2b1QQZv+Ktv15L
         vDxtuIwPMNjqjlt6TmRwIgsCPgBaAH1hTnETMr2qlhssE2cmlDMu9mxTkePcorLIm3jt
         bEYDiY8/8iIKqsLVOcJixb+j3PYwZ/Ts2NE0xQGLRvyMI+AIZ9Lupi7hA3OcXxgAiS+x
         fMYUrt4dwmit0QLegv/VhsG8WsV/SiNokh+V3QAaLnFnyrqshWxHBinibnBPDcdipJVG
         Y7WwmtN4lvhgUjk119SkelJydt6egzftO9Z24VSmQdvHxu7o3S+rWb7BjPdf7s5fdrrA
         VC2A==
X-Gm-Message-State: AOJu0Yx8eGk/3PFjEEUi6sL9eEnZNStzfh8nwz7ZVwTfSUc3x0cui1yn
	vtCdpF+6fEU0klDiuAcCuqjyvLUlEtuqOYGzQ8I/QnfHA30vkvAu0LDEfN+AbOAO
X-Gm-Gg: ASbGncvK78qWF+/22iBuvV7WGcRuojiAOxgDshsRd1q4SfCvW69ADFoqC4vB/XPm5hT
	cOlpHcCkjDCoMXPIgXFBXQrBMDrOPvmIM4ZAKSQWY08SGTFGfFUSmIF7bGOxEsyuO/mL7Zn+9vp
	M2RdOq2Tm6cME67NI65wS3BFzRYYvEwdoTHeXhuDYAoA/Rgl7x4F1BR8vyKnBaLvCsmqEkQtSKo
	MMcu1OJbQ0uVLkR0ar7cgMQmQ0nbU2MBNmo9vQjjIpot5yPVpb37k8SRJfW3T4QDkHrotqc7YaX
	z5GnNbK9O7mA2SSioasm2RJNYoEyDgI+FhpQuXKrwcqKf1HvFzjZlnJ1
X-Google-Smtp-Source: AGHT+IHhOtSYNMgEiWm5lkFkZdHSDqqCjXIUTeKxvtmUhoU+0PN4AeQPOuVMX0N/7lkF1BWZfZO73Q==
X-Received: by 2002:a05:690c:a82:b0:708:4f42:c2f6 with SMTP id 00721157ae682-70ca79f79b3mr172689097b3.16.1747655066464;
        Mon, 19 May 2025 04:44:26 -0700 (PDT)
Received: from localhost.localdomain ([71.215.9.36])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca850896csm16961227b3.69.2025.05.19.04.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:44:26 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] glade: update 3.22.2 -> 3.36.0
Date: Mon, 19 May 2025 07:44:01 -0400
Message-ID: <20250519114401.28672-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 May 2025 11:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117477

    Fix HOMEPAGE

    License Update:  COPYING.GPL - whitespace changes and change of address of the
      Free Software Foundation.  COPYING.LGPL - whitespace changes and change of
      address of the Free Software Foundation.

    | checking for itstool... no
    | configure: error: itstool not found

    add itstool-native to DEPENDS to address configure failure.

    | ERROR: glade-3.36.0-r0 do_configure: QA Issue: AM_GNU_GETTEXT used but no inherit gettext [configure-gettext]

    inherit gettext to address QA error.

    The code of gladeui/glade-command.c has changed from using
      G_OBJECT (prop)    to  GLADE_PROPERTY (prop)
      G_OBJECT (widget)  to  GLADE_WIDGET (widget)
    thus resolving the incompatible pointer types seen in glade 3.22.2.

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../recipes-devtools/glade/glade_3.22.2.bb    | 32 -------------------
 .../recipes-devtools/glade/glade_3.36.0.bb    | 32 +++++++++++++++++++
 2 files changed, 32 insertions(+), 32 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/glade/glade_3.22.2.bb
 create mode 100644 meta-oe/recipes-devtools/glade/glade_3.36.0.bb

diff --git a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb b/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
deleted file mode 100644
index 84ca98a8b4..0000000000
--- a/meta-oe/recipes-devtools/glade/glade_3.22.2.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Glade - A User Interface Designer"
-HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPL-2.0-only & LGPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
-                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
-                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native \
-           gnome-common-native \
-           autoconf-archive-native \
-"
-GNOMEBASEBUILDCLASS = "autotools"
-inherit features_check autotools pkgconfig gnomebase gobject-introspection mime-xdg gtk-doc
-
-# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
-# cairo would at least needed to be built with xlib.
-ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.22/glade-${PV}.tar.xz \
-           file://remove-yelp-help-rules-var.patch \
-          "
-SRC_URI[sha256sum] = "edefa6eb24b4d15bd52589121dc109bc08c286157c41288deb74dd9cc3f26a21"
-
-EXTRA_OECONF += "--disable-man-pages"
-
-FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so"
-
-# http://errors.yoctoproject.org/Errors/Details/766882/
-# glade-3.22.2/gladeui/glade-widget.c:1822:36: error: assignment to 'GtkWidget *' {aka 'struct _GtkWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-# glade-3.22.2/gladeui/glade-command.c:920:23: error: assignment to 'GladeProperty *' {aka 'struct _GladeProperty *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-# glade-3.22.2/gladeui/glade-command.c:1253:21: error: assignment to 'GladeWidget *' {aka 'struct _GladeWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-# glade-3.22.2/gladeui/glade-command.c:1419:21: error: assignment to 'GladeWidget *' {aka 'struct _GladeWidget *'} from incompatible pointer type 'GObject *' {aka 'struct _GObject *'} [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"
diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
new file mode 100644
index 0000000000..85f85a4612
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Glade - A User Interface Designer"
+HOMEPAGE = "https://glade.gnome.org"
+LICENSE = "GPL-2.0-only & LGPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
+                    file://COPYING.GPL;md5=4641e94ec96f98fabc56ff9cc48be14b \
+                    file://COPYING.LGPL;md5=81227099add6b483afd7b1d4fc4e93b7"
+DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native itstool-native \
+           gnome-common-native \
+           autoconf-archive-native \
+"
+GNOMEBASEBUILDCLASS = "autotools"
+inherit features_check autotools gettext pkgconfig gnomebase gobject-introspection mime-xdg gtk-doc
+
+# xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
+# cairo would at least needed to be built with xlib.
+ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
+
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade/3.36/glade-${PV}.tar.xz \
+           file://remove-yelp-help-rules-var.patch \
+          "
+SRC_URI[sha256sum] = "19b546b527cc46213ccfc8022d49ec57e618fe2caa9aa51db2d2862233ea6f08"
+
+EXTRA_OECONF += "--disable-man-pages"
+
+FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so"
+
+
+
+
+
+
+
-- 
2.43.0


