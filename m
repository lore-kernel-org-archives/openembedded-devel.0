Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <koen.kooi@gmail.com>) id 1M4B3Y-0006OE-Gz
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 May 2009 11:47:20 +0200
Received: by mail-ew0-f172.google.com with SMTP id 20so593886ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 May 2009 02:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Gj9xBjeVsvxjQgftUitaeUAo1lhSCz/sJSlM5v9IkJA=;
	b=VkpsJnKkhj1sY4NkwpcKo8JOx4vPD9pXIcuh7KE8O4gzQvkJQqCMnU76J6fKTWLsLb
	PaQVS7oYuVJigUrPnWy1/li5duRYXBwbAhSJFCaKKI4SY7ZVCeBLW27yjchkbKmocTLc
	y1d/zk4Ofbf+Xt0mfymkyQKhB9xgqUfy0o+Xo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=ppL0kcLZmb0qDvS7XSQXeP8HQ+SvuoT/QHKzS8rCmAV7g7N/ZbLPMBOa9f4TOTsES+
	IIQ11FhjoPaYXRs0tBR4PLZgMTZREmItOKOXqskTIHtykt3+CTBiFMnnyXqHentPqlDv
	TOlBKLFzPFthjBvEJ5p441PFZUngxaxTBwkSw=
Received: by 10.211.168.5 with SMTP id v5mr1787260ebo.18.1242207638016;
	Wed, 13 May 2009 02:40:38 -0700 (PDT)
Received: from localhost (s55917625.adsl.wanadoo.nl [85.145.118.37])
	by mx.google.com with ESMTPS id 7sm2194089eyg.17.2009.05.13.02.40.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 May 2009 02:40:37 -0700 (PDT)
From: koen.kooi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Wed, 13 May 2009 11:39:11 +0200
Message-Id: <1242207556-15601-33-git-send-email-k.kooi@student.utwente.nl>
X-Mailer: git-send-email 1.6.1
In-Reply-To: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
References: <1242207556-15601-1-git-send-email-k.kooi@student.utwente.nl>
Subject: [STABLE][PATCH 32/37] gpe-watch: Fix install: don't do install -s
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
X-List-Received-Date: Wed, 13 May 2009 10:54:10 -0000

From: Steve Sakoman <steve@sakoman.com>

Signed-off-by: Koen Kooi <koen@openembedded.org>
---
 recipes/gpe-watch/gpe-watch-0.10/fix_install.patch |   13 +++++++++++++
 recipes/gpe-watch/gpe-watch_0.10.bb                |    5 ++++-
 2 files changed, 17 insertions(+), 1 deletions(-)
 create mode 100644 recipes/gpe-watch/gpe-watch-0.10/fix_install.patch

diff --git a/recipes/gpe-watch/gpe-watch-0.10/fix_install.patch b/recipes/gpe-watch/gpe-watch-0.10/fix_install.patch
new file mode 100644
index 0000000..3ae63a8
--- /dev/null
+++ b/recipes/gpe-watch/gpe-watch-0.10/fix_install.patch
@@ -0,0 +1,13 @@
+diff --git gpe-watch-0.10/Makefile-orig gpe-watch-0.10/Makefile
+index 2f74616..58fa802 100644
+--- gpe-watch-0.10/Makefile-orig
++++ gpe-watch-0.10/Makefile
+@@ -39,7 +39,7 @@ $(PACKAGE): $(OBJS) $(LIB)
+ 
+ install-program: all $(PACKAGE).desktop
+ 	mkdir -p $(DESTDIR)$(PREFIX)/bin
+-	install -s $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
++	install $(PACKAGE) $(DESTDIR)$(PREFIX)/bin/$(PACKAGE)
+ 	mkdir -p $(DESTDIR)$(PREFIX)/share/pixmaps
+ 	install -m 644 $(PACKAGE).png $(DESTDIR)$(PREFIX)/share/pixmaps/$(PACKAGE).png
+ 	#mkdir -p $(DESTDIR)$(PREFIX)/share/$(PACKAGE)
diff --git a/recipes/gpe-watch/gpe-watch_0.10.bb b/recipes/gpe-watch/gpe-watch_0.10.bb
index e0d5147..9b386a2 100644
--- a/recipes/gpe-watch/gpe-watch_0.10.bb
+++ b/recipes/gpe-watch/gpe-watch_0.10.bb
@@ -1,5 +1,6 @@
 LICENSE = "GPL"
 inherit gpe pkgconfig
+PR = "r1"
 
 DESCRIPTION = "GPE analog clock-watch"
 DEPENDS = "gtk+ libgpewidget"
@@ -7,4 +8,6 @@ SECTION = "gpe"
 PRIORITY = "optional"
 
 SRC_URI += "file://fix_makefile.patch;patch=1 \
-            file://no-render-h.patch;patch=1"
+            file://fix_install.patch;patch=1 \
+            file://no-render-h.patch;patch=1 \
+           "
-- 
1.6.1



