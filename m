Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web10.21724.1590356936881849088
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 May 2020 14:48:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tsAjKfSg;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id se13so18647072ejb.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 24 May 2020 14:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZwaS1ZElETi66hg7kbTORMATMZMB0DO0lkpKQ2V0MY=;
        b=tsAjKfSgvDKYzceXdthblmEbeU8AEZ833Otso7rNTPb1m1d28g6MD2kO+qeuDdkxrA
         6ULI2OCBuTx8t8PHQkj99c+KhDxJT+akaUvZ84rzPNzLN9vvLJevZTy38OK07hHXQsVO
         UaQgsnbKLo6i1izpVRP0AAGDDbaCXZH+ZX1Bbc8kXlD86inyoH9lx4A+ckys69x9FS3O
         gbfR6jDvwC8Ync/WlSNLVtosGk/Sl4AMjXkRVSDaNUf999jLg1R2mIx/05uIui0GFTE+
         xtmCYxK/eUDmJfGg53mO8KS4roXOV8dgWb8yrd/UuGTIi0y0jsTYRS9j61zWZE//U5pR
         bOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NZwaS1ZElETi66hg7kbTORMATMZMB0DO0lkpKQ2V0MY=;
        b=DJsyCXep0/9QCQuaCI33MjTT3t2rkhBfrhxPJTUuQrxyRxaQq2mf/Y6Cz6+fF0Rz86
         a0bQch61A+Cdiv2YVZklcIr75PSoPQRu7lkX5VATZQZppLxUywqIODeWAgV8/qHcOQTf
         DvGgNQgU+OUcTAf1Z5sGbiCBsB35JSPsjR3b2fBwwDEk+rhVZEVPxRbya0iZr0gmliB2
         XZRLUXEHu4uqL506V+tqYQe3GeJNGCODKmpOVZapWAoBrbOQmoUa2tZDcVKTFH7Pyqs5
         IbZ6P1Eyn+UMi1jGj5cQRCoslpvRbirWOodCOUttIJf8reVQshY7R5kdmcdsKl0Q0tjL
         A+Kw==
X-Gm-Message-State: AOAM531exoEN2dH9auftLhPgckmHzumcarh57xH1cVj8+xWLnQZkCEm3
	U5i2Lu8yeMoV1Lo5cR9niHPqIv3B9jg=
X-Google-Smtp-Source: ABdhPJzneI2HfEUO7l2HkzTFwe194H7tufyYOR7HkLgtF4e1XKQfRVTkSoRwN0EJePr8beRrOfyVOA==
X-Received: by 2002:a17:906:f06:: with SMTP id z6mr16446006eji.105.1590356935016;
        Sun, 24 May 2020 14:48:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f480647c75077471d25d12a.dip0.t-ipconnect.de. [2003:f0:7f48:647:c750:7747:1d25:d12a])
        by smtp.gmail.com with ESMTPSA id z7sm3092092edq.38.2020.05.24.14.48.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2020 14:48:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/2] gexiv2: upgrade 0.12.0 -> 0.12.1
Date: Sun, 24 May 2020 23:48:41 +0200
Message-Id: <20200524214842.30763-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

gexiv2 0.12.1 - 23 May 2020

 * Support macOS dylib versioning
 * Improve compatibility with current exiv2 development versions
 * Fix compiling on windows
 * Fix issue with problematic symbol visibility of exiv2
 * Fix issues with tests overwriting environment variables
 * Fix exception escaping on division by zero
 * Fix overflow in altitude fraction conversion
 * Fix crash with experimental GIO support
 * Documentation fixes
 * Add gexiv2_metadata_update_gps_info which will not remove all other GPS
   information

Bugs fixed in this release:
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/41
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/42
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/45
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/52
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/53
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/54
 - https://gitlab.gnome.org/GNOME/gexiv2/issues/55

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../gexiv2/{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gexiv2/{gexiv2_0.12.0.bb => gexiv2_0.12.1.bb} (69%)

diff --git a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
similarity index 69%
rename from meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
rename to meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
index 458eaeaa1..12ea5938c 100644
--- a/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.0.bb
+++ b/meta-gnome/recipes-gnome/gexiv2/gexiv2_0.12.1.bb
@@ -9,8 +9,8 @@ GTKDOC_MESON_OPTION = "gtk_doc"
 
 inherit gnomebase gobject-introspection gtk-doc
 
-SRC_URI[archive.md5sum] = "0a618c5b053106d1801d89cc77385419"
-SRC_URI[archive.sha256sum] = "58f539b0386f36300b76f3afea3a508de4914b27e78f58ee4d142486a42f926a"
+SRC_URI[archive.md5sum] = "44a3cfeab1afd83a71e852835d24e656"
+SRC_URI[archive.sha256sum] = "8aeafd59653ea88f6b78cb03780ee9fd61a2f993070c5f0d0976bed93ac2bd77"
 
 EXTRA_OEMESON = " \
     -Dvapi=false \
-- 
2.21.1

