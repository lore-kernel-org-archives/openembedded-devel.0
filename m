Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web11.8120.1596153624135242086
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jul 2020 17:00:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jHrgLg4b;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id l4so29638357ejd.13
        for <openembedded-devel@lists.openembedded.org>; Thu, 30 Jul 2020 17:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=95CXADfc/Ma3OsOGclXup2m3m41OlNWbcg5mUXu+aTM=;
        b=jHrgLg4bjR8tUkDCXM7U6b0AzLab2xtLzDezgXLHeeDLc1WJnYqNXl5vp48Mi836cs
         b1XYNmwhbQZbbhpFfnc/P9Ggwff8CMdonZczo/DnbrxddzlBwTpwUuGfO0obW7kkLkPq
         P4AcPraSlb9EH7yMNlAkzkcXZxs3c28UVNVahmnfjgfuxDesCTMzGGZ2Bkb8OiPfjr9h
         TdN3EnXQj1iLMz3AYgFaNvvx3AnnKsnIpxG6u5/Xi4eRX0JPIAOpk1M+QggmrFGWO99A
         MAuImWcjzzrD29lMv31FPGAeOKDwW80ZSuqMkH1jwEHB5e7kitZF1vIyLdFZgkBFkjHS
         /Apg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=95CXADfc/Ma3OsOGclXup2m3m41OlNWbcg5mUXu+aTM=;
        b=c/devT1bwpGbfwbSe00BdqF8qL8yrhSGycRXZ97R9A2wUYVzkl8jhxiMFoqP90hyNs
         z7tr9zU/ko5JNr6KgDivFwhFYC/ORkoaKwcuVvHuNbGe7UBfFcVkNAZFS7NXUZj0P6Mt
         yCS43+vHCO0SRSAZ1wxGhV66daS6MvfZHISphixEk0LmsUG+bucuXOiqPu9/OSwAsezv
         HZTty9lfLFZnFMGhbNPZVkpkbRvQr94V8hFC8kMUgZac/HMwXX5BqAwuvnlL0fsbNIXm
         noq+L4RKNRf3yo32htKNbGBJh2VRoNZRbEqLFtNaG7kpbrvcLwv2IeDCzlUfFUnXKJ1x
         S05g==
X-Gm-Message-State: AOAM531MCaivir4B6BM5a0Q1QofmdtDK+lWRd6pq7yCAHoUnbcP2d/uJ
	qVXS7jt4+9iPDMdyMgxVNEAWYkJV
X-Google-Smtp-Source: ABdhPJxHUEn5YLN9YD1nskgCVf82afGCiwD6Os0NQIK0So7O23XM2H4zFAqe32lmds2t6FWxZW/hng==
X-Received: by 2002:a17:906:65b:: with SMTP id t27mr1563928ejb.457.1596153621892;
        Thu, 30 Jul 2020 17:00:21 -0700 (PDT)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f120620ff8937d1a8714aa4.dip0.t-ipconnect.de. [2003:f0:7f12:620:ff89:37d1:a871:4aa4])
        by smtp.gmail.com with ESMTPSA id a19sm7687997ejg.116.2020.07.30.17.00.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2020 17:00:21 -0700 (PDT)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/4] exiv2: upgrade 0.27.1 -> 0.27.3
Date: Fri, 31 Jul 2020 02:00:04 +0200
Message-Id: <20200731000007.452878-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...-protection-only-if-compiler-arch-su.patch | 40 +++++++++++++++++++
 .../{exiv2_0.27.1.bb => exiv2_0.27.3.bb}      |  7 +++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
 rename meta-oe/recipes-support/exiv2/{exiv2_0.27.1.bb => exiv2_0.27.3.bb} (52%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
new file mode 100644
index 000000000..96146a195
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
@@ -0,0 +1,40 @@
+From 04d5f4805a86302a0e135a28d58a6c1ff6a68d52 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 30 Jul 2020 23:03:51 +0200
+Subject: [PATCH] Use compiler -fcf-protection only if compiler/arch supports
+ it
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+There have been some PRs they were either rejected or some general suggestion
+for more flags suggested. So
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ cmake/compilerFlags.cmake | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/cmake/compilerFlags.cmake b/cmake/compilerFlags.cmake
+index 12caf42..455525e 100644
+--- a/cmake/compilerFlags.cmake
++++ b/cmake/compilerFlags.cmake
+@@ -26,7 +26,12 @@ if ( MINGW OR UNIX OR MSYS ) # MINGW, Linux, APPLE, CYGWIN
+         # This fails under Fedora, MinGW GCC 8.3.0 and CYGWIN/MSYS 9.3.0
+         if (NOT (MINGW OR CMAKE_HOST_SOLARIS OR CYGWIN OR MSYS) )
+             if (COMPILER_IS_GCC AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 8.0)
+-                add_compile_options(-fstack-clash-protection -fcf-protection)
++                # Gcc does support -fcf-protection on few arches only
++                CHECK_CXX_COMPILER_FLAG(-fcf-protection COMPILER_SUPPORTS_FCF_PROTECTION)
++                if (COMPILER_SUPPORTS_FCF_PROTECTION)
++                    add_compile_options(-fcf-protection)
++                endif()
++                add_compile_options(-fstack-clash-protection)
+             endif()
+ 
+             if( (COMPILER_IS_GCC   AND CMAKE_CXX_COMPILER_VERSION VERSION_GREATER_EQUAL 5.0) # Not in GCC 4.8
+-- 
+2.21.3
+
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
similarity index 52%
rename from meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb
rename to meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index 97116ee2d..ed1e8de5c 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.1.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -5,8 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 DEPENDS = "zlib expat"
 
 SRC_URI = "https://exiv2.org/releases/${BPN}-${PV}-Source.tar.gz"
-SRC_URI[md5sum] = "56d064517ae5903dd963b84514a121c1"
-SRC_URI[sha256sum] = "f125286980fd1bcb28e188c02a93946951c61e10784720be2301b661a65b3081"
+SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
+
+# Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
+inherit dos2unix
+SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 
-- 
2.26.2

