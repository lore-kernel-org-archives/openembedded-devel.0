Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rxqm0-00063o-Qs
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 03:08:40 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so479834eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2012 18:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=0q/NcRLPvdq+CnLzmbziM6ibx8POIyWByD8IhRv6oJg=;
	b=Kd5cqK4e24dCXe0ZcuT3RRhnS4xSVRGO7olmvTlXpPlorWoTsrXR03UQ8NYN2I2IYm
	c7S6ppKoVjflHYEGWE8XhMBEbqcBxPB8uAczz08g5MemrEXAuwkVJWCl+uAcR6ttR2xR
	P7cItJUUOWyyRruzWflghZSLUdn+et9+R1fmg=
Received: by 10.14.45.75 with SMTP id o51mr357987eeb.20.1329357630683;
	Wed, 15 Feb 2012 18:00:30 -0800 (PST)
Received: from localhost.localdomain (p5B0A2E3F.dip.t-dialin.net.
	[91.10.46.63])
	by mx.google.com with ESMTPS id n58sm17552669een.10.2012.02.15.18.00.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Feb 2012 18:00:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 16 Feb 2012 03:03:06 +0100
Message-Id: <1329357796-27398-13-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][v2] 12/22] cronie: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 02:08:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +-----------
 1 files changed, 1 insertions(+), 11 deletions(-)

diff --git a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend b/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
index e0b9fb9..5aedb21 100644
--- a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
+++ b/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
@@ -1,7 +1,7 @@
 # look for files in the layer first
 FILESEXTRAPATHS := "${THISDIR}/${PN}"
 
-PRINC = "1"
+PRINC = "2"
 
 inherit systemd
 
@@ -9,13 +9,3 @@ SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE_${PN}-systemd = "crond.service"
 
 SRC_URI += "file://crond.service"
-
-do_install_append() {
-    install -d ${D}${base_libdir}/systemd/system
-    install -m 644 ${WORKDIR}/crond.service ${D}${base_libdir}/systemd/system
-}
-
-PACKAGES =+ "${PN}-systemd"
-
-FILES_${PN}-systemd += "${base_libdir}/systemd"
-RDEPENDS_${PN}-systemd = "${PN}"
-- 
1.7.4.4



