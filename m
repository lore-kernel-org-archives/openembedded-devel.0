Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Noor_Ahsan@mentor.com>) id 1OtFRU-0005SC-QY
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 09:51:59 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1OtFQo-0003nS-RN from Noor_Ahsan@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 00:50:59 -0700
Received: from localhost.localdomain ([137.202.156.152]) by
	eu2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 8 Sep 2010 09:50:57 +0200
From: Noor Ahsan <noor_ahsan@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Sep 2010 13:49:07 +0600
Message-Id: <1283932147-28718-1-git-send-email-noor_ahsan@mentor.com>
X-Mailer: git-send-email 1.6.3.3
X-OriginalArrivalTime: 08 Sep 2010 07:50:57.0428 (UTC)
	FILETIME=[9270D540:01CB4F2A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Noor_Ahsan@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] fribidi: Extended recipe to build native package, add BBCLASSEXTEND
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
X-List-Received-Date: Wed, 08 Sep 2010 07:51:59 -0000

* Add BBCLASSEXTEND = "native" to fribidi recipe
* Bump PR to "r1"
* Remove libfribidi-native_0.10.4.bb

Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
---
 recipes/libfribidi/fribidi_0.19.2.bb           |    2 +
 recipes/libfribidi/libfribidi-native_0.10.4.bb |   32 ------------------------
 2 files changed, 2 insertions(+), 32 deletions(-)

diff --git a/recipes/libfribidi/fribidi_0.19.2.bb b/recipes/libfribidi/fribidi_0.19.2.bb
index 76323c2..3f12af8 100644
--- a/recipes/libfribidi/fribidi_0.19.2.bb
+++ b/recipes/libfribidi/fribidi_0.19.2.bb
@@ -1,6 +1,7 @@
 DESCRIPTION = "Fribidi library for bidirectional text"
 SECTION = "libs"
 PRIORITY = "optional"
+PR = "r1"
 
 PROVIDES = "libfribidi"
 
@@ -16,3 +17,4 @@ SRC_URI = "http://fribidi.org/download/fribidi-${PV}.tar.gz"
 
 SRC_URI[md5sum] = "626db17d2d99b43615ad9d12500f568a"
 SRC_URI[sha256sum] = "49cf91586e48b52fe25872ff66c1da0dff0daac2593f9f300e2af12f44f64177"
+BBCLASSEXTEND = "native"
diff --git a/recipes/libfribidi/libfribidi-native_0.10.4.bb b/recipes/libfribidi/libfribidi-native_0.10.4.bb
deleted file mode 100644
index 4e1ae87..0000000
--- a/recipes/libfribidi/libfribidi-native_0.10.4.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-DESCRIPTION = "Fribidi library for bidirectional text"
-SECTION = "libs"
-PRIORITY = "optional"
-
-inherit autotools pkgconfig native
-
-PR = "r0"
-
-S = "${WORKDIR}/fribidi-${PV}"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/fribidi/fribidi-${PV}.tar.bz2 \
-           file://libtool-update.patch"
-
-#PACKAGES += " ${PN}-bin"
-FILES_${PN} = "${libdir}/lib*.so.*"
-#FILES_${PN}-bin = "${libdir}/uu*"
-
-do_configure_prepend () {
-# this version of libtool is old - we have to nobble this file to get it to litoolize
-	rm ltconfig
-	rm aclocal.m4
-	rm acinclude.m4
-}
-
-do_stage () {
-	oe_libinstall -a -so -C .libs libfribidi ${STAGING_LIBDIR}
-	autotools_stage_includes
-}
-
-
-SRC_URI[md5sum] = "0f6e7ecca08e6e108dc06337f5b5cabf"
-SRC_URI[sha256sum] = "f3ecdb9d108bd61ec9394df75f5fd68ba886a8da0863ba6258338893aec6c04f"
-- 
1.6.3.3



