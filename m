Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.jrz.cbn>) id 1P9Mdl-0002YW-2K
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Oct 2010 20:46:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7412E8D4CC4;
	Fri, 22 Oct 2010 14:46:20 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 10141-05; Fri, 22 Oct 2010 14:46:20 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 420718D4DFA; Fri, 22 Oct 2010 14:46:20 -0400 (EDT)
Received: from sles10-64.jrz.cbn (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id CCF8E8D4E30;
	Fri, 22 Oct 2010 14:46:15 -0400 (EDT)
Received: by sles10-64.jrz.cbn (Postfix, from userid 1001)
	id BE7505000E3; Fri, 22 Oct 2010 14:46:15 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Oct 2010 14:46:15 -0400
Message-Id: <1287773175-12507-2-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1287773175-12507-1-git-send-email-msmith@cbnco.com>
References: <1287773175-12507-1-git-send-email-msmith@cbnco.com>
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: michael@sles10-64.jrz.cbn
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL, BAYES_00, NO_DNS_FOR_FROM,
	SPF_HELO_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] openswan 2.6.31: split package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Oct 2010 18:46:57 -0000

Split examples to ${PN}-examples, and KLIPS scripts to ${PN}-klips.
Saves about 400K in the main package for NETKEY users.

Also pass down some paths in case libdir, libexecdir, sbindir are
non-standard.

Signed-off-by: Michael Smith <msmith@cbnco.com>
Cc: Tom Rini <tom_rini@mentor.com>
---
 recipes/openswan/openswan_2.6.31.bb |   24 +++++++++++++++++++++++-
 1 files changed, 23 insertions(+), 1 deletions(-)

diff --git a/recipes/openswan/openswan_2.6.31.bb b/recipes/openswan/openswan_2.6.31.bb
index df3fe8b..94b45aa 100644
--- a/recipes/openswan/openswan_2.6.31.bb
+++ b/recipes/openswan/openswan_2.6.31.bb
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 DEPENDS = "gmp flex-native bison-native"
 RRECOMMENDS_${PN} = "kernel-module-ipsec"
 RDEPENDS_append_nylon = "perl"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.openswan.org/download/openswan-${PV}.tar.gz"
 
@@ -14,6 +14,9 @@ EXTRA_OEMAKE = "DESTDIR=${D} \
                 USERCOMPILE="${CFLAGS}" \
                 USERLINK="${LDFLAGS}" \
                 FINALCONFDIR=${sysconfdir}/ipsec \
+                FINALLIBDIR=${libdir}/ipsec \
+                FINALLIBEXECDIR=${libexecdir}/ipsec \
+                FINALSBINDIR=${sbindir} \
                 INC_RCDEFAULT=${sysconfdir}/init.d \
                 INC_USRLOCAL=${prefix} \
                 INC_MANDIR=share/man WERROR=''"
@@ -26,10 +29,29 @@ do_install () {
 	oe_runmake install
 }
 
+PACKAGES =+ "${PN}-examples ${PN}-test ${PN}-klips"
+
 FILES_${PN} = "${sysconfdir} ${libdir}/ipsec/* ${sbindir}/* ${libexecdir}/ipsec/*"
 FILES_${PN}-dbg += "${libdir}/ipsec/.debug ${libexecdir}/ipsec/.debug"
 
 CONFFILES_${PN} = "${sysconfdir}/ipsec/ipsec.conf"
 
+FILES_${PN}-examples = "${sysconfdir}/ipsec.d/examples"
+
+# KLIPS requires some binaries and scripts that NETKEY users don't need.
+FILES_${PN}-klips = " \
+        ${libexecdir}/ipsec/eroute \
+        ${libexecdir}/ipsec/klipsdebug \
+        ${libexecdir}/ipsec/spi \
+        ${libexecdir}/ipsec/spigrp \
+        ${libexecdir}/ipsec/tncfg \
+        ${libdir}/ipsec/_updown.klips \
+"
+
+FILES_${PN}-test = " \
+        ${libexecdir}/ipsec/showpolicy \
+        ${libexecdir}/ipsec/verify \
+"
+
 SRC_URI[md5sum] = "1f508adf9d0be4f34c003b833d8fce4a"
 SRC_URI[sha256sum] = "bddd2ca79fec2326a69904b59df15753e59b1bf02882416b19507516e9cfcc21"
-- 
1.7.0.4



