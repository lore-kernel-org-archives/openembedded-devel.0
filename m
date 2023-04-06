Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD042C7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 03:09:52 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.149951.1680750592007080293
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Apr 2023 20:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ge3NsxQl;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id x15so36039558pjk.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Apr 2023 20:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680750591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXB/BagWcWUZVe9mE+EDYw0XVMfaN3retJRMLEfZKoM=;
        b=ge3NsxQlYVTddEmNvcGejaYLb/Lr/tIEihpyAkkTLpxTtOpT5IK9Ix5cwF11uiwxzZ
         LpfDvj2azm5XXOkMpmUvpoyIPHAD0/P+UQBJC7LF7uzCc3BGjWAbbvinCuCjhFDkCOg3
         TLLb4c4sI7CBZD8B3NopE4yTdar8dA5j6vzAqzUqgH5tntEpNa1YB1H6TE515Uo0lHZh
         IyMFg9WD+qzIuOIETeCcfKejwf6menvvOhd37HXa+JUdBnofOUHVyfNmPfO5xq1twVYP
         ZJWVvgSSNTFwHfMnWG0Dnoga/tqkxDBAAjIN6SeF7KocESMp0wEQpqc06XGJehQcfCH2
         PvGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680750591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXB/BagWcWUZVe9mE+EDYw0XVMfaN3retJRMLEfZKoM=;
        b=pc1fzPjiGTvWzuceaOp00DdC62NS0T1gtdL3SPgQo0SdfiuxPdEOfTsT5lgPupq1q/
         OZ7Jx3XpUj9L/6kIJl97shYqZWvVf864drwPeAaMdREhuHKT8FsAxOkvlsFru8ezVUq2
         9cwpTZbK4xXfmG+wmbf53BJr/buRB29UayM8ywd2kCH0/3oaalMVi3DlmOtkd65MvPbx
         X2HhEkQa0mfPqQ/EWT7+4xev8A6oDOIY5IYFj0sfD6xlBuAO1Ugt9I8oOzjKcJDHbPH5
         ZPER9BJU7rvagVoNiMPHGpg74TDXtzoTsLWuj11O6eI6FUhv/ssQKUm3sCJGRKKGwtoX
         a0+g==
X-Gm-Message-State: AAQBX9dcyd5Va874Nx79Gz6Lm96h0orIk+t6Yo2B7SuHNBMTmzCoWgLd
	lHPpCWeZAakbIQ26EP8R6aMA1k+Ci+i+oQ==
X-Google-Smtp-Source: AKy350Y21Ye+La0d7rwM/S75ejwMHMJUVM4yQdndNPnlf4JsAs7sikviSrHGBrIOuunANM44JiOt5Q==
X-Received: by 2002:a17:902:f9cd:b0:1a2:85f0:e748 with SMTP id kz13-20020a170902f9cd00b001a285f0e748mr7875090plb.20.1680750590945;
        Wed, 05 Apr 2023 20:09:50 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::26f8])
        by smtp.gmail.com with ESMTPSA id bh10-20020a170902a98a00b001a2b79db755sm240449plb.140.2023.04.05.20.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 20:09:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] meta-gnome: Update patch status for several recipes
Date: Wed,  5 Apr 2023 20:09:48 -0700
Message-Id: <20230406030948.3282617-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Apr 2023 03:09:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101961

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Select-the-current-user-to-authenticate-with-by-defa.patch | 2 ++
 .../0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch    | 2 ++
 ...Get-user-icon-from-accountsservice-instead-of-lookin.patch | 3 +++
 ...Use-fresh-X11-timestamps-when-displaying-authenticat.patch | 3 +++
 ...configure.ac-disable-gnome-tools-that-are-not-provid.patch | 1 +
 .../0001-cmake-Do-not-export-CC-into-gir-compiler.patch       | 4 ++++
 ...0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch | 1 +
 .../libxklavier/libxklavier/fix-do_installe-failure.patch     | 2 +-
 .../accountsservice/0001-musl-Hack-to-fix-build.patch         | 2 ++
 .../0001-Makefile.am-Link-with-libm-for-powl-API.patch        | 1 +
 10 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0001-Select-the-current-user-to-authenticate-with-by-defa.patch b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0001-Select-the-current-user-to-authenticate-with-by-defa.patch
index 91f67bbc8a..f8f7ec34f9 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0001-Select-the-current-user-to-authenticate-with-by-defa.patch
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0001-Select-the-current-user-to-authenticate-with-by-defa.patch
@@ -5,6 +5,8 @@ Subject: Select the current user to authenticate with by default
 
 Bug: http://bugzilla.gnome.org/show_bug.cgi?id=596188
 Bug-Ubuntu: https://launchpad.net/bugs/435227
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/polkitgnomeauthenticationdialog.c | 23 ++++++++++++++---------
  1 file changed, 14 insertions(+), 9 deletions(-)
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch
index 76b96f47de..011fe6ef25 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0002-Auth-dialog-Make-the-label-wrap-at-70-chars.patch
@@ -6,6 +6,8 @@ Because GtkWindow doesn't have a default width anymore.
 
 Bug: https://bugzilla.gnome.org/show_bug.cgi?id=738688
 Bug-Ubuntu: https://launchpad.net/bugs/1382566
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/polkitgnomeauthenticationdialog.c | 2 ++
  1 file changed, 2 insertions(+)
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0003-Get-user-icon-from-accountsservice-instead-of-lookin.patch b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0003-Get-user-icon-from-accountsservice-instead-of-lookin.patch
index 4314939061..a3759c4dcf 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0003-Get-user-icon-from-accountsservice-instead-of-lookin.patch
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0003-Get-user-icon-from-accountsservice-instead-of-lookin.patch
@@ -4,6 +4,9 @@ Subject: Get user icon from accountsservice instead of looking in ~/.face
 
 Bug: https://bugzilla.gnome.org/show_bug.cgi?id=669857
 Bug-Ubuntu: https://launchpad.net/bugs/928249
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/polkitgnomeauthenticationdialog.c | 107 ++++++++++++++++++++++++++++++----
  1 file changed, 97 insertions(+), 10 deletions(-)
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
index 83ad38d833..2c9c5bb16b 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0004-Use-fresh-X11-timestamps-when-displaying-authenticat.patch
@@ -7,6 +7,9 @@ This circumvents focus-stealing prevention.
 Bug: https://bugzilla.gnome.org/show_bug.cgi?id=676076
 Bug-Debian: https://bugs.debian.org/684300
 Bug-Ubuntu: https://launchpad.net/bugs/946171
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/polkitgnomeauthenticator.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)
diff --git a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0005-configure.ac-disable-gnome-tools-that-are-not-provid.patch b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0005-configure.ac-disable-gnome-tools-that-are-not-provid.patch
index 153cca25e1..7eee12a920 100644
--- a/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0005-configure.ac-disable-gnome-tools-that-are-not-provid.patch
+++ b/meta-gnome/recipes-extended/polkit-gnome/polkit-gnome/0005-configure.ac-disable-gnome-tools-that-are-not-provid.patch
@@ -3,6 +3,7 @@ From: Markus Volk <f_l_k@t-online.de>
 Date: Fri, 24 Feb 2023 17:29:24 +0100
 Subject: [PATCH] configure.ac: disable gnome-tools that are not provided
 
+Upstream-Status: Inappropriate [OE-specific]
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  configure.ac | 4 ++--
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
index fda84acae7..118d93a72a 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0001-cmake-Do-not-export-CC-into-gir-compiler.patch
@@ -1,3 +1,7 @@
+Use G_IR_SCANNER without passing additional environment
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 --- a/cmake/modules/GObjectIntrospection.cmake
 +++ b/cmake/modules/GObjectIntrospection.cmake
 @@ -122,9 +122,7 @@ macro(gir_add_introspection gir)
diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
index 23c3a96d43..51eaf7cfef 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-server/0002-CMakeLists.txt-remove-CHECK_C_SOURCE_RUNS-check.patch
@@ -9,6 +9,7 @@ Content-Transfer-Encoding: 8bit
 * TRY_RUN: does not work for OE
 * HAVE_LKSTRFTIME is set by recipe as configure option
 
+Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
  CMakeLists.txt | 23 -----------------------
diff --git a/meta-gnome/recipes-gnome/libxklavier/libxklavier/fix-do_installe-failure.patch b/meta-gnome/recipes-gnome/libxklavier/libxklavier/fix-do_installe-failure.patch
index 29eeef3d50..6c32bfa14f 100644
--- a/meta-gnome/recipes-gnome/libxklavier/libxklavier/fix-do_installe-failure.patch
+++ b/meta-gnome/recipes-gnome/libxklavier/libxklavier/fix-do_installe-failure.patch
@@ -12,7 +12,7 @@ libxklavier.vapi': No such file or directory
 | 21 make[3]: *** [install-vapiDATA] Error 1
 | 22 make[3]: *** Waiting for unfinished jobs....
 
-Upstream-Stauts: Pending
+Upstream-Status: Pending
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
diff --git a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
index 99bd09a6c3..944d2f9165 100644
--- a/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
+++ b/meta-gnome/recipes-support/accountsservice/accountsservice/0001-musl-Hack-to-fix-build.patch
@@ -3,6 +3,8 @@ From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
 Date: Sun, 8 Dec 2019 23:42:00 +0100
 Subject: [PATCH] musl: Hack to fix configure
 
+Upstream-Status: Inappropriate [Musl Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  meson.build | 11 ++++++++---
  1 file changed, 8 insertions(+), 3 deletions(-)
diff --git a/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch b/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch
index 8ea34cf239..7a052b23b9 100644
--- a/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch
+++ b/meta-gnome/recipes-support/usermode/usermode/0001-Makefile.am-Link-with-libm-for-powl-API.patch
@@ -3,6 +3,7 @@ From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 25 Jul 2017 18:28:15 -0700
 Subject: [PATCH] Makefile.am: Link with libm for powl() API
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  Makefile.am | 2 +-
-- 
2.40.0


