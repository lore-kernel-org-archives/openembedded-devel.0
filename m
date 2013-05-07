Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UZqrx-0003ct-Lc
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 01:00:36 +0200
Received: by mail-ee0-f47.google.com with SMTP id b47so597139eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2013 15:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=PJynlSsFfhqd9S5nVWQyxGHPdc6xbefchXjYmALdUnQ=;
	b=vJrAZQGyxpuB77LogZxuQCSZZc5ECzCGO/hoO5DUfKgE/QZqajgX9TD5QgEsAU766e
	f79YthstuV5T5Qy/ELD4BHpVHGGJWb/UnA8tGyz+8FewmpDkr+GmN6D8JtSc4zmjxzwk
	aPjIRlOsr/mvWYAtN4S40fEsrsjfLrJ4J7r3PoiSBTcZovCRqH/YyENzolQVA/RcttF/
	F9sQrMk7l9i/c6RR0WtPQqgkkYh1M6ridorL1h6a8CVpbhd95Fc2Oq9etYhkM9xkyqr0
	gmZ9jBhBc/AzBviz6Jt4OxPD4sGp4OMqaN9qcDUa55VYwamsWsppEP+V0s6pLv65RiHf
	YAWQ==
X-Received: by 10.14.38.198 with SMTP id a46mr10202910eeb.11.1367966544516;
	Tue, 07 May 2013 15:42:24 -0700 (PDT)
Received: from localhost.localdomain (p5B0A0896.dip0.t-ipconnect.de.
	[91.10.8.150])
	by mx.google.com with ESMTPSA id i3sm41969409eev.1.2013.05.07.15.42.23
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 15:42:23 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2013 00:41:50 +0200
Message-Id: <1367966513-12566-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-gnome 12/15] dconf: fix/remove postinst by inheriting gsettings
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
X-List-Received-Date: Tue, 07 May 2013 23:00:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
index ba14e88..7d11cf8 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.7.5.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SECTION = "x11/gnome"
 
-inherit gnome
+inherit gnome gsettings
 SRC_URI[archive.md5sum] = "d784f8afca04473d194a72047595c28e"
 SRC_URI[archive.sha256sum] = "e2103e8207744903790e9fac6427fa394bb485a0c7f4e0d03b0fb43268c34f33"
 
@@ -12,7 +12,7 @@ DEPENDS = "glib-2.0 gtk+3"
 
 inherit vala
 
-PR = "r1"
+PR = "r2"
 
 PACKAGES =+ "dconf-editor"
 
@@ -21,11 +21,3 @@ FILES_${PN} += "${datadir}/dbus-1/ \
                 ${libdir}/gio/modules/*.so \
 "
 FILES_${PN}-dbg += "${libdir}/gio/modules/.debug/libdconfsettings.so"
-
-pkg_postinst_${PN} () {
-if [ -n "$D" ]; then
-    exit 1
-fi
-
-glib-compile-schemas ${datadir}/glib-2.0/schemas
-}
-- 
1.7.4.4



