Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 69E9178544
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Jan 2018 06:47:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0M6lsl1026845
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Jan 2018 22:47:54 -0800 (PST)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 21 Jan 2018 22:47:42 -0800
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 21 Jan 2018 22:47:41 -0800
Message-ID: <20180122064741.32276-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] net-snmp: fix the invalid -fdebug-prefix-map
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
X-List-Received-Date: Mon, 22 Jan 2018 06:47:53 -0000
Content-Type: text/plain

From: Yu Mingli <mingli.yu@windriver.com>

The previous path value to -fdebug-prefix-map
is null which may result in other package such as
quagga do_config error as below:
====================================================
add DISTRO_FEATURES_append = " snmp" to conf/local.conf
test@buildserver@ bitbake quagga
| checking for i586-poky-linux-net-snmp-config... no
| checking for net-snmp-config... $Prj/tmp/work/i586-poky-linux/quagga/1.2.1-r0/recipe-sysroot/usr/bin/crossscripts/net-snmp-config
| checking whether we can link to Net-SNMP... no
| configure: error: --enable-snmp given but not usable
| NOTE: The following config.log files may provide further information.
| NOTE: $Prj/tmp/work/i586-poky-linux/quagga/1.2.1-r0/build/config.log
| ERROR: configure failed
| WARNING: $Prj/tmp/work/i586-poky-linux/quagga/1.2.1-r0/temp/run.do_configure.80493:1 exit 1 from 'exit 1'
| ERROR: Function failed: do_configure (log file is located at $Prj/tmp/work/i586-poky-linux/quagga/1.2.1-r0/temp/log.do_configure.80493)
====================================================

Signed-off-by: Yu Mingli <mingli.yu@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 3c0587469..09f26c842 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -150,6 +150,7 @@ do_install_ptest() {
 }
 
 SYSROOT_PREPROCESS_FUNCS += "net_snmp_sysroot_preprocess"
+SNMP_DBGDIR = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 net_snmp_sysroot_preprocess () {
     if [ -e ${D}${bindir}/net-snmp-config ]; then
@@ -161,6 +162,12 @@ net_snmp_sysroot_preprocess () {
             -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
             -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
             -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=${S}@g" \
+            -e "s@-fdebug-prefix-map=${SNMP_DBGDIR}@-fdebug-prefix-map=${WORKDIR}=${SNMP_DBGDIR}@g" \
+            -e "s@-fdebug-prefix-map= -fdebug-prefix-map=@-fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+                  -fdebug-prefix-map=${STAGING_DIR_HOST}=@g" \
+            -e "s@--sysroot=@--sysroot=${STAGING_DIR_HOST}@g" \
+            -e "s@--with-libtool-sysroot=@--with-libtool-sysroot=${STAGING_DIR_HOST}@g" \
+            -e "s@--with-install-prefix=@--with-install-prefix=${D}@g" \
           -i  ${SYSROOT_DESTDIR}${bindir_crossscripts}/net-snmp-config
     fi
 }
-- 
2.11.0


