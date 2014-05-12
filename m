Return-Path: <alexandre.fournier@kiplink.fr>
Received: from webmail.wisp-e.com (unknown [212.83.147.100])
	by mail.openembedded.org (Postfix) with ESMTP id 963C960167
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 20:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by webmail.wisp-e.com (Postfix) with ESMTP id 66A3F1A1627
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 May 2014 22:03:00 +0200 (CEST)
Received: from webmail.wisp-e.com ([127.0.0.1])
	by localhost (webmail.wisp-e.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 4EdQ5LnlUqSU; Mon, 12 May 2014 22:02:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by webmail.wisp-e.com (Postfix) with ESMTP id D949A1A1626;
	Mon, 12 May 2014 22:02:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at wisp-e.com
Received: from webmail.wisp-e.com ([127.0.0.1])
	by localhost (webmail.wisp-e.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5oKl-9hmU5zJ; Mon, 12 May 2014 22:02:59 +0200 (CEST)
Received: from borma.wisp-e.com (borma.wisp-e.com [192.168.200.62])
	by webmail.wisp-e.com (Postfix) with ESMTPSA id AD2581A15A5;
	Mon, 12 May 2014 22:02:59 +0200 (CEST)
From: Alexandre Fournier <alexandre.fournier@kiplink.fr>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 12 May 2014 22:04:31 +0200
Message-Id: <1399925071-12155-1-git-send-email-alexandre.fournier@kiplink.fr>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-networking][PATCH v2] net-snmp: install net-snmp-config script to STAGING_BINDIR_CROSS
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
X-List-Received-Date: Mon, 12 May 2014 20:02:53 -0000

This recipe was installing net-snmp-config script to STAGING_BINDIR
instead of STAGING_BINDIR_CROSS, during the do_install. It is not
recommended and must be done after staging.

Changes:
* Remove STAGING_BINDIR manipulations from do_install_append
* Add net_snmp_sysroot_preprocess function instead
* Append net_snmp_sysroot_preprocess to SYSROOT_PREPROCESS_FUNCS

Signed-off-by: Alexandre Fournier <alexandre.fournier@kiplink.fr>
---
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb            | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index eb50d0f..f1e3a5d 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -49,19 +49,26 @@ do_install_append() {
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/snmpd
     install -m 644 ${WORKDIR}/snmpd.conf ${D}${sysconfdir}/snmp/
     install -m 644 ${WORKDIR}/snmptrapd.conf ${D}${sysconfdir}/snmp/
-    install -d ${STAGING_BINDIR}
-    install -m 0755 ${D}${bindir}/net-snmp-config ${STAGING_BINDIR}/
     sed -e "s@-I/usr/include@@g" \
         -e "s@^prefix=.*@prefix=${STAGING_DIR_HOST}@g" \
         -e "s@^exec_prefix=.*@exec_prefix=${STAGING_DIR_HOST}@g" \
         -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
         -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
-        -i ${STAGING_BINDIR}/net-snmp-config
+        -i ${D}${bindir}/net-snmp-config
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
 }
 
+SYSROOT_PREPROCESS_FUNCS += "net_snmp_sysroot_preprocess"
+
+net_snmp_sysroot_preprocess () {
+    if [ -e ${D}${bindir}/net-snmp-config ]; then
+        install -d ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+        install -m 755 ${D}${bindir}/net-snmp-config ${SYSROOT_DESTDIR}${bindir_crossscripts}/
+    fi
+}
+
 PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
             ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
 
-- 
1.8.3.2


