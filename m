Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.622.1620064552101673831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 May 2021 10:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AtZVc53q;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id c17so4721621pfn.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 May 2021 10:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zQyOpveV/t+YhFUbJtGq90CLShTIAZyDljBqHZkkrAI=;
        b=AtZVc53q70+5MI+WUYrHBJ8te61c1vLX8eRr9OwmXXc5ze+EVbCG/+Vtr9iMRxRbZz
         qkrQ0aoZNDXXgle5cqw4ONiRjGnnbY20MrH/voan+DJqhWHQvXDW4WYtPJnp24nIL6Xo
         BV0X+nEkSQXTkk6WB6YGLWSm7y1pa9N7RBGVJ2xCTJ0kIexPtagjLiAAFEx86nFR/Vrd
         e2n//lCbSAK7EACl604mgtd0mFmh2y0WdlWtwG2KR/6a6J0f6/RQf1qnYmcNcq4iXLGB
         sc0IbuRhkulhWpBQJGNJtTXNLVSqAv54/WZLzAqouEsQJFbohm6yFxu2ZIQacNQqNiQO
         8u5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zQyOpveV/t+YhFUbJtGq90CLShTIAZyDljBqHZkkrAI=;
        b=d7CLK7ah1TPcomHJbd3asl5D5EsT209OyQzCNoFzaLAIHdhusNnVsM+HQPptC6DtSu
         dpgJF7WZuLcP+BHvPcaraebwFHlQG697u3SMBPMDm+DiIPQURpXSGAu3FtC5Kl0MlvPe
         i68wYXXFiK0Kpp1zb2iWpslqJhNd0kuP/Kn3YMXNNLz0EQ483WiZImp92eLO6OKXXfqd
         TA+GbMass3zqJdCeD1Xs1XVVNK+KAaHz/ePiQJUYIVWUQfW/xLEiEE93r0qjPBhSSG4m
         6/0DNoX9iVAXpp9arGh7vPfsqItguXl+KY68NmK+PZqPeQXM5z379/Tt1tp9nfA/YSPT
         fpFg==
X-Gm-Message-State: AOAM532t4LS3H9ZhLExc6EJoft/K9OIaP8ThoVfO31UXMmCHslQ597oR
	djtBWaVeubic7waI8yGHOn/He40kn6ciaA==
X-Google-Smtp-Source: ABdhPJyGUWv1t3HpVbDsOAUktNd8kT6a/9LMrB01ykg/5HhK8Ie5DchFBwLcJ/b8Zmx8gpKZUCMY4g==
X-Received: by 2002:a63:652:: with SMTP id 79mr2936243pgg.293.1620064551152;
        Mon, 03 May 2021 10:55:51 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id y13sm6003073pff.163.2021.05.03.10.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 10:55:50 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] ctags: Switch to universal ctags
Date: Mon,  3 May 2021 10:55:48 -0700
Message-Id: <20210503175548.3380271-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/ctags/ctags_5.8.bb   | 25 -------------------
 .../ctags/ctags_5.9.20210502.0.bb             | 25 +++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/ctags/ctags_5.8.bb
 create mode 100644 meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb

diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.8.bb b/meta-oe/recipes-devtools/ctags/ctags_5.8.bb
deleted file mode 100644
index d006d83aa5..0000000000
--- a/meta-oe/recipes-devtools/ctags/ctags_5.8.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-# Copyright (C) 2015 Igor Santos <igor.santos@aker.com.br>
-# Released under the MIT license (see COPYING.MIT for the terms)
-
-SUMMARY = "Exuberant Ctags"
-DESCRIPTION = "Exuberant Ctags is a multilanguage reimplementation of the \
-               Unix ctags utility. Ctags generates an index of source code \
-               definitions which is used by numerous editors and utilities \
-               to instantly locate the definitions."
-
-HOMEPAGE = "http://ctags.sourceforge.net/"
-
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
-
-inherit autotools-brokensep
-
-SRC_URI = "http://prdownloads.sourceforge.net/${BPN}/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "c00f82ecdcc357434731913e5b48630d"
-SRC_URI[sha256sum] = "0e44b45dcabe969e0bbbb11e30c246f81abe5d32012db37395eb57d66e9e99c7"
-
-do_install() {
-    install -Dm 755 ${B}/ctags ${D}${bindir}/ctags
-    install -Dm 644 ${B}/ctags.1 ${D}${mandir}/man1/ctags.1
-}
diff --git a/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
new file mode 100644
index 0000000000..aca0502db6
--- /dev/null
+++ b/meta-oe/recipes-devtools/ctags/ctags_5.9.20210502.0.bb
@@ -0,0 +1,25 @@
+# Copyright (C) 2015 Igor Santos <igor.santos@aker.com.br>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Universal Ctags"
+DESCRIPTION = "Universal Ctags is a multilanguage reimplementation of the \
+               Unix ctags utility. Ctags generates an index of source code \
+               definitions which is used by numerous editors and utilities \
+               to instantly locate the definitions."
+
+HOMEPAGE = "https://ctags.io/"
+
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
+
+inherit autotools-brokensep pkgconfig manpages
+
+DEPENDS += "libxml2 jansson libyaml python3-docutils-native"
+SRCREV = "6df08b82d4845d1b9420d9268f24d5db16ee4480"
+SRC_URI = "git://github.com/universal-ctags/ctags"
+
+S = "${WORKDIR}/git"
+
+#do_install() {
+#    install -Dm 755 ${B}/ctags ${D}${bindir}/ctags
+#}
-- 
2.31.1

