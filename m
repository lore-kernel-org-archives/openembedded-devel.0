Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id D57456C4E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 00:52:28 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id CAC391C005A;
	Wed, 21 Nov 2018 13:52:27 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 13:52:20 +1300
Message-Id: <20181121005220.22091-7-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181121005220.22091-1-douglas.royds@taitradio.com>
References: <20181120063718.28683-1-douglas.royds@taitradio.com>
	<20181121005220.22091-1-douglas.royds@taitradio.com>
Subject: [meta-oe][PATCH v2 6/6] net-snmp: Simplify sed expressions
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
X-List-Received-Date: Wed, 21 Nov 2018 00:52:29 -0000

Readability.
The existing patterns allowed each pattern to be matched multiple times (with no
intevening spaces), but the "g" modifier achieves this anyway.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.8.bb       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
index 2a0d88ab2..7794f3880 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.8.bb
@@ -119,12 +119,12 @@ do_install_append() {
     sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
         -i ${D}${bindir}/net-snmp-create-v3-user
     sed -e 's@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g' \
-        -e 's@\([^ ]*-fdebug-prefix-map=[^ "]*\)\1*@@g' \
-        -e 's@\([^ ]*--sysroot=[^ "]*\)\1*@@g' \
-        -e 's@\([^ ]*--with-libtool-sysroot=[^ "]*\)\1*@@g' \
-        -e 's@\([^ ]*--with-install-prefix=[^ "]*\)\1*@@g' \
-        -e 's@\([^ ]*PKG_CONFIG_PATH=[^ "]*\)\1*@@g' \
-        -e 's@\([^ ]*PKG_CONFIG_LIBDIR=[^ "]*\)\1*@@g' \
+        -e 's@[^ ]*-fdebug-prefix-map=[^ "]*@@g' \
+        -e 's@[^ ]*--sysroot=[^ "]*@@g' \
+        -e 's@[^ ]*--with-libtool-sysroot=[^ "]*@@g' \
+        -e 's@[^ ]*--with-install-prefix=[^ "]*@@g' \
+        -e 's@[^ ]*PKG_CONFIG_PATH=[^ "]*@@g' \
+        -e 's@[^ ]*PKG_CONFIG_LIBDIR=[^ "]*@@g' \
         -i ${D}${bindir}/net-snmp-config
 
     if [ "${HAS_PERL}" = "1" ]; then
-- 
2.17.1


