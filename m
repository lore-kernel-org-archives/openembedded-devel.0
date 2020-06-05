Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web10.8232.1591354515421123476
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Jun 2020 03:55:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OH3Ot0Fo;
 spf=pass (domain: gmail.com, ip: 209.85.221.66, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wr1-f66.google.com with SMTP id c3so9251674wru.12
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Jun 2020 03:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=eeqbx3g5eODpLEf+pokSQsN3En14ocBC5m+D85DORPg=;
        b=OH3Ot0FoG7V3RZf4zyjdXOv0cd63JEqBXrlDNS8AxIDSK6FHPXHOmoHVKTb7LKv4hy
         z4npEBFnkswl1S1tIYhqHP6dzoYm+3408rGf/+asnV3JTRenB2AXMzUxeebm33oLIFJw
         OSH9SN/SXGI82OtLWOJBq2+Zrw86zFxwcDK3QNyNlFOmdhPTqqBXU84uVvJV0Hj/nEa9
         AOscHwuAtHXfj1iecuuG98NPKL/7cN2Ys74o8WkqyJ0mhU7Bv7SBZssQ6b95norcTY/V
         ZwCEGxBYDLFnKLQU35M3sZqfqBJE5iV72xXOoY+lB7f+xa8qQrAcaqYO5NXL0ZlXnReT
         3akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eeqbx3g5eODpLEf+pokSQsN3En14ocBC5m+D85DORPg=;
        b=A6TVAkvH/RqCJi5q/Z55Bsz5JboXy9y9FThZhXXsgqr9YIO3rD2RTdV+bSrp4tuOAG
         s0M5GSNdmNaR/62Pq859In4uJYI0ZhwUkJ6eX8FngTLgBCWmKKD5nukb6TFUyAHFMoGw
         U5rZLKZP84YvceawXslcIy3QSNY02yI8bZRec367/IRGXFrVJRdD9C8x4YKt5514ZM9k
         zSxADzvDAIrYmkgKa4brlaOv+rxIaFu3I2nli3GAkZiOf6WH2MIhoqTB3r1dneo1uRCP
         6kCFy+wG0B996ykdbvhVGYep+gD/3HJnA/ZDMVAwI/w3jSFJrwo2mwnpkkAWSv0unOe+
         yxRg==
X-Gm-Message-State: AOAM530Qz27nESWj9AKC6laiMR9AsUf0rK0otnS89BAOvCzBjD6I8CFE
	TFC6ln71cJbNazAdGtTvR879MkvD
X-Google-Smtp-Source: ABdhPJwtStRI2mqw2KqcQRJFkGmqx0FJAtkkA44fNVwQCSLAarcfkDYbKQ7XJDELsqonmSIT96fouQ==
X-Received: by 2002:adf:b697:: with SMTP id j23mr9662260wre.201.1591354513574;
        Fri, 05 Jun 2020 03:55:13 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id x205sm11871915wmx.21.2020.06.05.03.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2020 03:55:12 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] libgusb: Upgrade 0.3.0+ -> 0.3.4
Date: Fri,  5 Jun 2020 11:53:56 +0100
Message-Id: <20200605105356.94677-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 ...-script-Don-t-hard-code-the-path-of-.patch | 53 +++++++++++++++++++
 .../{libgusb_git.bb => libgusb_0.3.4.bb}      |  7 +--
 2 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch
 rename meta-oe/recipes-support/libgusb/{libgusb_git.bb => libgusb_0.3.4.bb} (55%)

diff --git a/meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch b/meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch
new file mode 100644
index 000000000000..41e64d7d805c
--- /dev/null
+++ b/meta-oe/recipes-support/libgusb/libgusb/0001-generate-version-script-Don-t-hard-code-the-path-of-.patch
@@ -0,0 +1,53 @@
+From 76c23503ed1002d3aad0118795006fe2128006ae Mon Sep 17 00:00:00 2001
+From: Ting-Wei Lan <lantw@src.gnome.org>
+Date: Sat, 21 Mar 2020 22:13:57 +0800
+Subject: [PATCH] generate-version-script: Don't hard-code the path of python3
+
+Python can be installed in different directories on different operating
+systems, so we can't hard-code the path of it. Instead, use meson to
+find it to avoid 'no such file or directory' error on the bad path.
+
+Upstream-Status: Backport [https://github.com/hughsie/libgusb/pull/36]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ contrib/generate-version-script.py | 1 -
+ gusb/meson.build                   | 4 ++++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+ mode change 100755 => 100644 contrib/generate-version-script.py
+
+diff --git a/contrib/generate-version-script.py b/contrib/generate-version-script.py
+old mode 100755
+new mode 100644
+index c4ee238ab0ab..0fe2b24e47e3
+--- a/contrib/generate-version-script.py
++++ b/contrib/generate-version-script.py
+@@ -1,4 +1,3 @@
+-#!/usr/bin/python3
+ # pylint: disable=invalid-name,missing-docstring
+ #
+ # Copyright (C) 2017 Richard Hughes <richard@hughsie.com>
+diff --git a/gusb/meson.build b/gusb/meson.build
+index 10a6f537a642..28ca3c63e595 100644
+--- a/gusb/meson.build
++++ b/gusb/meson.build
+@@ -142,6 +142,9 @@ libgusb_girtarget = gnome.generate_gir(gusb,
+ libgusb_gir = libgusb_girtarget[0]
+ libgusb_typelib = libgusb_girtarget[1]
+ 
++pymod = import('python')
++py_installation = pymod.find_installation('python3')
++
+ # Verify the map file is correct -- note we can't actually use the generated
+ # file for two reasons:
+ #
+@@ -154,6 +157,7 @@ mapfile_target = custom_target('gusb_mapfile',
+   input: libgusb_girtarget[0],
+   output: 'libgusb.ver',
+   command: [
++    py_installation,
+     join_paths(meson.source_root(), 'contrib', 'generate-version-script.py'),
+     'LIBGUSB',
+     '@INPUT@',
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/libgusb/libgusb_git.bb b/meta-oe/recipes-support/libgusb/libgusb_0.3.4.bb
similarity index 55%
rename from meta-oe/recipes-support/libgusb/libgusb_git.bb
rename to meta-oe/recipes-support/libgusb/libgusb_0.3.4.bb
index e3c0bdd15eb6..bd88c8ed4c3d 100644
--- a/meta-oe/recipes-support/libgusb/libgusb_git.bb
+++ b/meta-oe/recipes-support/libgusb/libgusb_0.3.4.bb
@@ -6,7 +6,8 @@ DEPENDS = "glib-2.0 libusb"
 
 inherit meson gobject-introspection gtk-doc gettext vala
 
-SRC_URI = "git://github.com/hughsie/libgusb.git"
-SRCREV = "636efc0624aa2a88174220fcabc9764c13d7febf"
-PV = "0.3.0+git${SRCPV}"
+SRC_URI = "git://github.com/hughsie/libgusb.git \
+           file://0001-generate-version-script-Don-t-hard-code-the-path-of-.patch \
+           "
+SRCREV = "377917fed85476d615f72279d0c97bc391d0f191"
 S = "${WORKDIR}/git"
-- 
2.17.1

