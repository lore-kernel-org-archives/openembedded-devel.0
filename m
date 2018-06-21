Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id A56817868D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jun 2018 06:21:59 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id d10-v6so1098652plo.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Jun 2018 23:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=aJ2NDIAt66zbpZFhFGDvRTVD/G2GjHhCItmeyJDCpKU=;
	b=ByUf9DM0lq40obEiZftEnH+I8V2GxCXIYlDpvHttM96j6G4m5itVMHWooTqwdfJnpn
	FrFs6YttdpoVAChI9b9Qnry7LVkYz3Q0uoeuzKw5Pv8xLddNaEh513teCUxLc5TlgPQG
	KTez+jx2Jen2enDam7Srlao3VmdAIMoJFMeXYsmwj4qYOBnRGrLzTNfWESABj/jGD/eF
	FgbsQ8wS1VUceykgtyU4dzuE+GmcUIlMDN0BOxq7cXgwS7uw/rAsTUCquTlDRKY3XHYT
	k3O4bKwERee/Jj5lPxiKFPE/86e8Ifgh6X5I+JeIAbJ873bVEPW3VcLPFPPQFdubwTcg
	+MHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=aJ2NDIAt66zbpZFhFGDvRTVD/G2GjHhCItmeyJDCpKU=;
	b=e2/fSa9Fbo1kI4UVo+wkUDMrNsA15JOstNOHWUbO7N5Jfjx7KMWExXck+as8cYlyp7
	EMD5CZKsnf2ssxplcWDajzltjYElzkHRo1YVmg5fMTA4pRvsbrpjT8xSF/vZb6Q7Ckb8
	ASCudRYjeNzuWIUwx0Xu2q8yUAxnwWOTyd9aLeFHenw+A+sufeAzLXOqrKEG9vw9K0qt
	aSwfeS1LodHb4/nTg1V+81XOvLxuWszTBlIQ+alqnpX9CkVAOh8/AHk4OdLeDDTo6NyO
	QCYSBItO4d7iyBaudIc+xF14eLmRXyDic6PJcc028+3+7t4Bn48UcjrqMj5tXamSK4C9
	WbMQ==
X-Gm-Message-State: APt69E0eDCpapzJTJ0sx1KU5GR6hIVkpoN46QCWcwHgbpcC0xiFApzTf
	K1vpcjhS65EP94LoeJlHUrepfA==
X-Google-Smtp-Source: ADUXVKKhguiYidEPhlS1IKNvNfdLOOgPg+s3R7yOBm83dfDLXzBJW+vpaXhflHIzEwPSrFpu8iURlg==
X-Received: by 2002:a17:902:6a89:: with SMTP id
	n9-v6mr26906169plk.302.1529562120236; 
	Wed, 20 Jun 2018 23:22:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	q82-v6sm9067154pfg.170.2018.06.20.23.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jun 2018 23:21:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Jun 2018 23:21:57 -0700
Message-Id: <20180621062157.33453-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] tiptop: Fix parallel build issues
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
X-List-Received-Date: Thu, 21 Jun 2018 06:21:59 -0000

- Fix reproducible build issue
- Fix out of tree builds

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../tiptop/0001-Fix-build-when-S-B.patch      | 28 ++++++++++++++++
 ...rallel-build-problems-by-Adrian-Bunk.patch | 28 ++++++++++++++++
 ...fix-reproducibility-of-build-process.patch | 32 +++++++++++++++++++
 .../recipes-extended/tiptop/tiptop_2.3.1.bb   |  9 ++++--
 4 files changed, 95 insertions(+), 2 deletions(-)
 create mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-build-when-S-B.patch
 create mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch
 create mode 100644 meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch

diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-build-when-S-B.patch b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-build-when-S-B.patch
new file mode 100644
index 0000000000..51756b891e
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-build-when-S-B.patch
@@ -0,0 +1,28 @@
+From ad907b1aff217fe3b431ae052025ba8ba6cacc01 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Jun 2018 23:14:58 -0700
+Subject: [PATCH] Fix build when S != B
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 4392c06..2c5cae4 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -69,7 +69,7 @@ install:
+ 	$(INSTALL) -d $(DESTDIR)$(bindir)
+ 	$(INSTALL) -m 0755 tiptop $(DESTDIR)$(bindir)
+ 	$(INSTALL) -d $(DESTDIR)$(man1dir)
+-	$(INSTALL) -m 0644 tiptop.1 $(DESTDIR)$(man1dir)
++	$(INSTALL) -m 0644 $(srcdir)/tiptop.1 $(DESTDIR)$(man1dir)
+ 	ln $(DESTDIR)$(bindir)/tiptop $(DESTDIR)$(bindir)/ptiptop
+ 	ln $(DESTDIR)$(man1dir)/tiptop.1 $(DESTDIR)$(man1dir)/ptiptop.1
+ 
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch
new file mode 100644
index 0000000000..ae676ae449
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/tiptop/0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch
@@ -0,0 +1,28 @@
+From 848983a30dc99248ec45632bfc31718716a86e9d Mon Sep 17 00:00:00 2001
+From: Tomasz Buchert <tomasz@debian.org>
+Date: Fri, 7 Jul 2017 21:15:58 +0200
+Subject: [PATCH] Fix parallel build problems (by Adrian Bunk)
+
+Taken from debian
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 32ab563..1993c9b 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -59,8 +59,9 @@ lex.yy.c: calc.lex
+ lex.yy.o: lex.yy.c
+ 	$(CC) $(CFLAGS) -I$(srcdir) -c lex.yy.c
+ 
++y.tab.c: y.tab.h
+ 
+-y.tab.c y.tab.h: calc.y
++y.tab.h: calc.y
+ 	$(YACC) -d $(srcdir)/calc.y
+ 
+ y.tab.o: y.tab.c
diff --git a/meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch b/meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch
new file mode 100644
index 0000000000..cecb70bc99
--- /dev/null
+++ b/meta-oe/recipes-extended/tiptop/tiptop/0002-fix-reproducibility-of-build-process.patch
@@ -0,0 +1,32 @@
+From 89dd9d8705408dccd5c5e47d22eba6fd6ec22b50 Mon Sep 17 00:00:00 2001
+From: Tomasz Buchert <tomasz@debian.org>
+Date: Thu, 9 Jul 2015 16:07:23 +0200
+Subject: [PATCH] fix reproducibility of build process
+
+The upstream Makefile sets macros that depend on
+a particular platform where the package is built.
+We don't set them which fixes the problem.
+
+Taken from debian
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/Makefile.in | 4 +---
+ 1 file changed, 1 insertion(+), 3 deletions(-)
+
+diff --git a/src/Makefile.in b/src/Makefile.in
+index 1993c9b..4392c06 100644
+--- a/src/Makefile.in
++++ b/src/Makefile.in
+@@ -48,9 +48,7 @@ Makefile: Makefile.in ../config.status
+ 
+ 
+ version.o: version.c
+-	$(CC) $(CFLAGS) -DCOMPILE_HOST="\""`hostname`"\"" \
+-                        -DCOMPILE_DATE="\"`date`\"" \
+-                        -c $(srcdir)/version.c
++	$(CC) $(CFLAGS) -c $(srcdir)/version.c
+ 
+ 
+ lex.yy.c: calc.lex
diff --git a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
index 04084ecb40..cf67a08b3e 100644
--- a/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
+++ b/meta-oe/recipes-extended/tiptop/tiptop_2.3.1.bb
@@ -4,11 +4,16 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 DEPENDS = "ncurses libxml2 bison-native flex-native"
 
-SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz"
+SRC_URI = "http://tiptop.gforge.inria.fr/releases/${BP}.tar.gz \
+           file://0001-Fix-parallel-build-problems-by-Adrian-Bunk.patch \
+           file://0002-fix-reproducibility-of-build-process.patch \
+           file://0001-Fix-build-when-S-B.patch \
+           "
 SRC_URI[md5sum] = "46ca0fdf0236f02dd2b96d347626d2a2"
 SRC_URI[sha256sum] = "51c4449c95bba34f16b429729c2f58431490665d8093efaa8643b2e1d1084182"
 
-inherit autotools-brokensep
+inherit autotools
+
 EXTRA_OECONF = "CFLAGS="$CFLAGS -I${STAGING_INCDIR}/libxml2""
 COMPATIBLE_HOST = "(i.86|x86_64|arm|powerpc|aarch64).*-linux"
 
-- 
2.17.1


