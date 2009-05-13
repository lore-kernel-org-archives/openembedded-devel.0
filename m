Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2u-0006OF-0E
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:40 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=fnGUG5ShQRipB26/n3PpbcQdjX2cL37SokY43rhACZ4=;
	b=LLufHIzDo6EwP4u23bGEyQwzC+vAIqbsXLzvcskiNxjB78nQ5xtnqqfRh5VuO7TsQx
	RG/olW6U0mtv54f8vQMR3b8AvSSY9dnrcoUpIDAuzojOZ7sJEtqrt1ZDIooPlk3Hdq6Z
	mOb82fwIoK6u8HaRFuumtHcAgCo142j9vB/cI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=cD/a/83lluIMWGpv2xWIJmclcJzyQ3jIqrbVKMNsRvhxxS/RV2clQv2Rx3ZyoT8GEh
	x1yKGDYZABJ9500cbwEdaFForhEP2L3sHjxJMZJpXa0qyuD95FPioNcXi1jndnIozKWb
	JfXJgejEba1pVChMDlMJSu4TnbHM/UnpplEd4=
Received: by 10.210.79.3 with SMTP id c3mr932409ebb.41.1242207597531;
	Wed, 13 May 2009 02:39:57 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2195820eyg.37.2009.05.13.02.39.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:56 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:54 +0200
Message-Id: <1242207556-15601-16-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 15/37] gpe-taskmanager: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:40 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-taskmanager/files/makefile-fix.patch |   11 +++++++++++
 recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb  |    2 ++
 recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb  |    2 ++
 recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb  |    2 ++
 recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb  |    1 +
 5 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpe-taskmanager/files/makefile-fix.patch

diff --git a/recipes/gpe-taskmanager/files/makefile-fix.patch b/recipes/gpe-taskmanager/files/makefile-fix.patch
new file mode 100644
index 0000000..7b26bed
--- /dev/null
+++ b/recipes/gpe-taskmanager/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2006-04-10 13:41:32.000000000 +0200
++++ gpe-taskmanager-0.20/Makefile	2009-05-01 22:03:35.000000000 +0200
+@@ -32,7 +32,7 @@
+ 
+ install-program: all all-desktop
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	install -d $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/$(PACKAGE).png
+ 	install -d $(DESTDIR)$(PREFIX)/share/applications
diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb
index 1f31a4d..6b03ad4 100644
--- a/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb
+++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.17.bb
@@ -7,3 +7,5 @@ SECTION = "gpe"
 DESCRIPTION = "GPE task manager"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb
index 1f31a4d..6b03ad4 100644
--- a/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb
+++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.18.bb
@@ -7,3 +7,5 @@ SECTION = "gpe"
 DESCRIPTION = "GPE task manager"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb
index 1f31a4d..6b03ad4 100644
--- a/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb
+++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.19.bb
@@ -7,3 +7,5 @@ SECTION = "gpe"
 DESCRIPTION = "GPE task manager"
 
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
diff --git a/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb b/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb
index 7d0ff8e..e02afbf 100644
--- a/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb
+++ b/recipes/gpe-taskmanager/gpe-taskmanager_0.20.bb
@@ -7,3 +7,4 @@ inherit gpe
 
 SRC_URI += "file://setlocale.patch;patch=1"
 
+SRC_URI += "file://makefile-fix.patch;patch=1"
-- 
1.6.1



