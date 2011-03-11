Received: from 6.27.mail-out.ovh.net ([46.105.50.195] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyAuw-0001Su-KT
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 23:34:42 +0100
Received: (qmail 16866 invoked by uid 503); 11 Mar 2011 23:26:32 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 11 Mar 2011 23:26:26 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Mar 2011 00:32:56 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Mar 2011 00:32:55 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Mar 2011 23:34:22 +0100
Message-Id: <1299882862-4839-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-Ovh-Tracer-Id: 11751861754385313097
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] libpcre: add latest 8.10 version
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
X-List-Received-Date: Fri, 11 Mar 2011 22:34:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/libpcre/libpcre-native_8.10.bb |   19 +++++++++++
 recipes/libpcre/libpcre_8.10.bb        |   52 ++++++++++++++++++++++++++++++++
 2 files changed, 71 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libpcre/libpcre-native_8.10.bb
 create mode 100644 recipes/libpcre/libpcre_8.10.bb

diff --git a/recipes/libpcre/libpcre-native_8.10.bb b/recipes/libpcre/libpcre-native_8.10.bb
new file mode 100644
index 0000000..9e5c62b
--- /dev/null
+++ b/recipes/libpcre/libpcre-native_8.10.bb
@@ -0,0 +1,19 @@
+SECTION = "unknown"
+require libpcre_${PV}.bb
+inherit native
+FILESDIR = "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/libpcre-${PV}"
+
+# NOTE: multiple providers are available (libpcre, libpcre-native);
+# NOTE: consider defining PREFERRED_PROVIDER_pcre
+PROVIDES = ""
+
+do_compile () {
+	# The generation of dftables can lead to timestamp problems with ccache
+	# because the generated config.h seems newer.  It is sufficient to ensure that the
+	# attempt to build dftables inside make will actually work (foo_FOR_BUILD is
+	# only used for this).
+	oe_runmake CC_FOR_BUILD="${BUILD_CC}" CFLAGS_FOR_BUILD="-DLINK_SIZE=2 -I${S}/include" LINK_FOR_BUILD="${BUILD_CC}"
+}
+
+SRC_URI[md5sum] = "780867a700e9d4e4b9cb47aa5453e4b2"
+SRC_URI[sha256sum] = "7ac4e016f6bad8c7d990e6de9bce58c04ff5dd8838be0c5ada0afad1d6a07480"
diff --git a/recipes/libpcre/libpcre_8.10.bb b/recipes/libpcre/libpcre_8.10.bb
new file mode 100644
index 0000000..92a9d32
--- /dev/null
+++ b/recipes/libpcre/libpcre_8.10.bb
@@ -0,0 +1,52 @@
+DESCRIPTION = "Perl-compatible regular expression library. PCRE has its own native \
+API, but a set of 'wrapper' functions that are based on the POSIX API \
+are also supplied in the library libpcreposix. Note that this just \
+provides a POSIX calling interface to PCRE; the regular expressions \
+themselves still follow Perl syntax and semantics. The header file for \
+the POSIX-style functions is called pcreposix.h."
+SECTION = "devel"
+PR = "r0"
+LICENSE = "BSD"
+SRC_URI = "${SOURCEFORGE_MIRROR}/pcre/pcre-${PV}.tar.bz2 \
+           file://pcre-cross.patch"
+S = "${WORKDIR}/pcre-${PV}"
+
+PROVIDES = "pcre"
+
+inherit autotools binconfig
+
+PARALLEL_MAKE = ""
+
+CFLAGS_append = " -D_REENTRANT"
+CXXFLAGS_powerpc += "-lstdc++"
+EXTRA_OECONF = " --with-link-size=2 --enable-newline-is-lf --with-match-limit=10000000 --enable-rebuild-chartables --enable-utf8"
+
+do_compile () {
+	# stop libtool from trying to link with host libraries - fix from #33
+	# this resolve build problem on amd64 - #1015
+	if [ -e ${S}/${TARGET_SYS}-libtool ] ; then
+		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool
+	else
+		ln -sf ${S}/libtool ${S}/${TARGET_SYS}-libtool
+		sed -i 's:-L\$:-L${STAGING_LIBDIR} -L\$:' ${S}/${TARGET_SYS}-libtool	
+	fi
+
+	# The generation of dftables can lead to timestamp problems with ccache
+	# because the generated config.h seems newer.  It is sufficient to ensure that the
+	# attempt to build dftables inside make will actually work (foo_FOR_BUILD is
+	# only used for this).
+	oe_runmake CC_FOR_BUILD="${BUILD_CC}" CFLAGS_FOR_BUILD="-DLINK_SIZE=2 -I${S}/include" LINK_FOR_BUILD="${BUILD_CC} -L${S}/lib"
+}
+
+do_install_append () {
+    install -d ${STAGING_BINDIR}
+    install -m 0755 ${D}${bindir}/pcre-config ${STAGING_BINDIR}/
+}
+
+FILES_${PN} = "${libdir}/lib*${SOLIBS}"
+FILES_${PN}-dev += "${bindir}/*"
+
+LEAD_SONAME = "libpcre.so.*"
+
+SRC_URI[md5sum] = "780867a700e9d4e4b9cb47aa5453e4b2"
+SRC_URI[sha256sum] = "7ac4e016f6bad8c7d990e6de9bce58c04ff5dd8838be0c5ada0afad1d6a07480"
-- 
1.7.0.4



