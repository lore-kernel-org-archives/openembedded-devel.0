Received: from cpe.ge-0-2-0-951.faaqnqu1.customer.tele.dk ([93.167.193.22]
	helo=mail.mikrofyn.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgh@sgh.dk>) id 1QEHjU-0006Ln-5z
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Apr 2011 11:05:28 +0200
Received: from zemeckis.mikrofyn.local ([10.115.0.50]) by mail.mikrofyn.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 25 Apr 2011 11:07:46 +0200
From: =?UTF-8?q?S=C3=B8ren=20Holm?= <sgh@sgh.dk>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Apr 2011 11:04:12 +0200
Message-Id: <1303722252-32371-1-git-send-email-sgh@sgh.dk>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Apr 2011 09:07:46.0656 (UTC)
	FILETIME=[3E59F600:01CC0328]
Subject: [PATCH] wvstreams: Added recipe for wxstreams 4.6.1.
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
X-List-Received-Date: Mon, 25 Apr 2011 09:05:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Søren Holm <sgh@sgh.dk>
---
 recipes/wvstreams/wvstreams_4.6.1.bb |   44 ++++++++++++++++++++++++++++++++++
 1 files changed, 44 insertions(+), 0 deletions(-)
 create mode 100644 recipes/wvstreams/wvstreams_4.6.1.bb

diff --git a/recipes/wvstreams/wvstreams_4.6.1.bb b/recipes/wvstreams/wvstreams_4.6.1.bb
new file mode 100644
index 0000000..b11b500
--- /dev/null
+++ b/recipes/wvstreams/wvstreams_4.6.1.bb
@@ -0,0 +1,44 @@
+HOMEPAGE = "http://alumnit.ca/wiki/index.php?page=WvStreams"
+LICENSE = "LGPL"
+DESCRIPTION = "WvStreams is a network programming library in C++"
+DEPENDS = "zlib openssl (>= 0.9.8)"
+
+PR = "r1"
+
+SRC_URI = "http://wvstreams.googlecode.com/files/${PN}-${PV}.tar.gz \
+	file://0001-Fixed-missing-header-includes.patch \
+	"
+
+inherit autotools pkgconfig
+
+LDFLAGS_append = " -Wl,-rpath-link,${TOOLCHAIN_PATH}/${TARGET_SYS}/lib"
+
+# dbus detection currently broken in configure.ac; remember to add "dbus (>= 1.2.14)" to DEPENDS  when fixed
+EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-dbus"
+
+PACKAGES_prepend = "libuniconf libuniconf-dbg "
+PACKAGES_prepend = "uniconfd uniconfd-dbg "
+PACKAGES_prepend = "libwvstreams-base libwvstreams-base-dbg "
+PACKAGES_prepend = "libwvstreams-extras libwvstreams-extras-dbg "
+
+FILES_libuniconf     = "${libdir}/libuniconf.so.*"
+FILES_libuniconf-dbg = "${libdir}/.debug/libuniconf.so.*"
+
+FILES_uniconfd     = "${sbindir}/uniconfd ${sysconfdir}/uniconf.conf ${localstatedir}/uniconf"
+FILES_uniconfd-dbg = "${sbindir}/.debug/uniconfd"
+
+FILES_libwvstreams-base     = "${libdir}/libwvutils.so.*"
+FILES_libwvstreams-base-dbg = "${libdir}/.debug/libwvutils.so.*"
+
+FILES_libwvstreams-extras     = "${libdir}/libwvbase.so.* ${libdir}/libwvstreams.so.*"
+FILES_libwvstreams-extras-dbg = "${libdir}/.debug/libwvbase.so.* ${libdir}/.debug/libwvstreams.so.*"
+
+PARALLEL_MAKE = ""
+
+do_configure() {
+        autoreconf
+        oe_runconf
+}
+
+SRC_URI[md5sum] = "2760dac31a43d452a19a3147bfde571c"
+SRC_URI[sha256sum] = "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
-- 
1.7.1



