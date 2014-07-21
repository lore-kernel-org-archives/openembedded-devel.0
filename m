Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id A619970395
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 15:52:29 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6LFqS9v016414 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jul 2014 10:52:29 -0500
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072110522893-32983 ;
	Mon, 21 Jul 2014 10:52:28 -0500 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Jul 2014 10:52:08 -0500
Message-Id: <1405957930-15362-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
References: <1405957930-15362-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:52:28 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/21/2014 10:52:29 AM,
	Serialize complete at 07/21/2014 10:52:29 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-20_03:2014-07-18, 2014-07-20,
	1970-01-01 signatures=0
Subject: [meta-oe][PATCH 2/4] syslog-ng: package fixes, install tweaks
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jul 2014 15:52:30 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Package build fixes:
- Skip dev-so insane checks, since syslog-ng installs
  /usr/lib/syslog-ng/libafsocket.so
- Remove ${SOLIBSDEV} from syslog-ng-dev
- Add "${libdir}/${BPN}/*" to base package

Other changes:
- Start initscript at level 19 (was 20); allows it to start before
  busybox-cron
- Force /usr/include/scl to be owned by root
- Fix license versions (GPL -> GPLv2 and LGPL -> LGPLv2.1)

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
---
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc      | 8 ++++----
 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb | 7 +++++++
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index e0c9055..eb7b9cc 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -1,13 +1,13 @@
 DESCRIPTION = "Alternative system logger daemon"
 DEPENDS = "libol flex eventlog glib-2.0"
-LICENSE = "GPL LGPL"
+LICENSE = "GPLv2 LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
 
 # syslog initscript is handled explicitly because order of
 # update-rc.d and update-alternatives is important
 RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 inherit autotools systemd
 
@@ -51,7 +51,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
     ${base_libdir}/*${SOLIBS} \
     ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
     ${datadir}/include/scl/ ${datadir}/xsd"
-FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
+FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la"
 CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
 
 RPROVIDES_${PN} += "${PN}-systemd"
@@ -71,7 +71,7 @@ pkg_postinst_${PN} () {
     # remove all rc.d-links potentially created from alternative
     # syslog packages before creating new ones
     update-rc.d $OPT -f syslog remove
-    update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
+    update-rc.d $OPT syslog start 19 2 3 4 5 . stop 90 0 1 6 .
 }
 
 pkg_prerm_${PN} () {
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
index 6d1fee7..9f89740 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
@@ -6,5 +6,12 @@ SRC_URI += " \
     file://initscript \
 "
 
+FILES_${PN} += "${libdir}/${BPN}/*"
+INSANE_SKIP_${PN} = "dev-so"
+
+do_install_append() {
+	chown -R root:root ${D}/${datadir}/include/scl/
+}
+
 SRC_URI[md5sum] = "60737452ce898f9dc7170dfdc9bfd732"
 SRC_URI[sha256sum] = "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9eca79d9144eeefa89"
-- 
2.0.2


