Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.14653.1627188759727350331
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Jul 2021 21:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rIl6jvL9;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id k4-20020a17090a5144b02901731c776526so14884696pjm.4
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Jul 2021 21:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=NUtzhJiJAx/ZpWd0gqHyKsqfypcE4YMSxg25qSZq6/o=;
        b=rIl6jvL9YyNZg4ur2fSAIA/DTH/5xPJNvxl8gmYCxP/td5UdTmHhH/m71yQXr7Hd6Z
         9po6CqL74ae4l6lMFya5bVy9jx/IxeeleeP8nw654ThW5UqZNLgywCesEhQ9Mw+ufdKD
         vrbEIaHMSZEul4fHNbiGSJzr7GYIcWBh1WIFEiY5XhfjPO4Sjo7ImUmXKH8hvtBiKQbd
         OfXPnAgNYBRuVGs12xh31/RF2ihb7TSF14iFJZVAaqXcLjNtz+UogXUzcF7+gJxPVBwT
         N256Ilf3JIURkZFTSh4FuGHpRQol4rJAKltgHWnHCAEjG6qm3sMgnxbtqCrTALyaSX2r
         eu1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NUtzhJiJAx/ZpWd0gqHyKsqfypcE4YMSxg25qSZq6/o=;
        b=J3OmfmVEB4wMRSTcypY9nKeqAfNpmBv1PUI/UfJfshIYCNU5zPRYThpejIESB/aD/B
         sKvOGOxvECYcAE8ARpISEVYsgJI7NYpMsTUSpianIqHoCasRCLsW6InRbdPfs2XCKfzD
         jjZ7oFm2OcrScHHWQRU4fNWhdlNoC+dMG3htDUWG0iCiGPv1X8S8c9ACnla10ciLI0ZQ
         zYG6m3lfRoo8nBZMWcg2alDiMZH2b0iuW19R8o1q74REtvDWr8mxjvslmTOVAnG766GG
         iSNo2RqXaiPP7srQxkKgTQi9KTwrEsVw/8jQO1bq3W+2E8Ukjyw/oCGQcw8vWyXmT5bD
         80Iw==
X-Gm-Message-State: AOAM533pmnCa9lkPw0OAmgOy4EvbEKLE3bDGRUrl4bNprSnhYonJH8iB
	/BpH8WR1zFysoKGmbMiSb6YMk+lboh9Mwg==
X-Google-Smtp-Source: ABdhPJwjDdxciOFqiWmenzuTl1/7nACrDyv26c9aQvliK1e9SvRnzix0QwbIC8v4sshT/F+lBT+BuA==
X-Received: by 2002:a63:da14:: with SMTP id c20mr12071668pgh.359.1627188759081;
        Sat, 24 Jul 2021 21:52:39 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:d2f1:9af3:9c5d:7e26])
        by smtp.gmail.com with ESMTPSA id t10sm43368804pgv.52.2021.07.24.21.52.38
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:52:38 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 09/15] vboxguestdrivers: Add __divmoddi4 builtin support
Date: Sat, 24 Jul 2021 21:52:15 -0700
Message-Id: <12bc39d8c5ee7fdec1d1f5e92812b200eeba5b7b.1627164868.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627164868.git.akuster808@gmail.com>
References: <cover.1627164868.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

gcc 11 needs it on i686

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 57f7692e8ef707535ffa1683aa711de442736ec1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../vboxguestdrivers/add__divmoddi4.patch     | 36 +++++++++++++++++++
 .../vboxguestdrivers_6.1.18.bb                |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch

diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
new file mode 100644
index 0000000000..8dd30a20ef
--- /dev/null
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers/add__divmoddi4.patch
@@ -0,0 +1,36 @@
+add __divmoddi4 builtin
+
+GCC 11 will generate it in code
+
+void foo(unsigned char *u8Second, unsigned int *u32Nanosecond, long long timeSpec)
+{
+    long long i64Div;
+    int i32Div;
+    int i32Rem;
+    i64Div = timeSpec;
+    i32Rem = (int)(i64Div % 1000000000);
+    i64Div /= 1000000000;
+    *u32Nanosecond = i32Rem;
+    i32Rem = (int)(i64Div % 60);
+    *u8Second = i32Rem;
+}
+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/src/VBox/Runtime/common/math/gcc/divdi3.c
++++ b/src/VBox/Runtime/common/math/gcc/divdi3.c
+@@ -68,3 +68,12 @@ __divdi3(a, b)
+ 		uq = - uq;
+ 	return uq;
+ }
++
++quad_t
++__divmoddi4(quad_t a, quad_t b, quad_t* rem)
++{
++	quad_t d = __divdi3(a,b);
++	*rem = a - (d*b);
++	return d;
++}
++
diff --git a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
index d620e9893f..1def1a3115 100644
--- a/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
+++ b/meta-oe/recipes-support/vboxguestdrivers/vboxguestdrivers_6.1.18.bb
@@ -14,6 +14,7 @@ VBOX_NAME = "VirtualBox-${PV}"
 SRC_URI = "http://download.virtualbox.org/virtualbox/${PV}/${VBOX_NAME}.tar.bz2 \
     file://Makefile.utils \
     file://kernel-5.10.patch \
+    file://add__divmoddi4.patch \
 "
 SRC_URI[md5sum] = "c61001386eb3822ab8f06d688a82e84b"
 SRC_URI[sha256sum] = "108d42b9b391b7a332a33df1662cf7b0e9d9a80f3079d16288d8b9487f427d40"
-- 
2.25.1

