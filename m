Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.17213.1627601827257063481
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Jul 2021 16:37:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=J3c6CvrH;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so18137918pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Jul 2021 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gKID/2z7XD5XgyFSRCH+/mAdYCwXrDywNzZZLec1w64=;
        b=J3c6CvrHjMQFf9OoOtd/ktNuxwW+wMd9f15yX81JBdP55eq7FZi8HN3Hi3a0ED3KTP
         QyjJ5ixNXWaNwN7PbS0tCU8BjgBG/ON3UdCIRy39nNqNMPB8py++KHCCKYi6DZKedgn9
         RBpkyQXh6FFIUt0jBMvg9+9REILI8dHoBo04Kx1YxtsPbkCvSoQ79y1V3XOaDe7AZvF4
         i+JFC+5dYR5MnRjzSAix5tRd7iS08IaEgWv+v6NmsnsM11GOFDa96UPUguTpHcvyHzur
         K3wtpwNOYVFoQvF7yf0zkmGUNBycLOj7vN9FWtoy80BbCLxEcMo8gYB9vg5NNdzh3SyN
         pVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gKID/2z7XD5XgyFSRCH+/mAdYCwXrDywNzZZLec1w64=;
        b=J7V0Odf342jL0rIWQsRVMYhXVX6BcLhUybOVXxqsdRzLR9MlhdH5pIr1h8XDSOzuD4
         Ruewl/Xz/8FuBw8/clYMuyCF0+DiG5Cdb7eU75SD61v4Ba/5aKF2HMuhkwcLuhIoo8jN
         f2LjfrhgLXnmeF1WVdfRfTNr6ZGBL3M9kmKZepj5o9380wP9uNEooyIa5D9V0UQkNXrc
         /QIWg6PNxi2vipcLjjvO/mfTA0stEmsiL6vqxoL4hpRApdRjbnYrz9hNTOsw9QxxKrod
         mh84Hraa718uUT+i5N9KSzkPSi6tfG2MCepCOh9GhefRzx8Qd+1S2PKBOEfs6pUidmAR
         xdOQ==
X-Gm-Message-State: AOAM531tNrjxm/618GxEeICKcAGmEWtZ9TEO3wyeOgoJnUlXFwZBKaAp
	0upKzftQVoxJDG4tgXV9zQFGwQRQ3Ajlrg==
X-Google-Smtp-Source: ABdhPJxTj0wRR4wg8rrJclzwgzUqWnUZ3RFmlcAoB+v6T+fnlO7jViNOmk33jwEM1D6y/hZGtU4PhA==
X-Received: by 2002:a63:f342:: with SMTP id t2mr5985075pgj.45.1627601826698;
        Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:43fe:2e36:1546:5b06])
        by smtp.gmail.com with ESMTPSA id w15sm2360487pfu.89.2021.07.29.16.37.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 16:37:06 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 15/15] python3-pillow: fix CVE-2021-34552
Date: Thu, 29 Jul 2021 16:36:48 -0700
Message-Id: <88813d34dd665cf90403716b88db2f0e0ec78d76.1627593245.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1627593245.git.akuster808@gmail.com>
References: <cover.1627593245.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Pull fix from version 8.3.1 back to 8.2.0.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...Limit-sprintf-modes-to-10-characters.patch | 49 +++++++++++++++++++
 ...0001-Use-snprintf-instead-of-sprintf.patch | 43 ++++++++++++++++
 .../python/python3-pillow_8.2.0.bb            |  2 +
 3 files changed, 94 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch

diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
new file mode 100644
index 0000000000..a1dd0d29ff
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Limit-sprintf-modes-to-10-characters.patch
@@ -0,0 +1,49 @@
+From 5f4504bb03f4edeeef8c2633dc5ba03a4c2a8a97 Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Tue, 15 Jun 2021 15:14:26 +1000
+Subject: [PATCH 1/1] Limit sprintf modes to 10 characters
+
+Needed to make CVE-2021-34552 fix apply cleanly.
+
+commit 5f4504bb03f4edeeef8c2633dc5ba03a4c2a8a97 (unmodified)
+
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/libImaging/Convert.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/src/libImaging/Convert.c b/src/libImaging/Convert.c
+index 8c7be36a2..1fa74a13b 100644
+--- a/src/libImaging/Convert.c
++++ b/src/libImaging/Convert.c
+@@ -1594,9 +1594,8 @@ convert(
+ #ifdef notdef
+         return (Imaging)ImagingError_ValueError("conversion not supported");
+ #else
+-        static char buf[256];
+-        /* FIXME: may overflow if mode is too large */
+-        sprintf(buf, "conversion from %s to %s not supported", imIn->mode, mode);
++        static char buf[100];
++        sprintf(buf, "conversion from %.10s to %.10s not supported", imIn->mode, mode);
+         return (Imaging)ImagingError_ValueError(buf);
+ #endif
+     }
+@@ -1645,11 +1644,10 @@ ImagingConvertTransparent(Imaging imIn, const char *mode, int r, int g, int b) {
+     }
+ #else
+     {
+-        static char buf[256];
+-        /* FIXME: may overflow if mode is too large */
++        static char buf[100];
+         sprintf(
+             buf,
+-            "conversion from %s to %s not supported in convert_transparent",
++            "conversion from %.10s to %.10s not supported in convert_transparent",
+             imIn->mode,
+             mode);
+         return (Imaging)ImagingError_ValueError(buf);
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch b/meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch
new file mode 100644
index 0000000000..fc0337f137
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pillow/0001-Use-snprintf-instead-of-sprintf.patch
@@ -0,0 +1,43 @@
+From 518ee3722a99d7f7d890db82a20bd81c1c0327fb Mon Sep 17 00:00:00 2001
+From: Andrew Murray <radarhere@users.noreply.github.com>
+Date: Wed, 30 Jun 2021 23:47:10 +1000
+Subject: [PATCH 1/1] Use snprintf instead of sprintf
+
+Fix CVE-2021-34552.
+
+commit 518ee3722a99d7f7d890db82a20bd81c1c0327fb (unmodified)
+
+Upstream-Status: Backport
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ src/libImaging/Convert.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/libImaging/Convert.c b/src/libImaging/Convert.c
+index 1fa74a13b..9012cfcd7 100644
+--- a/src/libImaging/Convert.c
++++ b/src/libImaging/Convert.c
+@@ -1595,7 +1595,7 @@ convert(
+         return (Imaging)ImagingError_ValueError("conversion not supported");
+ #else
+         static char buf[100];
+-        sprintf(buf, "conversion from %.10s to %.10s not supported", imIn->mode, mode);
++        snprintf(buf, 100, "conversion from %.10s to %.10s not supported", imIn->mode, mode);
+         return (Imaging)ImagingError_ValueError(buf);
+ #endif
+     }
+@@ -1645,8 +1645,9 @@ ImagingConvertTransparent(Imaging imIn, const char *mode, int r, int g, int b) {
+ #else
+     {
+         static char buf[100];
+-        sprintf(
++        snprintf(
+             buf,
++            100,
+             "conversion from %.10s to %.10s not supported in convert_transparent",
+             imIn->mode,
+             mode);
+-- 
+2.29.2
+
diff --git a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
index 3241230d13..40745bb763 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_8.2.0.bb
@@ -8,6 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=0337b116233da4616ae9fdb130bf6f1a"
 SRC_URI = "git://github.com/python-pillow/Pillow.git;branch=8.2.x \
            file://0001-support-cross-compiling.patch \
            file://0001-explicitly-set-compile-options.patch \
+           file://0001-Limit-sprintf-modes-to-10-characters.patch \
+           file://0001-Use-snprintf-instead-of-sprintf.patch \
 "
 SRCREV ?= "e0e353c0ef7516979a9aedce3792596649ce4433"
 
-- 
2.25.1

