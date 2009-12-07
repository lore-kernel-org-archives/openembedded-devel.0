Received: from host4.kei.pl ([195.149.226.213] helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <marcin@juszkiewicz.com.pl>) id 1NHip5-0008EB-Ip
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Dec 2009 20:00:42 +0100
Received: (qmail 8663 invoked by uid 813007); 7 Dec 2009 18:59:00 -0000
X-clamdmail: clamdmail 0.18a
Received: from 195.149.226.213 (HELO home.localnet)
	(marcin@juszkiewicz.com.pl@195.149.226.213)
	by 195.149.226.213 with ESMTPA; 7 Dec 2009 18:59:00 -0000
From: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 7 Dec 2009 19:59:18 +0100
User-Agent: KMail/1.12.2 (Linux/2.6.32-rc7-00029-ga9366e6-dirty; KDE/4.3.2;
	x86_64; ; )
MIME-Version: 1.0
Message-Id: <200912071959.19252.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 195.149.226.213
X-SA-Exim-Mail-From: marcin@juszkiewicz.com.pl
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Java handling in OpenEmbedded
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
X-List-Received-Date: Mon, 07 Dec 2009 19:00:42 -0000
X-Groupsio-MsgNum: 14935
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_HCVHLM0EvjuTm1Y"

--Boundary-00=_HCVHLM0EvjuTm1Y
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi

For most of time I do builds of BugLabs software for just one device: BUG 
which uses i.mx31 cpu (armv6). As I need to test it also on BeagleBoard I got 
hit by one problem when it comes to building Java software...

As Java is target independent we package it as "all". But the problem is when 
build want to get JAR files built from other recipes (think dependencies). By 
default all those jars are staged into target staging (armv6-angstrom-linux-
gnueabi in this case). It works fine as long as you do not want to build for 
other architecture in same tmpdir.

After MACHINE change OE thinks (correctly) that it does not need to build Java 
things again (as it was PACKAGE_ARCH="all") and tries to use it from staging. 
But staging/usr/share/java/ dir is empty...

OK, someone can say "but what is a deal? it got built before so you can just 
install packages - they are 'all' anyway". Sure, but some of our Java recipes 
are bind to BUG kernel services so can not be built for other devices and we 
do not want to be forced to keep MACHINE values in specific order to 'maybe 
this will work' way of building.

What is a solution? I had few ideas during weekend and tested two of them.

1. Drop PACKAGE_ARCH="all" for ALL Java recipes. It works but adds extra
   building time.

2. Change staging of JAR files. This worked fine for my build. Patch to
   stable/2009 branch attached.

Please test and reply what do you think about it. I did tests with BugLabs 
meta-bug/ overlay [1] (concierge and some of bug-osgi are good test targets).

1. svn://svn.buglabs.net/bug/trunk/com.buglabs.build.oe/meta-bug/

Regards, 
-- 
JID:      hrw@jabber.org
Website:  http://marcin.juszkiewicz.com.pl/
LinkedIn: http://www.linkedin.com/in/marcinjuszkiewicz

--Boundary-00=_HCVHLM0EvjuTm1Y
Content-Type: text/x-patch;
  charset="us-ascii";
  name="fix-java-staging.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="fix-java-staging.diff"

diff --git a/classes/java.bbclass b/classes/java.bbclass
index b68035c..fecd7f5 100644
--- a/classes/java.bbclass
+++ b/classes/java.bbclass
@@ -13,9 +13,9 @@ libdir_jni ?= ${libdir}/jni
 # JVM bundle location on target
 libdir_jvm ?= ${libdir}/jvm
 
-STAGING_DATADIR_JAVA ?= ${STAGING_DATADIR}/java
-STAGING_LIBDIR_JNI ?= ${STAGING_LIBDIR}/jni
-STAGING_LIBDIR_JVM ?= ${STAGING_LIBDIR}/jvm
+STAGING_DATADIR_JAVA ?= ${STAGING_DIR_JAVA}
+STAGING_LIBDIR_JNI   ?= ${STAGING_LIBDIR}/jni
+STAGING_LIBDIR_JVM   ?= ${STAGING_LIBDIR}/jvm
 
 STAGING_DATADIR_JAVA_NATIVE ?= ${STAGING_DATADIR_NATIVE}/java
 STAGING_LIBDIR_JNI_NATIVE ?= ${STAGING_LIBDIR_NATIVE}/jni
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index d1ed040..bfc28d5 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -264,6 +264,7 @@ B = "${S}"
 
 STAGING_DIR = "${TMPDIR}/staging"
 
+STAGING_DIR_JAVA = "${STAGING_DIR}/java"
 STAGING_DIR_NATIVE = "${STAGING_DIR}/${BUILD_SYS}"
 STAGING_BINDIR_NATIVE = "${STAGING_DIR_NATIVE}${layout_bindir}"
 STAGING_BINDIR_CROSS  = "${STAGING_DIR_NATIVE}${layout_bindir}/${MULTIMACH_HOST_SYS}"

--Boundary-00=_HCVHLM0EvjuTm1Y--
