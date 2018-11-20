Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id CFFFE6BA9C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2018 06:37:31 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 227D32202D1;
	Tue, 20 Nov 2018 19:37:31 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 20 Nov 2018 19:37:16 +1300
Message-Id: <20181120063718.28683-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181120063718.28683-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH 3/5] net-snmp: Reproducibility: Remove PKG_CONFIG paths from net-snmp-config
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
X-List-Received-Date: Tue, 20 Nov 2018 06:37:32 -0000

PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR point into the net-snmp recipe-sysroot.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 089946032..4b1267b3c 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -119,6 +119,8 @@ do_install_append() {
            -e "s@\([^ ]*--sysroot=[^ ]*\)\1*@@g" \
            -e "s@\([^ ]*--with-libtool-sysroot=[^ ]*\)\1*@@g" \
            -e "s@\([^ ]*--with-install-prefix=[^ ]*\)\1*@@g" \
+           -e "s@\([^ ]*PKG_CONFIG_PATH=[^ ]*\)\1*@@g" \
+           -e "s@\([^ ]*PKG_CONFIG_LIBDIR=[^ ]*\)\1*@@g" \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.17.1


