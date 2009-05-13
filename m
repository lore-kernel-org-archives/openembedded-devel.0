Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B2f-0006OE-Pf
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:46:25 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=0QUu05MHQ8ZvzwXlCeaNwjxrUb5mwT7N72SziVRQmp4=;
	b=bjdTZKtajBNOEFXrEMYgn/A14T8zhpnLr7QlRZg5d4w6SPmj94982EpwPDnT+v/ODM
	iGyIljMYw1oufKD43U/VS14u1SPvr189sXGEfy7YvTK8wSk0yLCAHEG00zJ2znbA7p3L
	t9boX53fifI/RwX+IAlcYqwHuQ5cf6Gis+bGc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=d5xv+I5YkkA43Z+M1utedjPBBttz7nDU15ZGFsaCsCVBG52Zq/4VDryHG9d07mLqYU
	jheY3OhWzj5998Uqq8hDr1Aps+Y6G0OlqI+S+RqGmJ+S4naTYxDX2jAXnqYiVm9f058K
	nHxhHCb1XMp2kzk2Ut4Q4P1+z/NFha9EYqjnw=
Received: by 10.210.120.17 with SMTP id s17mr4653939ebc.3.1242207583203;
	Wed, 13 May 2009 02:39:43 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2187478eyb.55.2009.05.13.02.39.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:39:42 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:38:51 +0200
Message-Id: <1242207556-15601-13-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 12/37] gpe-su: Makefile fix - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 09:46:26 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-su/files/makefile-fix.patch |   11 +++++++++++
 recipes/gpe-su/gpe-su.inc               |    2 ++
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gpe-su/files/makefile-fix.patch

diff --git a/recipes/gpe-su/files/makefile-fix.patch b/recipes/gpe-su/files/makefile-fix.patch
new file mode 100644
index 0000000..cce98b1
--- /dev/null
+++ b/recipes/gpe-su/files/makefile-fix.patch
@@ -0,0 +1,11 @@
+--- /tmp/Makefile.old	2008-07-14 22:34:47.000000000 +0200
++++ gpe-su-0.20/Makefile	2009-05-01 16:02:11.000000000 +0200
+@@ -34,7 +34,7 @@
+ 
+ install-program: all $(PACKAGE).desktop
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	install -m 755 -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install -m 755 $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/applications
+ 	install -m 644 $(PACKAGE).desktop $(DESTDIR)$(PREFIX)/share/applications
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps
diff --git a/recipes/gpe-su/gpe-su.inc b/recipes/gpe-su/gpe-su.inc
index 3daa0b9..287915e 100644
--- a/recipes/gpe-su/gpe-su.inc
+++ b/recipes/gpe-su/gpe-su.inc
@@ -6,3 +6,5 @@ DEPENDS = "libgpewidget virtual/libintl"
 SRC_URI = "${GPE_MIRROR}/${PN}-${PV}.tar.gz"
 
 inherit gpe pkgconfig
+
+SRC_URI += "file://makefile-fix.patch;patch=1"
-- 
1.6.1



