Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwpD-0006aY-Ce
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:42:31 +0200
Received: by mail-ey0-f175.google.com with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=y9UiBtS1/rko6EZ5oECQlpu4uTGdOJDbiIPGHqpqZic=;
	b=cHc5iy9XIzjZqpCwpJFNVjUWGfac9l1stAisgc8wnkB8MBp0LHGzWp4lQoxYnra3Xl
	2v0boCq1rfnEou0WkR8BXysOnKAKLG56/TU9TBnaCWG5gv1YIVHShH8Ws9YIRAJrDXSz
	mevl9xpB7zNRbmvZJDgiC0AKEcJ7MG71v+2lQ=
Received: by 10.223.65.20 with SMTP id g20mr19520000fai.20.1318894604641;
	Mon, 17 Oct 2011 16:36:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n18sm221533fah.2.2011.10.17.16.36.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:36:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:29 +0200
Message-Id: <1667aa0fe3210f0588bcf6906d1c0b58f667af1d.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
References: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 10/10] efm-nav, efm-path, efm-pathbar: drop from meta-efl, now are part of efm itself
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
X-List-Received-Date: Mon, 17 Oct 2011 23:42:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/e17/efm-nav_svn.bb     |   14 --------------
 meta-efl/recipes-efl/e17/efm-path_svn.bb    |   15 ---------------
 meta-efl/recipes-efl/e17/efm-pathbar_svn.bb |   15 ---------------
 3 files changed, 0 insertions(+), 44 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/e17/efm-nav_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/efm-path_svn.bb
 delete mode 100644 meta-efl/recipes-efl/e17/efm-pathbar_svn.bb

diff --git a/meta-efl/recipes-efl/e17/efm-nav_svn.bb b/meta-efl/recipes-efl/e17/efm-nav_svn.bb
deleted file mode 100644
index e6a8e6f..0000000
--- a/meta-efl/recipes-efl/e17/efm-nav_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-LICENSE = "MIT"
-PV = "0.0.1+svnr${SRCPV}"
-
-require e-module.inc
-
-SRCNAME = "E-MODULES-EXTRA/efm_nav"
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac
-    sed -i -e s:\ po::g Makefile.am
-}
-
-FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug/"
-FILES_${PN} += "${libdir}/enlightenment/modules/"
diff --git a/meta-efl/recipes-efl/e17/efm-path_svn.bb b/meta-efl/recipes-efl/e17/efm-path_svn.bb
deleted file mode 100644
index 685513f..0000000
--- a/meta-efl/recipes-efl/e17/efm-path_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "MIT"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-SRCNAME = "E-MODULES-EXTRA/efm_path"
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac
-    sed -i -e s:\ po::g Makefile.am
-}
-
-FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug/"
-FILES_${PN} += "${libdir}/enlightenment/modules/"
diff --git a/meta-efl/recipes-efl/e17/efm-pathbar_svn.bb b/meta-efl/recipes-efl/e17/efm-pathbar_svn.bb
deleted file mode 100644
index 54c5a0b..0000000
--- a/meta-efl/recipes-efl/e17/efm-pathbar_svn.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-LICENSE = "MIT"
-PV = "0.0.1+svnr${SRCPV}"
-PR = "${INC_PR}.0"
-
-require e-module.inc
-
-SRCNAME = "E-MODULES-EXTRA/efm_pathbar"
-
-do_configure_prepend() {
-    sed -i -e /po/d configure.ac
-    sed -i -e s:\ po::g Makefile.am
-}
-
-FILES_${PN}-dbg += "${libdir}/enlightenment/modules/*/*/.debug/"
-FILES_${PN} += "${libdir}/enlightenment/modules/"
-- 
1.7.7



