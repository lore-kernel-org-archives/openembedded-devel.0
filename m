Received: from 3.27.mail-out.ovh.net ([46.105.56.209] helo=27.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PyqVZ-0008Ug-A6
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 19:59:17 +0100
Received: (qmail 17752 invoked by uid 503); 13 Mar 2011 19:51:10 -0000
Received: from b9.ovh.net (HELO mail625.ha.ovh.net) (213.186.33.59)
	by 27.mail-out.ovh.net with SMTP; 13 Mar 2011 19:51:04 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Mar 2011 20:57:30 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Mar 2011 20:57:28 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Mar 2011 19:58:57 +0100
Message-Id: <1300042739-17381-7-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1300042739-17381-1-git-send-email-eric@eukrea.com>
References: <1300042739-17381-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1411878483834809679
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 7/9] libc-client: remove 2007b
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
X-List-Received-Date: Sun, 13 Mar 2011 18:59:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/libc-client/libc-client_2007b.bb |   30 ------------------------------
 1 files changed, 0 insertions(+), 30 deletions(-)
 delete mode 100644 recipes/libc-client/libc-client_2007b.bb

diff --git a/recipes/libc-client/libc-client_2007b.bb b/recipes/libc-client/libc-client_2007b.bb
deleted file mode 100644
index dbcda08..0000000
--- a/recipes/libc-client/libc-client_2007b.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "UW c-client library for mail protocols"
-SECTION = "devel"
-PRIORITY = "optional"
-LICENSE = "University of Washingtons Free-Fork License"
-DEPENDS = "libpam openssl libpam"
-
-SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.Z \
-	   file://quote_cctype.patch"
-
-S = "${WORKDIR}/imap-${PV}"
-
-EXTRA_OEMAKE = "CC='${CC}'"
-
-HEADERS = "src/c-client/*.h src/osdep/unix/*.h c-client/auths.c c-client/linkage.c c-client/linkage.h c-client/osdep.h"
-
-do_compile() {
-	echo "SSLINCLUDE=${STAGING_INCDIR} SSLLIB=${STAGING_LIBDIR}" > ${S}/SPECIALS
-	oe_runmake lnp
-}
-
-do_install() {
-        install -d ${D}${includedir}/c-client
-        install ${HEADERS} ${D}${includedir}/c-client
-	install -d ${D}${libdir}
-        install c-client/c-client.a ${D}${libdir}/libc-client.a
-}
-
-
-SRC_URI[md5sum] = "4d59ce6303cf8ef93ff51341b1ce2df7"
-SRC_URI[sha256sum] = "b3170bef59f416be1f710be58333f9b0c2c8b0fe137062accd4f5f13a3785cd0"
-- 
1.7.0.4



