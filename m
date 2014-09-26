Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id C03B065D59
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 09:44:08 +0000 (UTC)
Received: by mail-la0-f41.google.com with SMTP id s18so14240146lam.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Sep 2014 02:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CPFB+F9nZLmqgo1tc0219rlp2KOlwnDIofWFZaxDZ4g=;
	b=bWibplz3qFGW6ZEvgEfs2fEitAn4QdSC84lFkL++VQrBg6kZf1ec7TKiPb66pqscRN
	rSZKM2Y35ugGeTExnBRJqR/hjCt/fac9rD3LoHptoTO+RKAf/rTO5aBa5ah2FXuUO7l2
	cnFXQtHqMVjTWFatd+Ygzc1hePPa7tyodyEVobWMIJi5q0y0/TO/N9eD1u0Z/bRw032Z
	jP+eZLNYQ9Monz+74lSzLMOgPCbPU5N9i1VzZc7XX5NeXuUCeCtBrrnHMpBdBfxgG7Cv
	uaxFi4HNdu4QkqMR46yx+qNm1V8YASCgaxQVXS6ZSzDKjAfRvZWlQgn0t3NWcRWjnyHC
	ydxw==
X-Gm-Message-State: ALoCoQkQr1kpwkfaH7+/sVrjyovkiPe4RAHCmNAQDYeTj43aNzeNjeaPA+yqJXX+NpGW2eP8hbCg
X-Received: by 10.112.149.36 with SMTP id tx4mr18164872lbb.79.1411724649496;
	Fri, 26 Sep 2014 02:44:09 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194]) by mx.google.com with ESMTPSA id
	ll12sm1694912lac.45.2014.09.26.02.44.08 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Sep 2014 02:44:08 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Sep 2014 12:44:06 +0300
Message-Id: <1411724646-16968-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH] acpitests: update to 20140828 release
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Sep 2014 09:44:10 -0000

* update md5sums
* refresh patches
* update EXTRA_OEMAKE (sync with acpica recipe)

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../acpica/acpitests/aapits-linux.patch            |  4 +--
 .../acpica/acpitests/aapits-makefile.patch         | 36 +++++++++++++---------
 ...acpitests_20140424.bb => acpitests_20140828.bb} | 10 +++---
 3 files changed, 29 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpitests_20140424.bb => acpitests_20140828.bb} (69%)

diff --git a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
index 116761d..7c5d6b0 100644
--- a/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
+++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-linux.patch
@@ -326,8 +326,8 @@ diff -urN acpica-unix2-20130626/tests/aapits/Makefile acpica-unix2-20130626-aapi
 --- acpica-unix2-20130626/tests/aapits/Makefile	2013-01-17 12:48:29.000000000 -0700
 +++ acpica-unix2-20130626-aapits/tests/aapits/Makefile	2013-07-25 15:17:09.309236422 -0600
 @@ -194,7 +194,7 @@
- CFLAGS+= -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include 
- 
+ CFLAGS+= -Wall -g -D_LINUX -DNDEBUG -D_CONSOLE -DACPI_APITS -DACPI_EXEC_APP -D_MULTI_THREADED -Wstrict-prototypes -I../../source/include
+
  
 -acpiexec : $(patsubst %.c,%.o, $(SRCS))
 +$(PROG) : $(patsubst %.c,%.o, $(SRCS))
diff --git a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
index d38501b..4d9e997 100644
--- a/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
+++ b/meta-oe/recipes-extended/acpica/acpitests/aapits-makefile.patch
@@ -8,19 +8,27 @@ Upstream-status: Unknown
 diff -urN acpica-unix2-20140325/tests/aapits/Makefile acpica-unix2-20140325/tests/aapits/Makefile
 --- acpica-unix2-20140325/tests/aapits/Makefile	2014-04-05 14:23:14.683636794 -0600
 +++ acpica-unix2-20140325-aapits/tests/aapits/Makefile	2014-04-05 15:10:57.879184598 -0600
-@@ -20,6 +20,7 @@
- 	../../source/components/hardware/hwxface.c \
+@@ -16,6 +16,7 @@
+ 	atosxfwrap.c \
+ 	osunixxf.c \
+ 	../../source/common/ahids.c \
++	../../source/common/ahuuids.c \
  	../../source/common/cmfsize.c \
  	../../source/common/getopt.c \
-+	../../source/common/ahids.c \
- 	../../source/components/debugger/dbcmds.c \
- 	../../source/components/debugger/dbconvert.c \
- 	../../source/components/debugger/dbdisply.c \
-@@ -154,6 +155,7 @@
- 	../../source/components/tables/tbfadt.c \
- 	../../source/components/tables/tbfind.c \
- 	../../source/components/tables/tbinstal.c \
-+	../../source/components/tables/tbdata.c \
- 	../../source/components/tables/tbprint.c \
- 	../../source/components/tables/tbutils.c \
- 	../../source/components/tables/tbxface.c \
+ 	../../source/components/hardware/hwtimer.c \
+@@ -174,6 +175,7 @@
+ 	../../source/components/utilities/utexcep.c \
+ 	../../source/components/utilities/utfileio.c \
+ 	../../source/components/utilities/utglobal.c \
++	../../source/components/utilities/uthex.c \
+ 	../../source/components/utilities/utids.c \
+ 	../../source/components/utilities/utinit.c \
+ 	../../source/components/utilities/utlock.c \
+@@ -189,6 +191,7 @@
+ 	../../source/components/utilities/utstate.c \
+ 	../../source/components/utilities/utstring.c \
+ 	../../source/components/utilities/uttrack.c \
++	../../source/components/utilities/utuuid.c \
+ 	../../source/components/utilities/utxface.c \
+ 	../../source/components/utilities/utxferror.c \
+ 	../../source/components/utilities/utxfinit.c \
diff --git a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
similarity index 69%
rename from meta-oe/recipes-extended/acpica/acpitests_20140424.bb
rename to meta-oe/recipes-extended/acpica/acpitests_20140828.bb
index 7e145bb..889c00b 100644
--- a/meta-oe/recipes-extended/acpica/acpitests_20140424.bb
+++ b/meta-oe/recipes-extended/acpica/acpitests_20140828.bb
@@ -11,14 +11,14 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;nam
            file://aapits-linux.patch \
            file://aapits-makefile.patch \
     "
-SRC_URI[acpitests.md5sum] = "bfc399cecb21e9491d362d8e480b2689"
-SRC_URI[acpitests.sha256sum] = "e7d7ff638872543909b38c2498e88958251ee6ce4d22bc13d4e3925771212c0e"
-SRC_URI[acpica.md5sum] = "733532f005fba5d1c5344440651b13d1"
-SRC_URI[acpica.sha256sum] = "72ece982bbbdfb1b17418f1feb3a9daaa01803d0d41dcf00e19d702cdf751bbc"
+SRC_URI[acpitests.md5sum] = "db9d6fdaa8e3eb101d700ee5ba4938ed"
+SRC_URI[acpitests.sha256sum] = "e576c74bf1bf1c9f7348bf9419e05c8acfece7105abcdc052e66670c7af2cf00"
+SRC_URI[acpica.md5sum] = "6f05f0d10166a1b1ff6107f3d1cdf1e5"
+SRC_URI[acpica.sha256sum] = "01d8867656c5ba41dec307c4383ce676196ad4281ac2c9dec9f5be5fac6d888e"
 
 S = "${WORKDIR}/acpitests-unix-${PV}"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc 'OPT_CFLAGS=-Wall'"
+EXTRA_OEMAKE = "CC='${CC}' 'OPT_CFLAGS=-Wall'"
 
 # The Makefiles expect a specific layout
 do_compile() {
-- 
2.1.1


