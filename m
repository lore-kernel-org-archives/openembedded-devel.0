Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E050C5DF70
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:47:11 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24530.1786747625830265808
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=f+7k/Sr5;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3856d6fbcb3so1466682a91.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747625; x=1787352425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKvDGv8/S0tmcdFLh/KjSU6yNANaZGcbtw6B2BznJro=;
        b=f+7k/Sr5PpPlt9OEygsGjk4gXZrb37QUnNGLYW2gWf6GxNKFD0I+1GfLkRbkomJ6zj
         q6BXvKy3fMGw0CS31abUCdn9JGlJAKD50C0VSplIIXScbilR1OBFATwnZ6lVw+bpS17E
         ytOOpr1QghaysPgvperbmBjCUGWQRvl5xsdaoyRPuYTvqDzQ+v3x5Mvl05p5J9VWgRFs
         XpW060iicg+/zBxkFB2djLffFTtZNaOJ/RS6kJq0HIwDovJQgVamMRsWs5KeGoR/sYCZ
         vtq1fA+9ZoEkPHwX2ftCDL0+BwyzfoV/TVcYqe52W6CNLwDfxjYNLPb9rl3wuAX2BL6C
         CKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747625; x=1787352425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKvDGv8/S0tmcdFLh/KjSU6yNANaZGcbtw6B2BznJro=;
        b=qMLAEk/pxCdwRdFC2IVV6Jv0Wym1cKfPuuQ9f9InPM/zd/PKvQSmJ0YXHdp5yhA2Hr
         olT9Qt6f1LJPlDKSndheLmCFCgSJY6KBTU57keSDYIHUK175A3WtE2v1C5jjA4OGocyM
         LJUe+gSiiImD0PXOekuWYLkO1O/izlelhdfgJsKi1HFekFsdgT7ujRiSBLGX9TTABELv
         q2uxdk3xrWh74plDJ5ISUY3mw6c28SER9BrtceqjAynTZpbzpFGCXZMZ9HcZjTIQTFd0
         FZDk00lbYoTc9QRW5ikGOrHy7zdBPKXohLOAOtIYIhtrk1M20RqiJy93BZsULEw4tCO9
         U4XQ==
X-Gm-Message-State: AOJu0Yz5/eD0DJyJ7LZWTIM6I5DuvH93c7OOoYQMaxDqoqOaqQyGDjZn
	F3BpPumraq/W2IE6Oy1ZiOU/Al6kTA7w+wCKLL/ieXJUhYl7Sj4vtpl1gVlT/dB5
X-Gm-Gg: AR+sD13D+kxwSq5molqOdvw8WmMB6G9tDgYcokR48QVbs0/ayD45Hf6qtKkoJmOS08P
	t3P84FrHFDlcVWsW1qietGnNDSyx0orqHrlxxSMOiwvs7ihXvszsHuVvAcWWZE23xJ7OkaWH0Fi
	W1uEgt7wNmlv1URy0vcBUZ/Nksex4joj/0YU5SIBvobMF6S/88cGVPnRk+jywHFIBBgXMgS/GGm
	wkSMSIqbXmIi3i0ma9E5EeTOsBVYMqQ7GlD+406mymCRu2h1oxExSOg8VF7KgKAEMQ1W/vf82QP
	A7+xn7vhzP3ffPKXjYRlUcex44ZBJHqY2REjXHBMz2GwpgPMTBeNUzblbk2D8S9z5Xhy4ORpLfp
	dtjQwn1JCXbyWsezsOg3IktGIJ8d1ExdP9NspJJDul1qalXDVjskbRpnQBGK3OZL/XzL2634rTl
	SOemMermbpLWon4Pj5ZHk5AB3JR5NrXqlVtogM8REVIYGn9XcPsQanlSGB2WlsUtT13rBkeCJRR
	fav5qnzuXTDcu6QkuJd9jKOFO9pQXJ6FutTjHuBgWtgpvHH6KZJUVLvD6RVjD/ZTKtydM22mqnG
	AbKgAw0DhWFgOA/GnLA/COFEp8KWHXM40tQMwIs6DZEc0ATA5lZuYx4LFCpGn3UdPbWJZz072OM
	Vj74Wdg47BDas79haK5MadpO3aCS0Ir7EnVsbGSGUUkXDdg==
X-Received: by 2002:a17:90b:2d92:b0:36b:77b9:5c8c with SMTP id 98e67ed59e1d1-3933babae61mr10881149a91.17.1786747625092;
        Fri, 14 Aug 2026 15:47:05 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:47:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 074/109] glade: upgrade 3.36.0 -> 3.40.0
Date: Fri, 14 Aug 2026 15:45:00 -0700
Message-ID: <20260814224539.1523174-74-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:47:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129138

Minor release. Two recipe-side fixes needed for the new meson.build:
3.40.0 renamed the "docs" option to "gtk_doc" and dropped "introspection"
entirely (introspection is no longer optional), so gtk-doc.bbclass and
gobject-introspection.bbclass are repointed via GTKDOC_MESON_OPTION and
GIR_MESON_OPTION rather than guessing at PACKAGECONFIG. 3.40.0 also ships
new /usr/share/help (translated user docs) and /usr/share/gettext/its
(catalog ITS rules) content that the old FILES:${PN} didn't claim, added.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../{glade_3.36.0.bb => glade_3.40.0.bb}      | 32 +++++++++++--------
 1 file changed, 18 insertions(+), 14 deletions(-)
 rename meta-oe/recipes-devtools/glade/{glade_3.36.0.bb => glade_3.40.0.bb} (42%)

diff --git a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb b/meta-oe/recipes-devtools/glade/glade_3.40.0.bb
similarity index 42%
rename from meta-oe/recipes-devtools/glade/glade_3.36.0.bb
rename to meta-oe/recipes-devtools/glade/glade_3.40.0.bb
index 57f0fe0aa8..140b6637a6 100644
--- a/meta-oe/recipes-devtools/glade/glade_3.36.0.bb
+++ b/meta-oe/recipes-devtools/glade/glade_3.40.0.bb
@@ -8,26 +8,30 @@ DEPENDS = "gtk+3 glib-2.0 libxml2 intltool-native itstool-native \
            gnome-common-native \
            autoconf-archive-native \
 "
-GNOMEBASEBUILDCLASS = "autotools"
-inherit features_check autotools gettext pkgconfig gnomebase gobject-introspection mime-xdg gtk-doc
+inherit features_check gettext pkgconfig gnomebase gobject-introspection mime-xdg gtk-doc
 
 # xfce4 depends on libwnck3, gtk+3 and libepoxy need to be built with x11 PACKAGECONFIG.
 # cairo would at least needed to be built with xlib.
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI = "${GNOME_MIRROR}/glade/3.36/glade-${PV}.tar.xz \
-           file://remove-yelp-help-rules-var.patch \
-           file://CVE-2020-36774.patch \
-          "
-SRC_URI[sha256sum] = "19b546b527cc46213ccfc8022d49ec57e618fe2caa9aa51db2d2862233ea6f08"
-
-EXTRA_OECONF += "--disable-man-pages"
-
-FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so"
-
-
-
+SRC_URI[archive.sha256sum] = "31c9adaea849972ab9517b564e19ac19977ca97758b109edc3167008f53e3d9c"
 
+# Man pages are generated with xsltproc pulling the docbook stylesheets over
+# the network, so keep them disabled like the autotools build did.
+EXTRA_OEMESON += "-Dman=false"
 
+# 3.40.0 renamed the docs meson option to "gtk_doc" and dropped the
+# "introspection" option entirely (introspection is no longer optional), so
+# repoint gtk-doc.bbclass at the new name and tell gobject-introspection.bbclass
+# not to inject a -Dintrospection flag that no longer exists.
+GTKDOC_MESON_OPTION = "gtk_doc"
+GIR_MESON_OPTION = ""
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[gjs] = "-Dgjs=enabled,-Dgjs=disabled,gjs"
+PACKAGECONFIG[python] = "-Dpython=enabled,-Dpython=disabled,python3-pygobject"
+PACKAGECONFIG[webkit] = "-Dwebkit2gtk=enabled,-Dwebkit2gtk=disabled,webkitgtk3"
 
+FILES:${PN} += "${datadir}/glade ${datadir}/metainfo ${libdir}/glade/modules/libgladegtk.so \
+                ${datadir}/gettext ${datadir}/help \
+"

