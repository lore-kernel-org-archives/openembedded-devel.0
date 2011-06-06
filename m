Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nmacmunn@gmail.com>) id 1QTdbU-0004XK-CF
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 19:28:43 +0200
Received: by iye7 with SMTP id 7so3670975iye.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Jun 2011 10:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=jWFe7zGLXioVcIuH/11VjbTMZNdiAcedo4dIQBvJbNU=;
	b=p7btyKg61fFiOqapmoyqa5vIlxM9gOtgOmJwtJn/ZzGm6UHpmz9fgkS9Z6Emr0y3SB
	a1xJyzdJTzcbDtZ2Ux7JdQ++vkxRYNGz+TXFS5+iucj5a7BxoKcAKrIuN9G9yMij8Txw
	RzOPL4Zu014qaTdXQsRzw1kV0YlPNBdKlbAWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=t7Pywcq6oSXMu5BgKjtN9UwwHWlKs2aoTJuIwMQf/OnrMgEqvW8+LVP88rfpTlqINV
	x3S7Hw6mXOqnVrbI0o5xr/mBIAaenkj1uYO3plJUpRfEOSJ3VIqTVezOHwnTV8GsZQ2p
	9assEHSE30yDI93pq506hu7YBXWZnA3UcN+Zw=
Received: by 10.42.29.69 with SMTP id q5mr9121288icc.353.1307381032758;
	Mon, 06 Jun 2011 10:23:52 -0700 (PDT)
Received: from localhost.localdomain ([74.3.164.55])
	by mx.google.com with ESMTPS id ex14sm2864745icb.13.2011.06.06.10.23.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 06 Jun 2011 10:23:51 -0700 (PDT)
From: Neil MacMunn <nmacmunn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 10:20:49 -0700
Message-Id: <1307380849-31354-1-git-send-email-neil@gumstix.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] openocd: added v0.4.0
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
X-List-Received-Date: Mon, 06 Jun 2011 17:28:43 -0000

* includes patch to prevent CROSS COMPILE Badness
* configure requires --enable-maintainer-mode to generate version.texi

Signed-off-by: Neil MacMunn <neil@gumstix.com>
---
 .../openocd/files/make-include-path-relative.patch |   13 +++++++++++
 recipes/openocd/openocd_0.4.bb                     |   23 ++++++++++++++++++++
 2 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/openocd/files/make-include-path-relative.patch
 create mode 100644 recipes/openocd/openocd_0.4.bb

diff --git a/recipes/openocd/files/make-include-path-relative.patch b/recipes/openocd/files/make-include-path-relative.patch
new file mode 100644
index 0000000..d9a5147
--- /dev/null
+++ b/recipes/openocd/files/make-include-path-relative.patch
@@ -0,0 +1,13 @@
+diff --git a/configure.in.orig b/configure.in
+index 4681aeb..07f57f3 100644
+--- a/configure.in
++++ b/configure.in.modified
+@@ -186,7 +186,7 @@ then
+       LDFLAGS="$LDFLAGS -Wl,-rpath,$OCDxprefix/lib"
+     fi
+     # The "INCDIR" is also usable
+-    CFLAGS="$CFLAGS -I$includedir"
++    CFLAGS="$CFLAGS -I$sysroot/include"
+ fi
+ 
+ AC_ARG_WITH(ftd2xx,
diff --git a/recipes/openocd/openocd_0.4.bb b/recipes/openocd/openocd_0.4.bb
new file mode 100644
index 0000000..e74b5fe
--- /dev/null
+++ b/recipes/openocd/openocd_0.4.bb
@@ -0,0 +1,23 @@
+DESCRIPTION = "Free and Open On-Chip Debugging, In-System Programming and Boundary-Scan Testing"
+HOMEPAGE = "http://openocd.berlios.de/"
+LICENSE = "GPL"
+SRCREV = "56e74908d17d740db0a376f354c21e6608e8af8d"
+PV = "0.4"
+PR = "r0"
+
+DEPENDS = "libftdi"
+EXTRA_OECONF = " --enable-ft2232_libftdi --disable-werror --enable-maintainer-mode"
+
+SRC_URI = "git://openocd.git.sourceforge.net/gitroot/openocd/openocd;protocol=http;branch=master \
+          file://make-include-path-relative.patch"
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+do_configure_append() {
+	for i in $(find ${S} -name Makefile) ; do
+		sed -i -e 's:-I/usr/include:${STAGING_INCDIR}:g' $i
+		sed -i -e 's:-L/usr/lib:-L${STAGING_LIBDIR}:g' $i
+	done
+}
+
-- 
1.7.1



