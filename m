Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqq-0001Jt-7H
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:00 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955916eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=omshb78+iI1T40uqdGXQWG63gxRlGAtDvpmkG01UMQA=;
	b=Jc5f4pi7WwsjLX5e8mNCUPKYfibRLes9OC1RjFCGXTt+E0404Wi42Qelg4bF97rmGs
	ePIMAQBZ8VyXEC8oPNx0YlE8UW/jxPDMfB//VopNrgvQKj/vPlY2wySmx+G7gs98coOm
	kI8OYS8OmtwuCItVREvfLVlTO3BLiUGptbPig=
Received: by 10.213.26.8 with SMTP id b8mr2098168ebc.88.1328627580091;
	Tue, 07 Feb 2012 07:13:00 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.12.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:12:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:34 +0100
Message-Id: <1328627573-5217-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 08/27] cronie: remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:00 -0000
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
1.7.6.4



