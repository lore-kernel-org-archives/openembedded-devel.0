Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA2EE6D257
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2013 06:28:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9V6Spx0010924
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 30 Oct 2013 23:28:51 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 30 Oct 2013 23:28:50 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2013 14:29:44 +0800
Message-ID: <1383200986-18674-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
References: <1383200986-18674-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 3/5] quagga: fix pkg_postinst
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
X-List-Received-Date: Thu, 31 Oct 2013 06:28:51 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch mainly involves two changes.
1. Create necessary files at do_install task. Add these configuration
   files to the CONFFILES variable.
2. Move the `chmod' and `chown' commands to do_install task.

After these two changes, qugga can run successfully at rootfs time.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../recipes-protocols/quagga/quagga.inc            |   28 +++++++++++++-------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 8720876..196bd30 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -73,6 +73,14 @@ do_install () {
         install -m 0640 ${S}/$f/$f.conf.sample ${D}${sysconfdir}/quagga/$f.conf.sample
     done
 
+    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do
+	touch ${D}${sysconfdir}/quagga/$f.conf
+    done
+    chown quagga:quaggavty ${D}${sysconfdir}/quagga
+    chown quagga:quagga ${D}${sysconfdir}/quagga/*.conf
+    chmod 750 ${D}${sysconfdir}/quagga
+    chmod 640 ${D}${sysconfdir}/quagga/*.conf
+
     # Install quagga
     oe_runmake install DESTDIR=${D} prefix=${prefix} \
             sbindir=${sbindir} \
@@ -108,7 +116,17 @@ FILES_${PN}-watchquagga = "${sbindir}/watchquagga ${sysconfdir}/default/watchqua
                            ${sysconfdir}/init.d/watchquagga"
 
 # Indicate that the default files are configuration files
-CONFFILES_${PN} = "${sysconfdir}/default/quagga"
+CONFFILES_${PN} = "${sysconfdir}/default/quagga \
+                   ${sysconfdir}/quagga/bgpd.conf \
+                   ${sysconfdir}/quagga/vtysh.conf \
+                   ${sysconfdir}/quagga/babeld.conf \
+                   ${sysconfdir}/quagga/isisd.conf \
+                   ${sysconfdir}/quagga/ospfd.conf \
+                   ${sysconfdir}/quagga/ripngd.conf \
+                   ${sysconfdir}/quagga/zebra.conf \
+                   ${sysconfdir}/quagga/ripd.conf \
+                   ${sysconfdir}/quagga/ospf6d.conf \
+                  "
 CONFFILES_${PN}-watchquagga = "${sysconfdir}/default/watchquagga"
 
 # Stop the names being rewritten due to the internal shared libraries
@@ -132,14 +150,6 @@ GROUPADD_PARAM_${PN} = "--system quagga ; --system quaggavty"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga quagga"
 
 pkg_postinst_${PN} () {
-    if [ "x$D" != "x" ] ; then
-        exit 1
-    fi
-    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
-    chown quagga:quaggavty ${sysconfdir}/quagga
-    chown quagga:quagga ${sysconfdir}/quagga/*.conf
-    chmod 750 ${sysconfdir}/quagga
-    chmod 640 ${sysconfdir}/quagga/*.conf
     if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
         ${sysconfdir}/init.d/populate-volatile.sh update
     fi
-- 
1.7.9.5


