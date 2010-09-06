Received: from out1.smtp.messagingengine.com ([66.111.4.25])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OslVf-0000OF-04
	for Openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 01:54:00 +0200
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 09AF231E;
	Mon,  6 Sep 2010 19:53:21 -0400 (EDT)
Received: from frontend2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Mon, 06 Sep 2010 19:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	s=smtpout; bh=8SYDrB38/INo9ULVRmcDcWeaytI=;
	b=jvKssGV0ycDKRlruTe6Nxz3WxoT5HKoaViBpeaYhL/OTuZmF2ugSefZOxhcRnUKPVUi+vTwqMP0GkbZG+QIl7yGfzgtTWbWWOXFD+BlicaWnkbL6jcKRxmk1EKNqbeVZZFrXzBvHgrEMawb7nH7xP2y/mHdRRmUgokuAOlJDrc4=
X-Sasl-enc: yAlY0FEGtq+qV9pQy0RB2vdrZMQybW9R43UQD+45xpND 1283817184
Received: from asterix.crazy-teaparty.dyndns.org
	(hnvr-4d07a3d2.pool.mediaWays.net [77.7.163.210])
	by mail.messagingengine.com (Postfix) with ESMTPA id E732D5E7362;
	Mon,  6 Sep 2010 19:52:56 -0400 (EDT)
From: Vitus Jensen <vjensen@gmx.de>
To: Openembedded-devel@lists.openembedded.org
Date: Tue,  7 Sep 2010 01:54:01 +0200
Message-Id: <1283817243-7436-2-git-send-email-vjensen@gmx.de>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
References: <1283817243-7436-1-git-send-email-vjensen@gmx.de>
X-SA-Exim-Connect-IP: 66.111.4.25
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Vitus Jensen <vjensen@gmx.de>
Subject: [PATCH 1/3] htmldoc-gui_1.9.x: remove, there is no GUI code in developer snapshots
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
X-List-Received-Date: Mon, 06 Sep 2010 23:54:00 -0000


Signed-off-by: Vitus Jensen <vjensen@gmx.de>
---
 recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb |   27 ---------------------------
 1 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb

diff --git a/recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb b/recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb
deleted file mode 100644
index 098bf63..0000000
--- a/recipes/htmldoc/htmldoc-gui_1.9.x-r1571.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-require htmldoc.inc
-DEPENDS += "htmldoc-native fltk"
-PR = "r2"
-
-
-SRC_URI = "http://ftp.rz.tu-bs.de/pub/mirror/ftp.easysw.com/ftp/pub/htmldoc/snapshots/htmldoc-${PV}.tar.bz2 \
-file://paths_1.9.x.patch"
-
-
-S = "${WORKDIR}/htmldoc-${PV}"
-
-inherit autotools pkgconfig
-
-EXTRA_AUTORECONF += "--exclude=autoheader"
-EXTRA_OECONF += "--disable-localpng --disable-localjpeg --disable-localzlib \
-		--with-gui=yes"
-
-FILES_${PN} += "${datadir}/htmldoc/fonts"
-FILES_${PN} += "${datadir}/htmldoc/data"
-
-
-do_install() {
-	oe_runmake 'DESTDIR=${D}' install
-}
-
-SRC_URI[md5sum] = "eda75ba1abe14ed8e71c6f40438def85"
-SRC_URI[sha256sum] = "b4c78ff6b47521e980533e52cbe46fe86874c75b3d6bc18bcc2500a2ba854c3e"
-- 
1.7.1



