Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PceGQ-0006MW-ML
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 14:27:54 +0100
X-Envelope-From: sledz@dresearch.de
Received: from mobil-400-586.intern.dresearch.de
	(p57A2231F.dip0.t-ipconnect.de [87.162.35.31]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p0BDRP1W022224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Tue, 11 Jan 2011 14:27:25 +0100
Received: by mobil-400-586.intern.dresearch.de (Postfix, from userid 1000)
	id DFB992E973; Tue, 11 Jan 2011 14:27:24 -0500 (EST)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 11 Jan 2011 14:26:41 -0500
Message-Id: <1294774001-29322-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <ighiieMAN_POSIXLY_CORRECT=1@dough.gmane.org>
References: <ighiieMAN_POSIXLY_CORRECT=1@dough.gmane.org>
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH v2] alsa-lib: fix packaging error
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
X-List-Received-Date: Tue, 11 Jan 2011 13:27:54 -0000

* symlink libasound.so -> libasound.so.2.0.0 in /usr/lib was missing in
  dev package

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 recipes/alsa/alsa-lib_1.0.20.bb |    2 +-
 recipes/alsa/alsa-lib_1.0.23.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/alsa/alsa-lib_1.0.20.bb b/recipes/alsa/alsa-lib_1.0.20.bb
index de522c7..fc508ec 100644
--- a/recipes/alsa/alsa-lib_1.0.20.bb
+++ b/recipes/alsa/alsa-lib_1.0.20.bb
@@ -34,7 +34,7 @@ FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
+FILES_alsa-dev += "${libdir}/libasound.so ${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
 FILES_alsa-conf-base = "\
 ${datadir}/alsa/alsa.conf \
 ${datadir}/alsa/cards/aliases.conf \
diff --git a/recipes/alsa/alsa-lib_1.0.23.bb b/recipes/alsa/alsa-lib_1.0.23.bb
index 0f9b14c..0085047 100644
--- a/recipes/alsa/alsa-lib_1.0.23.bb
+++ b/recipes/alsa/alsa-lib_1.0.23.bb
@@ -36,7 +36,7 @@ FILES_${PN}-dbg += "${libdir}/alsa-lib/*/.debu*"
 FILES_libasound = "${libdir}/libasound.so.*"
 FILES_alsa-server = "${bindir}/*"
 FILES_alsa-conf = "${datadir}/alsa/"
-FILES_alsa-dev += "${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
+FILES_alsa-dev += "${libdir}/libasound.so ${libdir}/pkgconfig/ /usr/include/ ${datadir}/aclocal/*"
 FILES_alsa-conf-base = "\
 ${datadir}/alsa/alsa.conf \
 ${datadir}/alsa/cards/aliases.conf \
-- 
1.7.1



