Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vhdirk@gmail.com>) id 1LraRp-0001Yh-67
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Apr 2009 18:16:43 +0200
Received: by ewy20 with SMTP id 20so294957ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Apr 2009 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=aTTZ/SL5fmG8Sk4XASHDkEtd2hI3W/GB8uxjLLrd0gs=;
	b=e+5kxdjkeod23MgBCcHjQleEyondL3hzRh4aZum4FhYzORgsDgBKcrZrUFjTy5QyYc
	LiGxPQRdnUtoXj1A5i8w0rYrntlR+alenzxyRN3kNhQu9OSg6gH9KaZmDK1NEga6Dz6e
	qhQMFNk6N2wQHIEXFKtprnVDxTP2ODiuffGWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=pRhS94NpHJH+Yk7AmQMWMB7juxW9nUTkGY4eZJAgFtoNO4N9hj4QQaSBisgdM9qn7q
	BeLUV5rB+104139ErPUDiXjSuOE6uXiqzqaPkBs8NOYSSph/9DM6gvI1OC5Nqao0LSh6
	Z8XN34V+rLcJoNJLgBd0qfaqRBwsS3p+Phhac=
Received: by 10.210.43.10 with SMTP id q10mr1297948ebq.70.1239207195764;
	Wed, 08 Apr 2009 09:13:15 -0700 (PDT)
Received: from localhost.localdomain (213.219.146.119.adsl.dyn.edpnet.net
	[213.219.146.119])
	by mx.google.com with ESMTPS id 12sm7898683ewy.7.2009.04.08.09.13.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 08 Apr 2009 09:13:15 -0700 (PDT)
From: Dirk 'Virk' Van Haerenborgh <vhdirk@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Apr 2009 18:13:14 +0200
Message-Id: <1239207194-12212-1-git-send-email-vhdirk@gmail.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 209.85.219.172
X-SA-Exim-Mail-From: vhdirk@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,RDNS_NONE,SPF_PASS
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] ccid: Update to version 1.3.10
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
X-List-Received-Date: Wed, 08 Apr 2009 16:16:46 -0000

---
 conf/checksums.ini          |    4 ++++
 recipes/ccid/ccid_1.3.10.bb |   21 +++++++++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ccid/ccid_1.3.10.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 2e8e264..08f9892 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3326,6 +3326,10 @@ sha256=015c4237a532b873990aeeecdf351138ce5a811d062d6db73c611a4985de5435
 md5=b8c51a2e3cccb381428426c0fc543244
 sha256=f1e44d628cc4cbac192bf33f492ad8d1e1988cae576924128df36f3638e9a485
 
+[http://alioth.debian.org/download.php/2924/ccid-1.3.10.tar.bz2]
+md5=92220d7b7b0aae7bc141b09ba529458c
+sha256=54610f1a6cd65e8d2b5cb9f7917e509ebcdf130a565e71e06ad4e65ed0dad5ec
+
 [http://alioth.debian.org/download.php/2482/ccid-1.3.8.tar.bz2]
 md5=ebb5fc927d73cd63737a9114481e8957
 sha256=8cb892ef36321069eff7826aa732f1481715fe54bf96346fae1d25565b44c536
diff --git a/recipes/ccid/ccid_1.3.10.bb b/recipes/ccid/ccid_1.3.10.bb
new file mode 100644
index 0000000..37f74eb
--- /dev/null
+++ b/recipes/ccid/ccid_1.3.10.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Generic USB CCID smart card reader driver"
+HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
+LICENSE = "GPL"
+PR = "r0"
+
+DEPENDS = "libusb pcsc-lite"
+RDEPENDS = "pcsc-lite"
+
+SRC_URI = "http://alioth.debian.org/download.php/2924/ccid-${PV}.tar.bz2"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-udev"
+
+do_install_append () {
+	install -d "${D}/etc/udev/rules.d"
+	install -m 644 "${S}/src/pcscd_ccid.rules" "${D}/etc/udev/rules.d/85-pcscd_ccid.rules"
+}
+
+FILES_${PN} += "${libdir}/pcsc/"
+FILES_${PN}-dbg += "${libdir}/pcsc/drivers/*/*/*/.debug"
-- 
1.6.0.4



