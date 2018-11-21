Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 8A26D6C4DF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 00:52:27 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id A41411C004A;
	Wed, 21 Nov 2018 13:52:27 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 13:52:17 +1300
Message-Id: <20181121005220.22091-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121005220.22091-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
	<20181121005220.22091-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH v2 3/6] net-snmp: Reproducibility: Remove PKG_CONFIG paths from net-snmp-config
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
X-List-Received-Date: Wed, 21 Nov 2018 00:52:28 -0000

PKG_CONFIG_PATH and PKG_CONFIG_LIBDIR point into the net-snmp recipe-sysroot.
Careful not to trim trailing quotes from the CFLAGS

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb       | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 089946032..03fe24bdd 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -114,11 +114,13 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
-    sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
-           -e "s@\([^ ]*-fdebug-prefix-map=[^ ]*\)\1*@@g" \
-           -e "s@\([^ ]*--sysroot=[^ ]*\)\1*@@g" \
-           -e "s@\([^ ]*--with-libtool-sysroot=[^ ]*\)\1*@@g" \
-           -e "s@\([^ ]*--with-install-prefix=[^ ]*\)\1*@@g" \
+    sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
+        -e 's@\([^ ]*-fdebug-prefix-map=[^ "]*\)\1*@@g' \
+        -e 's@\([^ ]*--sysroot=[^ "]*\)\1*@@g' \
+        -e 's@\([^ ]*--with-libtool-sysroot=[^ "]*\)\1*@@g' \
+        -e 's@\([^ ]*--with-install-prefix=[^ "]*\)\1*@@g' \
+        -e 's@\([^ ]*PKG_CONFIG_PATH=[^ "]*\)\1*@@g' \
+        -e 's@\([^ ]*PKG_CONFIG_LIBDIR=[^ "]*\)\1*@@g' \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.17.1


