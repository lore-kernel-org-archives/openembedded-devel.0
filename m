Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrh-0003KM-GX
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:13 +0200
Received: by mail-ee0-f47.google.com with SMTP id b47so594070eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=MyiHZIJyJMRANILvGk+dVDftjElupytYrF3EHPCBPcM=;
	b=AcGFyRMYeXGMrJyQLEo9CYwF/P6uhkAU+OwGyv9hwkIYsYnSkBj/0Qt4qht85GvNoA
	B6jHasLhAuXGIkU547CiuGwJ648ImTC7kA2P6zDJY//ofRSVJZlbtkazGLDcRWzlzHNg
	aWSHdbQEraIUZ7cMRA5FYCPQeyb+f8m/vKxFLm1HwxcxMPawt7qx7nvRyj+pbGFgaHwx
	00L6Oc6XxXb6x/vJWgSWJTjfXvtO8f9+QldI0J7dUGTwN9fk6RAacGgkRk3ro4GsyKjD
	Fxp1q0qC7h5ptzqjT+4rhNoa62rlzuL9mjz3+L1AWBFswPNf93V54i6PwIMyHXgQAStk
	HKOA==
X-Received: by 10.14.214.3 with SMTP id b3mr10134960eep.24.1367966528357;
	Tue, 07 May 2013 15:42:08 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:07 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:39 +0200
Message-Id: <1367966513-12566-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 01/15] libbonobo: fix build with glib 2.36
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
X-List-Received-Date: Tue, 07 May 2013 23:00:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../0001-Remove-use-of-G_DISABLE_DEPRECATED.patch  |   47 ++++++++++++++++++++
 .../recipes-gnome/bonobo/libbonobo_2.24.3.bb       |    3 +-
 2 files changed, 49 insertions(+), 1 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch

diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch b/meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
new file mode 100644
index 0000000..44cf1f9
--- /dev/null
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo/0001-Remove-use-of-G_DISABLE_DEPRECATED.patch
@@ -0,0 +1,47 @@
+From fef13a371fc91f6d9b42518126c2a8b459fdf0e8 Mon Sep 17 00:00:00 2001
+From: Colin Walters <walters@verbum.org>
+Date: Thu, 2 May 2013 14:17:38 -0400
+Subject: [PATCH] Remove use of G_DISABLE_DEPRECATED
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This now trips up on GStaticRecMutex; I'm not going to bother to port,
+realistically no one is actively maintaining this code anymore.
+
+Upstream-Status: Applied
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ activation-server/Makefile.am |    1 -
+ configure.in                  |    2 +-
+ 2 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/activation-server/Makefile.am b/activation-server/Makefile.am
+index efb18a8..ffa90f6 100644
+--- a/activation-server/Makefile.am
++++ b/activation-server/Makefile.am
+@@ -17,7 +17,6 @@ INCLUDES=					\
+ 	$(SERVER_CFLAGS)			\
+ 	$(WARN_CFLAGS)				\
+ 	-DSERVER_CONFDIR=\"$(sysconfdir)\"	\
+-	-DG_DISABLE_DEPRECATED			\
+ 	-DG_LOG_DOMAIN=\"Bonobo-Activation-Server\" \
+ 	$(NULL)
+ 
+diff --git a/configure.in b/configure.in
+index 70a4e26..6be2bca 100644
+--- a/configure.in
++++ b/configure.in
+@@ -132,7 +132,7 @@ AC_SUBST(SERVER_LIBS)
+ AC_SUBST(SERVER_CFLAGS)
+ 
+ if test "$enable_maintainer_mode" = "yes"; then
+-	DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_DEPRECATED -DG_DISABLE_SINGLE_INCLUDES"
++	DISABLE_DEPRECATED_CFLAGS="-DG_DISABLE_SINGLE_INCLUDES"
+ 	AC_SUBST(DISABLE_DEPRECATED_CFLAGS)
+ fi
+ 
+-- 
+1.7.6.5
+
diff --git a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
index 253b46a..622f244 100644
--- a/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
+++ b/meta-gnome/recipes-gnome/bonobo/libbonobo_2.24.3.bb
@@ -1,5 +1,6 @@
 require libbonobo.inc
-PR = "r1"
+PR = "r2"
 
+SRC_URI += "file://0001-Remove-use-of-G_DISABLE_DEPRECATED.patch"
 SRC_URI[archive.md5sum] = "b217cef6a187505290c66c5bf8225d38"
 SRC_URI[archive.sha256sum] = "5310957fa90691689c0557218b8833f681666cae160bd84e1f2c2705189a4ebe"
-- 
1.7.4.4



