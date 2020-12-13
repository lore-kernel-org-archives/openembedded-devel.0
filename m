Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web08.12338.1607819737685532938
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 12 Dec 2020 16:35:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lyDR7yBS;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id v1so4255232pjr.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 12 Dec 2020 16:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J4t0WyExuC/PN/5dz5Yvur5bql1nhZjyfpkWzfVfhGA=;
        b=lyDR7yBSCgKzZ7tmQCi5c/8OBvCo9kCQKwcK5oNbKcT5nDCZu7H8zvlIg66p70m00C
         MFlyIZbMycG6nu6IVB4h0dp9c6iLIVHiuY/bG5vwbhK8wVBZb8HghBgGQcAfg2KCDas0
         2iW8+16lJiuUPNGZmfA4fEOPzMwtollZGlVTRfYCFJ1zMTkkpK+STfp1JyTRzX94lPuH
         t5moZUt213m89CWzdiuoAojr0U7AE8VljtKLcic/qO7eEJKoW/LYXItngLvJAD14uaLp
         bphbKaWLNSyTN3kYJ0kOSHZtTzGbFVx+ggAMa94qNTiODPBWspIi8jJ/6cDZnS76WzUj
         HjFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J4t0WyExuC/PN/5dz5Yvur5bql1nhZjyfpkWzfVfhGA=;
        b=c3w0CB3V0AymJoxBQlM9ojYGC0aJj0ZB1kIJBnEjzFZhW+OkvH+LtqySrP/ygeCNOi
         5MsJdxGiv5U+8GWCPoeYeBKQcJnqBQRRRwRqYBDepfI18Wsy+AMhcGYrX89NdjqW53Gs
         n6oJPUgmqTj0e23hwjjkui3HWjmF+FYRo/tWoBnP9F9bnFmRLY7LwlKNATzqv6OysZcH
         DaQliYaGzVr/VrFas4yE3byQvf1am3YlmhTdTj/cVi2Jqu7wGIFomx4jA2nkknbxvaLi
         1HNZ8//zfkN3n/bfND2x70YyQyA3jmgIWZA7VKCpisoposVu8R6pp6Gd07EQe+KsPYOH
         OhGQ==
X-Gm-Message-State: AOAM5313OFELXQa+tCVDwgD2tkx6g9fBc0VY7NdEQt6RlrFH3KyyLhHx
	qWMz8OS4wO4Rjh7thUehekD1S2BWEVK/kA==
X-Google-Smtp-Source: ABdhPJwNpguipD5Ec1BvoeW0yNarLp0cS8GcFDvdu4TGgUsmGQJvvNMziO2TerhzafY/QBdI6vEsFg==
X-Received: by 2002:a17:902:9a49:b029:da:b3b0:94a1 with SMTP id x9-20020a1709029a49b02900dab3b094a1mr16859364plv.11.1607819736934;
        Sat, 12 Dec 2020 16:35:36 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::5bf5])
        by smtp.gmail.com with ESMTPSA id s5sm14900901pju.9.2020.12.12.16.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Dec 2020 16:35:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 1/2] networkmanager: Fix reallocarray check in meson
Date: Sat, 12 Dec 2020 16:35:33 -0800
Message-Id: <20201213003534.3469717-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../networkmanager/fix_reallocarray_check.patch  | 16 ++++++++++++++++
 .../networkmanager/networkmanager_1.22.14.bb     |  1 +
 2 files changed, 17 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
new file mode 100644
index 0000000000..291424b5b5
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
@@ -0,0 +1,16 @@
+reallocarray() is coming from stdlib.h which maybe indirectly included
+by malloc.h but not on all libc implementations
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/meson.build
++++ b/meson.build
+@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
+ # FIXME secure_getenv check is not useful?
+ config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
+ config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
+-config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
++config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
+ config_h.set10('HAVE_DECL_EXPLICIT_BZERO', cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
+ config_h.set10('HAVE_DECL_MEMFD_CREATE', cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
+ 
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
index 2613076a7e..aa8ab899bb 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.14.bb
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
     file://0001-install-firewalld-to-var-libdir-rather-than-hardcod-.patch \
+    file://fix_reallocarray_check.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
-- 
2.29.2

