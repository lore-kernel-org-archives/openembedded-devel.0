Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.34858.1622399674965904030
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 May 2021 11:34:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vH/D4SzQ;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: akuster808@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id q15so6658518pgg.12
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 May 2021 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=P0ot+RkO0hgk8vWX+ICS6YsbdaRYB2larXoqFZI+geI=;
        b=vH/D4SzQuD960yMLGykmZBNx+jF+t06EwXDF81QE4iRfLhip1AOQE8AmSzhvMzsqKr
         0oHE27VADnE+PWQnwGiiRdN4Xk+E98Y9j57ldISsV9uijZi+ZBvnl0X/LZOJk9NMbMiN
         2+0sPvcqZ0/Mi/ZQJsKx2Vkq1qj5teXeA3tHfRTbzOPlGEimj2m6mBb2mCihMsyLHPLs
         6rzA+PQJM1CXZwz5oOsQmk6GG3zgTDeiRv+h3Xr4K3ZzlQRgA29Xref89h9i0TMpym0Y
         sp3iBiwzTHtb7m0kLTfYEMloV88k6cL+bMOFrmHMAlzPEtGP8UYWcR/J+ONRYwMsAfZP
         gHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=P0ot+RkO0hgk8vWX+ICS6YsbdaRYB2larXoqFZI+geI=;
        b=ouaN+bfbDyq9axJFtMHyTDwWq5HG3HI9HG9XAT0UPBQdIl8hyQc/+eIHFWv2HepB3E
         dVVVXMkPxIoKlP4tUIn3nLUsKWQg3A6nTvBx9NDT3NHpXbJz+Cn7NzVbqOReZecJ9OH+
         T8EXAkJRK9CrN+2eJ6mfEM4oAdMtqNFvH/y1EA5sCfwHyR93SX21G3R1deYSRpQ6Nu0f
         lkNtrfbl/8VGgm+M8Pviub/5EgAemtq4na6f3uNrDXlTI7+blPw59Jfg2EMt8A0VzH0R
         ejf5vtVrDtdDfJTesUY2uoeHYBmjwFToX+SqDnDeS6IKUXCK7RUOveX+lxVh0FMGNadH
         iD/A==
X-Gm-Message-State: AOAM530jIOVF9pmxR8X3kwsmyKCjEbr8Si7ayCQTp2mnW2INN3JuYwIB
	0ytgAXUdoSXuuCQCovmbc6XLlcce7wFukg==
X-Google-Smtp-Source: ABdhPJyFSizlu6Vdmj5MiIEkPaa2By8u7HaEj8yzdcLpmiFm0x5VYst69arx6yYrstu4WU5Q+ewn3g==
X-Received: by 2002:a62:1496:0:b029:2e7:2674:147 with SMTP id 144-20020a6214960000b02902e726740147mr13899842pfu.51.1622399674410;
        Sun, 30 May 2021 11:34:34 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:417e:d6cd:22c6:4534])
        by smtp.gmail.com with ESMTPSA id z19sm8828696pjq.11.2021.05.30.11.34.33
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 May 2021 11:34:34 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 01/12] exiv2: Fix CVE-2021-29457
Date: Sun, 30 May 2021 11:34:11 -0700
Message-Id: <eee3b137a084d033994fd5eae31dafa74f880ed5.1622399528.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1622399528.git.akuster808@gmail.com>
References: <cover.1622399528.git.akuster808@gmail.com>

From: wangmy <wangmy@fujitsu.com>

  References
  https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2021-29457

  The heap overflow is triggered when Exiv2 is used to write metadata into a crafted image file.
  An attacker could potentially exploit the vulnerability to gain code execution, if they can
  trick the victim into running Exiv2 on a crafted image file.

  Upstream-Status: Accepted [https://github.com/Exiv2/exiv2/commit/0230620e6ea5e2da0911318e07ce6e66d1ebdf22]
  CVE: CVE-2021-29457

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5be72693096cef671bf54bf1dd6ee8125614d064)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29457.patch          | 26 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
new file mode 100644
index 0000000000..e5d069487c
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29457.patch
@@ -0,0 +1,26 @@
+From 13e5a3e02339b746abcaee6408893ca2fd8e289d Mon Sep 17 00:00:00 2001
+From: Pydera <pydera@mailbox.org>
+Date: Thu, 8 Apr 2021 17:36:16 +0200
+Subject: [PATCH] Fix out of buffer access in #1529
+
+---
+ src/jp2image.cpp | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/jp2image.cpp b/src/jp2image.cpp
+index 88ab9b2d6..12025f966 100644
+--- a/src/jp2image.cpp
++++ b/src/jp2image.cpp
+@@ -776,9 +776,10 @@ static void boxes_check(size_t b,size_t m)
+ #endif
+                 box.length = (uint32_t) (io_->size() - io_->tell() + 8);
+             }
+-            if (box.length == 1)
++            if (box.length < 8)
+             {
+-                // FIXME. Special case. the real box size is given in another place.
++                // box is broken, so there is nothing we can do here
++                throw Error(kerCorruptedMetadata);
+             }
+ 
+             // Read whole box : Box header + Box data (not fixed size - can be null).
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index ed1e8de5c2..a13db42edd 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -9,7 +9,8 @@ SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
 inherit dos2unix
-SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch"
+SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
+            file://CVE-2021-29457.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.17.1

