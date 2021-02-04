Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web10.554.1612481319468063282
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Feb 2021 15:28:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R8fPg/Lf;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id cl8so2604806pjb.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Feb 2021 15:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z+rmBpBxiPg9fXIUt8iN8JQikxpwK8LFOuBFcUztkWU=;
        b=R8fPg/Lf9VvIbSIOPiWjSzUVAVuGPcND0PFZ6Ye0rLy5OoUERexpM2NV3F0ENywqVE
         RJhyCRTPnh+3svXZkWm7LmqwZYRfJldW99vih9dr5k7NxRPN/SaJAzKOm+lx1fO3LpBb
         CboBSLjEkV5oVGWdiQ/PKdox1lyTKsSZFenBPpIhZ6yT/s6zZue10llhhqpd2rZB+nZJ
         M764+wXOJrujlX28qsIlxuC9BRWZMPRrFV7RLSUXXNXTsI8JKzHIOQN0hydmlaWjGzbP
         TuTXKi7QTlPMJjYy2dWbGnXf4pRx/BWk4gBTJ+o2jeB80TyeZ4oMp2xge94AcudbjolW
         Q3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z+rmBpBxiPg9fXIUt8iN8JQikxpwK8LFOuBFcUztkWU=;
        b=SoUB4g4DhszMLYbJgTPSzfpdhuTGaKggkxJrPQrMB8elctaAP7ZmQnr8oVtm2mvuii
         xNxUV6QoqSq3L2isXrwpkWpUkIp3pyicqWbEADUjocRAiEDkGT7PARyubvXdwY+ygXFi
         mJthAUX28899j7KOKzAs5ZwjbsoNqnqknlRQFJH2otlBaDOfM/8hQuS3d3N1V2jhDkCO
         XfZa1K13yMDyLignQfHTiVWjEr0hU1/mIJm7qURb2suu6J1KP7vakhSvLlarekA8mY0C
         FcSTNvynReKX0fz+PI+sMCi+Qi9ENgvWHY5iLa6KjM66QUP1gVZDwvmxT8klLj3B3mMh
         EDmw==
X-Gm-Message-State: AOAM531dUZz/z2ybHNZvUpYq+ToqHkMAjZfvOM0LgYE/p4vlTRAuhlxR
	j8eyj1A/GoJnvotPK8RjY2eEYqp19GM1Xw==
X-Google-Smtp-Source: ABdhPJyUA8Kw16e1xfwyiYYFyRshXrZQ9efxDawNmjZ8bPi+lXnuVbWaWG8JQbODf6o9TzBp+xw0HA==
X-Received: by 2002:a17:902:fe03:b029:e1:2c46:f3fd with SMTP id g3-20020a170902fe03b02900e12c46f3fdmr1437759plj.62.1612481318646;
        Thu, 04 Feb 2021 15:28:38 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::2914])
        by smtp.gmail.com with ESMTPSA id k6sm7886467pgk.36.2021.02.04.15.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 15:28:38 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] boinc-client: Upgrade to 7.16.16 release
Date: Thu,  4 Feb 2021 15:28:34 -0800
Message-Id: <20210204232836.655046-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop upstreamed patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../boinc/boinc-client/opengl_m4_check.patch  | 28 -------------------
 ...client_7.16.bb => boinc-client_7.16.16.bb} |  5 ++--
 2 files changed, 2 insertions(+), 31 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
 rename meta-oe/recipes-extended/boinc/{boinc-client_7.16.bb => boinc-client_7.16.16.bb} (96%)

diff --git a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch b/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
deleted file mode 100644
index ad4493f0b6..0000000000
--- a/meta-oe/recipes-extended/boinc/boinc-client/opengl_m4_check.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 4f2dd929618f149087249f3c90cc056d5080b1e4 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 3 Nov 2016 01:20:33 -0700
-Subject: [PATCH] boinc: Add recipe for boinc-client
-
-Do not add prefix/lib to library search path
-let sysroot take care of that
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Inappropriate[Cross-compile specific]
-
----
- m4/ax_check_gl.m4 | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/m4/ax_check_gl.m4 b/m4/ax_check_gl.m4
-index e26ce5b930..1e60c9266a 100644
---- a/m4/ax_check_gl.m4
-+++ b/m4/ax_check_gl.m4
-@@ -58,7 +58,7 @@ else
-     else
-       ax_try_lib="${ax_lib}"
-     fi
--    LIBS="-L${prefix}/lib ${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
-+    LIBS="${ax_try_lib} ${GL_LIBS} ${ax_save_LIBS}"
-     AC_LINK_IFELSE(
-     [AC_LANG_PROGRAM([[
- # if HAVE_WINDOWS_H && defined(_WIN32)
diff --git a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
similarity index 96%
rename from meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
rename to meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
index db90f06f46..441bcd3ac3 100644
--- a/meta-oe/recipes-extended/boinc/boinc-client_7.16.bb
+++ b/meta-oe/recipes-extended/boinc/boinc-client_7.16.16.bb
@@ -29,11 +29,10 @@ DEPENDS = "curl \
            ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk+ libnotify xcb-util libxscrnsaver', '', d)} \
            nettle \
 "
-SRCREV = "e0e033af9fca3cca84a3417ea6531ae25be73a7a"
-BRANCH = "client_release/7/${PV}"
+SRCREV = "df0239e6f074207798a8ecf1358a74545dda9132"
+BRANCH = "client_release/7/7.16"
 SRC_URI = "git://github.com/BOINC/boinc;protocol=https;branch=${BRANCH} \
            file://boinc-AM_CONDITIONAL.patch \
-           file://opengl_m4_check.patch \
            file://gtk-configure.patch \
 "
 
-- 
2.30.0

