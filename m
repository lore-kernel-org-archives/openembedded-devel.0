Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PEmew-0001M6-Qd
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:34:36 +0100
Received: by ewy2 with SMTP id 2so2183249ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=8svOKkkD7+0vngByba1CDYb3/OzfUiusbm6kesHl7gk=;
	b=GXffHYZo5SzuKlHSYxU+CRi6ALLSSm/2ji2Lbs93YFg+kZLyjRlkldbSlW9RtkDqlT
	5I+99vu11DNBwfQdTSFR5IhIxMzIWkdLKdnXuUpshb4Nm3eYvsbAYaFw8dk6UcWOGkQI
	tQVDFOIg4NgYsNTSTUYa/xhHea+0N+Bk+fN2w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=v+T7Z7f5gv25ngiWcTN4OqaE0lDRAD0eGmzfGJjaN18c6Cg/KaUKANXPSVA0L1OUeH
	o1eSFZtHOuitvjqB403JknKBm5CKkkCa3LHJtOMOHT8E/SFeFfX6DoQUsDCiZSkVVsol
	jbqAJqNC82xFZyF7VvVjNtRzy73RxO82eQCNY=
Received: by 10.14.48.74 with SMTP id u50mr1939425eeb.49.1289064821388;
	Sat, 06 Nov 2010 10:33:41 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id w20sm2321722eeh.12.2010.11.06.10.33.40
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 10:33:40 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 17:33:32 +0000
Message-Id: <1289064813-20133-1-git-send-email-moncelier@devlife.org>
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
Subject: [PATCH 10/11] pcsc-lite: Add support for ccid 1.4.0
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
X-List-Received-Date: Sat, 06 Nov 2010 17:34:38 -0000

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 recipes/pcsc-lite/pcsc-lite_1.6.4.bb |   35 ++++++++++++++++++++++++++++++++++
 1 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 recipes/pcsc-lite/pcsc-lite_1.6.4.bb

diff --git a/recipes/pcsc-lite/pcsc-lite_1.6.4.bb b/recipes/pcsc-lite/pcsc-lite_1.6.4.bb
new file mode 100644
index 0000000..4c74573
--- /dev/null
+++ b/recipes/pcsc-lite/pcsc-lite_1.6.4.bb
@@ -0,0 +1,35 @@
+DESCRIPTION = "PC/SC Lite smart card framework and applications"
+HOMEPAGE = "http://pcsclite.alioth.debian.org/"
+LICENSE = "BSD"
+
+DEPENDS = "hal"
+RDEPENDS_${PN} = "hal"
+
+SRC_URI = "https://alioth.debian.org/frs/download.php/2795/pcsc-lite-${PV}.tar.bz2 \
+           file://pcscd.init "
+
+inherit autotools update-rc.d
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
+FILES_libpcsclite = "${libdir}/libpcsclite.so.* ${libdir}/libpcsclite.so"
+
+SRC_URI[md5sum] = "d2106e881803784fe2f27922d2d73bc0"
+SRC_URI[sha256sum] = "f5011a7167ad00e312958eace65f14e4cfd20655b02e80f7de1438828c7f730a"
+
+DEFAULT_PREFERENCE = "-1"
-- 
1.7.3.1



