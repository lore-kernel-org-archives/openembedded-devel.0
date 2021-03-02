Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web08.1648.1614723354335691694
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Mar 2021 14:15:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EgAE9IA4;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id i14so2860283pjz.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Mar 2021 14:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TubTDY/WUZW7xrIzGve8WGlpyWMi+7uafXsBSuQSQio=;
        b=EgAE9IA4wJ0T7tLyohX9Afs+3rqQ6XFfnp8/F7js4G7RUIPZnZMZSNcNjmBuJ1+Pgg
         JZsA8mRKYt19QFaRAlXIXpM4KDcoczhMRzcVZlftl+yER16jhMoavvMbCnMXI4MwTni7
         5CzFMQ2UiY/FC9uR/S8h0cygOSQ1vkl/dEtIPlOw8ZzlzhhtUIknCrWte0+9M5uFyF4W
         NzAMeVlHqM1PcSNaXtXOxO5iZl2T1A4TmG4czFiZnHpr78EGZPv3PR2wmcnyXog86K7T
         3iJnYC6uM4+n/dU7x7E0BV0gH3TBB+B3zWPifA7DrLEGKQJ4etoiXTcbF4T8Me6jyrHQ
         Xf9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TubTDY/WUZW7xrIzGve8WGlpyWMi+7uafXsBSuQSQio=;
        b=h+c0wIEjPsUb4ZeXAwMYcKeTdyMMsrzBPQJVMfXAGEdyJyLiOyyEEns/4o1FXTMalD
         erQXiQKVi5agFeyLt1YSymgBCTwiXXqTp0auxtKJ01p0uZTtnfDk7k6oPmlLbpoEm3cA
         0gwT6yoSKP3+yKsRgSDWad9z1Rg9T/iTUeySx83CeujWGkrxNYEx51bJR24Qk1/gAMzI
         PR9jg0QaZc0ZMjxrepqb/FhYS4hdOACoXR13CtqHfyZlKEdBQH/sXtQMhLeFrGWiJz+s
         RnuRMReG/KQr5SvK2GbgI3FPY+si7QRPsLgzMaqqxppLz8FLf9K1RWbSGfKVkELLeXOj
         f/4w==
X-Gm-Message-State: AOAM531TBR7lUKoTjaz4XK3BxBIEtdnfp1u8Sxj8GQXiVV4yL+3NDoDs
	fBqSvPoLb82/46QsSJRyZvWCNAlzL/zj7g==
X-Google-Smtp-Source: ABdhPJx6+cFyrS4PWSowgG0A7J2NPUaZCKXSIbnvA/LUXtEZWlkR/KrIWVOeHzH3RRQX45fo5NHUJQ==
X-Received: by 2002:a17:902:ee0b:b029:e4:8ef6:5d1e with SMTP id z11-20020a170902ee0bb02900e48ef65d1emr91619plb.78.1614723348228;
        Tue, 02 Mar 2021 14:15:48 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b3bf])
        by smtp.gmail.com with ESMTPSA id i13sm21295617pfe.46.2021.03.02.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 14:15:47 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
Subject: [meta-gnome][PATCH] nautilus: Drop use of volatile
Date: Tue,  2 Mar 2021 14:15:45 -0800
Message-Id: <20210302221545.1499097-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

volatile qualifier has been dropped in gcc11

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 .../nautilus/0001-Drop-use-of-volatile.patch  | 32 +++++++++++++++++++
 .../recipes-gnome/nautilus/nautilus_3.36.3.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch
new file mode 100644
index 0000000000..46831429d0
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Drop-use-of-volatile.patch
@@ -0,0 +1,32 @@
+From 9ab5acb902a38b420592931ec9e46ccd0624035a Mon Sep 17 00:00:00 2001
+From: Ondrej Holy <oholy@redhat.com>
+Date: Wed, 13 Jan 2021 13:22:58 +0100
+Subject: [PATCH] Drop use of volatile
+
+The `fedora rawhide` CI job currently fails because of usage of the
+`volatile` qualifier. Let's drop the `volatile` qualifier as it doesn't
+help anyway. It was dropped in GLib as well, see:
+https://gitlab.gnome.org/GNOME/glib/-/merge_requests/1719
+
+Fixes: https://gitlab.gnome.org/GNOME/nautilus/-/issues/1741
+---
+Upstream-Status: Backport [https://github.com/GNOME/nautilus/commit/9b733dd9df9d6d9805c56749d05ada15a7560ef4]
+ src/nautilus-enum-types.c.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/nautilus-enum-types.c.template b/src/nautilus-enum-types.c.template
+index 00155ca..9d8ac83 100644
+--- a/src/nautilus-enum-types.c.template
++++ b/src/nautilus-enum-types.c.template
+@@ -13,7 +13,7 @@
+ GType
+ @enum_name@_get_type (void)
+ {
+-    static volatile GType type_once = 0;
++    static GType type_once = 0;
+ 
+     if (g_once_init_enter (&type_once))
+     {
+-- 
+2.30.1
+
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
index fc9ab379d8..cf138d9739 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_3.36.3.bb
@@ -17,6 +17,7 @@ DEPENDS = " \
 
 inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check upstream-version-is-even mime-xdg
 
+SRC_URI += "file://0001-Drop-use-of-volatile.patch"
 SRC_URI[archive.md5sum] = "c3c8dbb90d8eeed6c127aa568e131395"
 SRC_URI[archive.sha256sum] = "b6cafc7ab1e70a64383de391b6097fcccbf36b208f8502d8c46423224fd30ef8"
 
-- 
2.30.1

