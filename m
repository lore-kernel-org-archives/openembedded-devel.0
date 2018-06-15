Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C29037512A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 08:22:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5F8MQPD017404
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Jun 2018 01:22:26 -0700 (PDT)
Received: from l1.corp.ad.wrs.com (128.224.124.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 15 Jun 2018 01:22:25 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 15 Jun 2018 11:22:26 +0300
Message-ID: <1529050946-24921-1-git-send-email-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/1] net-snmp: Fix host contamination
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
X-List-Received-Date: Fri, 15 Jun 2018 08:22:25 -0000
Content-Type: text/plain

If "/usr/local/ssl/include" directory exists on the host machine, net-snmp will
also search the host openssl headers:

build/net-snmp/temp$ grep -i "/usr/local/ssl/include" log.do_compile
x86_64-wrs-linux-libtool: compile: x86_64-wrs-linux-gcc ... -I/usr/local/ssl/include

Fix this by selecting the proper sysroot headers using
--with-openssl=${STAGING_EXECPREFIXDIR}

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
index 5c827bb86..6f6f19ac9 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
@@ -66,7 +66,8 @@ EXTRA_OECONF = "--enable-shared \
                 --with-install-prefix=${D} \
                 --with-persistent-directory=${localstatedir}/lib/net-snmp \
                 ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
-"
+                --with-openssl=${STAGING_EXECPREFIXDIR} \
+                "
 
 # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
 EXTRA_OECONF += "--with-mib-modules=smux"
@@ -121,8 +122,10 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+           -e "s@${STAGING_DIR_TARGET}@@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
+           -e "s@${STAGING_DIR_TARGET}@@g" \
            -e "s@\([^ ]*-fdebug-prefix-map=[^ ]*\)\1*@@g" \
            -e "s@\([^ ]*--sysroot=[^ ]*\)\1*@@g" \
            -e "s@\([^ ]*--with-libtool-sysroot=[^ ]*\)\1*@@g" \
-- 
2.17.1


