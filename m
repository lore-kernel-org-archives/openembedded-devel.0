Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web10.4381.1623220737988462140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 23:38:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rKYOOXA0;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id dj8so27435541edb.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 23:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=6yEbRYQW9sZfGQyg5MMUbY+qBc6oxMPEro5wHZMe8QA=;
        b=rKYOOXA0rMXyOKmILIlxCRHMlcYCSDrbopMuZKQ3sxKu6mlxYMtLIHksZ/+9xLxZWK
         /B3zTp8Fr5guaQRUcESEhykE5e5oPNydjy31EjnVt4IFGIGWnOfKpSxQBlDpiWY7h0En
         7pCWF7d2nWC5oJiVGRDvxzbbAvQbafABuJ1NDte6/z8ShOEb5cnXqiJjSCDKjTZJPoZp
         QHcQdcmThO8cVlrLRW8wKwYiNxfd6Ja4QPyUR57fzQk/JHxlYITwmgPY4r2c2p8kPTqa
         6tgpc7YCPykH6NHJ1/BEbDbNdozPqitGK5PUKnyUms/LOm29wzW1IsoFjU3UDyV3LqWh
         8kog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6yEbRYQW9sZfGQyg5MMUbY+qBc6oxMPEro5wHZMe8QA=;
        b=SgGtbKxb+XV5Jv1cdBIgOUh1mcL91O5paeiV/up9LFDYP7bRpeMOCMkLAnrd41kuc7
         BnmFhTZIu7EfcuivtbO51cmW42zCYg6tb17Og7kpy8hHvYnhQJfIvGZmsZcZxCdGDUV7
         V5Hj3G/m2eHiXUEkkFrB4eMvxtyh3Uw0Js2ZYVJKZ4mDIu4YH4UJAanD/b7CmU1E9v8Y
         +nKTAsJEEFfDqyQ7oB24YoM9mw8nYrNA/vbOxI+eAJwHnYJeiyGjbkSrixE+LA5bDf40
         BjYYBfvlpZRFsAxPfEVIq6MhAO6oFRzoY+/VVLgPJdBsqUHyEhrpKDSf+SIvHbpHktDF
         8u4g==
X-Gm-Message-State: AOAM532kZZo7KuyCagSaCBRj6E3EWGX5mN6v5Y3sEWzLHjbykfPnZOPH
	+9vz3ZBWGaE5+nwerqIBm1SlbYtFGCzF7w==
X-Google-Smtp-Source: ABdhPJyRn6d2UhubBlegu4nEdBUnkZQXOCnddX1ozkHDL4iVXtbW7MX7a8UyShd2Za3ag6klxmsBIA==
X-Received: by 2002:aa7:d555:: with SMTP id u21mr21225776edr.84.1623220736567;
        Tue, 08 Jun 2021 23:38:56 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f297e89b85a8a6897bdbe62.dip0.t-ipconnect.de. [2003:f0:7f29:7e89:b85a:8a68:97bd:be62])
        by smtp.gmail.com with ESMTPSA id o4sm690810edc.94.2021.06.08.23.38.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 23:38:56 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 19/28] libmediaart-2.0: upgrade 1.9.4 -> 1.9.5 / merge inc file / build with meson
Date: Wed,  9 Jun 2021 08:38:22 +0200
Message-Id: <20210609063831.3400611-19-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609063831.3400611-1-schnitzeltony@gmail.com>
References: <20210609063831.3400611-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

NEW in 1.9.5 - 2021-05-22
=========================
  * libmediaart: Remove QT4 support
  * libmediaart: Mandate that input strings are UTF8
  * extract: Remove local storage
  * build: Drop autotools support
  * build: Update to recent glib API
  * build: introspection fixes
  * build: Added CI

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libmediaart/libmediaart-2.0_1.9.4.bb      |  7 ------
 .../libmediaart/libmediaart-2.0_1.9.5.bb      | 23 +++++++++++++++++++
 .../libmediaart/libmediaart.inc               | 12 ----------
 3 files changed, 23 insertions(+), 19 deletions(-)
 delete mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb
 create mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
 delete mode 100644 meta-multimedia/recipes-support/libmediaart/libmediaart.inc

diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb
deleted file mode 100644
index 56a7873fc..000000000
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.4.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require libmediaart.inc
-
-SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
-SRC_URI[md5sum] = "9b960a6a764fba38135fb57219f2e6b4"
-SRC_URI[sha256sum] = "a57be017257e4815389afe4f58fdacb6a50e74fd185452b23a652ee56b04813d"
-
-S = "${WORKDIR}/libmediaart-${PV}"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
new file mode 100644
index 000000000..31fe43bfa
--- /dev/null
+++ b/meta-multimedia/recipes-support/libmediaart/libmediaart-2.0_1.9.5.bb
@@ -0,0 +1,23 @@
+SUMMARY = "Library tasked with managing, extracting and handling media art caches"
+
+LICENSE = "LGPLv2+ & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
+                    file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
+                    file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
+
+DEPENDS = "glib-2.0 gdk-pixbuf"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+inherit gnomebase gobject-introspection vala features_check
+
+SRC_URI = "${GNOME_MIRROR}/libmediaart/1.9/libmediaart-${PV}.tar.xz"
+SRC_URI[sha256sum] = "07def5a42c482ae71d3e1f77a4d0fdc337f74226059a65284d6d5a241f0e9cd6"
+
+S = "${WORKDIR}/libmediaart-${PV}"
+
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST = "introspection"
+
+EXTRA_OEMESON = "-Dimage_library=gdk-pixbuf"
diff --git a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc b/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
deleted file mode 100644
index c7b368de3..000000000
--- a/meta-multimedia/recipes-support/libmediaart/libmediaart.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-SUMMARY = "Library tasked with managing, extracting and handling media art caches"
-
-LICENSE = "LGPLv2+ & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
-                    file://libmediaart/extract.c;endline=18;md5=dff2b6328ab067b5baadc135f9876c36 \
-                    file://tests/mediaarttest.c;endline=18;md5=067106eaa1f7a9d918759a096667f18e"
-
-DEPENDS = "glib-2.0 gdk-pixbuf"
-
-inherit gnomebase gtk-doc gobject-introspection
-
-EXTRA_OECONF = "--disable-qt --enable-gdkpixbuf"
-- 
2.31.1

