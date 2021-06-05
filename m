Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.11474.1622894996970882261
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Jun 2021 05:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FXSpv2Fr;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id g8so18631139ejx.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Jun 2021 05:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2fmWzAGbYgX1o3fkfKCByAk+TjBJpOfMS56ybvFIE8=;
        b=FXSpv2FrxlhzCsLGpwTg4JHX6sZ78rxi8oKmndv4J2NT4DiI/lPlrtUQlCWxq4z0oS
         SY66wUF87YrW87GA4I30qFjiFtOr/8kXl/Diw0DU/3ofQ9zXJQKWaCqKlbBhr4s2OcEd
         QKqI3qyvRv0kH6sgCA702Xh0YOc59eFc+6DxD33+89EMmXIE5CNs2qirY5jCN6ZmV/0q
         ka1ggC+1D6uTq+EVXB3MZHGv/hN7fNXJWRIv8tFT/11nFWWTYyb2KVgcp4FRMwiwr3Qi
         74PG52UynsCTqJodBUkbVW4hUmFxSSFj/decDBEBRKBQ8Pkb82WofNGgjupqItq1+q88
         9Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2fmWzAGbYgX1o3fkfKCByAk+TjBJpOfMS56ybvFIE8=;
        b=TB3x2a9aNAhiCgWT3SfQDqUcM7916eTbynILsH9L47/VQfF0wNdOXHs4rgLghqKqeQ
         JKjGdk9x2jBeM3PFYRHTKckgfIo3t2D8dlrORBVueBFiVuIQ+Xd3i48WDFHtFC31NZ6W
         7p2aoHB78GlKW9Kj1FCvfeen2cZSic9QzY8GSy1D27Wk4GBUUrSYvSGukqid1rOdDNKD
         Z6RXT+kUrxAf/9XiW6zk3yquFlB+I+/EZs7FDgXk/lVAStj+6bFm9YXOgXWT/VCKefyW
         ESZY8OPeck56g28kJL5tvAWEscoZpQpZONRWHoDPIUZBsWygorribd9YFDG3Re0tP4cp
         rpvQ==
X-Gm-Message-State: AOAM5302ejXT2kO/Ey0Sg9iQe0uSLg+UiB3UhR6k3DDVu/odEgKcovYd
	cd50oKjn2kV/psvT+CaYFslX2GXiDrKqJQ==
X-Google-Smtp-Source: ABdhPJzVa9is0+dwhB3ALSytHZoUx2jz4DY2EaQubbpCIjQkcQcNaDPaDCPOlQ2Uf31ZusCtLDa1vg==
X-Received: by 2002:a17:906:b191:: with SMTP id w17mr9044337ejy.200.1622894994707;
        Sat, 05 Jun 2021 05:09:54 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from thanks-buchmuellers.speedport.ip (p200300f07f11f861d707ea86d7bc33dd.dip0.t-ipconnect.de. [2003:f0:7f11:f861:d707:ea86:d7bc:33dd])
        by smtp.gmail.com with ESMTPSA id d25sm3994489ejd.59.2021.06.05.05.09.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jun 2021 05:09:54 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/5] gnome-disk-utility: upgrade 3.36.3 -> 40.1
Date: Sat,  5 Jun 2021 14:09:38 +0200
Message-Id: <20210605120942.1080733-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ome-disk-utility_3.36.3.bb => gnome-disk-utility_40.1.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-disk-utility/{gnome-disk-utility_3.36.3.bb => gnome-disk-utility_40.1.bb} (84%)

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_40.1.bb
similarity index 84%
rename from meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
rename to meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_40.1.bb
index 1045dea25..869f820fa 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_3.36.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_40.1.bb
@@ -12,11 +12,12 @@ DEPENDS = " \
     libsecret \
     libpwquality \
     udisks2 \
+    libhandy \
 "
 
 GNOMEBASEBUILDCLASS = "meson"
 
-inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-version-is-even mime-xdg
+inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 polkit"
 
@@ -25,7 +26,7 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
 # As soon as elogind is of interest this needs rework: meson option is combo
 PACKAGECONFIG[systemd] = "-Dlogind=libsystemd,-Dlogind=none,systemd"
 
-SRC_URI[archive.sha256sum] = "dd033d3f36ab070bc72317cf3045e5b4927765543f1bce7612b2c7f96595167a"
+SRC_URI[archive.sha256sum] = "2a4b99ac11ca23394b28c5584b9e96284e8c5a4da65cf06207de54f42b1ff141"
 
 FILES_${PN} += " \
     ${datadir}/metainfo \
-- 
2.31.1

