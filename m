Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.23730.1591978489523547638
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 09:14:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ll5+f9Nq;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id h5so10323785wrc.7
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 09:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=pANHNligV6E3Q4LLgrmJbwq5GX2WUvqDuvBYhehRHro=;
        b=ll5+f9NqcFRYn3NKBbcMPzjnP/IIYbyGZD8Vgp2rfQHyH+w7LG0OWjbsfQx/XGBWwG
         IW9JoKC0eSi983ply5ZlynCjNgoVcReR8biSyWrf9VH7OhbLQxxDQ/vaDDwxBLRcXjzG
         SccMskSaTUcblGBYzNQOsKS2e7zfbYMXitg4rrhnDUyfImC8KPKG6/KB4StNG6eN9Xn2
         ygKTkY4VsclsUzQm4s77DYPsDbDfd///sC7tQo/TU/YSCKH4VdYeK0lplbEdWkFJlVS1
         spwjwvCuSHnJkww7dpQiYH0K9ppcyXLz8jXGpjHBEblnNbL5dFrNtw0IZ3/6jKGfMnON
         Fg5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=pANHNligV6E3Q4LLgrmJbwq5GX2WUvqDuvBYhehRHro=;
        b=M622rT5ah0+daL1eCJxVfEt5sxJ3qBNwZiUZKkdwhY3iUhRUkv5jhhQu1Cxm7plcxz
         BWxp1m5xFTDXqlWWr9fJNuKE+Z+uv/iC4tl3TbF5MoA8JudMuANVq5B7sL3gDpt94vUb
         38oWu64HP3Zva2E1FsUlXy+eMKQTJIMTuQFRW3dXlCAESKeBP77hujLl2Pa5M66Rs8gR
         IG5EHQJT7HM0lXpZpQ1ny0grxnkxOT9AaV+GIp5PEZ7dH9azHve/q64oHZ/EVbqhJoff
         d1Q2O3gUMAFAqqYn1TCwEm+qBX4Rp9yO1DZUeAHRcMZgQsPVAR20im5rOj4LML4mzVAw
         i6zQ==
X-Gm-Message-State: AOAM531+7tB6tPwNgiaYYFOqqWwSIewFE1wGYyVQLyfkBXNQzoLkspGJ
	GixO89GViu218LuZ0xgy5qTq6rUzhWk=
X-Google-Smtp-Source: ABdhPJwk0qW0NPEOkFnY24yKMlqH7zR7lEv7s+iLhvpOeRKaGQwAa7h1kq+IE5TX5YCPpbq8jbtA/w==
X-Received: by 2002:a05:6000:1003:: with SMTP id a3mr15384191wrx.111.1591978487766;
        Fri, 12 Jun 2020 09:14:47 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id 125sm9858145wmc.23.2020.06.12.09.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 09:14:47 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] libjcat: Add recipe
Date: Fri, 12 Jun 2020 17:13:39 +0100
Message-Id: <20200612161340.7373-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-gnome/libjcat/libjcat/run-ptest   |  3 ++
 .../recipes-gnome/libjcat/libjcat_0.1.2.bb    | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/libjcat/libjcat/run-ptest
 create mode 100644 meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb

diff --git a/meta-oe/recipes-gnome/libjcat/libjcat/run-ptest b/meta-oe/recipes-gnome/libjcat/libjcat/run-ptest
new file mode 100644
index 000000000000..14980a7d06a9
--- /dev/null
+++ b/meta-oe/recipes-gnome/libjcat/libjcat/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libjcat
diff --git a/meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb
new file mode 100644
index 000000000000..10f5a800bd42
--- /dev/null
+++ b/meta-oe/recipes-gnome/libjcat/libjcat_0.1.2.bb
@@ -0,0 +1,34 @@
+SUMMARY = "Library for reading and writing Jcat files"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+DEPENDS = "\
+    glib-2.0 \
+    json-glib \
+"
+
+SRC_URI = "\
+    git://github.com/hughsie/libjcat.git \
+    file://run-ptest \
+"
+SRCREV = "1a509ac60b7446254c3bd1f45ea53e6cffba30ac"
+S = "${WORKDIR}/git"
+
+inherit gobject-introspection gtk-doc meson ptest-gnome vala
+
+PACKAGECONFIG ??= "\
+    gpg \
+    pkcs7 \
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[gpg] = "-Dgpg=true,-Dgpg=false,gpgme"
+PACKAGECONFIG[pkcs7] = "-Dpkcs7=true,-Dpkcs7=false,gnutls gnutls-native"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
+
+# manpage generation is broken because help2man needs to run the target binary on the host...
+EXTRA_OEMESON = "-Dman=false"
+GTKDOC_MESON_OPTION = "gtkdoc"
+
+RDEPENDS_${PN}_class-target = "\
+    ${@bb.utils.contains('PACKAGECONFIG', 'gpg', 'gnupg', '', d)} \
+"
-- 
2.17.1

