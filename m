Return-Path: <fathi.boudra@linaro.org>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8120865DEB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 08:08:39 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id z12so949615lbi.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 01:08:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=lps8hJeGa3BIQ5R0adep1JGvdzkt64nYqNVLd/1t+HI=;
	b=gsXr4iLVUxxFL4eyC/gsTB+XVk71K7Qm9uuHFyUFLycblYHRGNz6UrYA85mbH0Y/fF
	C3utisGUuxHCI4/CfNbxVV3vFZfMhiB16OclSUgtRmOKIF3Jdcc+eMlr0p0EvP1VRD43
	kS6YuCDcwP0C0RCJJqq0L1yWnpPQ9ZiM3hIXDzZGZMeIuVMI+rsI7cJskW8ucYd4hqcl
	T+snizYyPgmQBkPoZ1VjGCr2bGkZZfOlRdROMvPW3PN/4ttOi8x+S83g/6rDX75jVguu
	JyC49ylGyyZKLb9df4bv1xlG9JQCL51Tz2B2qLIGrgkt/MoXCBGUhTD1mVEWKQk7uYN9
	g/pg==
X-Gm-Message-State: ALoCoQkXpPn9AenM/AIH8A941AffHcSsrkB3gqsDr+n9pcc++vtPmiHa7TOSn4MpUtyvfrL16Bq3
X-Received: by 10.152.1.74 with SMTP id 10mr34778052lak.43.1412064518083;
	Tue, 30 Sep 2014 01:08:38 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id nx9sm5762184lbb.23.2014.09.30.01.08.37
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Sep 2014 01:08:37 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Sep 2014 11:08:33 +0300
Message-Id: <1412064513-15996-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 2.1.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH v2] acpitests: update to 20140828 release
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
X-List-Received-Date: Tue, 30 Sep 2014 08:08:44 -0000

update md5sums and refresh patches

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 v2 changes: rebased on top of Khem changes (add0ba4)

 .../acpica/acpitests/aapits-linux.patch            |  4 +--
 .../acpica/acpitests/aapits-makefile.patch         | 36 +++++++++++++---------
 ...acpitests_20140424.bb => acpitests_20140828.bb} | 10 +++---
 3 files changed, 29 insertions(+), 21 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpitests_20140424.bb => acpitests_20140828.bb} (74%)

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
@@ -11,10 +11,10 @@ SRC_URI = "https://acpica.org/sites/acpica/files/acpitests-unix-${PV}.tar.gz;nam
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
 
-- 
2.1.1

