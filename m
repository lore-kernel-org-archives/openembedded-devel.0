Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QRrtL-0007X3-Vm
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jun 2011 22:19:48 +0200
Received: by mail-yw0-f47.google.com with SMTP id 8so89031ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jun 2011 13:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references:in-reply-to:references;
	bh=rH9B1pgmVZkNlidcoBgeiY2ZwnNMueNt5ph0MnOq89Q=;
	b=cEHRc17N5pWFipOJ455Ar8SvitPTElctT0OaSHUg+9JwKUnfgNQqkh1Sl8I6Fr97x/
	sw3ZFo0VTbxLIIxW+zhURfXS+usyy87nCr280VSYDeR3ZcdCxLq5jYXqaBac6tmk/+2f
	inHwul/UdvXY7EBWNe4jXagbC/HstJZv58skQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=WfRIZYCyqYFkGl+p4Xbho1b7oHpXd+WVeEwAxmZrlg4OjuC5KJJtBZVrC6eTj+Q+Jn
	C7Uxa9/CpO7AwXlEoGTz5OoiVEIFc0Wgrnnf0eevkQQXdBHED7vsgStOLa7ym7fP0Ps8
	hgjNUV4U99KeUJDBChmmpGw5ByKVFW9dItbH8=
Received: by 10.236.138.161 with SMTP id a21mr3860845yhj.49.1306959398702;
	Wed, 01 Jun 2011 13:16:38 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id t43sm1478016yhm.70.2011.06.01.13.16.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Jun 2011 13:16:37 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 Jun 2011 20:16:14 +0000
Message-Id: <7dd8f3e2c2252f5d813fee95492f3707af3bdf86.1306959338.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
References: <cover.1306959338.git.otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 4/5] ccid: add 1.4.4 version recipe
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
X-List-Received-Date: Wed, 01 Jun 2011 20:19:48 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-support/ccid/ccid_1.4.4.bb |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-support/ccid/ccid_1.4.4.bb

diff --git a/meta-oe/recipes-support/ccid/ccid_1.4.4.bb b/meta-oe/recipes-support/ccid/ccid_1.4.4.bb
new file mode 100644
index 0000000..734e854
--- /dev/null
+++ b/meta-oe/recipes-support/ccid/ccid_1.4.4.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "Generic USB CCID smart card reader driver"
+HOMEPAGE = "http://pcsclite.alioth.debian.org/ccid.html"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
+PR = "r0"
+
+DEPENDS = "virtual/libusb0 pcsc-lite"
+RDEPENDS_${PN} = "pcsc-lite"
+
+SRC_URI = "https://alioth.debian.org/frs/download.php/3579/ccid-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "79ef91103bcdd99a3b31cb5c5721a829"
+SRC_URI[sha256sum] = "953e430d2e37a67b99041f584249085656d73e72390dfe40589f4dd5c367edd0"
+
+inherit autotools
+
+FILES_${PN} += "${libdir}/pcsc/"
+FILES_${PN}-dbg += "${libdir}/pcsc/drivers/*/*/*/.debug"
-- 
1.7.2.5



