Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pixdamix@gmail.com>) id 1PEmf0-0001MA-Eq
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Nov 2010 18:34:42 +0100
Received: by eya28 with SMTP id 28so2293322eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Nov 2010 10:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer:in-reply-to:references;
	bh=Z74RCPoqB1u9HMFqsDJtZKbgRxR1r/4FtAxOLeWlDYc=;
	b=kKECH0dDWAku/lXB1ao8CfUX1vCZovd2QHm2R2k8gsUdbiNDEf+V1cRKUlThM/Jv6L
	XZNjKR0RI42Zr+/GnIF1cu1J9xGT3iKPMi2ZsooeA8Tl7RDJxy9XOXfrgW86i2Tdfam6
	Yf1wWiYCYr/AI+B2dF2UiB/eUhKf0xzle+FgI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=TtPSf7aD2Fki+4zZyy/BIeFD6dHrdLCebGbjcxG9YMbbX8fDNClZeNQ/mYj45wpXNe
	VZiNveFkba0R/p/K+cAF3zQJVbaDgOW/bYfRsUX78PWcj1IDZOJ9E6PEt87ANW9AunEI
	xeTYyJlN59dI+1nKu2siOFsUvOn35APFDaM48=
Received: by 10.213.105.148 with SMTP id t20mr2725150ebo.30.1289064823868;
	Sat, 06 Nov 2010 10:33:43 -0700 (PDT)
Received: from localhost.localdomain ([93.182.199.230])
	by mx.google.com with ESMTPS id w20sm2321722eeh.12.2010.11.06.10.33.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 06 Nov 2010 10:33:43 -0700 (PDT)
Sender: Camille Moncelier <pixdamix@gmail.com>
From: Camille Moncelier <moncelier@devlife.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  6 Nov 2010 17:33:33 +0000
Message-Id: <1289064813-20133-2-git-send-email-moncelier@devlife.org>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <1289064813-20133-1-git-send-email-moncelier@devlife.org>
References: <1289064813-20133-1-git-send-email-moncelier@devlife.org>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: pixdamix@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: [PATCH 11/11] ccid: Bump version to 1.4.0 (Needs pcsc-lite > 1.6.2)
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
X-List-Received-Date: Sat, 06 Nov 2010 17:34:42 -0000

Signed-off-by: Camille Moncelier <moncelier@devlife.org>
---
 recipes/ccid/ccid_1.4.0.bb              |   28 ++++++++++++++++++++++++++++
 recipes/ccid/files/no-cardman-5321.diff |   10 ++++++++++
 2 files changed, 38 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ccid/ccid_1.4.0.bb
 create mode 100644 recipes/ccid/files/no-cardman-5321.diff

diff --git a/recipes/ccid/ccid_1.4.0.bb b/recipes/ccid/ccid_1.4.0.bb
new file mode 100644
index 0000000..b104374
--- /dev/null
+++ b/recipes/ccid/ccid_1.4.0.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "Generic USB CCID smart card reader driver"
+HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
+LICENSE = "GPL"
+PR = "r1"
+
+DEPENDS = "virtual/libusb0 pcsc-lite"
+RDEPENDS_${PN} = "pcsc-lite"
+
+SRC_URI = "http://alioth.debian.org/download.php/3333/ccid-${PV}.tar.bz2 \
+  file://no-cardman-5321.diff;apply=yes \
+"
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
+
+SRC_URI[md5sum] = "745d681bed2e17579fa6144e19bcb01d"
+SRC_URI[sha256sum] = "a0b6e56c54f311c4cb39eef0f362e4e6d388bf815a15532e4524d2be1723b4ff"
+
+DEFAULT_PREFERENCE = "-1"
diff --git a/recipes/ccid/files/no-cardman-5321.diff b/recipes/ccid/files/no-cardman-5321.diff
new file mode 100644
index 0000000..504c061
--- /dev/null
+++ b/recipes/ccid/files/no-cardman-5321.diff
@@ -0,0 +1,10 @@
+--- ccid-1.3.11/readers/supported_readers.txt.old	2009-09-28 18:12:42.000000000 +0200
++++ ccid-1.3.11/readers/supported_readers.txt	2009-09-28 18:12:53.000000000 +0200
+@@ -43,7 +43,6 @@
+ 0x076B:0x4321:OmniKey CardMan 4321
+ 0x076B:0x5121:OmniKey CardMan 5121
+ 0x076B:0x5125:OmniKey CardMan 5125
+-0x076B:0x5321:OmniKey CardMan 5321
+ 0x076B:0x6622:OmniKey CardMan 6121
+ 0x076B:0xA021:Smart Card Reader
+ 0x076B:0xA022:Teo by Xiring
-- 
1.7.3.1



