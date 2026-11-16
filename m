Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22034.1794808932863950519
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Nov 2026 22:02:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=fwIPaZ+U;
 spf=pass (domain: gmail.com, ip: 74.125.82.179, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3989244eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 22:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794808932; x=1795413732; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1jcdGgrQtB+PNoEmbp8829YsqQXX99ghZEtAO45FMo=;
        b=fwIPaZ+U8/jAaFjqpmSwd3CrVz9ZtXo68cWnlCEjOwbEVSkoJl1lQgbsrtnxsvJiJt
         Uu4gGtHH/UvTn3npyDH1K+GI5IDZ0rpmH8BoBdr9QRszkZ6EgHZLVSMXHu+qPQD/7nYQ
         9EEvrg1E3M97NYGud+GKbwZnhF58W14zig4bp8mqVVD6SL5u0C1byZvPV6BlRwbXUU6O
         m+r4q7o+rqR/uNFHbdhvvfWfPAM/FdPBBi/BpURi+LjOSAIkarWAgQpX7Pr2pJPWQ9LG
         yWRP3BoD8pAh7ASSwlxy8aFkdMLXYBz1X3pbPTXnruLayw0OgTjUi2u7yys/mKvZjt5j
         Bguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794808932; x=1795413732;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1jcdGgrQtB+PNoEmbp8829YsqQXX99ghZEtAO45FMo=;
        b=wfZlUx/I4XoeezJwj5HPLkX6BMwnfFnV6nu8O+Xxv1cqhAo1lcly95ZkDmq9fnjbgW
         KkSgDiWgMSMDRijmHTiOHmWTU+HO6+jxtWdod4TqDhkfFbjnVswLwYj+71rz3NMlJH85
         K6ZaM1zBJnHRaciH9v3ScrUbT6ThJ1Z/NUBHqFXBjrYtLhcmG5I+zBP82uPntgd8qpYX
         VTegXRkGm5i7bjM+a5jqJb0JgCWa44I6FkUC2mUs15ZLtoCecOMcizG72FFq0Ab1/zuk
         nJ7sV/AvGN5Iz6618SRuq3uOy7p1/3RKU/tugSwTeKVVIvU4c8PDimvlrVAGhA+tJA+U
         ZNag==
X-Gm-Message-State: APuU4Z9n+UixGZaLWufafHDO0sikkuq/tBSw3GToQ0yM5qF5fp2Y07jz
	susCyvE/bPrIir+0BIPffXBJ2ftALE3MyKBpQahDPUnbwvkaFumUro4HpB7s0ulE
X-Gm-Gg: AYBFou16dh3kcfuSPKPo9izzXTFbrAbkqfAv4Hb7+4RcZIO6zHktkl+cIXLv8dWrIXc
	AMWc34mTXcwvwBeqtRyQOxozSqUXam//sH/bSuOUoRasP2Cg2gmEd2KLvRU+eABRgIwkxzH8ity
	69hvXZMJJpIQl91UgQ3MDsL8DtVv9vxsPcag0PrbJ76Zwh57b3S8bpjAcQiFEr9xOlNH7WHyeaV
	pTDwVfIEb3wMeZxtvN8rJSCQV9TdJjs9zL0PLxovcWh9xfZw45qLx2aCEEX19Zha4gtiV2PBsUk
	bYSWWLSebDs3j53+3Wsswtaf/+3OOOJU1EZ2H+NFxqjO2sTzvwVTnF4Er88BmcgnO0VpaiR0rN8
	YRGSPIaSNZFpc24kn/sW8jr6Q2iMTGyVCkZwPJKXqjneGPOB7DUNEm9azCC5PMjt8qapjiU9XtW
	ppddnCJfRkZwnjSQf9qId99YJDyj1kW4X/Mx3CIeTJ1GLZiG+IMWwJ7yhmMpNFNrPhutwMpPehf
	qVjyM4J51BtFSQ6Zg8irfaJUmbQjPtszzRsCveXsRzGoxzsroMMeL6IzzZxJbsxv5dfIStiASPw
	zhzv8BHXCzI/EWwh41k5U8vC7r/5RynlTJQ0d8uTQd19u7WhrY+JCrW6r9Hh0xw/GjEwfhETPPI
	dpVGiFZJgxnd0zQkE47Gx+TDEtdV6yorxLqQJ1oR673CRN0EamFBuK4OdL1HiqrGVcSiCAodSl1
	2akP4QC01OiHI/C/WgxLBuHV0Bg6rCx0dXdUI31cQwjhtxX2ZVsSVcHXA3BXFwZ0Kr7JPQW4H4S
	lPDEI1+f7etYAyqVhYopcXALBAmfQ/0hjTJi6CvjvGDIrXIV1c1F74NJnlim2ndwjQZcJ22afPa
	JPzt
X-Received: by 2002:a05:693c:8206:b0:36f:f3b7:6dee with SMTP id 5a478bee46e88-37966e3ab88mr10799866eec.7.1794808932009;
        Sun, 15 Nov 2026 22:02:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379553316fdsm31410262eec.5.2026.11.15.22.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:02:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-gnome][PATCH 01/30] libxklavier: Fix link with lld
Date: Sun, 15 Nov 2026 22:01:39 -0800
Message-ID: <20261116060209.2916444-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 06:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132399
Content-Type: text/plain; charset="utf-8"

libxklavier.public exports xkl_engine_VOID__FLAGS_INT_BOOLEAN, which
marshal.list never generates. GNU ld ignores the unknown symbol, lld
fails on it. Drop it from the export list.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...existent-symbol-from-the-export-list.patch | 31 +++++++++++++++++++
 .../libxklavier/libxklavier_5.4.bb            |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-Drop-nonexistent-symbol-from-the-export-list.patch

diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-Drop-nonexistent-symbol-from-the-export-list.patch b/meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-Drop-nonexistent-symbol-from-the-export-list.patch
new file mode 100644
index 0000000000..c42883213e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier/0001-Drop-nonexistent-symbol-from-the-export-list.patch
@@ -0,0 +1,31 @@
+From 3d64d9c69a92e4f05957e79010ca0be04bd59779 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sun, 15 Nov 2026 17:09:44 -0800
+Subject: [PATCH] Drop nonexistent symbol from the export list
+
+libxklavier.public exports xkl_engine_VOID__FLAGS_INT_BOOLEAN, but
+marshal.list has no VOID:FLAGS,INT,BOOLEAN entry, so the marshaller is
+never generated. GNU ld ignores the unknown symbol, but lld fails:
+
+  error: version script assignment of 'global' to symbol
+  'xkl_engine_VOID__FLAGS_INT_BOOLEAN' failed: symbol not defined
+
+Upstream-Status: Inactive-Upstream [lastrelease: 2013]
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ libxklavier/libxklavier.public | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libxklavier/libxklavier.public b/libxklavier/libxklavier.public
+index 11f27d5..2789e6b 100644
+--- a/libxklavier/libxklavier.public
++++ b/libxklavier/libxklavier.public
+@@ -83,7 +83,6 @@ xkl_engine_start_listen
+ xkl_engine_state_change_get_type
+ xkl_engine_stop_listen
+ xkl_engine_ungrab_key
+-xkl_engine_VOID__FLAGS_INT_BOOLEAN
+ xkl_engine_VOID__ENUM_INT_BOOLEAN
+ xkl_get_country_name
+ xkl_get_language_name
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
index f52c210ed4..d3ca8c4f1b 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier_5.4.bb
@@ -14,6 +14,7 @@ SRC_URI = " \
     http://pkgs.fedoraproject.org/repo/pkgs/${BPN}/${BPN}-${PV}.tar.bz2/13af74dcb6011ecedf1e3ed122bd31fa/${BPN}-${PV}.tar.bz2 \
     file://fix-do_installe-failure.patch \
     file://0001-xklavier_config_xkb.c-Fix-keyboard-layout-settings-f.patch \
+    file://0001-Drop-nonexistent-symbol-from-the-export-list.patch \
 "
 SRC_URI[md5sum] = "13af74dcb6011ecedf1e3ed122bd31fa"
 SRC_URI[sha256sum] = "17a34194df5cbcd3b7bfd0f561d95d1f723aa1c87fca56bc2c209514460a9320"
