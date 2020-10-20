Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web09.1592.1603176547855797487
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Oct 2020 23:49:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uLCTFlsA;
 spf=pass (domain: gmail.com, ip: 209.85.216.46, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f46.google.com with SMTP id hk7so472961pjb.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Oct 2020 23:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8y5L9+lEoIrNp7mM7fZgoqCJBR1kmKdE74+pDXR0+s=;
        b=uLCTFlsAhjMRd0PWeAsayX5Lz82+QrWJzpR3j4Ucc86h0Orqjp+6bSa+48DRo0V4ta
         i2ZG6RRNLmbpKYIx+D4oB7Fw2Dg0HFOlR+3pcx1PFsOzMjNpDQ/xjCCQ8rhJLrdlgVKK
         ue53Rd+4LXsTz+3g9n07CQgthGMngH/x8gjZS8HsB9RIdioRmCFU/OMlTjxkVYNantt0
         Xz+OCrIZ8sON5tJhblFTKmeaa7wPaaHVR1JeISaaic4zqXUVzzD9RZog9D2DmMoutibl
         hLkpPvKowChA5wdZ08nKVqqih1vFfgGHD8Bd3CjeDznikT54xqKgYb/XnulUgv36n9Sl
         564Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8y5L9+lEoIrNp7mM7fZgoqCJBR1kmKdE74+pDXR0+s=;
        b=Brx3X+TTzy4+NX5RMAxGaBdHDWEzvU/9OEFc+Qd+nochZ/rvAFQy8aIIARBuUvYC1T
         7EjxQzyy8MZnScY/jDrb14C2U11Y2tNDgmu9dXl9llNHGNYXoaVBv8mgViZbn7x2Tlnm
         0CFyAF1lRDKrGQoUGD4Nwf4mW+4+89EjfYWyLHjYyGqRhi78O16RIbfNLgIRRQ1cNm8e
         ln03WL2CTYtznS7+Kz2jb/nRm7T4TYn+VzuN7m7TmcFILyfXdvKPXUSs++bqHVR+bECg
         CedJufy9aWj8FUgcLVNa7hsPDNC+RHNOMnqwByQCkx4rZbPD/pFvYaD7koDJrTRiECT3
         Gryw==
X-Gm-Message-State: AOAM533yJvz2VC86ytYMMeOOBBIThKCwpuF9+Djay2QVoWPaXva7NQ7W
	9LXze5YALydi5M0oYyHFMbeoo7+JbPFJsA==
X-Google-Smtp-Source: ABdhPJy3L7O9ryyEsjLCQ8GjBBdrP3v6xNOrWPEDQ8g9oqmTYEDLiuVE5N5Ac1v6Ft7DQJrUCB3zug==
X-Received: by 2002:a17:90a:dc07:: with SMTP id i7mr1511408pjv.111.1603176546994;
        Mon, 19 Oct 2020 23:49:06 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4467])
        by smtp.gmail.com with ESMTPSA id c12sm848862pgd.57.2020.10.19.23.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 23:49:06 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [meta-oe][PATCH] apitrace: Disable secuirty flags for clang
Date: Mon, 19 Oct 2020 23:49:04 -0700
Message-Id: <20201020064904.1353375-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add apitrace to relevant packagegroup

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb          | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5a4375d72a..92190c8389 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -206,6 +206,7 @@ RDEPENDS_packagegroup-meta-oe-dbs ="\
 
 RDEPENDS_packagegroup-meta-oe-devtools ="\
     abseil-cpp \
+    apitrace \
     breakpad \
     bootchart \
     android-tools-conf \
diff --git a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
index 6e61683cde..826291a5e4 100644
--- a/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
+++ b/meta-oe/recipes-devtools/apitrace/apitrace_9.0.bb
@@ -26,3 +26,5 @@ EXTRA_OECMAKE += "\
 EXTRA_OECMAKE += "\
     -DENABLE_STATIC_SNAPPY=ON \
 "
+
+SECURITY_CFLAGS_toolchain-clang = ""
-- 
2.28.0

