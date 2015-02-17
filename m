Return-Path: <max.oss.09@gmail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2DBAB73589
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 09:58:03 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id l2so34115920wgh.9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Feb 2015 01:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=QIJJsWjQMEQi44skDNZO/tBdk05JpnYgvt3VfOnsCHY=;
	b=MDSSWxbyhTwRBt5wdLGMwUw34GQHAHCfrLYO5CrArr05yowtk+z5TeTZTIOq+YFr/E
	AOyIm+pmvPys/31qARh63hHHx5h/KSqkgYYGwCGW2KCUKKKdlgj2Qh9Spb1UBLb8gyHB
	lw5EV6VltskFYGAXo1NrekVSmoFmbdYn41SYuQuXHecx3o1IcTdvv6nY6gyOKBhlZgBr
	rh3Ndtma0oRFSJ8sDygxAC1qYJD1HwZACc5R2uu15XS17euQTRnLE+EKWSKgYaS43/Qd
	dDSH67OX4OxStQ1teJ8hmYk9jLP2ApH0LguuMG80iob0XLOGtWNf1fD6P/h6A3UjjybC
	QjUQ==
X-Received: by 10.194.108.9 with SMTP id hg9mr60973939wjb.68.1424167084262;
	Tue, 17 Feb 2015 01:58:04 -0800 (PST)
Received: from linuxdev.toradex.int ([46.140.72.82])
	by mx.google.com with ESMTPSA id nb9sm13736945wic.3.2015.02.17.01.58.03
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Feb 2015 01:58:03 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Feb 2015 10:57:16 +0100
Message-Id: <1424167036-15517-7-git-send-email-max.oss.09@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
References: <1424167036-15517-1-git-send-email-max.oss.09@gmail.com>
Cc: otavio@ossystems.com.br
Subject: [meta-java][PATCH v2 6/6] mark broken recipes with PNBLACKLIST
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
X-List-Received-Date: Tue, 17 Feb 2015 09:58:04 -0000

While testing commit 'java-library: inherit allarch' I found some recipes
throwing errors in do_compile.

The recipes jaxme and xom currently don't build with compiler errors.

jaxen, dom4j, jdom, commons-jxpath, commons-configuration depend directly
or indirectly on jaxme and/or xom and thus are unbildable.

Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
---
 recipes-core/jakarta-commons/commons-configuration_1.5.bb |  2 ++
 recipes-core/jakarta-commons/commons-jxpath_1.3.bb        |  2 ++
 recipes-core/xml-commons/dom4j_1.6.1.bb                   |  2 ++
 recipes-core/xml-commons/jaxen_1.1.1.bb                   |  2 ++
 recipes-core/xml-commons/jaxme_0.5.2.bb                   | 14 ++++++++++++++
 recipes-core/xml-commons/jdom_1.1.bb                      |  2 ++
 recipes-core/xml-commons/xom_1.1.bb                       | 11 +++++++++++
 7 files changed, 35 insertions(+)

diff --git a/recipes-core/jakarta-commons/commons-configuration_1.5.bb b/recipes-core/jakarta-commons/commons-configuration_1.5.bb
index 54409e5..eebb7f7 100644
--- a/recipes-core/jakarta-commons/commons-configuration_1.5.bb
+++ b/recipes-core/jakarta-commons/commons-configuration_1.5.bb
@@ -9,6 +9,8 @@ SRC_URI = " \
 	   http://ftp.hosting-studio.de/pub/linux/apache/ant/source/apache-ant-1.7.1-src.tar.bz2;name=ant \
           "
 
+PNBLACKLIST[commons-configuration] ?= "BROKEN: indirectly depends on broken 'xom'"
+
 DEPENDS += "commons-logging commons-collections3 commons-beanutils commons-codec commons-digester commons-jxpath commons-lang servlet2.4"
 RDEPENDS_${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libcommons-codec-java libcommons-digester-java libcommons-jxpath-java libcommons-lang-java libservlet2.4-java"
 
diff --git a/recipes-core/jakarta-commons/commons-jxpath_1.3.bb b/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
index d380ed9..8ccbad1 100644
--- a/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
+++ b/recipes-core/jakarta-commons/commons-jxpath_1.3.bb
@@ -6,6 +6,8 @@ DESCRIPTION = "JXPath interpreter for Java"
 
 SRC_URI = "http://archive.apache.org/dist/commons/jxpath/source/${BP}-src.tar.gz"
 
+PNBLACKLIST[commons-jxpath] ?= "BROKEN: indirectly depends on broken 'xom'"
+
 DEPENDS += "commons-logging commons-collections3 commons-beanutils servlet2.3 jdom"
 RDEPENDS_${PN} = "libcommons-logging-java libcommons-collections3-java libcommons-beanutils-java libservlet2.3-java libjdom-java"
 
diff --git a/recipes-core/xml-commons/dom4j_1.6.1.bb b/recipes-core/xml-commons/dom4j_1.6.1.bb
index d26d2ee..19dca74 100644
--- a/recipes-core/xml-commons/dom4j_1.6.1.bb
+++ b/recipes-core/xml-commons/dom4j_1.6.1.bb
@@ -11,6 +11,8 @@ SRC_URI = "\
 	file://debian.patch \
 	"
 
+PNBLACKLIST[dom4j] ?= "BROKEN: indirectly depends on broken 'xom'"
+
 inherit java-library
 
 do_compile() {
diff --git a/recipes-core/xml-commons/jaxen_1.1.1.bb b/recipes-core/xml-commons/jaxen_1.1.1.bb
index 147ccf9..4853683 100644
--- a/recipes-core/xml-commons/jaxen_1.1.1.bb
+++ b/recipes-core/xml-commons/jaxen_1.1.1.bb
@@ -10,6 +10,8 @@ SRC_URI = "\
 	http://www.jdom.org/dist/binary/archive/jdom-1.1.tar.gz;name=jdom \
 	"
 
+PNBLACKLIST[jaxen] ?= "BROKEN: depends on broken 'xom'"
+
 inherit java-library
 
 do_compile() {
diff --git a/recipes-core/xml-commons/jaxme_0.5.2.bb b/recipes-core/xml-commons/jaxme_0.5.2.bb
index b4ec750..03f4f57 100644
--- a/recipes-core/xml-commons/jaxme_0.5.2.bb
+++ b/recipes-core/xml-commons/jaxme_0.5.2.bb
@@ -9,6 +9,20 @@ SRC_URI = "\
 	http://ftp.hosting-studio.de/pub/linux/apache/ant/source/apache-ant-1.7.1-src.tar.bz2;name=ant \
 	"
 
+# do_compile:
+# 2. ERROR in src/jaxme/org/apache/ws/jaxme/generator/XJCTask.java (at line 30)
+#         import org.apache.ws.jaxme.generator.sg.SGFactoryChain;
+#                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
+# The import org.apache.ws.jaxme.generator.sg.SGFactoryChain cannot be resolved
+# ----------
+# 3. ERROR in src/jaxme/org/apache/ws/jaxme/generator/XJCTask.java (at line 1055)
+#         if (!SGFactoryChain.class.isAssignableFrom(c)) {
+#              ^^^^^^^^^^^^^^
+# SGFactoryChain cannot be resolved to a type
+# ----------
+# ... and many more
+PNBLACKLIST[jaxme] ?= "BROKEN: do_compile fails"
+
 S = "${WORKDIR}/ws-${P}"
 
 inherit java-library
diff --git a/recipes-core/xml-commons/jdom_1.1.bb b/recipes-core/xml-commons/jdom_1.1.bb
index cb53734..4867e82 100644
--- a/recipes-core/xml-commons/jdom_1.1.bb
+++ b/recipes-core/xml-commons/jdom_1.1.bb
@@ -9,6 +9,8 @@ SRC_URI = "\
 	http://www.jdom.org/dist/binary/archive/jdom-${PV}.tar.gz \
 	"
 
+PNBLACKLIST[jdom] ?= "BROKEN: indirectly depends on broken 'xom'"
+
 inherit java-library
 
 do_compile() {
diff --git a/recipes-core/xml-commons/xom_1.1.bb b/recipes-core/xml-commons/xom_1.1.bb
index 7405dab..c37965b 100644
--- a/recipes-core/xml-commons/xom_1.1.bb
+++ b/recipes-core/xml-commons/xom_1.1.bb
@@ -10,6 +10,17 @@ SRC_URI = "\
 	file://04_remove_sun_import.patch \
 	"
 
+# DEBUG: Executing shell function do_compile
+# ----------
+# 1. ERROR in src/nu/xom/UnicodeUtil.java (at line 0)
+# 	/* Copyright 2005 Elliotte Rusty Harold
+# 	^
+# Internal compiler error: java.lang.StackOverflowError at org.eclipse.jdt.internal.compiler.ast.Expression.checkNPE(Expression.java:511)
+# ----------
+# Exception in thread "main" java.lang.StackOverflowError
+#    at org.eclipse.jdt.internal.compiler.ast.Expression.checkNPE(Expression.java:511)
+PNBLACKLIST[xom] ?= "BROKEN: do_compile fails with internal javac error"
+
 S = "${WORKDIR}/XOM"
 
 inherit java-library
-- 
1.9.3


