Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.22481.1627640574759685038
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Jul 2021 03:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OFrPZWP2;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: salman.isd@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id h14so10624454wrx.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 30 Jul 2021 03:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TGI2Mk6/FetdVHMFJjcqDxiZZHWgPvb+pny/nY51gzU=;
        b=OFrPZWP2pEp2/IQheucy84YEs1rF3H8uiHe+Zcwht0Old5PU++QXGI5jmtt4p+42SG
         Q6qbQ2O3All3VyrqR3KMsbNaJVw6BP3OexD/SIcqVfL0GVxSvWZ4ucDoCvnUbyXwh9pe
         3x7oFGJOgTPYn2WUzgV930+DV3LMRTKZ7LLJLSuxw58OYt7Yd99ndaXl/wTWiivk0ONe
         URKexgeKo22MA8fPPUbWKHeiaW59AAoOR7tF4aolBhV6ZUUZpKZxRNesm3bNmnhk12Cn
         MvjblDmGUHoFvImq+HBPQVs2A+Eg/5uWvo4ks0ZS4/gtIHOYZ+/iexbhcFxXB4Zgtz6S
         EXOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TGI2Mk6/FetdVHMFJjcqDxiZZHWgPvb+pny/nY51gzU=;
        b=j7WY1V8LXFI46GYkU7yFtqasdpRYq0t6mvTm1btmt7szT3rBC5gcC+JJ8XRC9fzi7R
         AXuwS6eSVKDxtHejNIqATitSHdD8bvPfWvOZmsi+TEuW9GDWw+ggrl3TPtCxqFx0LW+d
         MWIUF6XYWBZYRz/bMfIDdI8TKD4YpjE5xVbj3BWZMA5zLhYsEkl6OQuc5JNA+th7PlyX
         TxJG0vpvsVOmSRAJvB5YCXmZg6WC/EbEPUPWT66y4Fg/ZG/U2ZIhkjZ63JCCzk39F87u
         9mcJDd9ZzzGBsGXovkoG3uXo89IvcwRC9rcLwX7L0ayJKfd2ExAJ+J27b2Dg9oHV7rm+
         WG6A==
X-Gm-Message-State: AOAM530O2dEJeMOPf/qh4LaawgpwGTRNHxeHppM9xhqsDToUNJCTAOi+
	0BsbTuSjOdZM5fZZNmybNarFRyyfcGovfg==
X-Google-Smtp-Source: ABdhPJy8EmzzDAJO2jQZ45tm3sijbY/US/Zf0LZKvWQt6FjG+0x+CmhLVZ9hwvEljrp7h1SLcVP6RQ==
X-Received: by 2002:adf:c549:: with SMTP id s9mr2240795wrf.344.1627640572870;
        Fri, 30 Jul 2021 03:22:52 -0700 (PDT)
Return-Path: <salman.isd@gmail.com>
Received: from localhost.localdomain (ip-37-201-145-145.hsi13.unitymediagroup.de. [37.201.145.145])
        by smtp.gmail.com with ESMTPSA id u11sm1164468wrp.26.2021.07.30.03.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 03:22:52 -0700 (PDT)
From: "Salman Ahmed" <salman.isd@gmail.com>
X-Google-Original-From: Salman Ahmed <salman.ahmed@weidmueller.com>
To: openembedded-devel@lists.openembedded.org
Cc: derek@asterius.io
Subject: [[meta-webserver] 2/2] nginx: upgrade 1.19.6 -> 1.21.1
Date: Fri, 30 Jul 2021 12:22:36 +0200
Message-Id: <506be9b2c234372b87331261de5a575f0f7cb033.1627638813.git.salman.ahmed@weidmueller.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627638813.git.salman.ahmed@weidmueller.com>
References: <cover.1627638813.git.salman.ahmed@weidmueller.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Salman Ahmed <salman.ahmed@weidmueller.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb | 10 ----------
 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb | 10 ++++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
deleted file mode 100644
index 16c80cd09..000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.19.6.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require nginx.inc
-
-# 1.18.x branch is the current stable branch, the recommended default
-# 1.19.x is the current mainline branches containing all new features
-DEFAULT_PREFERENCE = "-1"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=52e384aaac868b755b93ad5535e2d075"
-
-SRC_URI[md5sum] = "0be1d90b45b1bdfcf8339f299e74063a"
-SRC_URI[sha256sum] = "b11195a02b1d3285ddf2987e02c6b6d28df41bb1b1dd25f33542848ef4fc33b5"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
new file mode 100644
index 000000000..b69fd7dab
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.21.1.bb
@@ -0,0 +1,10 @@
+require nginx.inc
+
+# 1.20.x branch is the current stable branch, the recommended default
+# 1.21.x is the current mainline branches containing all new features
+DEFAULT_PREFERENCE = "-1"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=206629dc7c7b3e87acb31162363ae505"
+
+SRC_URI[md5sum] = "7dce9e2136ec32dfd823736e871815b1"
+SRC_URI[sha256sum] = "68ba0311342115163a0354cad34f90c05a7e8bf689dc498abf07899eda155560"
-- 
2.25.1

