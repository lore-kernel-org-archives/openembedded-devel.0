Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web09.1885.1612579212292587311
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Feb 2021 18:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bd8tOcPs;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id fa16so4191326pjb.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 05 Feb 2021 18:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRQv/p55HLbIqLs3acK4CEJ890aC92Fuzrz2KtiYHGI=;
        b=bd8tOcPsWWsRPzWwN4x1++MUurKkf3B22Czyox14Y99aqdMcRbS0jKnJ7lP8B9EA5x
         4hfVdMA8zEPz/1JVGHASIqg116YAz6EkhMEVtB44KtLd0TNv1KiDWArkLSOmflb2JoJQ
         Egi/cbtsNJVLB5f0N3m+pGVLunBotmAeYSqFqEUpVi1cBM2OVjo27ZEUAwJQUnn6q0Na
         aTYkLHq2YrqQBaygvinvyAxV+mEFPRVpKAoqrsZ75aL0QzgDyqz3PI90wLgubf+gb94h
         pUc3sbRqaj6t96xJOhUslbWj4Ab3mUBHAO7zJqz2Bl3q1sSkJufxqfVfyfwBfkP/J+dP
         VStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oRQv/p55HLbIqLs3acK4CEJ890aC92Fuzrz2KtiYHGI=;
        b=thyeaiDMd+eGr/5mNcb+DjDM2sIB/zedmiz4f7bQL/cJE3Xs80EBdDGJd5DCz+Udmv
         5WFtxhIxCMO5WzsxwEtk2eFDGCR3HekAotx5vUvkZaKVHIAnZM7s9tiVMRe0/e3ugKVZ
         905hOVUvG+YSxpjB14BVADJGVX81AyNJARSbA05rZrsvSM2HV739uX0JB/hfpmUdTDPf
         K15rwaFk8gsaQgi7c/0uCRcS46aAoNYtG5LyT1uG1JyVqDAa98KU0eNj6Aa9dpSdn5FB
         JfkMiKKPrzbPu3VHmU3yGSUexY/oyB6451FA5HPiWXVAOUn3oP3sr3WpdW5IYrXjQV7Y
         hxUA==
X-Gm-Message-State: AOAM532XlVrkIpuBi0/aI8A4h4PzVvEOzPAggrwctxexTMVfqRZ1xhZC
	8AJBJFhGbM+E2idDp7PNOsdk/peQBu7tDw==
X-Google-Smtp-Source: ABdhPJymPoHgb3UFQeILwZmrpRPP81xFdQDnhnZ86NM4QuV9ecXAoWXXe9nkRYSFMv9oJxf9A7BZsw==
X-Received: by 2002:a17:90b:350b:: with SMTP id ls11mr6808114pjb.166.1612579211355;
        Fri, 05 Feb 2021 18:40:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::d188])
        by smtp.gmail.com with ESMTPSA id b17sm11328946pfp.167.2021.02.05.18.40.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Feb 2021 18:40:10 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] libstatgrab: Fix build with autoconf 2.70+
Date: Fri,  5 Feb 2021 18:40:08 -0800
Message-Id: <20210206024008.827594-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...re.ac-Do-not-use-single-line-comment.patch | 33 +++++++++++++++++++
 .../libstatgrab/libstatgrab_0.92.bb           |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch

diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch b/meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch
new file mode 100644
index 0000000000..46493bb9e7
--- /dev/null
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab/0001-configure.ac-Do-not-use-single-line-comment.patch
@@ -0,0 +1,33 @@
+From a8502c5a7e336f1e5068f9dd3bdb359d787f9bdc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 5 Feb 2021 18:35:12 -0800
+Subject: [PATCH] configure.ac: Do not use single line comment
+
+autoconf 2.70+ does not like it and regenerating configure script fails
+
+| ../libstatgrab-0.92/configure: line 7818: syntax error near unexpected token `ac_fn_check_decl'
+| ../libstatgrab-0.92/configure: line 7818: `fi ac_fn_check_decl "$LINENO" "__sun" "ac_cv_have_decl___sun" "$ac_includes_default" "$ac_c_undeclared_builtin_options" "CFLAGS"'
+
+Upstream-Status: Submitted [https://github.com/libstatgrab/libstatgrab/pull/128]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 99518f8..74e7f0f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -100,7 +100,8 @@ AC_TYPE_UNSIGNED_LONG_LONG_INT
+ 
+ dnl Check for extra flags to enable some kind of behavior
+ AC_CHECK_DECL([_AIX],[ac_cv_need_minus_d_linux_source_compat="yes"; ac_cv_need_minus_d_all_source="yes"])
+-AC_CHECK_DECL([__linux],[ac_cv_need_minus_d_gnu_source="yes"]) dnl probably required by kfreebsd, too?
++dnl probably required by kfreebsd, too?
++AC_CHECK_DECL([__linux],[ac_cv_need_minus_d_gnu_source="yes"])
+ AC_CHECK_DECL([__sun],[ac_cv_need_minus_d_extensions="yes"; ac_cv_need_minus_d_posix_pthread_semantics="yes"])
+ AC_CHECK_DECL([__hpux],[ac_cv_need_minus_d_hpux_source="yes"])
+ 
+-- 
+2.30.0
+
diff --git a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
index 27fe0e2c40..a47d3bf000 100644
--- a/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
+++ b/meta-oe/recipes-extended/libstatgrab/libstatgrab_0.92.bb
@@ -10,6 +10,7 @@ PACKAGES_prepend = "statgrab statgrab-dbg saidar saidar-dbg ${PN}-mrtg "
 
 # don't use the git tag unless docbooc2x is available to build the manpages
 SRC_URI = "https://github.com/libstatgrab/libstatgrab/releases/download/LIBSTATGRAB_0_92/libstatgrab-0.92.tar.gz \
+           file://0001-configure.ac-Do-not-use-single-line-comment.patch \
           "
 SRC_URI[md5sum] = "5362b2ddbec54b3901e7d70c22cda249"
 SRC_URI[sha256sum] = "5bf1906aff9ffc3eeacf32567270f4d819055d8386d98b9c8c05519012d5a196"
-- 
2.30.0

