Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LrYwG-0002pz-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 16:39:42 +0200
Received: by ewy20 with SMTP id 20so234240ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 07:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=qBJ4O53GipDEsqmJNxfVc9s/yBZC3Mq7rzAl8pQbRA4=;
	b=BnI3cDSmtawRlP0uM/ycgizkMMTNnzw/rDog+Qnyoij6U47qmfmWd86qo5be09fBj6
	e8u1TddfakefKiZzQJF7ElFl8u0UeEBQSGnkeC4F2hhY6Pxww3iA8y86EK0w/5mpMp7t
	XN/we1SA2QVwsOSlGnIQea55qdBhNFxxAI9mM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=D39G0DBmIwuE+ipZZ1/7QgGr7cg7QykxzXuWvE0F9GJWds3QznJvXEOZKAUQ+K2JmX
	h6qBDItKZA5yGjSWKUmIhUGDuCFFsY0CdK+2fq7HEIPomPSFSc6c4e4bhWbGK7SmXpn9
	IyOoBaROa7aySFo3NqR+xTj0ha0yBhOGj39rw=
Received: by 10.210.59.14 with SMTP id h14mr5160591eba.81.1239201394443;
	Wed, 08 Apr 2009 07:36:34 -0700 (PDT)
Received: from localhost.localdomain (213.219.146.119.adsl.dyn.edpnet.net
	[213.219.146.119])
	by mx.google.com with ESMTPS id 18sm7829907ewy.45.2009.04.08.07.36.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Apr 2009 07:36:33 -0700 (PDT)
From: Dirk 'Virk' Van Haerenborgh <vhdirk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2009 16:36:33 +0200
Message-Id: <1239201393-17243-1-git-send-email-vhdirk@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: vhdirk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] pcsc-lite: Update to version 1.5.2
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
X-List-Received-Date: Wed, 08 Apr 2009 14:39:42 -0000

No packaging changes.
---
 conf/checksums.ini                   |   11 +++++++----
 recipes/pcsc-lite/pcsc-lite_1.5.2.bb |   30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 recipes/pcsc-lite/pcsc-lite_1.5.2.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index d08d7bc..3389321 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -18294,6 +18294,10 @@ sha256=362e4b4473f2f7a3bfa28ea73e80ec00a2fe525a1aceb5f66e1c528a900bd735
 md5=b97d3a725ab93662adf09acfbc49efeb
 sha256=56fc9e6324539537324b071e5b51c3388df9bfa92fb7e210b989b463122fc333
 
+[https://alioth.debian.org/frs/download.php/2795/pcsc-lite-1.5.2.tar.bz2]
+md5=d7d466621bec39354351f09349f6374c
+sha256=a0c11b0b5cc46d4c4ec499b875cfdc4e766fdf12fe2f6ea635e1b11ab7b8821e
+
 [http://handhelds.org/~zecke/oe_packages/pdamaze_V1.0.0.tar.gz]
 md5=bf27dd51fe03c8b475080b74de043a13
 sha256=99d6bc6b360baabd6044e8883d467cc6ed7955f9ab66d8f87f61e3cc757fb97a
@@ -23462,14 +23466,13 @@ sha256=c762525fdbf5f5dd32c6c950f2a63d8c1b15ec3dc7afca5d2dc3dbd1b129a00d
 md5=66480128b9dabcced2e4c8db3e60fa50
 sha256=6c5bfb2edae5c289233b6cd65393bb7414a2d30ad4d1239c207a659a4232d91a
 
-[http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog_5.3.1.tar.gz]
-md5=ba97ddce396bfccd8d409bc3141d7ef4
-sha256=b7bf9feeedea26d7e06935369a1a556089426e94f9ead946018526c96cd9b12e
-
 [http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog-5.6.tar.gz]
 md5=6df285569dd1d85528b983c98c9b2b7c
 sha256=a2c7d6726e092315dbb047211b754528e4532521678a30e16f60a31bb86a7f74
 
+[http://www.ibiblio.org/pub/Linux/system/daemons/watchdog/watchdog_5.3.1.tar.gz]
+md5=ba97ddce396bfccd8d409bc3141d7ef4
+sha256=b7bf9feeedea26d7e06935369a1a556089426e94f9ead946018526c96cd9b12e
 
 [http://downloads.sourceforge.net/wbxmllib/wbxml2-0.9.0-src.tar.gz]
 md5=3f9b5bf104ec523b8eebe69f93919ded
diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
new file mode 100644
index 0000000..156e463
--- /dev/null
+++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
@@ -0,0 +1,30 @@
+DESCRIPTION = "PC/SC Lite smart card framework and applications"
+HOMEPAGE = "http://pcsclite.alioth.debian.org/"
+LICENSE = "BSD"
+
+DEPENDS = "hal"
+RDEPENDS_${PN} = "hal"
+
+SRC_URI = "http://alioth.debian.org/download.php/2479/pcsc-lite-${PV}.tar.bz2 \
+           file://pcscd.init "
+
+inherit autotools_stage update-rc.d
+
+INITSCRIPT_NAME = "pcscd"
+INITSCRIPT_PARAMS = "defaults"
+
+EXTRA_OECONF = " \
+	--enable-libhal \
+	--disable-libusb \
+	--enable-usbdropdir=${libdir}/pcsc/drivers \
+	"
+
+do_install() {
+	oe_runmake DESTDIR="${D}" install
+	install -d "${D}/etc/init.d"
+	install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/init.d/pcscd"
+}
+
+PACKAGES =+ "libpcsclite"
+
+FILES_libpcsclite = "${libdir}/libpcsclite.so.*"
-- 
1.6.0.4



