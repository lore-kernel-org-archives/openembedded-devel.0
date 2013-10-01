Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6F2AA6B896
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Oct 2013 23:34:11 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id b15so19363eek.26
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Oct 2013 16:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/3pHwfiuPsyXOHoM2LxTzyBH4HKMkPstATRCo+PABmw=;
	b=IEc6VjbiQrD7T/qZy9GlinEobEW9Sys9JQmZYTF3UdTPSAZ6M5OZuX7sygLIDKuDFo
	OIc4oBfwxysOrvWp9FLILc6HJ+L0vUsjYL0HccQ4CFI5GaXABoA9lb02O2BS0+ev/Txn
	0DkoqcmupRdzKItbJtld8m1oo5Z3uy47nnZXwroDRsMaj43K8zE2v/5cB0eJLIjMEO0f
	hOiIfhgNiqzNePK8uvmom8XuC3YFfFiCmLlcRslYQK+HZP5fi1UswwFewoo4T4bBx//F
	EHUCXX0L7DetOflzLg5OggiVjSUUk5Ts+k335q3qv8uFOqxa09em1+Q44PgMWAGbsQd7
	J/qQ==
X-Received: by 10.14.108.9 with SMTP id p9mr50134326eeg.8.1380670452833;
	Tue, 01 Oct 2013 16:34:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	h52sm18472196eez.3.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 01 Oct 2013 16:34:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Oct 2013 01:34:09 +0200
Message-Id: <1380670450-16802-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe][dylan][PATCH 1/2] krb5: Backport patch to fix parallel build
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
X-List-Received-Date: Tue, 01 Oct 2013 23:34:12 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch | 49 ++++++++++++++++++++++
 meta-oe/recipes-connectivity/krb5/krb5_1.11.bb     |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-connectivity/krb5/krb5/055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch

diff --git a/meta-oe/recipes-connectivity/krb5/krb5/055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch b/meta-oe/recipes-connectivity/krb5/krb5/055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch
new file mode 100644
index 0000000..d92f5c6
--- /dev/null
+++ b/meta-oe/recipes-connectivity/krb5/krb5/055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch
@@ -0,0 +1,49 @@
+From 055d1ffa81d0730e92aa3f1ed5045cd805c74957 Mon Sep 17 00:00:00 2001
+From: Nickolai Zeldovich <nickolai@csail.mit.edu>
+Date: Sun, 3 Mar 2013 01:38:22 -0500
+Subject: [PATCH] Fix dependencies in tests/gssapi
+
+Use $(COMMON_DEPS) instead of $(COMMON_DEPLIBS) for dependencies; the
+latter appears to be a typo.  Fixes build when using "make -j".
+
+ticket: 7587 (new)
+target_version: 1.11.2
+tags: pullup
+
+Upstream-Status: Backport
+http://krbdev.mit.edu/rt/Ticket/Display.html?id=7587
+
+---
+ tests/gssapi/Makefile.in | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/tests/gssapi/Makefile.in b/tests/gssapi/Makefile.in
+index 5620234..6a5870b 100644
+--- a/tests/gssapi/Makefile.in
++++ b/tests/gssapi/Makefile.in
+@@ -45,11 +45,11 @@ t_accname: t_accname.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_accname.o $(COMMON_LIBS)
+ t_ccselect: t_ccselect.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_ccselect.o $(COMMON_LIBS)
+-t_credstore: t_credstore.o $(COMMON_DEPLIBS)
++t_credstore: t_credstore.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_credstore.o $(COMMON_LIBS)
+ t_export_cred: t_export_cred.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_export_cred.o $(COMMON_LIBS)
+-t_export_name: t_export_name.o $(COMMON_DEPLIBS)
++t_export_name: t_export_name.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_export_name.o $(COMMON_LIBS)
+ t_gssexts: t_gssexts.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_gssexts.o $(COMMON_LIBS)
+@@ -67,7 +67,7 @@ t_s4u: t_s4u.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_s4u.o $(COMMON_LIBS)
+ t_s4u2proxy_krb5: t_s4u2proxy_krb5.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_s4u2proxy_krb5.o $(COMMON_LIBS)
+-t_saslname: t_saslname.o $(COMMON_DEPLIBS)
++t_saslname: t_saslname.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_saslname.o $(COMMON_LIBS)
+ t_spnego: t_spnego.o $(COMMON_DEPS)
+ 	$(CC_LINK) -o $@ t_spnego.o $(COMMON_LIBS)
+-- 
+1.8.4
+
diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
index a68e85d..63676fd 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.11.bb
@@ -9,7 +9,9 @@ inherit autotools binconfig perlnative
 
 PR = "r2"
 
-SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar"
+SRC_URI = "http://web.mit.edu/kerberos/dist/${PN}/${PV}/${P}-signed.tar \
+           file://055d1ffa81d0730e92aa3f1ed5045cd805c74957.patch \
+"
 SRC_URI[md5sum] = "1a13c53899806c4da99a798a04d25545"
 SRC_URI[sha256sum] = "fe37fb93b398db98a1b23f814673ea2ae4b90138f85e1a4027ef639456a78651"
 
-- 
1.8.3.2


