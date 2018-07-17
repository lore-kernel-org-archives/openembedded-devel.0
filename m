Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f45.google.com (mail-pl0-f45.google.com
	[209.85.160.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7B92878869
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:51:02 +0000 (UTC)
Received: by mail-pl0-f45.google.com with SMTP id 94-v6so4154338ple.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Tm/8UinkdCv6Lub2EBtjbGSFFiH1ek5er6KeP11gAI=;
	b=QPuOG23ZKv1/L2Urs1RBXdIcOvltzjFjFBplXvvGzMjV8dFFnuBL/fGpSU7ZddqC6o
	Yh0/q1foKdbnrM6zriX15y+5w75B0OEBAAfsPUEk7o/HqtXIGuiu9biFOHs1CnnozFAA
	PR60EODMOWaO+hilgMS5iEGiztuKfz9SwwtwHRwGHMxuC4Cb5pSOmIajEUusyGDfJ1D1
	NshvWUIFJliAIDjtbKXYqYef4H1+bzDv7BgdHdJHeot0PKYy/pILZZHJhg/+GtNrrvmb
	Iay7YuTP+znOGOG+POcwr+atlOqotPbE7AUwid3MUbBKlkcSCN+HqNhSAdVJshCi9gYQ
	hTTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Tm/8UinkdCv6Lub2EBtjbGSFFiH1ek5er6KeP11gAI=;
	b=R6McyrMblIAiAKb7s8dR06VQAe+C7OU3B9gMHzHxygE5/IX4Aww8BEPt41KSNe8Cm8
	K7GoIl/2P43Th5FFZ3sDqWc5k2OGRZTtaoxaPJQek6AEEBzjUFZx+I2fhWfe4x5kd4le
	6AXUBzbtr6nlc3KCvq9EKHsHcJQ7rufBLLSBos1Prt9b5gQZMJzpJkbFsYOKBRHG7nSw
	5X5hrVLtF2ntEsWrzCiwiwjAoiZFPKUFEnHVKVzePuPXaNZi2ZRwDjUHUVmOKDzuCJo/
	4ir9JhK93dCgBn6qQIE+OqKu+EYWEfqq8ciyWyZ2CX2fTM+NU8+HLZmvpiA40Vrh3YJ+
	F4Vg==
X-Gm-Message-State: AOUpUlEhDfOTfgVFlKKEocEh3maJpNM3mFNRPkn7xlVrtZIcgap/ycWk
	l8ysts4kibs8OhJw1VZfZmFPMQ==
X-Google-Smtp-Source: AAOMgpeda0IN/Fk3iFkRDNRUDVXNhl/zP/VXgtjLxFtI5dEvCJBOsfOlWg1Yaxg0cPWy7u2rZIL/Lg==
X-Received: by 2002:a17:902:5617:: with SMTP id
	h23-v6mr18642684pli.324.1531792263131; 
	Mon, 16 Jul 2018 18:51:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm27878586pfd.71.2018.07.16.18.51.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 18:51:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 18:50:50 -0700
Message-Id: <20180717015053.8191-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180717015053.8191-1-raj.khem@gmail.com>
References: <20180717015053.8191-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] volume-key: Upgrade to 0.3.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 01:51:02 -0000

Add dependency on swig-native which was missing

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...icitly-support-python3-by-pkg-config.patch | 26 +++++++++----------
 ...lume-key_0.3.9.bb => volume-key_0.3.10.bb} |  5 ++--
 2 files changed, 15 insertions(+), 16 deletions(-)
 rename meta-oe/recipes-extended/volume_key/{volume-key_0.3.9.bb => volume-key_0.3.10.bb} (84%)

diff --git a/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch b/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
index 03edb13909..7fc76ab2f9 100644
--- a/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
+++ b/meta-oe/recipes-extended/volume_key/files/0001-explicitly-support-python3-by-pkg-config.patch
@@ -1,4 +1,4 @@
-From 18415c0b4c6e50ed9b99dfdae8d210590d0ab72e Mon Sep 17 00:00:00 2001
+From 968c7506bea3b8d66e18a562d8b8491172631b37 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Fri, 28 Apr 2017 04:50:30 -0400
 Subject: [PATCH] explicitly support python3 by pkg-config
@@ -9,13 +9,14 @@ use pkg-config to replace
 Upstream-Status: Inappropriate [wr-installer specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+
 ---
  Makefile.am  | 5 ++---
  configure.ac | 2 ++
  2 files changed, 4 insertions(+), 3 deletions(-)
 
 diff --git a/Makefile.am b/Makefile.am
-index 4569bbf..7a8daf4 100644
+index 68560b1..ee2b4dc 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -20,7 +20,6 @@ ACLOCAL_AMFLAGS = -I m4
@@ -39,18 +40,15 @@ index 4569bbf..7a8daf4 100644
  
  src_volume_key_SOURCES = src/volume_key.c
 diff --git a/configure.ac b/configure.ac
-index ff35dd0..0928a6c 100644
+index 40c3906..16c067d 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -27,6 +27,8 @@ AM_INIT_AUTOMAKE([no-dist-gzip dist-xz no-define subdir-objects -Wall])
- AC_PROG_CC
- AM_PROG_CC_C_O
- LT_INIT([disable-static])
-+
-+PKG_CHECK_MODULES(python3, [python3])
- AM_PATH_PYTHON
+@@ -31,6 +31,8 @@ LT_INIT([disable-static])
+ AC_PATH_PROGS(PYTHON, python2.7 python2.6 python2 python, [Python is required])
+ AM_PATH_PYTHON([2.6], [], AC_MSG_ERROR([Python 2.6 or 2.7 is required]))
  
- dnl Not gpg2, it cannot receive passphrases from gpgme
--- 
-2.8.1
-
++PKG_CHECK_MODULES(python3, [python3])
++
+ AC_PATH_PROG([GPG], [gpg2])
+ AC_ARG_VAR([GPG])
+ AC_DEFINE_UNQUOTED([GPG_PATH], "$GPG", [Path to the gpg2 executable])
diff --git a/meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb b/meta-oe/recipes-extended/volume_key/volume-key_0.3.10.bb
similarity index 84%
rename from meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb
rename to meta-oe/recipes-extended/volume_key/volume-key_0.3.10.bb
index febf3f256d..e8d20553fb 100644
--- a/meta-oe/recipes-extended/volume_key/volume-key_0.3.9.bb
+++ b/meta-oe/recipes-extended/volume_key/volume-key_0.3.10.bb
@@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "https://releases.pagure.org/volume_key/volume_key-${PV}.tar.xz \
            file://0001-explicitly-support-python3-by-pkg-config.patch \
 "
-SRC_URI[md5sum] = "a2d14931177c660e1f3ebbcf5f47d8e2"
-SRC_URI[sha256sum] = "450a54fe9bf56acec6850c1e71371d3e4913c9ca1ef0cdc3a517b4b6910412a6"
+SRC_URI[md5sum] = "605fd99a6e42916728020562a6edee78"
+SRC_URI[sha256sum] = "c5729de7e33e39c8674e9aae2337d2719f9298d6499f1656d0d25a065a7e98a7"
 
 SRCNAME = "volume_key"
 S = "${WORKDIR}/${SRCNAME}-${PV}"
@@ -25,6 +25,7 @@ DEPENDS += " \
     cryptsetup \
     nss \
     gpgme \
+    swig-native \
 "
 
 RDEPENDS_python3-${PN} += "${PN}"
-- 
2.18.0


