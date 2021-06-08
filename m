Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.1416.1623169988228922020
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Jun 2021 09:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VddM7B8s;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id g6so16123656pfq.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 08 Jun 2021 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nT3hNOPD02opDxSShYX8DPnE0D3Rlk/rC54G8jLPEeo=;
        b=VddM7B8snHvceaopfVq7rvYQ+CfEE0QRHTCops2oNeLI86mOXB0FTxC3moEI2ltZvT
         fCXboHljp+xm+i0hTu4/q3yTKph+vHKDSfYFL6VvAWWWG2qwRlOApU5KDWYGe9nHhLUJ
         DFLBe4unjWAbYJ2ZeuLKlrJXa153X6wa/7bpeELbcby2CZKHXIzhm7N4QXTilq3cJR80
         HMJQ0hzQDuqjyjh+GfmkP5b5YhHXxM8/Lq8bp/6LkiQDvkwpFN5A2LkwuFvdDWMNpeie
         fo276sjM4mEChH1sVCc7rqFMOLSMa9R3A5UJFwPiFHJSMFtMJ1k0nZ9WWbm1zhXJjpdV
         4teA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nT3hNOPD02opDxSShYX8DPnE0D3Rlk/rC54G8jLPEeo=;
        b=cYchfNgUcBUaYNxc9ZRwPY+Gm0gHBuppJNT0kOpDL7JDMixv8lZTOSYafWJMo0uRve
         8Ox0i0HiAJlLO1lpDEcFONI0yG1SIx70cVv0rpFJ4vCTH73JwIKHIhxkssYgLVpZ6b9l
         CSb0qcicWeVdOEtE2ecF6ntfiq0mZ/2rTCbQzBUAKw3gSMBC5myNO1BplGOXgwWhLgER
         YZfpOiBseb6VZYGYstVKsBve3B9mCU1IM3RwjyiDLpZduH9RDN1XfliOK0IfVhFXjacC
         x215VaZ8fFjDsyGDLYNb2TEa+MBKL9ePuyNF/MGHvjtmNcr6yMLKzJOGj3ogrOWnrGp8
         6C0Q==
X-Gm-Message-State: AOAM530bLejQk+xQ2ooZ3TkxgRKrgQ3wxJgMrvd3WLKfuPgxGzd/OcYK
	th0LY+wDsr/V6csSwh2Vm81SHmYbmSckog==
X-Google-Smtp-Source: ABdhPJx5lKcUBS/X9dISD+wn9B48A2p4kaappNszlk8Wc2ff+eXPE1gDkichkbA1x6rA47OR4CPV/w==
X-Received: by 2002:a63:be44:: with SMTP id g4mr23697501pgo.425.1623169987424;
        Tue, 08 Jun 2021 09:33:07 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a054])
        by smtp.gmail.com with ESMTPSA id ga23sm3038525pjb.0.2021.06.08.09.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 09:33:07 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Ross Burton <ross.burton@arm.com>
Subject: [meta-oe][PATCH] zsync: Fix build on musl
Date: Tue,  8 Jun 2021 09:33:04 -0700
Message-Id: <20210608163304.1223962-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>
---
 ...0001-sha1-Include-unistd.h-for-off_t.patch | 29 +++++++++++++++++++
 meta-oe/recipes-extended/zsync/zsync_0.6.2.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch

diff --git a/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch b/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
new file mode 100644
index 0000000000..60bcd8166f
--- /dev/null
+++ b/meta-oe/recipes-extended/zsync/zsync/0001-sha1-Include-unistd.h-for-off_t.patch
@@ -0,0 +1,29 @@
+From 72ad6dd95441836afb1f113697339b3c694d0e69 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 8 Jun 2021 09:26:32 -0700
+Subject: [PATCH] sha1: Include unistd.h for off_t
+
+Musl systems do not get this definition indirectly like what happens
+on glibc, therefore include unistd.h to get the definition
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libzsync/sha1.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/libzsync/sha1.h b/libzsync/sha1.h
+index 3946505..23d9434 100644
+--- a/libzsync/sha1.h
++++ b/libzsync/sha1.h
+@@ -16,6 +16,7 @@
+ #else
+ #include <sys/types.h>
+ #endif
++#include <unistd.h>
+ 
+ #define	SHA1_BLOCK_LENGTH		64
+ #define	SHA1_DIGEST_LENGTH		20
+-- 
+2.32.0
+
diff --git a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
index c61e26309d..b80bf9cded 100644
--- a/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
+++ b/meta-oe/recipes-extended/zsync/zsync_0.6.2.bb
@@ -5,7 +5,9 @@ LICENSE = "Artistic-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=71c0ac4d86266533509aa0825b8d323c"
 
 SRC_URI = "http://zsync.moria.org.uk/download/${BP}.tar.bz2 \
-           file://out-of-tree.patch"
+           file://out-of-tree.patch \
+           file://0001-sha1-Include-unistd.h-for-off_t.patch \
+           "
 SRC_URI[sha256sum] = "0b9d53433387aa4f04634a6c63a5efa8203070f2298af72a705f9be3dda65af2"
 
 inherit autotools
-- 
2.32.0

