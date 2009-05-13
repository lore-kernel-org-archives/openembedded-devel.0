Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2y-0006OF-Aj
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:44 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Y97vaaXxS7tvxktgvtoYRu2qGaOzph86/ufaQMoIRHM=;
	b=kGrrnaXibu2VLndIOzZrL5BLPfkSXmHe+7BuX5IRlhlIGltA9PH8/InwML7sHocWVT
	OpriRjRDAH211+I+OsfrzBVrSAHkJa39G2TjH/vQv2FkIc2qCfKnYK3l0lg700ZrN5VO
	l7WwBZpxOl0ixmp4CyRojcYHtlnfUH+yHtZeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=B8jkFdMAQJAs47zIlmhma8CTKXJcrrbNr3dx9Xa61LtG2UAQKuDBbisS59MIgCKAf5
	9S/zcQbwDoChW9u6NBPJVtgwkQ1bP/v5joDjkB0WZZBf/i3iFUYmPNKrir49St6MpzkT
	ZKmHvAjOeSj8pq3M4uvVQoZvewyqm71SZIxy8=
Received: by 10.210.128.10 with SMTP id a10mr955534ebd.16.1242207601776;
	Wed, 13 May 2009 02:40:01 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2200086eyh.20.2009.05.13.02.40.00
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:01 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:56 +0200
Message-Id: <1242207556-15601-18-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 17/37] gpe-autostarter: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:44 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-autostarter/files/makefile-fix.patch |   11 +++++++++++
 recipes/gpe-autostarter/gpe-autostarter_0.11.bb  |    4 +++-
 recipes/gpe-autostarter/gpe-autostarter_0.12.bb  |    4 +++-
 recipes/gpe-autostarter/gpe-autostarter_0.6.bb   |    2 ++
 recipes/gpe-autostarter/gpe-autostarter_0.7.bb   |    2 ++
 recipes/gpe-autostarter/gpe-autostarter_svn.bb   |    2 ++
 6 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 recipes/gpe-autostarter/files/makefile-fix.patch

diff --git a/recipes/gpe-autostarter/files/makefile-fix.patch b/recipes/gpe-autostarter/files/makefile-fix.patch
new file mode 100644
index 0000000..97ee907
--- /dev/null
+++ b/recipes/gpe-autostarter/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2006-08-23 15:08:36.000000000 +0200
++++ gpe-autostarter-0.12/Makefile	2009-05-01 22:32:50.000000000 +0200
+@@ -28,7 +28,7 @@
+ 
+ install-program: all
+ 	install -d $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/
+ 	install -d $(DESTDIR)/etc/X11/Xsession.d
+ 	install $(PACKAGE).xsession $(DESTDIR)/etc/X11/Xsession.d/50$(PACKAGE)
+ 
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.11.bb b/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
index b228b3d..26a9e97 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.11.bb
@@ -5,4 +5,6 @@ LICENSE = "GPL"
 
 inherit gpe
 
-SRC_URI += " file://dbus-new-api.patch;patch=1"
+SRC_URI += "file://dbus-new-api.patch;patch=1 \
+	    file://makefile-fix.patch;patch=1"
+
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.12.bb b/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
index c47f757..4c4293e 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.12.bb
@@ -5,4 +5,6 @@ RDEPENDS = "hotplug-dbus"
 
 inherit gpe
 
-SRC_URI += "file://wireless.patch;patch=1"
+SRC_URI += "file://wireless.patch;patch=1 \
+	    file://makefile-fix.patch;patch=1"
+
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.6.bb b/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
index ef7f255..0ba68b7 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.6.bb
@@ -4,3 +4,5 @@ DEPENDS = "glib-2.0 dbus-glib hotplug-dbus"
 RDEPENDS = "hotplug-dbus"
 
 inherit gpe
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
diff --git a/recipes/gpe-autostarter/gpe-autostarter_0.7.bb b/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
index f92b5df..9e92740 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_0.7.bb
@@ -4,3 +4,5 @@ DEPENDS = "glib-2.0 dbus-glib hotplug-dbus virtual/libx11"
 RDEPENDS = "hotplug-dbus"
 
 inherit gpe
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
diff --git a/recipes/gpe-autostarter/gpe-autostarter_svn.bb b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
index 2742952..8d275b5 100644
--- a/recipes/gpe-autostarter/gpe-autostarter_svn.bb
+++ b/recipes/gpe-autostarter/gpe-autostarter_svn.bb
@@ -8,6 +8,8 @@ inherit gpe
 SRC_URI = "${GPE_SVN} \
            file://svn-build.patch;patch=1"
 
+SRC_URI += "file://makefile-fix.patch;patch=1"
+
 S = "${WORKDIR}/${PN}"
 
 export CVSBUILD="no"
-- 
1.6.1



