Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Owvtl-0000rw-6e
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Sep 2010 13:48:06 +0200
Received: by eyb7 with SMTP id 7so1324924eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Sep 2010 04:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=NPFrybEPnv6hUYUwhHWV58DloXA41P7Fx/mMFFgyzzU=;
	b=P67KLOydQJgaXPWcXmLXCNNhqxd7l8+dEsS4uscqnH+qAXOm1a/Xw6g1oov3SMGRSi
	UB3Z04g+R+VhYpK6PDBgz/z9fMuoOl8Ft8Fn8VZSZzxH9bFDBd963Hau87aJM7EPmFEl
	jo6p7bQniAwPhl2/ufELE/vWpevvP+WYWW0Cs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=eTGC5RdI5y+O5r/AC+iOF0mOf2BpZ5Y7veJm1NfzgFVgflIYaXJ0TMhSnHA6jfYz9n
	wEnKpqD8yXxzUn8mk5a2Fzl3OWyGJKnLZbl4qRMopK0zbdbBo7OKIvcUJkft1UeH9ZJj
	KX28NBIUe2xxITROyK1tSeoYRcmF2FJ2cjfDw=
Received: by 10.213.17.138 with SMTP id s10mr774128eba.44.1284810434948;
	Sat, 18 Sep 2010 04:47:14 -0700 (PDT)
Received: from localhost.localdomain (j200125.upc-j.chello.nl [24.132.200.125])
	by mx.google.com with ESMTPS id v59sm7439918eeh.4.2010.09.18.04.47.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 18 Sep 2010 04:47:14 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 18 Sep 2010 13:47:08 +0200
Message-Id: <1284810428-19013-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.6.4.2
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] clutter: moved COMPATIBLE_MACHINE to clutter-common.inc
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
X-List-Received-Date: Sat, 18 Sep 2010 11:48:07 -0000

moved COMPATIBLE_MACHINE from clutter.inc to clutter-common.inc
the other recipes all DEPEND on clutter but do not have a COMPATIBLE_MACHINE
defined, but of course do not work for other machines.
This patch moves COMPATIBLE_MACHINE to clutter-common.inc which is
included by all other inc file and so it applies to all

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---
 recipes/clutter/clutter-box2d.inc  |    2 +-
 recipes/clutter/clutter-common.inc |    2 ++
 recipes/clutter/clutter-gst.inc    |    2 +-
 recipes/clutter/clutter-gtk.inc    |    2 +-
 recipes/clutter/clutter.inc        |    4 +---
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/clutter/clutter-box2d.inc b/recipes/clutter/clutter-box2d.inc
index 7541335..e187adf 100644
--- a/recipes/clutter/clutter-box2d.inc
+++ b/recipes/clutter/clutter-box2d.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPLv2.1"
 
 DEPENDS = "clutter"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 # The main clutter lib is machine specific so we need to be too
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes/clutter/clutter-common.inc b/recipes/clutter/clutter-common.inc
index 65b490a..e681bf6 100644
--- a/recipes/clutter/clutter-common.inc
+++ b/recipes/clutter/clutter-common.inc
@@ -1,3 +1,5 @@
+COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|overo|omap3evm|omap5912osk)"
+
 # common functions for all clutter-libraries
 
 # all .debug stuff goes to clutter*-dbg
diff --git a/recipes/clutter/clutter-gst.inc b/recipes/clutter/clutter-gst.inc
index b25f31e..d5cbcda 100644
--- a/recipes/clutter/clutter-gst.inc
+++ b/recipes/clutter/clutter-gst.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GStreamer integration library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS = "clutter gstreamer gst-plugins-base"
 
diff --git a/recipes/clutter/clutter-gtk.inc b/recipes/clutter/clutter-gtk.inc
index 6e624c5..d00babb 100644
--- a/recipes/clutter/clutter-gtk.inc
+++ b/recipes/clutter/clutter-gtk.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Clutter GTK+ integration library"
 HOMEPAGE = "http://www.clutter-project.org/"
 LICENSE = "LGPLv2.1"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS = "gtk+ clutter"
 require clutter-common.inc
diff --git a/recipes/clutter/clutter.inc b/recipes/clutter/clutter.inc
index e29164f..5987aa6 100644
--- a/recipes/clutter/clutter.inc
+++ b/recipes/clutter/clutter.inc
@@ -8,8 +8,6 @@ INC_SRC_URI = "file://sample.desktop \
 
 PARALLEL_MAKE = ""
 
-COMPATIBLE_MACHINE = "(zylonite|mx31litekit|omap-3430ldp|omap-3430sdp|mx31ads|qemuarm|qemux86|ipodtouch|am3517-evm|dm37x-evm|am37x-evm|beagleboard|overo|omap3evm|omap5912osk)"
-
 STDDEPENDS = "virtual/libx11 gtk-doc-native pango glib-2.0 libxfixes gtk+"
 BASE_CONF = "--disable-gtk-doc ${@get_clutter_fpu_setting(bb, d)} --enable-conformance "
 
@@ -43,7 +41,7 @@ EXTRA_OECONF_mx31ads = "${BASE_CONF} --with-flavour=eglnative"
 PACKAGE_ARCH_mx31ads = "${MACHINE_ARCH}"
 LDFLAGS_append_mx31ads = " -lpvrNULLWSEGL -lstdc++ "
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 inherit autotools pkgconfig gtk-doc
 
-- 
1.6.4.2



