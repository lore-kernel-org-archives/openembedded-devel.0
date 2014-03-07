Return-Path: <paul.betafive@gmail.com>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id 510C66F59F
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Mar 2014 01:03:21 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id u57so4030429wes.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Mar 2014 17:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=R/K76NIvv1D/XJtOI1SK4Nfc/HQkf9JYK88JZu6c7rY=;
	b=Wyr2meMCnYll3itcdbsSXM9hU1K4iI+N2suE7axDMBtKkPEsllXqhxWMP9SsOlwuXA
	XBlY30rGejXXkJ9czS5qJwajFp8PdRGGKLOj+/RG792aons7HgFyEpm1o44FbVNa3PL1
	qKR+jKyqU443NIM9F4RPqk6YGl8+yQrofz2faXwcCacoXFx8sP0oZeYtUtoath+3zGfT
	uAwVoLviup1FZvFedD+dVRIZ/nyI2JsYmPRcwV7BhjxObEyrIx3kr2d33UrLKLfP8bLw
	t8ddL5KokuuKRBk0oqgI9KNRKLnl3j/AxjNEbfQ2AlRa8bIYMloxwtsNnDCyoUva+y8E
	Hfkw==
X-Received: by 10.194.24.35 with SMTP id r3mr14664296wjf.68.1394154202391;
	Thu, 06 Mar 2014 17:03:22 -0800 (PST)
Received: from desktop.betafive.co.uk
	(cpc66027-shep11-2-0-cust140.8-3.cable.virginmedia.com.
	[81.110.75.141])
	by mx.google.com with ESMTPSA id h9sm1002019wjz.16.2014.03.06.17.03.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Mar 2014 17:03:21 -0800 (PST)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Mar 2014 01:02:42 +0000
Message-Id: <1394154162-4510-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 1.9.0
Subject: [meta-networking][PATCH] ipsec-tools: Don't link against libfl
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
X-List-Received-Date: Fri, 07 Mar 2014 01:03:25 -0000

We can remove all references to yywrap by adding "%option noyywrap" statements
to each flex source file which doesn't override yywrap. After this, we no longer
need to link against libfl and so no longer get errors about undefined
references to yylex.

Also change the dependency on flex to flex-native as we no longer need libfl
compiled for the target - the lexer is now self-contained.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 .../0002-Don-t-link-against-libfl.patch            | 86 ++++++++++++++++++++++
 .../ipsec-tools/ipsec-tools_0.8.1.bb               |  3 +-
 2 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch

diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch
new file mode 100644
index 0000000..674331d
--- /dev/null
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools/0002-Don-t-link-against-libfl.patch
@@ -0,0 +1,86 @@
+From e48b9097dce7bc2bfbb9e9c542124d3b5cebab39 Mon Sep 17 00:00:00 2001
+From: Paul Barker <paul@paulbarker.me.uk>
+Date: Wed, 5 Mar 2014 13:39:14 +0000
+Subject: [PATCH] Don't link against libfl
+
+We can remove all references to yywrap by adding "%option noyywrap" statements
+to each flex source file that doesn't override yywrap. After this, we no longer
+need to link against libfl and so no longer get errors about undefined
+references to yylex.
+
+Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
+Upstream-status: Pending
+---
+ src/libipsec/Makefile.am | 1 -
+ src/racoon/Makefile.am   | 2 +-
+ src/racoon/cftoken.l     | 2 ++
+ src/setkey/Makefile.am   | 1 -
+ src/setkey/token.l       | 2 ++
+ 5 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/src/libipsec/Makefile.am b/src/libipsec/Makefile.am
+index 6a4e3b3..df1e106 100644
+--- a/src/libipsec/Makefile.am
++++ b/src/libipsec/Makefile.am
+@@ -26,7 +26,6 @@ libipsec_la_SOURCES = \
+ # version is current:revision:age.
+ # See: http://www.gnu.org/manual/libtool-1.4.2/html_chapter/libtool_6.html#SEC32
+ libipsec_la_LDFLAGS = -version-info 0:1:0
+-libipsec_la_LIBADD = $(LEXLIB)
+ 
+ noinst_HEADERS = ipsec_strerror.h
+ 
+diff --git a/src/racoon/Makefile.am b/src/racoon/Makefile.am
+index dbaded9..0662957 100644
+--- a/src/racoon/Makefile.am
++++ b/src/racoon/Makefile.am
+@@ -38,7 +38,7 @@ racoon_SOURCES = \
+ 	cftoken.l cfparse.y prsa_tok.l prsa_par.y 
+ EXTRA_racoon_SOURCES = isakmp_xauth.c isakmp_cfg.c isakmp_unity.c throttle.c \
+ 	isakmp_frag.c nattraversal.c security.c $(MISSING_ALGOS)
+-racoon_LDADD = $(CRYPTOBJS) $(HYBRID_OBJS) $(NATT_OBJS) $(FRAG_OBJS) $(LEXLIB) \
++racoon_LDADD = $(CRYPTOBJS) $(HYBRID_OBJS) $(NATT_OBJS) $(FRAG_OBJS) \
+ 	 $(SECCTX_OBJS) vmbuf.o sockmisc.o misc.o ../libipsec/libipsec.la
+ racoon_DEPENDENCIES = \
+ 	$(CRYPTOBJS) $(HYBRID_OBJS) $(NATT_OBJS) $(FRAG_OBJS) $(SECCTX_OBJS) \
+diff --git a/src/racoon/cftoken.l b/src/racoon/cftoken.l
+index 490242c..1701922 100644
+--- a/src/racoon/cftoken.l
++++ b/src/racoon/cftoken.l
+@@ -106,6 +106,8 @@ static int incstackp = 0;
+ static int yy_first_time = 1;
+ %}
+ 
++%option noyywrap
++
+ /* common seciton */
+ nl		\n
+ ws		[ \t]+
+diff --git a/src/setkey/Makefile.am b/src/setkey/Makefile.am
+index 746c1f1..389e6cf 100644
+--- a/src/setkey/Makefile.am
++++ b/src/setkey/Makefile.am
+@@ -13,7 +13,6 @@ setkey_SOURCES = \
+ 
+ setkey_LDFLAGS = ../libipsec/libipsec.la
+ setkey_DEPENDENCIES = ../libipsec/libipsec.la
+-setkey_LDADD = $(LEXLIB)
+ 
+ noinst_HEADERS = vchar.h extern.h
+ man8_MANS = setkey.8
+diff --git a/src/setkey/token.l b/src/setkey/token.l
+index ad3d843..eb23b76 100644
+--- a/src/setkey/token.l
++++ b/src/setkey/token.l
+@@ -88,6 +88,8 @@
+ #endif
+ %}
+ 
++%option noyywrap
++
+ /* common section */
+ nl		\n
+ ws		[ \t]+
+-- 
+1.9.0
+
diff --git a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
index e931745..fcf329c 100644
--- a/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
+++ b/meta-networking/recipes-support/ipsec-tools/ipsec-tools_0.8.1.bb
@@ -5,10 +5,11 @@ SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://src/libipsec/pfkey.c;beginline=6;endline=31;md5=bc9b7ff40beff19fe6bc6aef26bd2b24"
 
-DEPENDS = "virtual/kernel openssl readline flex bison-native"
+DEPENDS = "virtual/kernel openssl readline flex-native bison-native"
 
 SRC_URI = "ftp://ftp.netbsd.org/pub/NetBSD/misc/ipsec-tools/0.8/ipsec-tools-${PV}.tar.bz2 \
            file://0001-Fix-warning-with-gcc-4.8.patch \
+           file://0002-Don-t-link-against-libfl.patch \
           "
 SRC_URI[md5sum] = "d38b39f291ba2962387c3232e7335dd8"
 SRC_URI[sha256sum] = "fa4a95bb36842f001b84c4e7a1bb727e3ee06147edbc830a881d63abe8153dd4"
-- 
1.9.0


