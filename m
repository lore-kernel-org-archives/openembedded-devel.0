Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web12.941.1586895477358750848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Apr 2020 13:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=C+ogATE+;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: schnitzeltony@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id u13so15567960wrp.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Apr 2020 13:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+MU1BhkvbMHLsV5xR2tPkwQb7CjYf2Z0OP2r7v1Gpxs=;
        b=C+ogATE+SfBWarxX3i2TDOUCdCCglbIrQqpT2pntXnH8c8IGcl5tvgvOOH9rc+FHlI
         XWFYffh+4f3KfYzKmH/Bf0XKOj31MCHpdy7sN+XJBotmVObFl8C+VmIyGsdICKqc85Mx
         4oPAxYy/KYQNd7tWIX6eEKZi7nNBO+RVs+I54Qg28w4I/RbngFOFfXUX0Lv34DpPLqjn
         ytA52a9Dx1wp+08czO/Oi00orJpwVhrteMF7khyhrP1tdyc5o3ssSgaPJ3IIDfNRRput
         WxifTDNwjDvocBJ/hIdi4M+Dj7SCR0lDlZKfKDT5iKonbrC5CaczazM935pvXUTJ8pWk
         JWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+MU1BhkvbMHLsV5xR2tPkwQb7CjYf2Z0OP2r7v1Gpxs=;
        b=lyqkyNXUduIwNSQZBZ4PS9x9HkCbQxcWhRur8CIHLGoNmc3L4oFHbUmOLVYnOzCnNL
         eNP31U54RRirKw+ZzyUmkjx7FSRgPqNLcKaIlhFr804rY0WjVKfKh92VA3E2eFqhpR6h
         1HCN4oEYRflvW9q8guqunFnbwzNmIRlC5RreDhUjufqmn+nnOHrbf4ExSSIviQaY+FYU
         ARZGFokNNUWpHMrpxeF25rZloMbT7mW/PkfyMw1owcZ6S2DGezWhxuV/J6iFFzXhlCWP
         Kh3Ji9lvydFsSQKmyjUgFBlFjQRpUo5UxLlQCUADKKDCkaALT2ib53xqhIyd9ohcuq5W
         UtrQ==
X-Gm-Message-State: AGi0Pua8gXYIM8N/NIU+fPa7cY0W14r9Ktlq5Sh6pZvH5XaZGCIOv0aW
	adGTjZdZZj1XBJ6Gcq1QkzegUYmHvHw=
X-Google-Smtp-Source: APiQypJU0PltQLD20VdBp4LzSsaD54NTJYlytDUT3/+oUl0HMlviRjiz5MjgWjmrgjU1c5kme45mKw==
X-Received: by 2002:a5d:408d:: with SMTP id o13mr3401896wrp.249.1586895475668;
        Tue, 14 Apr 2020 13:17:55 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300F07F0C2E51E8849BADA5B2D5E3.dip0.t-ipconnect.de. [2003:f0:7f0c:2e51:e884:9bad:a5b2:d5e3])
        by smtp.gmail.com with ESMTPSA id 145sm21115425wma.1.2020.04.14.13.17.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2020 13:17:55 -0700 (PDT)
From: "Andreas M?ller" <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 2/4] ghex: initial add 3.18.4
Date: Tue, 14 Apr 2020 22:17:43 +0200
Message-Id: <20200414201745.19390-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200414201745.19390-1-schnitzeltony@gmail.com>
References: <20200414201745.19390-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb    | 17 +++++++++++++++++
 .../packagegroups/packagegroup-gnome-apps.bb    |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb

diff --git a/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
new file mode 100644
index 000000000..cf33ebdfe
--- /dev/null
+++ b/meta-gnome/recipes-gnome/ghex/ghex_3.18.4.bb
@@ -0,0 +1,17 @@
+SUMMARY = "GHex - a hex editor for GNOME"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+GNOMEBASEBUILDCLASS = "meson"
+
+DEPENDS = " \
+    glib-2.0-native \
+    gtk+3 \
+"
+
+inherit gnomebase gsettings gtk-icon-cache gnome-help gettext upstream-version-is-even
+
+SRC_URI[archive.md5sum] = "7e6ed808766bc18285bdc6999bdf0f15"
+SRC_URI[archive.sha256sum] = "c2d9c191ff5bce836618779865bee4059db81a3a0dff38bda3cc7a9e729637c0"
+
+FILES_${PN} += "${datadir}/metainfo"
diff --git a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
index 522e9e9a3..0b900f0e7 100644
--- a/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
+++ b/meta-gnome/recipes-support/packagegroups/packagegroup-gnome-apps.bb
@@ -11,6 +11,7 @@ RDEPENDS_${PN} = " \
     evince \
     file-roller \
     gedit \
+    ghex \
     gnome-calculator \
     gnome-font-viewer \
     gnome-terminal \
-- 
2.21.1

