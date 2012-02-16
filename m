Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqly-00063q-7z
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:38 +0100
Received: by mail-ee0-f47.google.com with SMTP id d41so504563eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=KFzqRaOmNcnlKHEgm4RJpKqJ+xW4bV7WALf6aS6xpzk=;
	b=MFcJFCDqdArZNnacKKxB+XXxKEmU+bo11HcndCf0/lyzaAw4dAOCekM88QmN54/Fgl
	qP8xos4xTsBM2OPfyGU5FUqj+8vHJmpJk5K4I7LtvFR9RKFacDEnCnoZYgihXZWB0SYR
	1lSRTc+nOkGWUGIDEQF4ppkH0hSoq6X2Ukf8I=
Received: by 10.14.126.68 with SMTP id a44mr327878eei.101.1329357628091;
	Wed, 15 Feb 2012 18:00:28 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:27 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:03 +0100
Message-Id: <1329357796-27398-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 09/22] dropbear: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../dropbear/dropbear_2011.54.bbappend             |   11 +----------
 1 files changed, 1 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
index 899e1fc..96cc8bd 100644
--- a/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
+++ b/meta-oe/recipes-core/dropbear/dropbear_2011.54.bbappend
@@ -1,6 +1,6 @@
 inherit systemd
 
-PRINC := "${@int(PRINC) + 1}"
+PRINC := "${@int(PRINC) + 2}"
 
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
@@ -13,14 +13,5 @@ SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "dropbear.socket"
 
 do_install_append() {
-	install -d ${D}${base_libdir}/systemd/system
-	install -m 0644 ${WORKDIR}/dropbearkey.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/dropbear@.service ${D}${base_libdir}/systemd/system/
-	install -m 0644 ${WORKDIR}/dropbear.socket ${D}${base_libdir}/systemd/system/
 	ln -sf /dev/null ${D}${base_libdir}/systemd/system/dropbear.service
 }
-
-PACKAGES += "${PN}-systemd"
-
-RDEPENDS_${PN}-systemd += "dropbear"
-FILES_${PN}-systemd = "${base_libdir}/systemd"
-- 
1.7.4.4



