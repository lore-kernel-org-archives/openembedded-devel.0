Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web12.23697.1591978390309604713
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jun 2020 09:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uzWPOS8g;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id c71so8669910wmd.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 12 Jun 2020 09:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=3Ezig/LEvNf05s/k12Cd3vPFeJdgm2+MBOdYTqaXIhM=;
        b=uzWPOS8g0tvvFdwzv++gzcY5LRYZMmH5A+Bsdooq1DcipCZkPorMnijxpphaojgUeu
         EQzDtFfdwRfn4zhjLkvy7Qcg9Sl70xtEt0dU3BmlfLSWl5OCus30wctupmFDdOx3ZOn7
         xNjYAGtimaFAkwo36s6hbbeHD4EV4tb3AIPKYtjYT27kDIZi2BOyBr1RLK6JCb6dfKz/
         sw8frWBzBGbE+v67Fomhp5rTPQ7o0h0vxiVBaZ9faXaQhcnf+5+dNcxlJVCqhzjDwSTN
         9GU6snHto+zBlqdlzWCOwmDwtHFdkrBC873BYGHmW5JEPsp4OQtOuds3/tzHoeN9Wg5Y
         3Eyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=3Ezig/LEvNf05s/k12Cd3vPFeJdgm2+MBOdYTqaXIhM=;
        b=Hrkjc0XWdlsAXIVSuB2mbe47ONZntbehIEOo99G1SVpl41YVCv9rJ2/vw7hthSHpOf
         MtTPOPQK/N3Aj4chPHAOYBETA85Cr7nPBp1zEmEEjzQaRnp1l4EJdRkeooaghyx52J4s
         bv4cjWF10i3Siw0HBTgQvP/IMgEfC/pK3lXl59kKOg4VnQGw29jKJGnBOU6H2c0PIaMA
         zncE2pAqGhSdKOgHBMiw/S90vV3TC0KVg5dcQTAVRGZq+3SbBFq0mLiDUq8KUaPPoPht
         k8k5rEGbqll9x8pODGyG42WmI+TBXcaS2cMQuVAI7VqvKOGgxTeSoXx7CyzUoX7puh94
         pq7Q==
X-Gm-Message-State: AOAM533velcckWZyex9iVkdqbBj0SMjMHBQoxtAYjyXQF9J0criLH6v9
	wvpzDWDYgZwIoqeSjDHKGsloGHzWWPU=
X-Google-Smtp-Source: ABdhPJzbt1jVnQg/r3hxPBrklBdQuAy7jPv1CojYmrti1LSXGz4u5vtOUf9hn+DOPZXLLKm9SeKfdQ==
X-Received: by 2002:a7b:c385:: with SMTP id s5mr15057105wmj.121.1591978387642;
        Fri, 12 Jun 2020 09:13:07 -0700 (PDT)
Return-Path: <alex.kiernan@gmail.com>
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net. [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id u7sm10933134wrm.23.2020.06.12.09.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2020 09:13:07 -0700 (PDT)
From: "Alex Kiernan" <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] libxmlb: Add recipe
Date: Fri, 12 Jun 2020 17:11:58 +0100
Message-Id: <20200612161158.7296-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 .../recipes-gnome/libxmlb/libxmlb/run-ptest   |  3 +++
 .../recipes-gnome/libxmlb/libxmlb_0.1.15.bb   | 19 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
 create mode 100644 meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb

diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest b/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
new file mode 100644
index 000000000000..6d0bb95d3aec
--- /dev/null
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb/run-ptest
@@ -0,0 +1,3 @@
+#! /bin/sh
+
+gnome-desktop-testing-runner libxmlb
diff --git a/meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb
new file mode 100644
index 000000000000..c545993174de
--- /dev/null
+++ b/meta-oe/recipes-gnome/libxmlb/libxmlb_0.1.15.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A library to help create and query binary XML blobs"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
+
+SRC_URI = "\
+    git://github.com/hughsie/libxmlb.git \
+    file://run-ptest \
+"
+SRCREV = "ee4aafdd97844f1c73021a4978a43460f0835d5c"
+S = "${WORKDIR}/git"
+
+inherit gobject-introspection gtk-doc meson ptest-gnome
+
+PACKAGECONFIG ??= "\
+    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+"
+PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
+
+GTKDOC_MESON_OPTION = "gtkdoc"
-- 
2.17.1

