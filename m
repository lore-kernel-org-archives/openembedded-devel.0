Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2h-0006OF-S8
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:27 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=7A1syO6D9BmSYkyfy5zCct+2Anwfe4YJklJNnpI/XF8=;
	b=fHEha0d+CM0DgPDfbWG13Vu8A9Zim9RxPH7wyEuE1SfCpcz8cq2t3MXkNnDkOQAuIr
	7XI1fW8O9dZ+novZPVS0DGRbTkJs2HSjjWiDN7IQwxww0c2jDWyDdkcDa2sIka4FkVxk
	XBxixbeyt8qYdO5GOx579rAETUGHoBX15gf58=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=dgAU3AQIVV93UhTvtP0DeOPD8vytH2pOyiaL2N25x+w6CG0fg/PA9+iOilA8kIv04+
	OQzevjMiN0W5W2K15IBUZySzRTs2rOKecfmD1hcwWgrrMefdrgFcFjD2kA1/FbPXCXeA
	e2E/JuFiQvS/GcOhfFPmsYXQwfc/8FG7SoBeA=
Received: by 10.210.135.20 with SMTP id i20mr77666ebd.17.1242207585355;
	Wed, 13 May 2009 02:39:45 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 10sm2197974eyz.31.2009.05.13.02.39.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:44 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:52 +0200
Message-Id: <1242207556-15601-14-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 13/37] minilite: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:28 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/minilite/files/makefile-fix.patch |   11 +++++++++++
 recipes/minilite/minilite_0.41.bb         |    2 ++
 recipes/minilite/minilite_0.43.bb         |    2 ++
 recipes/minilite/minilite_0.44.bb         |    2 ++
 recipes/minilite/minilite_0.47.bb         |    2 ++
 recipes/minilite/minilite_0.48.bb         |    2 ++
 recipes/minilite/minilite_0.49.bb         |    2 ++
 recipes/minilite/minilite_0.50.bb         |    2 ++
 8 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/minilite/files/makefile-fix.patch

diff --git a/recipes/minilite/files/makefile-fix.patch b/recipes/minilite/files/makefile-fix.patch
new file mode 100644
index 0000000..1be6cea
--- /dev/null
+++ b/recipes/minilite/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2006-01-16 22:51:34.000000000 +0100
++++ minilite-050/Makefile	2009-05-01 16:36:32.000000000 +0200
+@@ -45,7 +45,7 @@
+ 
+ install-program: all
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	$(INSTALL) -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	$(INSTALL) $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
+ 	$(INSTALL) -m 644 $(PACKAGE).desktop $(DESTDIR)$(PREFIX)/share/applications/$(PACKAGE).desktop
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps/
diff --git a/recipes/minilite/minilite_0.41.bb b/recipes/minilite/minilite_0.41.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.41.bb
+++ b/recipes/minilite/minilite_0.41.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
diff --git a/recipes/minilite/minilite_0.43.bb b/recipes/minilite/minilite_0.43.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.43.bb
+++ b/recipes/minilite/minilite_0.43.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
diff --git a/recipes/minilite/minilite_0.44.bb b/recipes/minilite/minilite_0.44.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.44.bb
+++ b/recipes/minilite/minilite_0.44.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
diff --git a/recipes/minilite/minilite_0.47.bb b/recipes/minilite/minilite_0.47.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.47.bb
+++ b/recipes/minilite/minilite_0.47.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
diff --git a/recipes/minilite/minilite_0.48.bb b/recipes/minilite/minilite_0.48.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.48.bb
+++ b/recipes/minilite/minilite_0.48.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
diff --git a/recipes/minilite/minilite_0.49.bb b/recipes/minilite/minilite_0.49.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.49.bb
+++ b/recipes/minilite/minilite_0.49.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
diff --git a/recipes/minilite/minilite_0.50.bb b/recipes/minilite/minilite_0.50.bb
index 0f5b126..997ae93 100644
--- a/recipes/minilite/minilite_0.50.bb
+++ b/recipes/minilite/minilite_0.50.bb
@@ -7,4 +7,6 @@ DESCRIPTION = "GPE Screen light control dockapp"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
+SRC_URI += "file://makefile-fix.patch;patch=1" 
+
 export CVSBUILD="no"
-- 
1.6.1



