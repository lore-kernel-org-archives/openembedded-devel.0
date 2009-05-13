Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3a-0006OF-Az
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:22 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593907ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=1E8AkDEbrojTuO5i/31fHcZWKfhIUOVSCR1xZ6GvTDs=;
	b=mWg9+hw/RvhB3teKT6ArTyEltAoXwRyku47nSXf6ijH8nD1bci5AwDputtqeMnr6uh
	5w3j+kYPvTRVe0wYApHYepiq1kl/H5F21cTRSGIExhIQWqQ4qpIq5eMFWlYbYhYFqABH
	XtR3IKXLP199bZwEfsRK+QAmHTZd3TV3Dmmj4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=vTlCJa8tR4xmdP7MXWyG2LQvytoC83/KgI/J3YKXMfyiKCzzBerdSV4biWdVBH40i7
	6yNjgm6W1Arb92A9YkWMsIIg1qGrOZYKXZoiAu8g05IoE3/r1r9blZ+V9gZWjCftnLg+
	7hr5CZ1xsH25r3XzCti/UTC5lHrh7pORMEic4=
Received: by 10.210.109.19 with SMTP id h19mr924958ebc.60.1242207639791;
	Wed, 13 May 2009 02:40:39 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 5sm2202287eyf.8.2009.05.13.02.40.39
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:39 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:12 +0200
Message-Id: <1242207556-15601-34-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 33/37] gpe-mixer: fix Makefile - don't strip on install
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
X-List-Received-Date: Wed, 13 May 2009 10:10:27 -0000

From: Andrea Adami <andrea.adami@gmail.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-mixer/gpe-mixer/fix-install.patch |   11 +++++++++++
 recipes/gpe-mixer/gpe-mixer_0.42.bb           |    3 ++-
 2 files changed, 13 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gpe-mixer/gpe-mixer/fix-install.patch

diff --git a/recipes/gpe-mixer/gpe-mixer/fix-install.patch b/recipes/gpe-mixer/gpe-mixer/fix-install.patch
new file mode 100644
index 0000000..ec5ea2c
--- /dev/null
+++ b/recipes/gpe-mixer/gpe-mixer/fix-install.patch
@@ -0,0 +1,11 @@
+--- Makefile.old	2009-05-09 21:11:12.000000000 +0200
++++ Makefile	2009-05-09 21:11:39.000000000 +0200
+@@ -36,7 +36,7 @@
+ 
+ install-program: all $(PACKAGE).desktop
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/$(PACKAGE).png
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/$(PACKAGE)
diff --git a/recipes/gpe-mixer/gpe-mixer_0.42.bb b/recipes/gpe-mixer/gpe-mixer_0.42.bb
index 5fe0e98..c2f7bbe 100644
--- a/recipes/gpe-mixer/gpe-mixer_0.42.bb
+++ b/recipes/gpe-mixer/gpe-mixer_0.42.bb
@@ -3,7 +3,8 @@ PR = "r1"
 
 inherit gpe pkgconfig
 
-SRC_URI += "file://gpemixer-no-host-includes.patch;patch=1"
+SRC_URI += "file://gpemixer-no-host-includes.patch;patch=1 \
+	    file://fix-install.patch;patch=1"
 
 DESCRIPTION = "GPE audio mixer"
 DEPENDS = "gtk+ libgpewidget"
-- 
1.6.1



