Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
 by mx.groups.io with SMTP id smtpd.web10.3044.1599324975960404821
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Sep 2020 09:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y/+j6UJO;
 spf=pass (domain: gmail.com, ip: 209.85.210.195, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f195.google.com with SMTP id v196so6343001pfc.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 05 Sep 2020 09:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=yV4egbfuTUc9wXzTVU7sRFBUsA6BV7dd7zIQaxLvRG8=;
        b=Y/+j6UJOd+WIsx38bhpcaemSx5G7UN+S6OFRJK6//XoUCydYmjc3uTHkphAQLJHR1k
         I+v3O3AUxRuDm7YWexIazSUd10cFeaMTlFclWSprchmRXuw5oSXpicqF5I57374ertpW
         KcD0g2F68sgqoM2OOB9sYYD7bSDsRl0zyWoe3z36TqMz1HRiLnUjQXd79fqWuHeKs5M8
         h7p+M0S4HFWw/O5tF1tUfDRFep+OTiksjI7ubJRvjbJzqe8aWZz66lcO1z5vSneRCNNc
         1p8ugJI4PjkCAzEptphD/+uNULJaOjOsMGuOo50T5KB8NTpTTh7gi4Hcs8FkKDFuBmp4
         OllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yV4egbfuTUc9wXzTVU7sRFBUsA6BV7dd7zIQaxLvRG8=;
        b=qOksthdDPkh3lxP7FW7UuB8hukHWC8mR6rgCe4hA4+ytQUAt3HAaKQd4jPMlGnHUow
         cntddHpc6qnO47/IooBdn+zZ4TP5WQ4JQazyJMjZbS/+1rsMsEoyaXZwpJWCj9Est+Sz
         IsCG5aEwmfz1zt9KBsCHbfo47g3gPCoRwEg92cZIMK9yCx+7T/zV4ZfNKUKJUlArmO1v
         IqsgA+nKsgdNIm60sqY+7rdjz8sdRlloOR38BSvrZwyF8B/TBN5GHV7vaxy8nD5LF8Sm
         +FPt95Sae7yBEUBiP4+x86V+kB4eBdmk19PC0mBC1GEHzAWMd4YyOEOupZRVA4AM73it
         zE3w==
X-Gm-Message-State: AOAM533VF24iQI6xtN7a6lOKIpAuVlBjboSTq4FIZF547PH4y+C89BJO
	9zVhDQYfoBN4H0BfM8pwOIxCDq5Ye/c=
X-Google-Smtp-Source: ABdhPJw6RQvil8rL98EJtBHR4H0rzeWgKzQcsl1cDif4XftwIq1TZsEr9+W6Jy/M3UFwvtmZfKTl4g==
X-Received: by 2002:a62:5284:: with SMTP id g126mr13386057pfb.139.1599324975289;
        Sat, 05 Sep 2020 09:56:15 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net ([2601:202:4180:a5c0:745b:fcae:da87:5147])
        by smtp.gmail.com with ESMTPSA id lb1sm7410944pjb.26.2020.09.05.09.56.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 09:56:14 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [dunfell 10/20] exiv2: upgrade 0.27.1 -> 0.27.3
Date: Sat,  5 Sep 2020 09:55:53 -0700
Message-Id: <5fe92ba89e7f3c05eebb15592720974ae92a5d6a.1599324864.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1599324864.git.akuster808@gmail.com>
References: <cover.1599324864.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 6443044ca9ec90d6740c42e618830ca52d656f5f)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...-protection-only-if-compiler-arch-su.patch | 40 +++++++++++++++++++
 .../{exiv2_0.27.1.bb => exiv2_0.27.3.bb}      |  7 +++-
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
 rename meta-oe/recipes-support/exiv2/{exiv2_0.27.1.bb => exiv2_0.27.3.bb} (52%)

diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch
new file mode 100644
index 0000000000..96146a1957
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
index 97116ee2d1..ed1e8de5c2 100644
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
2.17.1

