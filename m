Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TgN82-0000Dx-1H
	for openembedded-devel@lists.openembedded.org;
	Wed, 05 Dec 2012 23:07:42 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3179783eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Dec 2012 13:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=u9HJ9+yp/xk08V1tH+s+gF7unWbXEb1KqGfth12lFDY=;
	b=FFY4JuCQ1HMz9+3dzdk+FqrXN/0GtBDsqTHGsH7DxpKAL3jBbpA06WWGNCgqtOBGwV
	9E+B6RhQ88E7YLwjj5AeGo6yj5CY4Qwxazode/eZDRfdIDL5qFoZ01sm36BGic+RyGoB
	xlkXxBr5cbcATkgQfvCr7Wd1CYUuuvpluRkXTUFzuh2Sf4DyMJexIH+FiKSwiV2WHcwP
	x1UwMVJLU484ycgNS+WNuMJXrJDiLVa+dv5q4IslUsgrkc7Mxs1dk523QTxSTGwG7vfW
	S7rBUXCxB2b0R+LPI/ShLiHM+0iJYNA5yuI49GpGaG2/JPSA4Rh1ez3goUwb76D6fgtH
	g1KQ==
Received: by 10.14.206.197 with SMTP id l45mr11775572eeo.17.1354744399938;
	Wed, 05 Dec 2012 13:53:19 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id y44sm11751088eel.14.2012.12.05.13.53.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Dec 2012 13:53:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  5 Dec 2012 22:52:08 +0100
Message-Id: <a7fc161530cd3d69272e30efe274e0dbc1deb8d5.1354743849.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354586187.git.Martin.Jansa@gmail.com>
	<1c92baa825d740b9c4e053de8b275e3f653395b3.1354743849.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354743849.git.Martin.Jansa@gmail.com>
References: <cover.1354743849.git.Martin.Jansa@gmail.com>
Subject: [PATCH 85/85] qwt: fix unpackaged files
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
X-List-Received-Date: Wed, 05 Dec 2012 22:07:42 -0000

* fixes:
qwt-6.0.1: qwt: Files/directories were installed but not shipped
  /usr/features
  /usr/doc
  /usr/plugins
  /usr/features/qwtconfig.pri
  /usr/features/qwtmathml.prf
  /usr/features/qwt.prf
  /usr/plugins/designer
  /usr/plugins/designer/libqwt_designer_plugin.so
  /usr/plugins/designer/.debug
  /usr/plugins/designer/.debug/libqwt_designer_plugin.so

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb | 2 ++
 meta-oe/recipes-qt/qwt/qwt.inc        | 6 +++++-
 meta-oe/recipes-qt/qwt/qwt_6.0.1.bb   | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
index 7f0e43b..af9d956 100644
--- a/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
+++ b/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb
@@ -2,6 +2,8 @@ inherit qt4e
 
 require qwt.inc
 
+PR = "r1"
+
 SRC_URI[qwt.md5sum] = "ace68558eab873e2da7e641179c4ef0c"
 SRC_URI[qwt.sha256sum] = "3fe19dd5962d705632fc2ef616b009299de6cf1e702538296924dbfdc8003cb2"
 
diff --git a/meta-oe/recipes-qt/qwt/qwt.inc b/meta-oe/recipes-qt/qwt/qwt.inc
index 50f4e2a..02a4049 100644
--- a/meta-oe/recipes-qt/qwt/qwt.inc
+++ b/meta-oe/recipes-qt/qwt/qwt.inc
@@ -22,6 +22,7 @@ do_install() {
     oe_runmake -e install
     install -d ${D}${datadir}/doc/${PN}
     mv ${D}${prefix}/doc/* ${D}${datadir}/doc/${PN}/
+    rmdir ${D}${prefix}/doc
     cd ${S}/examples
     install -d ${D}/${bindir}
     cd bin${QT_LIBINFIX}/
@@ -30,5 +31,8 @@ do_install() {
     done
 }
 
-PACKAGES_prepend = "${PN}-examples "
+PACKAGES_prepend = "${PN}-examples ${PN}-features ${PN}-plugins"
 FILES_${PN}-examples = "${bindir}/*"
+FILES_${PN}-features = "${prefix}/features"
+FILES_${PN}-plugins = "${prefix}/plugins"
+FILES_${PN}-dbg = "${prefix}/plugins/designer/.debug"
diff --git a/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb b/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
index e7eb7b7..f38816a 100644
--- a/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
+++ b/meta-oe/recipes-qt/qwt/qwt_6.0.1.bb
@@ -2,6 +2,8 @@ inherit qt4x11
 
 require qwt.inc
 
+PR = "r1"
+
 SRC_URI[qwt.md5sum] = "ace68558eab873e2da7e641179c4ef0c"
 SRC_URI[qwt.sha256sum] = "3fe19dd5962d705632fc2ef616b009299de6cf1e702538296924dbfdc8003cb2"
 
-- 
1.8.0



