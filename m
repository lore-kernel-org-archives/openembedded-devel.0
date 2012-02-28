Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S2T4t-0003Qp-SV
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 20:51:16 +0100
Received: by daln34 with SMTP id n34so5698504dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 11:42:47 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.194.8 as permitted sender) client-ip=10.68.194.8; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.194.8 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.194.8])
	by 10.68.194.8 with SMTP id hs8mr57625382pbc.113.1330458167344
	(num_hops = 1); Tue, 28 Feb 2012 11:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=YYhEJ3e+AyiXJfrTm7ji6ruwSSdMzn3NbV77284xN+o=;
	b=ucwphzZ0nCYlKE8GvmPj4yIqub9ucHwiZPZw14vQwgZxaOVZ81tPFtNyTU25+RAf5z
	01ypbic7x9eVsagHLUwRmbq+goOn2e9ht3Wjo8OyQ4gcws0usEXYMSTDTcFpHGgHrf6i
	bTH51aHa/TIB5T2KEULBDYVGuby/dFhOBfWfY=
Received: by 10.68.194.8 with SMTP id hs8mr48589795pbc.113.1330458167117;
	Tue, 28 Feb 2012 11:42:47 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id g4sm251637pbs.17.2012.02.28.11.42.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 11:42:46 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 11:42:35 -0800
Message-Id: <1330458155-3487-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9
Subject: [meta-java][PATCH] meta-java: Fix quote errors
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 19:51:16 -0000

new bitbake is strict about quoting so fix them

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 classes/java.bbclass                    |   18 +++++++++---------
 recipes-core/xml-commons/dom4j_1.6.1.bb |    2 +-
 recipes-core/xml-commons/jaxen_1.1.1.bb |    2 +-
 recipes-core/xml-commons/jdom_1.1.bb    |    2 +-
 4 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/classes/java.bbclass b/classes/java.bbclass
index 49c4c29..235ab23 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -5,21 +5,21 @@
 # the Debian distribution.
 
 # Jar location on target
-datadir_java ?= ${datadir}/java
+datadir_java ?= "${datadir}/java"
 
 # JNI library location on target
-libdir_jni ?= ${libdir}/jni
+libdir_jni ?= "${libdir}/jni"
 
 # JVM bundle location on target
-libdir_jvm ?= ${libdir}/jvm
+libdir_jvm ?= "${libdir}/jvm"
 
-STAGING_DATADIR_JAVA ?= ${STAGING_DATADIR}/java
-STAGING_LIBDIR_JNI ?= ${STAGING_LIBDIR}/jni
-STAGING_LIBDIR_JVM ?= ${STAGING_LIBDIR}/jvm
+STAGING_DATADIR_JAVA ?= "${STAGING_DATADIR}/java"
+STAGING_LIBDIR_JNI ?= "${STAGING_LIBDIR}/jni"
+STAGING_LIBDIR_JVM ?= "${STAGING_LIBDIR}/jvm"
 
-STAGING_DATADIR_JAVA_NATIVE ?= ${STAGING_DATADIR_NATIVE}/java
-STAGING_LIBDIR_JNI_NATIVE ?= ${STAGING_LIBDIR_NATIVE}/jni
-STAGING_LIBDIR_JVM_NATIVE ?= ${STAGING_LIBDIR_NATIVE}/jvm
+STAGING_DATADIR_JAVA_NATIVE ?= "${STAGING_DATADIR_NATIVE}/java"
+STAGING_LIBDIR_JNI_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jni"
+STAGING_LIBDIR_JVM_NATIVE ?= "${STAGING_LIBDIR_NATIVE}/jvm"
 
 oe_jarinstall() {
   # Purpose: Install a jar file and create all the given symlinks to it.
diff --git a/recipes-core/xml-commons/dom4j_1.6.1.bb b/recipes-core/xml-commons/dom4j_1.6.1.bb
index 94bd807..d26d2ee 100644
--- a/recipes-core/xml-commons/dom4j_1.6.1.bb
+++ b/recipes-core/xml-commons/dom4j_1.6.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "dom4j is a simple and flexible Java library for working with XML, XPath and XSLT"
 LICENSE = "BSD"
 
-HOMEPAGE = "http://dom4j.org
+HOMEPAGE = "http://dom4j.org"
 
 DEPENDS = "fastjar-native xerces-j xalan-j xpp2 xpp3 jaxen"
 
diff --git a/recipes-core/xml-commons/jaxen_1.1.1.bb b/recipes-core/xml-commons/jaxen_1.1.1.bb
index 7180dda..147ccf9 100644
--- a/recipes-core/xml-commons/jaxen_1.1.1.bb
+++ b/recipes-core/xml-commons/jaxen_1.1.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "XPath library written in Java"
 LICENSE = "BSD"
 
-HOMEPAGE = "http://jaxen.codehaus.org/
+HOMEPAGE = "http://jaxen.codehaus.org/"
 
 DEPENDS = "fastjar-native xerces-j xom"
 
diff --git a/recipes-core/xml-commons/jdom_1.1.bb b/recipes-core/xml-commons/jdom_1.1.bb
index 1a77f05..cb53734 100644
--- a/recipes-core/xml-commons/jdom_1.1.bb
+++ b/recipes-core/xml-commons/jdom_1.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Parses, manipulates, and outputs XML using standard Java constructs"
 LICENSE = "BSD"
 
-HOMEPAGE = "http://jdom.org/
+HOMEPAGE = "http://jdom.org/"
 
 DEPENDS = "fastjar-native jaxen"
 
-- 
1.7.9



