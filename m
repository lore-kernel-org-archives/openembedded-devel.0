Received: from [83.222.19.8] (helo=mail.asoft.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mad_soft@inbox.ru>) id 1M7y3j-0004B6-JL
	for openembedded-devel@openembedded.org; Sat, 23 May 2009 22:43:11 +0200
Received: from localhost.localdomain ([62.205.175.245]) (authenticated bits=0)
	by mail.asoft.ru (8.13.4/8.13.4) with ESMTP id n4NKZK4s015936
	for <openembedded-devel@openembedded.org>;
	Sun, 24 May 2009 00:35:22 +0400
From: Dmitry Artamonow <mad_soft@inbox.ru>
To: openembedded-devel@openembedded.org
Date: Sun, 24 May 2009 00:35:17 +0400
Message-Id: <1243110920-18111-4-git-send-email-mad_soft@inbox.ru>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <1243110920-18111-3-git-send-email-mad_soft@inbox.ru>
References: <1243110920-18111-1-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-2-git-send-email-mad_soft@inbox.ru>
	<1243110920-18111-3-git-send-email-mad_soft@inbox.ru>
X-Greylist: Sender succeeded SMTP AUTH authentication, not delayed by
	milter-greylist-2.0.2 (mail.asoft.ru [0.0.0.0]);
	Sun, 24 May 2009 00:35:22 +0400 (MSD)
Subject: [PATCH] libnsgif: add recipe for version 0.0.1
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
X-List-Received-Date: Sat, 23 May 2009 20:43:12 -0000

libnsgif is GIF decoding library.
Currently only Netsurf browser is using it, so we build just static
library.

Signed-off-by: Dmitry Artamonow <mad_soft@inbox.ru>
---
 recipes/netsurf/libnsgif_0.0.1.bb |   24 ++++++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)
 create mode 100644 recipes/netsurf/libnsgif_0.0.1.bb

diff --git a/recipes/netsurf/libnsgif_0.0.1.bb b/recipes/netsurf/libnsgif_0.0.1.bb
new file mode 100644
index 0000000..3b9cfc2
--- /dev/null
+++ b/recipes/netsurf/libnsgif_0.0.1.bb
@@ -0,0 +1,24 @@
+DESCRIPTION = "Libnsgif is a decoding library for the GIF image file format"
+HOMEPAGE = "http://www.netsurf-browser.org/projects/libnsgif/"
+SECTION = "libs"
+PRIORITY = "optional"
+LICENSE = "MIT"
+
+SRC_URI = "http://www.netsurf-browser.org/projects/releases/libnsgif-${PV}-src.tar.gz"
+
+inherit pkgconfig
+
+EXTRA_OEMAKE = "CURDIR=${S} DESTDIR=${D} PREFIX=${prefix} BUILDDIR=build-OE"
+
+# NOTE: we're using default buildmode here, which results in building only
+# static libraries (.a) Not a problem as libnsbmp is only used by Netsurf
+# at the moment
+
+do_stage() {
+	oe_libinstall -a -C build-OE/ libnsgif ${STAGING_LIBDIR}
+	install -m 0644 include/*.h ${STAGING_INCDIR}/
+}
+
+do_install() {
+	oe_runmake install
+}
-- 
1.6.0.6



