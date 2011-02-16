Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ppeia-0000xC-JS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 11:34:44 +0100
Received: (qmail 19753 invoked by uid 503); 16 Feb 2011 11:16:16 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 16 Feb 2011 11:16:16 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 16 Feb 2011 12:33:35 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 16 Feb 2011 12:33:34 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Feb 2011 11:33:47 +0100
Message-Id: <1297852433-31160-3-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1297852433-31160-1-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 12105112849527516491
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH 03/10] gnokii: add latest version
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
X-List-Received-Date: Wed, 16 Feb 2011 10:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- build tested for armv5 with PARALLEL_MAKE="-j8" so I removed
PARALLEL_MAKE = "" which was set in previous recipes.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/gnokii/gnokii_0.6.30.bb |   28 ++++++++++++++++++++++++++++
 1 files changed, 28 insertions(+), 0 deletions(-)
 create mode 100644 recipes/gnokii/gnokii_0.6.30.bb

diff --git a/recipes/gnokii/gnokii_0.6.30.bb b/recipes/gnokii/gnokii_0.6.30.bb
new file mode 100644
index 0000000..0f82c5d
--- /dev/null
+++ b/recipes/gnokii/gnokii_0.6.30.bb
@@ -0,0 +1,28 @@
+LICENSE = "GPL"
+DESCRIPTION = "Cellphone tools and driver software"
+SRC_URI = "http://www.gnokii.org/download/gnokii/gnokii-${PV}.tar.bz2 \
+	"
+
+DEPENDS = "libxpm gtk+"
+
+inherit autotools pkgconfig
+
+PACKAGES += "libgnokii libgnokii-dev"
+
+FILES_${PN} = "${bindir} ${sbindir}"
+FILES_libgnokii-dev = "${includedir} ${libdir}/lib*.so ${libdir}/*.la \
+                ${libdir}/*.a ${libdir}/*.o ${libdir}/pkgconfig \
+	        /lib/*.a /lib/*.o ${datadir}/aclocal"
+FILES_${PN}-dev = ""
+FILES_libgnokii = "${libdir}/libgnokii.so.*"
+
+do_stage() {
+	autotools_stage_includes
+
+	oe_libinstall -C common -so libgnokii ${STAGING_LIBDIR}
+}
+
+
+SRC_URI[md5sum] = "c90137d403febbc16712d64f0eb196de"
+SRC_URI[sha256sum] = "337c75369901cc6665219e3b92e29949fc83823e8d63608979230d72fe2e1dd4"
+
-- 
1.7.0.4



