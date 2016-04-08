Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99BD8731CA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Apr 2016 02:13:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u382DlkQ017769
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 7 Apr 2016 19:13:48 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Apr 2016 19:13:47 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 8 Apr 2016 10:07:25 +0800
Message-ID: <1460081245-24356-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][meta-oe] krb5: add native and nativesdk extend
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Apr 2016 02:13:48 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

add native and nativesdk extend, curl-native/nativesdk need them.
replace the hardcode /etc with ${sysconfdir}, /var with ${localstatedir}

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index 297cc1b..099e8e9 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -61,7 +61,7 @@ FILES_${PN}-doc += "${datadir}/examples"
 FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
 
 # As this recipe doesn't inherit update-rc.d, we need to add this dependency here
-RDEPENDS_${PN} += "initscripts-functions"
+RDEPENDS_${PN}_class-target += "initscripts-functions"
 
 krb5_do_unpack() {
     # ${P}-signed.tar contains ${P}.tar.gz.asc and ${P}.tar.gz
@@ -80,12 +80,12 @@ do_configure() {
 }
 
 do_install_append() {
-    mkdir -p ${D}/etc/init.d ${D}/etc/default
-    install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/etc/init.d
-    install -m 0644 ${WORKDIR}/etc/default/* ${D}/etc/default
+    mkdir -p ${D}/${sysconfdir}/init.d ${D}/${sysconfdir}/default
+    install -m 0755 ${WORKDIR}/etc/init.d/* ${D}/${sysconfdir}/init.d
+    install -m 0644 ${WORKDIR}/etc/default/* ${D}/${sysconfdir}/default
 
-    rm -rf ${D}/var/run
-    mkdir -p ${D}/etc/default/volatiles
+    rm -rf ${D}/${localstatedir}/run
+    mkdir -p ${D}/${sysconfdir}/default/volatiles
     echo "d root root 0755 ${localstatedir}/run/krb5kdc none" \
            > ${D}${sysconfdir}/default/volatiles/87_krb5
     if ${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
@@ -105,3 +105,5 @@ pkg_postinst_${PN} () {
         fi
     fi
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


