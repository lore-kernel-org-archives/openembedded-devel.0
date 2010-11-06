Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PEmUy-0000hV-T0
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:24:17 +0100
Received: by ewy2 with SMTP id 2so2181506ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 10:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=JVaV52rmwvnwDf9HxLQ7g8/yKJ6DlHx0Pb+gprPhjS4=;
	b=pftJTaL5Y66Dw/6gSlYdAk+imyHcwQZvjj9YJ84331dKFEHvGgMqe4T4caye5GomI6
	VZ56hFXW+lUemNuMv/yk9qfZIrGWSNUqjn8op6dOPIZxohQnamcL0SLVUmiGMr8Xd6L/
	KOPonvuCa7M/qP9U0p8zOeFBTn9MJp68XrDYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=cIPij4ftmYKKZuXtv8hoaVTcSUOimI0kcs93CPyIDc4ctiSAT/IQuXe0GD7zHkXwny
	lcnrRWKQn1ulMsEjm91o6vAhBbwPGy0uqVH57yDkiKbY0nToqVZmCEoBzyzP1MoFU56g
	nVck/uCYeuKKNT47So0sI12iaUp33Rp0fHw+4=
Received: by 10.14.45.76 with SMTP id o52mr1861194eeb.43.1289064201201;
	Sat, 06 Nov 2010 10:23:21 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id v51sm2318372eeh.10.2010.11.06.10.23.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 10:23:20 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 17:23:07 +0000
Message-Id: <1289064187-19968-1-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 07/11] zbar: Add support for Qt widgets and bump to 0.10
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
X-List-Received-Date: Sat, 06 Nov 2010 17:24:17 -0000

  * Added support for qt widgets (not only gtk ones)

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 recipes/zbar/zbar_0.10.bb |   31 +++++++++++++++++++++++++++++++
 1 files changed, 31 insertions(+), 0 deletions(-)
 create mode 100644 recipes/zbar/zbar_0.10.bb

diff --git a/recipes/zbar/zbar_0.10.bb b/recipes/zbar/zbar_0.10.bb
new file mode 100644
index 0000000..844764d
--- /dev/null
+++ b/recipes/zbar/zbar_0.10.bb
@@ -0,0 +1,31 @@
+DESCRIPTION = "2D barcode scanner toolkit."
+SECTION = "graphics"
+LICENSE = "GPL"
+DEPENDS = "intltool-native gtk+ qt4-x11-free libpng jpeg"
+PR = "r1"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/${PN}/${P}.tar.bz2"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = " --without-imagemagick --without-python"
+
+do_configure_append() {
+    # This one tries to autodetect MOC and fails, so we have to force it
+    sed -i "s#^MOC =.*#MOC = ${STAGING_BINDIR_NATIVE}/moc4#" Makefile
+}
+
+PACKAGES += "libzbar libzbargtk libzbarqt"
+
+FILES_${PN} = "${bindir}/zbar*"
+FILES_${PN}-doc = "${datadir}/doc ${datadir}/man "
+FILES_${PN}-dbg += " ${bindir}/.debug"
+FILES_libzbar = "${libdir}/libzbar.so.*"
+FILES_libzbar-dev = "${libdir}/libzbar.so ${libdir}/libzbar.*a ${includedir}/zbar* "
+FILES_libzbargtk = "${libdir}/libzbargtk.so.*"
+FILES_libzbargtk-dev = "${libdir}/libzbargtk.so ${libdir}/libzbargtk.*a"
+FILES_libzbarqt = "${libdir}/libzbarqt.so.*"
+FILES_libzbarqt-dev = "${libdir}/libzbarqt.so ${libdir}/libzbarqt.*a"
+
+SRC_URI[md5sum] = "0fd61eb590ac1bab62a77913c8b086a5"
+SRC_URI[sha256sum] = "234efb39dbbe5cef4189cc76f37afbe3cfcfb45ae52493bfe8e191318bdbadc6"
-- 
1.7.3.1



