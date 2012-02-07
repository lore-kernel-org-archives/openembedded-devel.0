Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Rumqy-0001Jt-Pi
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Feb 2012 16:21:08 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so1955916eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2012 07:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=BtY/42cjhhPvhBx+ROCkPKgBUz9RrSE/XnhNQbv+p6U=;
	b=g6KX/1QhdPRbJABYl7bzgvoVzQaB2G9b4Ez8tDDa317vN9IzNpCke304Py8+/eDSPq
	PqkEQXu3Mp6wKnuqpdjh227TK+6NOEiNYnxfQvvM0oc8+PgbYLqYBJJ9ct+shLhGVpRO
	Sy9/Zo1BojAX6xqg24Yii3zPwUmBgMu23QmYQ=
Received: by 10.213.35.135 with SMTP id p7mr2133461ebd.134.1328627588681;
	Tue, 07 Feb 2012 07:13:08 -0800 (PST)
Received: from localhost.localdomain (ip-95-223-250-190.unitymediagroup.de.
	[95.223.250.190])
	by mx.google.com with ESMTPS id n58sm1424741een.10.2012.02.07.07.13.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Feb 2012 07:13:08 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Feb 2012 16:12:41 +0100
Message-Id: <1328627573-5217-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe][RFC 15/27] cloud9: pack systemd support in ${PN}-systemd / remove unneeded systemd code
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
X-List-Received-Date: Tue, 07 Feb 2012 15:21:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
index 4e95075..a7bccf9 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.5.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
 DEPENDS = "libxml2 nodejs-native"
 
-PR = "r13"
+PR = "r14"
 
 SRC_URI = "git://github.com/ajaxorg/cloud9.git;name=cloud9ide \
            git://github.com/ajaxorg/o3;destsuffix=o3;name=o3 \
@@ -98,9 +98,6 @@ do_install () {
  install -m 0644 ${WORKDIR}/o3/modules/o3.js ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.js
  install -m 0755 ${WORKDIR}/o3/o3.node ${D}${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/o3.node
 
- install -m 0755 -d ${D}${base_libdir}/systemd/system
- install -m 0644 ${WORKDIR}/cloud9.service ${D}${base_libdir}/systemd/system/
-
   install -m 0755 -d ${D}${sysconfdir}/avahi/services/
   install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
 }
@@ -109,10 +106,9 @@ FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o
                     ${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/.debug \
                    "
 
-FILES_${PN} += "${base_libdir}/systemd/system"
 RDEPENDS_${PN} = "nodejs gzip"
 
 inherit systemd
 
-SYSTEMD_PACKAGES = "${PN}"
-SYSTEMD_SERVICE_${PN} = "cloud9.service"
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE_${PN}-systemd = "cloud9.service"
-- 
1.7.6.4



