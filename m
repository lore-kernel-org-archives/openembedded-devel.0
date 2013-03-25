Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1UK9c3-0002iV-5W
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 16:47:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2PFU7fF011688
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 08:30:08 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 25 Mar 2013 08:30:07 -0700
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 25 Mar 2013 11:30:07 -0400
Message-ID: <1364225407-13263-3-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1364225407-13263-1-git-send-email-aws.ismail@windriver.com>
References: <1364225407-13263-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 2/2] Quagga: clean up whitespaces/hardtabs in recipe
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
X-List-Received-Date: Mon, 25 Mar 2013 15:47:23 -0000
Content-Type: text/plain

Minor clean-up for some places where whitespaces
and hardtabs stil existed.

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
---
 .../recipes-protocols/quagga/quagga.inc            |   60 ++++++++++----------
 1 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 9a70d18..b40c858 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -52,32 +52,32 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 ${SNMP_CONF}"
 
 do_install () {
-        # Install init script and default settings
-        install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d \
-                           ${D}${sysconfdir}/quagga ${D}${sysconfdir}/default/volatiles
-        install -m 0644 ${WORKDIR}/quagga.default ${D}${sysconfdir}/default/quagga
-        install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
-        install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
-        install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
-        install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
-
-        # Install sample configurations for the daemons
-        for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do
-            install -m 0640 ${S}/$f/$f.conf.sample ${D}${sysconfdir}/quagga/$f.conf.sample
-        done
-
-        # Install quagga
-        oe_runmake install DESTDIR=${D} prefix=${prefix} \
-                sbindir=${sbindir} \
-                sysconfdir=${sysconfdir}/quagga \
-                localstatedir=${localstatedir}/run/quagga
-
-	# Fix hardcoded paths
-	sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
-	sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
-	sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
-	sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
-	sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
+    # Install init script and default settings
+    install -m 0755 -d ${D}${sysconfdir}/default ${D}${sysconfdir}/init.d \
+    ${D}${sysconfdir}/quagga ${D}${sysconfdir}/default/volatiles
+    install -m 0644 ${WORKDIR}/quagga.default ${D}${sysconfdir}/default/quagga
+    install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
+    install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
+    install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
+    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
+
+    # Install sample configurations for the daemons
+    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do
+        install -m 0640 ${S}/$f/$f.conf.sample ${D}${sysconfdir}/quagga/$f.conf.sample
+    done
+
+    # Install quagga
+    oe_runmake install DESTDIR=${D} prefix=${prefix} \
+            sbindir=${sbindir} \
+            sysconfdir=${sysconfdir}/quagga \
+            localstatedir=${localstatedir}/run/quagga
+
+    # Fix hardcoded paths
+    sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
+    sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
+    sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
+    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
+    sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
 }
 
 # Split into a main package and separate per-protocol packages
@@ -125,10 +125,10 @@ pkg_postinst_${PN} () {
         exit 1
     fi
     for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
-	chown quagga:quaggavty ${sysconfdir}/quagga
-	chown quagga:quagga ${sysconfdir}/quagga/*.conf
-	chmod 750 ${sysconfdir}/quagga
-	chown 640 ${sysconfdir}/quagga/*.conf
+    chown quagga:quaggavty ${sysconfdir}/quagga
+    chown quagga:quagga ${sysconfdir}/quagga/*.conf
+    chmod 750 ${sysconfdir}/quagga
+    chown 640 ${sysconfdir}/quagga/*.conf
     if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
         ${sysconfdir}/init.d/populate-volatile.sh update
     fi
-- 
1.7.0.4



