Received: from [209.85.220.172] (helo=mail-fx0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M6yJe-0005ca-Qy
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 04:47:30 +0200
Received: by mail-fx0-f172.google.com with SMTP id 20so805174fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 May 2009 19:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=oMftZIZrLjzIt+mxyxSpNkCdM259kZOaEyQSrcoPTu8=;
	b=uyuR/dEBKYniiHQ5FpmNu32zoOzx480vSJqIr3/t8ulZ71K4Nti9xSjU3+ayZkOfUv
	XdEhJzrpRTUI57nPsUcXab0RiQWxp0lLtU9G9PCSdebInmso8WUYzWXdRX4GQVG4mvCh
	AwTqivbqvrpV1eMqaWJgUv7YeNUx0U8404j1o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=KCvzEUtWZpHusWghPgADsUxekcN/s+keDKqQoVbK4dIkSxbW9nnxGLUC5qTiFbTVJt
	bWGPyijZkw+cwfCdFJM2yckG6hgxCpGai9jqgFaSTMx1eV/GpCsotrAWRf+DiD3yvhjq
	Hbuv0gPcDg65/i/HpfAkTj6MJ40ODnceIDmdQ=
Received: by 10.103.172.7 with SMTP id z7mr1069631muo.15.1242873599558;
	Wed, 20 May 2009 19:39:59 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id u9sm129138muf.7.2009.05.20.19.39.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 20 May 2009 19:39:55 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 09FCB6103B8; Wed, 20 May 2009 23:39:42 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 May 2009 23:39:31 -0300
Message-Id: <1242873578-17444-17-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.6.3.1.54.g99dd
In-Reply-To: <1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
References: <1242873578-17444-1-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-2-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-3-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-4-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-5-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-6-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-7-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-8-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-9-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-10-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-11-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-12-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-13-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-14-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-15-git-send-email-otavio@ossystems.com.br>
	<1242873578-17444-16-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 16/23] Fixed indentation for Python code
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
X-List-Received-Date: Thu, 21 May 2009 02:47:31 -0000

From: Mario Domenech Goulart <mario@ossystems.com.br>

 - recipes/boost/boost-36.inc
 - recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
 - recipes/gstreamer/gst-plugins-ugly_0.10.10.bb

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 recipes/boost/boost-36.inc                       |   22 +++++++++++-----------
 recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb |    8 ++++----
 recipes/gstreamer/gst-plugins-ugly_0.10.10.bb    |    8 ++++----
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/recipes/boost/boost-36.inc b/recipes/boost/boost-36.inc
index 5a4faaf..4bd065f 100644
--- a/recipes/boost/boost-36.inc
+++ b/recipes/boost/boost-36.inc
@@ -43,18 +43,18 @@ S = "${WORKDIR}/${BOOST_P}"
 # Make a package for each library, plus -dev
 PACKAGES = "${PN}-dbg ${BOOST_PACKAGES}"
 python __anonymous () {
-	import bb
-
-	packages = []
-	extras = [] 
-	for lib in bb.data.getVar('BOOST_LIBS', d, 1).split( ):
-		pkg = "boost-%s" % lib.replace("_", "-")
-		extras.append("--with-%s" % lib)
-		packages.append(pkg)
-		if not bb.data.getVar("FILES_%s" % pkg, d, 1):
-			bb.data.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so*" % lib, d)
-	bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
-	bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
+    import bb
+
+    packages = []
+    extras = []
+    for lib in bb.data.getVar('BOOST_LIBS', d, 1).split( ):
+            pkg = "boost-%s" % lib.replace("_", "-")
+            extras.append("--with-%s" % lib)
+            packages.append(pkg)
+            if not bb.data.getVar("FILES_%s" % pkg, d, 1):
+                    bb.data.setVar("FILES_%s" % pkg, "${libdir}/libboost_%s*.so*" % lib, d)
+    bb.data.setVar("BOOST_PACKAGES", " ".join(packages), d)
+    bb.data.setVar("BJAM_EXTRA", " ".join(extras), d)
 }
 
 # Override the contents of specific packages
diff --git a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
index 77c4184..545a43a 100644
--- a/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
+++ b/recipes/gstreamer/gst-plugins-ugly-sid_0.10.7.bb
@@ -10,8 +10,8 @@ SRC_URI = "\
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
 python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise != "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly-sid will only build if ENTERPRISE_DISTRO == 1")
+    # Don't build, if we are building an ENTERPRISE distro
+    enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
+    if enterprise != "1":
+            raise bb.parse.SkipPackage("gst-plugins-ugly-sid will only build if ENTERPRISE_DISTRO == 1")
 }
diff --git a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
index 0678e22..49350ed 100644
--- a/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
+++ b/recipes/gstreamer/gst-plugins-ugly_0.10.10.bb
@@ -10,9 +10,9 @@ SRC_URI += "\
 "
 
 python() {
-	# Don't build, if we are building an ENTERPRISE distro
-	enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
-	if enterprise == "1":
-		raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
+    # Don't build, if we are building an ENTERPRISE distro
+    enterprise = bb.data.getVar("ENTERPRISE_DISTRO", d, 1)
+    if enterprise == "1":
+            raise bb.parse.SkipPackage("gst-plugins-ugly will only build if ENTERPRISE_DISTRO != 1")
 }
 
-- 
1.6.3.1.54.g99dd



