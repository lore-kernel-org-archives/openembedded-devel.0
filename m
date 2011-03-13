Received: from 2.27.mail-out.ovh.net ([46.105.37.238] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyqVY-0008Uc-6H
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 19:59:17 +0100
Received: (qmail 17747 invoked by uid 503); 13 Mar 2011 19:51:09 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:28 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:56 +0100
Message-Id: <1300042739-17381-6-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1411878483834809678
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 6/9] libc-client: add 2007e
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
X-List-Received-Date: Sun, 13 Mar 2011 18:59:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/libc-client/libc-client_2007e.bb |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes/libc-client/libc-client_2007e.bb

diff --git a/recipes/libc-client/libc-client_2007e.bb b/recipes/libc-client/libc-client_2007e.bb
new file mode 100644
index 0000000..743910c
--- /dev/null
+++ b/recipes/libc-client/libc-client_2007e.bb
@@ -0,0 +1,29 @@
+DESCRIPTION = "UW c-client library for mail protocols"
+SECTION = "devel"
+PRIORITY = "optional"
+LICENSE = "University of Washingtons Free-Fork License"
+DEPENDS = "libpam openssl libpam"
+
+SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
+	   file://quote_cctype.patch"
+
+S = "${WORKDIR}/imap-${PV}"
+
+EXTRA_OEMAKE = "CC='${CC}'"
+
+HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
+
+do_compile() {
+	echo "SSLINCLUDE=${STAGING_INCDIR} SSLLIB=${STAGING_LIBDIR}" > ${S}/SPECIALS
+	oe_runmake lnp
+}
+
+do_install() {
+        install -d ${D}${includedir}/c-client
+        install ${HEADERS} ${D}${includedir}/c-client
+	install -d ${D}${libdir}
+        install c-client/c-client.a ${D}${libdir}/libc-client.a
+}
+
+SRC_URI[md5sum] = "7903800dc2604000016de070e0c55840"
+SRC_URI[sha256sum] = "4b1137b87249782496ec3eeacaf83bbf09312a7d2ae3aead262179041b55565f"
-- 
1.7.0.4



