Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79B8171BFC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Mar 2018 05:53:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2M5rmAO003836
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Mar 2018 22:53:49 -0700 (PDT)
Received: from localhost (128.224.163.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 21 Mar 2018 22:53:48 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Mar 2018 13:53:46 +0800
Message-ID: <1521698026-27617-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.163.220]
Subject: [meta-networking][PATCH] crda: refresh patch
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
X-List-Received-Date: Thu, 22 Mar 2018 05:53:48 -0000
Content-Type: text/plain

Fix QA warning:

WARNING: crda-3.18-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to
incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch fix-linking-of-libraries-used-by-reglib.patch
patching file Makefile
Hunk #2 succeeded at 40 with fuzz 2.
Hunk #3 succeeded at 46 (offset -5 lines).
Hunk #4 succeeded at 116 (offset -5 lines).

Now at patch fix-linking-of-libraries-used-by-reglib.patch

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../fix-linking-of-libraries-used-by-reglib.patch   | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch b/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
index aceb56d..812e983 100644
--- a/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
+++ b/meta-networking/recipes-connectivity/crda/crda/fix-linking-of-libraries-used-by-reglib.patch
@@ -1,6 +1,7 @@
+From 890f5bf2654b695a866262d72bfa9750af921a3b Mon Sep 17 00:00:00 2001
 From: Ben Hutchings <ben@decadent.org.uk>
 Date: Sat, 23 Aug 2014 12:26:37 -0700
-Subject: Fix linking of libraries used by libreg
+Subject: [PATCH] Fix linking of libraries used by libreg
 
 The math and crypto libraries are called by and need to be linked to
 libreg.so, not to the executables.
@@ -9,10 +10,15 @@ Upstream-Status: Backport [http://www.spinics.net/lists/linux-wireless/msg126027
 
 Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
 Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
+---
+ Makefile | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index a3ead30..da2dcc3 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -30,7 +30,7 @@ CFLAGS += -std=gnu99 -Wall -Werror -peda
+@@ -30,7 +30,7 @@ CFLAGS += -std=gnu99 -Wall -Werror -pedantic
  CFLAGS += -Wall -g
  LDLIBREG += -lreg
  LDLIBS += $(LDLIBREG)
@@ -21,16 +27,14 @@ Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
  LIBREG += libreg.so
  LDFLAGS += -L ./
  
-@@ -40,7 +40,7 @@ all_noverify: $(LIBREG) crda intersect r
+@@ -40,13 +40,13 @@ all_noverify: $(LIBREG) crda intersect regdbdump db2rd optimize
  
  ifeq ($(USE_OPENSSL),1)
  CFLAGS += -DUSE_OPENSSL -DPUBKEY_DIR=\"$(RUNTIME_PUBKEY_DIR)\" `pkg-config --cflags openssl`
 -LDLIBS += `pkg-config --libs openssl`
 +LIBREGLDLIBS += `pkg-config --libs openssl`
  
- ifeq ($(RUNTIME_PUBKEY_ONLY),1)
- CFLAGS += -DRUNTIME_PUBKEY_ONLY
-@@ -51,7 +51,7 @@ endif
+ $(LIBREG): keys-ssl.c
  
  else
  CFLAGS += -DUSE_GCRYPT
@@ -39,7 +43,7 @@ Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
  
  $(LIBREG): keys-gcrypt.c
  
-@@ -121,7 +121,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(
+@@ -116,7 +116,7 @@ keys-%.c: utils/key2pub.py $(wildcard $(PUBKEY_DIR)/*.pem)
  
  $(LIBREG): regdb.h reglib.h reglib.c
  	$(NQ) '  CC  ' $@
@@ -48,3 +52,6 @@ Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
  
  install-libreg-headers:
  	$(NQ) '  INSTALL  libreg-headers'
+-- 
+2.7.4
+
-- 
2.7.4


