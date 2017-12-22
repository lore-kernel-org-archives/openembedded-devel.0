Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C32378898
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Dec 2017 06:21:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vBM6LAxS020324
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Dec 2017 22:21:10 -0800 (PST)
Received: from otp-linux01.wrs.com (128.224.126.17) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 21 Dec 2017 22:21:09 -0800
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 22 Dec 2017 08:21:08 +0200
Message-ID: <20171222062108.286283-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH v2] net-snmp: fix invalid paths in target net-snmp-config
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
X-List-Received-Date: Fri, 22 Dec 2017 06:21:10 -0000
Content-Type: text/plain

Remove build host paths from target net-snmp-config.

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index af6fd1b1f..f6da945af 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -116,6 +116,10 @@ do_install_append() {
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+           -e "s@${STAGING_DIR_NATIVE}@@g" \
+           -e "s@${STAGING_DIR_HOST}@@g" \
+           -e "s@${D}@@g" \
+           -e "s@${WORKDIR}@@g" \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
@@ -144,6 +148,7 @@ do_install_ptest() {
 }
 
 SYSROOT_PREPROCESS_FUNCS += "net_snmp_sysroot_preprocess"
+SNMP_DBGDIR = "/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}"
 
 net_snmp_sysroot_preprocess () {
     if [ -e ${D}${bindir}/net-snmp-config ]; then
@@ -155,6 +160,12 @@ net_snmp_sysroot_preprocess () {
             -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
             -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
             -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=${S}@g" \
+            -e "s@-fdebug-prefix-map==${SNMP_DBGDIR}@-fdebug-prefix-map=${WORKDIR}=${SNMP_DBGDIR}@g" \
+            -e "s@-fdebug-prefix-map== -fdebug-prefix-map==@-fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
+                  -fdebug-prefix-map=${STAGING_DIR_HOST}=@g" \
+            -e "s@--sysroot=@--sysroot=${STAGING_DIR_HOST}@g" \
+            -e "s@--with-libtool-sysroot=@--with-libtool-sysroot=${STAGING_DIR_HOST}@g" \
+            -e "s@--with-install-prefix=@--with-install-prefix=${D}@g" \
           -i  ${SYSROOT_DESTDIR}${bindir_crossscripts}/net-snmp-config
     fi
 }
-- 
2.13.3


