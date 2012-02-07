Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqw-0001JL-So
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:07 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so2181054eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=jd1asg6ZqOYjbtN4ll5++CaKdY1VP1QT9duS6dLaOIU=;
	b=mMVh7A/0JYyjMKxuL+RZCFzNPUQWQQFGc0XUYe46eu8tJIXdIrK84I+wDnnsfOD/SX
	tcdDkThZw6jbxYit6SH0bQwbbKbU+V4X2Xw3PQHP19FFC5hYyBv61uyEukpjwcYsI5Oh
	0FRAmHTdWVp01XSj7LAd75qqb9B2qmkD/bpQ4=
Received: by 10.14.119.16 with SMTP id m16mr7175228eeh.124.1328627586858;
	Tue, 07 Feb 2012 07:13:06 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:06 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:40 +0100
Message-Id: <1328627573-5217-15-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 14/27] dropbear: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../dropbear/dropbear_2011.54.bbappend             |   10 +---------
 1 files changed, 1 insertions(+), 9 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index 899e1fc..ba65067 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
@@ -13,14 +13,6 @@ SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
 
 do_install_append() {
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${base_libdir}/systemd/system/
 	ln -sf /dev/null ${D}${base_libdir}/systemd/system/dropbear.service
 }
 
-PACKAGES += "${PN}-systemd"
-
-RDEPENDS_${PN}-systemd += "dropbear"
-FILES_${PN}-systemd = "${base_libdir}/systemd"
-- 
1.7.6.4



