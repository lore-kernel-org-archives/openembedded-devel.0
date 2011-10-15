Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RF7O8-0000Tk-Pv
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Oct 2011 18:47:08 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so3456973bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Oct 2011 09:41:24 -0700 (PDT)
Received: by 10.223.58.83 with SMTP id f19mr11804554fah.36.1318696882778;
	Sat, 15 Oct 2011 09:41:22 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id w14sm11333348fae.13.2011.10.15.09.41.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 09:41:22 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Oct 2011 18:41:13 +0200
Message-Id: <1318696873-5478-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.6.6.1
In-Reply-To: <1318696873-5478-1-git-send-email-koen@dominion.thruhere.net>
References: <1318696873-5478-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe 2/2] subsurface: inital add
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
X-List-Received-Date: Sat, 15 Oct 2011 16:47:08 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-extended/subsurface/subsurface_git.bb  |   28 ++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-extended/subsurface/subsurface_git.bb

diff --git a/meta-oe/recipes-extended/subsurface/subsurface_git.bb b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
new file mode 100644
index 0000000..b1a7e3e
--- /dev/null
+++ b/meta-oe/recipes-extended/subsurface/subsurface_git.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Subsurface is an open source dive log program."
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+DEPENDS = "libdivecomputer gtk+ libxml2 glib-2.0"
+
+inherit gtk-icon-cache
+
+PV = "1.0"
+SRCREV = "f2c61aefa762ce2ef7dea61886afeb23b0fe5eff"
+SRC_URI = "git://subsurface.hohndel.org/subsurface.git"
+S = "${WORKDIR}/git"
+
+EXTRA_OEMAKE = "CC='${CC}' \
+                libdc-usr=${STAGING_INCDIR}/libdivecomputer/* \
+                LIBDIVECOMPUTERINCLUDES=${STAGING_INCDIR}/libdivecomputer \
+                LIBDIVECOMPUTERARCHIVE=${STAGING_LIBDIR}/libdivecomputer.a \
+               "
+
+do_install() {
+	install -d ${D}${datadir}/man/man1
+	oe_runmake install prefix=${D}${prefix}
+	rm ${D}${datadir}/icons/hicolor/icon-theme.cache
+}
+
+FILES_${PN} += "${datadir}/icons/hicolor/scalable/apps/subsurface.svg"
+RRECOMMENDS_${PN}_append_libc-glibc = " eglibc-gconv-iso8859-15"
+
-- 
1.6.6.1



