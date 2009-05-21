Received: from [72.14.220.156] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthieu.poullet@gmail.com>) id 1M7AYk-0008Sg-Tw
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 May 2009 17:52:00 +0200
Received: by fg-out-1718.google.com with SMTP id e12so1263184fga.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2009 08:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=V7kCQpUGZfbnJ4Y8lR/ShyWU4M4QETKaBekFWGnSdAY=;
	b=qdp5zVx7WzWQK0mjHl+GzV+E2GxHZpoVuMxDRY+wKPl5QvcVbtWVhQF17h3BoOdJvx
	wgCaT9oNOxs/X713vNnUKK8NyKO963DArhHfdaz0io8qS5zRbQvdBjFWZ71D3RIC4P9t
	YZfjQuyU5pC/n1TDV04GwFG+yLlsKnPWScgAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=I+RuS+WKjO0L1pUmnWhlGUxw9bHY/p3A65hcZLzjvauQEj+sZU6I13AEoC6aTIuPEB
	To1trmqZ/ZqOWIZ1JySizhMeldAE9IhBgqbOOd38l0y1PCyj9M7jup8aZz32S6lPNOoe
	6EX0WRhnRP5tCZTtWusu4vAaUSlIzUClpJciA=
Received: by 10.86.27.6 with SMTP id a6mr2297471fga.18.1242920659271;
	Thu, 21 May 2009 08:44:19 -0700 (PDT)
Received: from localhost.localdomain (77-22-121-59-dynip.superkabel.de
	[77.22.121.59])
	by mx.google.com with ESMTPS id d6sm4110941fga.27.2009.05.21.08.44.18
	(version=SSLv3 cipher=RC4-MD5); Thu, 21 May 2009 08:44:18 -0700 (PDT)
From: Matthieu Poullet <matthieu.poullet@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 21 May 2009 17:44:17 +0200
Message-Id: <1242920657-24148-1-git-send-email-matthieu.poullet@gmail.com>
X-Mailer: git-send-email 1.6.0.4
Cc: Matthieu Poullet <matthieu.poullet@gmail.com>
Subject: [PATCH] wget: update to version 1.11.4
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
X-List-Received-Date: Thu, 21 May 2009 15:52:04 -0000

The actual version was released in 2003, so I think it's time to update it.
This patch prepares the transition and allows other to test the latest release.

Regards,
Matthieu.

Signed-off-by: Matthieu Poullet <matthieu.poullet@gmail.com>
---
 conf/checksums.ini          |    4 ++++
 recipes/wget/wget.inc       |   34 ++++++++++++++++++++++++++++++++++
 recipes/wget/wget_1.11.4.bb |    8 ++++++++
 recipes/wget/wget_1.9.1.bb  |   41 ++++++++++-------------------------------
 4 files changed, 56 insertions(+), 31 deletions(-)
 create mode 100644 recipes/wget/wget.inc
 create mode 100644 recipes/wget/wget_1.11.4.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2764372..64fb7f5 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -24026,6 +24026,10 @@ sha256=87caf592bd81922908e7ee6ff356c7d46cf5a2cbe46847df7d64aff537ca16b6
 md5=e6051f1e1487ec0ebfdbda72bedc70ad
 sha256=69044b87c517b986dbc17a5f7e4de430cb56e605330c19c6bb0d384d5c37e638
 
+[ftp://ftp.gnu.org/gnu/wget/wget-1.11.4.tar.gz]
+md5=69e8a7296c0e12c53bd9ffd786462e87
+sha256=7315963b6eefb7530b4a4f63a5d5ccdab30078784cf41ccb5297873f9adea2f3
+
 [ftp://ftp.debian.org/debian/pool/main/w/whois/whois_4.5.25.tar.gz]
 md5=516fc54ce709e874133fc3b3c7c05447
 sha256=99979ff161ee209da21ae118eff9ca6de7c5cb1b0dc3397de18df534e0afaf76
diff --git a/recipes/wget/wget.inc b/recipes/wget/wget.inc
new file mode 100644
index 0000000..21814c8
--- /dev/null
+++ b/recipes/wget/wget.inc
@@ -0,0 +1,34 @@
+DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
+SECTION = "console/network"
+DEPENDS = ""
+INC_PR = "r7"
+LICENSE = "GPL"
+
+S = "${WORKDIR}/wget-${PV}"
+
+inherit autotools gettext
+
+# Disable checking for SSL since that searches the system paths
+EXTRA_OECONF = "--enable-ipv6 --without-ssl"
+
+# The unslung kernel does not support ipv6
+EXTRA_OECONF_unslung = "--without-ssl"
+# SlugOS kernels do not support ipv6. Can be loaded as a module.
+EXTRA_OECONF_slugos = "--without-ssl"
+
+do_configure() {
+	autotools_do_configure
+}
+
+do_install () {
+	autotools_do_install
+	mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
+}
+
+pkg_postinst_${PN} () {
+	update-alternatives --install ${bindir}/wget wget wget.${PN} 100
+}
+
+pkg_prerm_${PN} () {
+	update-alternatives --remove wget wget.${PN}
+}
diff --git a/recipes/wget/wget_1.11.4.bb b/recipes/wget/wget_1.11.4.bb
new file mode 100644
index 0000000..4a20bab
--- /dev/null
+++ b/recipes/wget/wget_1.11.4.bb
@@ -0,0 +1,8 @@
+PR="${INC_PR}.1"
+
+DEFAULT_PREFERENCE="-1"
+SRC_URI = " \
+	${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+"
+
+require wget.inc
diff --git a/recipes/wget/wget_1.9.1.bb b/recipes/wget/wget_1.9.1.bb
index b1e9404..50974ed 100644
--- a/recipes/wget/wget_1.9.1.bb
+++ b/recipes/wget/wget_1.9.1.bb
@@ -1,40 +1,19 @@
-DESCRIPTION = "A console URL download utility featuring HTTP, FTP, and more."
-SECTION = "console/network"
-DEPENDS = ""
-PR = "r7"
-LICENSE = "GPL"
+PR = "${INC_PR}.1"
 
-SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
-	   file://m4macros.patch;patch=1 \
-	   file://autotools.patch;patch=1 \
-           file://ipv6-fix.patch;patch=1"
-S = "${WORKDIR}/wget-${PV}"
-
-inherit autotools gettext
-
-# Disable checking for SSL since that searches the system paths
-EXTRA_OECONF = "--enable-ipv6 --without-ssl"
+SRC_URI = " \
+	${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
+	file://m4macros.patch;patch=1 \
+	file://autotools.patch;patch=1 \
+        file://ipv6-fix.patch;patch=1 \
+"
 
-# SlugOS kernels do not support ipv6. Can be loaded as a module.
-EXTRA_OECONF_slugos = "--without-ssl"
+S = "${WORKDIR}/wget-${PV}"
 
-do_configure () {
+do_configure_prepend () {
 	if [ ! -e acinclude.m4 ]; then
 		mv aclocal.m4 acinclude.m4
 	fi
 	rm -f libtool.m4
-	autotools_do_configure
 }
 
-do_install () {
-	autotools_do_install
-	mv ${D}${bindir}/wget ${D}${bindir}/wget.${PN}
-}
-
-pkg_postinst_${PN} () {
-	update-alternatives --install ${bindir}/wget wget wget.${PN} 100
-}
-
-pkg_prerm_${PN} () {
-	update-alternatives --remove wget wget.${PN}
-}
+require wget.inc
-- 
1.6.0.4



