Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S2TE5-0003xn-GO
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 21:00:45 +0100
Received: by daln34 with SMTP id n34so5706287dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Feb 2012 11:52:17 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.208.196 as permitted sender) client-ip=10.68.208.196; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.208.196 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.208.196])
	by 10.68.208.196 with SMTP id mg4mr58903201pbc.108.1330458737231
	(num_hops = 1); Tue, 28 Feb 2012 11:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2S6/MYF/wje2d1wLZeag0c7WStAdALE1BkdIpU+RcBU=;
	b=BKt1hGhruX3jRF5/a9pox0fN0D/PTz39nDGdyAnlHYmVGVIFkEni9Mv5qTXuCGp6Y8
	lqiY6HVLKxx5letOjOYed/lu4+BcxCqNuMx++Iw7dcLL0EpDQJikaY5hP+jnDUpUTO8f
	0Z1tcWmDgGduxCd2oKxPL3rO51qGzqxeISa6Y=
Received: by 10.68.208.196 with SMTP id mg4mr49723469pbc.108.1330458736942;
	Tue, 28 Feb 2012 11:52:16 -0800 (PST)
Received: from leto.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id f3sm16442979pbr.61.2012.02.28.11.52.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Feb 2012 11:52:15 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 28 Feb 2012 11:52:06 -0800
Message-Id: <1330458726-7562-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9
Subject: [meta-opie][PATCH] meta-opie: Fix quoting errors found by latest bitbake
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
X-List-Received-Date: Tue, 28 Feb 2012 20:00:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../opie-irdaapplet/opie-irdaapplet_git.bb         |    2 +-
 recipes-opie/opie-reader/uqtreader_1.2.5.bb        |    2 +-
 recipes-opie/opie-reader/uqtreader_git.bb          |    2 +-
 recipes-qtopia/qpegps/qpegps.inc                   |    2 +-
 recipes-qtopia/scummvm/scummvm_1.1.1.bb            |    2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb b/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb
index 7af53fb..dffc2b9 100644
--- a/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb
+++ b/recipes-opie/opie-irdaapplet/opie-irdaapplet_git.bb
@@ -1,7 +1,7 @@
 require ${PN}.inc
 
 PV = "${OPIE_GIT_PV}"
-PR = r3
+PR = "r3"
 
 SRC_URI = "${OPIE_GIT};protocol=git;subpath=core/applets/irdaapplet \
            ${OPIE_GIT};protocol=git;subpath=pics \
diff --git a/recipes-opie/opie-reader/uqtreader_1.2.5.bb b/recipes-opie/opie-reader/uqtreader_1.2.5.bb
index ec70e15..73dfae4 100644
--- a/recipes-opie/opie-reader/uqtreader_1.2.5.bb
+++ b/recipes-opie/opie-reader/uqtreader_1.2.5.bb
@@ -66,7 +66,7 @@ FILES_${PN}-codeclib = "${libdir}/libreader_codec.so.*"
 FILES_${PN}-codec-aportis = "${libdir}/uqtreader/codecs/libAportis.so"
 FILES_${PN}-codec-arrierego = "${libdir}/uqtreader/codecs/libArriereGo.so"
 FILES_${PN}-codec-chm = "${libdir}/uqtreader/codecs/libCHM.so"
-DEBIAN_NOAUTONAME_${PN}-codec-plucker = 1
+DEBIAN_NOAUTONAME_${PN}-codec-plucker = "1"
 FILES_${PN}-codec-plucker = "${libdir}/uqtreader/codecs/libPlucker.so ${libdir}/lib*plucker*.so.* ${libdir}/uqtreader/support/libpluckerdecompress.so"
 FILES_${PN}-codec-reb = "${libdir}/uqtreader/codecs/libReb.so"
 FILES_${PN}-codec-weasel = "${libdir}/uqtreader/codecs/libWeasel.so"
diff --git a/recipes-opie/opie-reader/uqtreader_git.bb b/recipes-opie/opie-reader/uqtreader_git.bb
index ad6c223..019d8c0 100644
--- a/recipes-opie/opie-reader/uqtreader_git.bb
+++ b/recipes-opie/opie-reader/uqtreader_git.bb
@@ -62,7 +62,7 @@ FILES_${PN}-codeclib = "${libdir}/libreader_codec.so.*"
 FILES_${PN}-codec-aportis = "${libdir}/uqtreader/codecs/libAportis.so"
 FILES_${PN}-codec-arrierego = "${libdir}/uqtreader/codecs/libArriereGo.so"
 FILES_${PN}-codec-chm = "${libdir}/uqtreader/codecs/libCHM.so"
-DEBIAN_NOAUTONAME_${PN}-codec-plucker = 1
+DEBIAN_NOAUTONAME_${PN}-codec-plucker = "1"
 FILES_${PN}-codec-plucker = "${libdir}/uqtreader/codecs/libPlucker.so ${libdir}/lib*plucker*.so.* ${libdir}/uqtreader/support/libpluckerdecompress.so"
 FILES_${PN}-codec-reb = "${libdir}/uqtreader/codecs/libReb.so"
 FILES_${PN}-codec-weasel = "${libdir}/uqtreader/codecs/libWeasel.so"
diff --git a/recipes-qtopia/qpegps/qpegps.inc b/recipes-qtopia/qpegps/qpegps.inc
index 8292915..6dd0767 100644
--- a/recipes-qtopia/qpegps/qpegps.inc
+++ b/recipes-qtopia/qpegps/qpegps.inc
@@ -18,7 +18,7 @@ inherit palmtop
 QMAKE_PROFILES = "qpegps.pro"
 EXTRA_QMAKEVARS_POST = "LIBS=-lqpe LIBS+=-lgps"
 OE_QMAKE_CFLAGS += " -DQWS "
-OE_QMAKE_LIBS_QT = ${QT_LIBRARY}
+OE_QMAKE_LIBS_QT = "${QT_LIBRARY}"
 
 do_install() {
         install -d ${D}${palmtopdir}/bin \
diff --git a/recipes-qtopia/scummvm/scummvm_1.1.1.bb b/recipes-qtopia/scummvm/scummvm_1.1.1.bb
index 90fc136..fba22d5 100644
--- a/recipes-qtopia/scummvm/scummvm_1.1.1.bb
+++ b/recipes-qtopia/scummvm/scummvm_1.1.1.bb
@@ -15,7 +15,7 @@ SRC_URI_OVERRIDES_PACKAGE_ARCH = "1"
 
 # Make this a plugin enabled build. Bigger binary, less memory usage. Makes more games run on lower end platforms.
 # These plugins are not normal Linux shared libs so will fall foul of the sanity checker.
-INSANE_SKIP_${PN} = True
+INSANE_SKIP_${PN} = "1"
 EXTRA_OECONF += " --enable-plugins --default-dynamic "
 
 # Workaround, because some env variables aren't recognised correctly
-- 
1.7.9



