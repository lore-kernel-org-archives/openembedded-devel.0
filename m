Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7108C60D8B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 13:52:10 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WzncS-0002Xv-5h from drew_moseley@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 25 Jun 2014 06:52:12 -0700
Received: from SVR-ORW-FEM-05.mgc.mentorg.com ([147.34.97.43]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 25 Jun 2014 06:51:40 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Wed, 25 Jun 2014 06:51:40 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 25 Jun 2014 09:51:38 -0400
Message-ID: <1403704298-9726-2-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1403704298-9726-1-git-send-email-drew_moseley@mentor.com>
References: <1403704298-9726-1-git-send-email-drew_moseley@mentor.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Jun 2014 13:51:40.0525 (UTC)
	FILETIME=[9744D9D0:01CF907C]
Subject: [meta-oe][PATCH 2/2] debianutils: Use update-alternatives class
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
X-List-Received-Date: Wed, 25 Jun 2014 13:52:11 -0000
Content-Type: text/plain

Use the update-alternatives class rather than explicit
pkg_prerm_${PN} and pkg_postinst_${PN} tasks.  This allows
the configuration to happen at build time rather than
on first boot.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../recipes-support/debianutils/debianutils_4.4.bb | 45 ++++++----------------
 1 file changed, 11 insertions(+), 34 deletions(-)

diff --git a/meta-oe/recipes-support/debianutils/debianutils_4.4.bb b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
index c93c026..346eaf1 100644
--- a/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
+++ b/meta-oe/recipes-support/debianutils/debianutils_4.4.bb
@@ -7,52 +7,29 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.gz"
 SRC_URI[md5sum] = "c0cb076754d7f4eb1e3397d00916647f"
 SRC_URI[sha256sum] = "190850cdd6b5302e0a1ba1aaed1bc7074d67d3bd8d04c613f242f7145afa53a6"
 
-inherit autotools
+inherit autotools update-alternatives
 
 do_configure_prepend() {
     sed -i -e 's:tempfile.1 which.1:which.1:g' ${S}/Makefile.am
 }
 
 do_install_append() {
-    for app in ${D}${sbindir}/* ${D}${bindir}/*; do
-        mv $app $app.${PN}
-    done
     if [ "${base_bindir}" != "${bindir}" ]; then
         # Debian places some utils into ${base_bindir} as does busybox
         install -d ${D}${base_bindir}
-        for app in run-parts.${PN} tempfile.${PN}; do
+        for app in run-parts tempfile; do
             mv ${D}${bindir}/$app ${D}${base_bindir}/$app
         done
     fi
 }
 
-pkg_prerm_${PN} () {
-if [ "x$D" != "x" ]; then
-    echo "can't do u-a offline" ; exit 1
-else
-    for app in add-shell  installkernel  remove-shell run-parts  savelog  tempfile  which ; do
-       update-alternatives --remove $app $app.${PN}
-    done
-fi
-}
-
-pkg_postinst_${PN} () {
-if [ "x$D" != "x" ]; then
-    echo "can't do u-a offline" ; exit 1
-else
-    for app in add-shell  installkernel  remove-shell ; do
-        update-alternatives --install ${sbindir}/$app $app $app.${PN} 100
-    done
-
-    for app in savelog  which ; do
-        update-alternatives --install ${bindir}/$app $app $app.${PN} 100
-    done
-
-    for app in run-parts  tempfile ; do
-        update-alternatives --install ${base_bindir}/$app $app $app.${PN} 100
-    done
-fi
-}
-
-
+ALTERNATIVE_PRIORITY="100"
+ALTERNATIVE_${PN} = "add-shell installkernel remove-shell run-parts savelog tempfile which"
 
+ALTERNATIVE_LINK_NAME[add-shell]="${sbindir}/add-shell"
+ALTERNATIVE_LINK_NAME[installkernel]="${sbindir}/installkernel"
+ALTERNATIVE_LINK_NAME[remove-shell]="${sbindir}/remove-shell"
+ALTERNATIVE_LINK_NAME[run-parts]="${base_bindir}/run-parts"
+ALTERNATIVE_LINK_NAME[savelog]="${bindir}/savelog"
+ALTERNATIVE_LINK_NAME[tempfile]="${base_bindir}/tempfile"
+ALTERNATIVE_LINK_NAME[which]="${bindir}/which"
-- 
1.9.1


