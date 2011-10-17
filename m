Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RFwoB-0006aY-AK
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Oct 2011 01:41:28 +0200
Received: by eyd9 with SMTP id 9so15949eyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Oct 2011 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=yiQVeGNmbjE6uQMSVTE6o5Vr0Uya3BiO1tDpnRe1ZCc=;
	b=NsuR3lTFE6ZrE8VFmIA5JBKos35s2RjL8Gk2r07FhzKLs0qsIcxQxTls1kqIHqMnPk
	Dyi5qbPTQ0P3he4Ywe68ZDv/G1DfSR3ZxdarGlQXnaN8/2m7xBvi3R89MsUQfcX/hiE1
	LxvBwSHLiVcAG/udha7XvKGP1Prq5bWNEBGcg=
Received: by 10.223.62.19 with SMTP id v19mr27255265fah.27.1318894536824;
	Mon, 17 Oct 2011 16:35:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f23sm222677faf.0.2011.10.17.16.35.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 16:35:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Oct 2011 01:35:20 +0200
Message-Id: <1ab4e30380da2444cfc66fe5283beb83168964a7.1318894479.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <cover.1318894479.git.Martin.Jansa@gmail.com>
References: <cover.1318894479.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][meta-efl][meta-gnome 01/10] syslog-ng: move conflicting file modules.conf to own packages and fix unpackaged files
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
X-List-Received-Date: Mon, 17 Oct 2011 23:41:28 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |   11 +++++++++++
 .../recipes-support/syslog-ng/syslog-ng_3.2.2.bb   |    2 +-
 2 files changed, 12 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index c3a36c1..073b6d6 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -38,6 +38,17 @@ do_install_append() {
         install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
 }
 
+PACKAGES =+ "${PN}-config"
+FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+            ${sysconfdir} ${sharedstatedir} ${localstatedir} \
+            ${base_bindir}/* ${base_sbindir}/* \
+            ${base_libdir}/*${SOLIBS} \
+            ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
+            ${datadir}/include/scl/ ${datadir}/xsd"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
+# moved intentionaly to ${PN}-config without RDEPENDing on it, because it breaks update-modules 
+# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
+FILES_${PN}-config += "${syconfdir}/modules.conf"
 CONFFILES_${PN} = "${sysconfdir}/${PN}.conf"
 
 pkg_postinst_${PN} () {
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
index f9eef24..c8b5ac8 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.2.bb
@@ -1,5 +1,5 @@
 require syslog-ng.inc
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 SRC_URI += " \
   file://syslog-ng.conf \
-- 
1.7.7



