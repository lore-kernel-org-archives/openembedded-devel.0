Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B691B60119
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Aug 2016 03:24:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7F3O6ic006525
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 14 Aug 2016 20:24:06 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 14 Aug 2016 20:24:05 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 Aug 2016 11:23:14 +0800
Message-ID: <20160815032314.18573-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.9.2.368.g08bb350
MIME-Version: 1.0
Subject: [meta-networking][PATCH] quagga: 0.99.24.1 -> 1.0.20160315
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
X-List-Received-Date: Mon, 15 Aug 2016 03:24:06 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade quagga from 0.99.24.1 to 1.0.20160315.

* babeld was removed from quagga, so remove babeld related code, service
  file and patch and from recipe
* remove Zebra-sync-zebra-routing-table-with-the-kernel-one.patch which
  is obsoleted that quagga update the logic, see
  https://github.com/Quagga/quagga/commit/0abf6796c3d8ae8f5ea8624668424bc1554de25e
* remove configure options '--enable-ospf-te' and '--enable-opaque-lsa'
  which are set by default and removed from configure.ac already

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 ...c-zebra-routing-table-with-the-kernel-one.patch | 48 ---------------------
 ...ose-the-stdout-stderr-as-in-other-daemons.patch | 50 ----------------------
 .../recipes-protocols/quagga/files/babeld.service  | 14 ------
 .../recipes-protocols/quagga/quagga.inc            | 23 +++-------
 .../recipes-protocols/quagga/quagga_0.99.24.1.bb   | 10 -----
 .../quagga/quagga_1.0.20160315.bb                  | 10 +++++
 6 files changed, 16 insertions(+), 139 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/babeld.service
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb

diff --git a/meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch b/meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch
deleted file mode 100644
index 35f4637..0000000
--- a/meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-sync zebra routing table with the kernel one when interface is down
-
-Add router to kernel main router table with "ip", then you can see 
-a router item in kernel main router table. Also can see this router
-item in zebra router table. If down the interface, this router item
-will be deleted from kernel main router table, but it will not be 
-deleted from zebra router table, just set as inactive.
-
-This patch is adopted from [1].
-[1] http://www.gossamer-threads.com/lists/quagga/dev/22609
-
-Upstream-Status: Pending
-
-Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
-Signed-of-by: Roy.Li <rongqing.li@windriver.com>
-
----
- zebra/zebra_rib.c |    7 +++++++
- 1 files changed, 7 insertions(+), 0 deletions(-)
-
-diff --git a/zebra/zebra_rib.c b/zebra/zebra_rib.c
-index 154e8d5..63434d0 100644
---- a/zebra/zebra_rib.c
-+++ b/zebra/zebra_rib.c
-@@ -765,6 +765,9 @@ rib_match_ipv6 (struct in6_addr *addr)
- #define RIB_SYSTEM_ROUTE(R) \
-         ((R)->type == ZEBRA_ROUTE_KERNEL || (R)->type == ZEBRA_ROUTE_CONNECT)
- 
-+#define RIB_KERNEL_ROUTE(R) \
-+	((R)->type == ZEBRA_ROUTE_KERNEL)
-+
- /* This function verifies reachability of one given nexthop, which can be
-  * numbered or unnumbered, IPv4 or IPv6. The result is unconditionally stored
-  * in nexthop->flags field. If the 4th parameter, 'set', is non-zero,
-@@ -1135,6 +1138,10 @@ rib_process (struct route_node *rn)
-       redistribute_delete (&rn->p, fib);
-       if (! RIB_SYSTEM_ROUTE (fib))
- 	rib_uninstall_kernel (rn, fib);
-+#ifdef GNU_LINUX
-+      else if(RIB_KERNEL_ROUTE (fib) && !if_is_up(if_lookup_by_index(fib->nexthop->ifindex)))
-+	del=fib;
-+#endif
-       UNSET_FLAG (fib->flags, ZEBRA_FLAG_SELECTED);
- 
-       /* Set real nexthop. */
--- 
-1.7.4.1
-
diff --git a/meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch b/meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch
deleted file mode 100644
index c2757a2..0000000
--- a/meta-networking/recipes-protocols/quagga/files/babel-close-the-stdout-stderr-as-in-other-daemons.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ba71f768e6dbb1f2ac72ed3bd880bff75a48d345 Mon Sep 17 00:00:00 2001
-From: Roy Li <rongqing.li@windriver.com>
-Date: Wed, 19 Feb 2014 14:13:40 +0800
-Subject: [PATCH] babeld: close stdout once the background daemon is created
-
-Upstream-Status: pending
-
-Once babald becomes a background daemon, it should not output information to
-stdout, so need to close stdout.
-
-In fact, other daemons close their stdout when they run into background, like
-ospfd, isisd and bgpd, by calling daemon() which is in lib/daemon.c
-
-Closing the stdout can fix a tee hang issue { #/usr/sbin/babeld -d |tee tmp }
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- babeld/util.c |   10 +++++++++-
- 1 file changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/babeld/util.c b/babeld/util.c
-index 011f382..76203bc 100644
---- a/babeld/util.c
-+++ b/babeld/util.c
-@@ -425,7 +425,7 @@ uchar_to_in6addr(struct in6_addr *dest, const unsigned char *src)
- int
- daemonise()
- {
--    int rc;
-+    int rc, fd;
- 
-     fflush(stdout);
-     fflush(stderr);
-@@ -441,5 +441,13 @@ daemonise()
-     if(rc < 0)
-         return -1;
- 
-+    fd = open("/dev/null", O_RDWR, 0);
-+    if (fd != -1)
-+    {
-+        dup2(fd, STDOUT_FILENO);
-+        if (fd > 2)
-+            close(fd);
-+    }
-+
-     return 1;
- }
--- 
-1.7.10.4
-
diff --git a/meta-networking/recipes-protocols/quagga/files/babeld.service b/meta-networking/recipes-protocols/quagga/files/babeld.service
deleted file mode 100644
index dd344b0..0000000
--- a/meta-networking/recipes-protocols/quagga/files/babeld.service
+++ /dev/null
@@ -1,14 +0,0 @@
-[Unit]
-Description=Babel routing daemon
-BindTo=zebra.service
-After=zebra.service
-ConditionPathExists=@SYSCONFDIR@/quagga/babeld.conf
-
-[Service]
-Type=forking
-EnvironmentFile=-@SYSCONFDIR@/default/quagga
-ExecStart=@SBINDIR@/babeld -d $babeld_options -f /etc/quagga/babeld.conf
-Restart=on-abort
-
-[Install]
-WantedBy=multi-user.target
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 4244fdf..dc5f017 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -22,7 +22,6 @@ QUAGGASUBDIR = ""
 # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
 # versions and leave it empty for recent versions.
 SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
-           file://Zebra-sync-zebra-routing-table-with-the-kernel-one.patch \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
@@ -31,7 +30,6 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
            file://quagga.pam \
            file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
            file://quagga-Avoid-duplicate-connected-address.patch \
-           file://babeld.service \
            file://bgpd.service \
            file://isisd.service \
            file://ospf6d.service \
@@ -47,8 +45,7 @@ PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
 inherit autotools update-rc.d useradd systemd
 
-SYSTEMD_PACKAGES = "${PN} ${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
-SYSTEMD_SERVICE_${PN}-babeld = "babeld.service"
+SYSTEMD_PACKAGES = "${PN} ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 SYSTEMD_SERVICE_${PN}-bgpd = "bgpd.service"
 SYSTEMD_SERVICE_${PN}-isisd = "isisd.service"
 SYSTEMD_SERVICE_${PN}-ospf6d = "ospf6d.service"
@@ -63,8 +60,6 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 --enable-vtysh \
                 --enable-isisd \
                 ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '--enable-watchquagga', '--disable-watchquagga', d)} \
-                --enable-ospf-te \
-                --enable-opaque-lsa \
                 --enable-ospfclient=yes \
                 --enable-multipath=64 \
                 --enable-user=quagga \
@@ -88,11 +83,11 @@ do_install () {
     install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
 
     # Install sample configurations for the daemons
-    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do
+    for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
         install -m 0640 ${S}/$f/$f.conf.sample ${D}${sysconfdir}/quagga/$f.conf.sample
     done
 
-    for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do
+    for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
 	touch ${D}${sysconfdir}/quagga/$f.conf
     done
     chown quagga:quaggavty ${D}${sysconfdir}/quagga
@@ -138,7 +133,7 @@ do_install () {
     fi
 
     install -d ${D}${systemd_unitdir}/system
-    for i in babeld bgpd isisd ospf6d ospfd ripd ripngd zebra; do
+    for i in bgpd isisd ospf6d ospfd ripd ripngd zebra; do
         install -m 0644 ${WORKDIR}/$i.service ${D}${systemd_unitdir}/system
     done
     sed -e 's,@BASE_SBINDIR@,${base_sbindir},g' \
@@ -160,15 +155,14 @@ pkg_postinst_${PN} () {
 }
 
 # Split into a main package and separate per-protocol packages
-PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-babeld ${PN}-bgpd \
+PACKAGE_BEFORE_PN = "${PN}-ospfd ${PN}-ospf6d ${PN}-bgpd \
                      ${PN}-ripd ${PN}-ripngd ${PN}-isisd \
                      ${PN}-ospfclient ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${PN}-watchquagga', '', d)}"
 
-RDEPENDS_${PN} += "${PN}-babeld ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
+RDEPENDS_${PN} += "${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 
 FILES_${PN}-ospfd       = "${sbindir}/ospfd ${libdir}/libospf.so.*"
 FILES_${PN}-ospf6d      = "${sbindir}/ospf6d"
-FILES_${PN}-babeld      = "${sbindir}/babeld"
 FILES_${PN}-bgpd        = "${sbindir}/bgpd"
 FILES_${PN}-ripd        = "${sbindir}/ripd"
 FILES_${PN}-ripngd      = "${sbindir}/ripngd"
@@ -181,7 +175,6 @@ FILES_${PN}-watchquagga = "${sbindir}/watchquagga ${sysconfdir}/default/watchqua
 CONFFILES_${PN} = "${sysconfdir}/default/quagga \
                    ${sysconfdir}/quagga/bgpd.conf \
                    ${sysconfdir}/quagga/vtysh.conf \
-                   ${sysconfdir}/quagga/babeld.conf \
                    ${sysconfdir}/quagga/isisd.conf \
                    ${sysconfdir}/quagga/ospfd.conf \
                    ${sysconfdir}/quagga/ripngd.conf \
@@ -230,10 +223,6 @@ pkg_prerm_${PN}-ospf6d () {
     ${sysconfdir}/init.d/quagga stop ospf6d
 }
 
-pkg_prerm_${PN}-babeld () {
-    ${sysconfdir}/init.d/quagga stop babeld
-}
-
 pkg_prerm_${PN}-bgpd () {
     ${sysconfdir}/init.d/quagga stop bgpd
 }
diff --git a/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb b/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
deleted file mode 100644
index cecf438..0000000
--- a/meta-networking/recipes-protocols/quagga/quagga_0.99.24.1.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require quagga.inc
-
-SRC_URI += "file://babel-close-the-stdout-stderr-as-in-other-daemons.patch \
-            file://0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch \
-"
-
-SRC_URI[md5sum] = "7986bdc2fe6027d4c9216f7f5791e718"
-SRC_URI[sha256sum] = "84ae1a47df085119a8fcab6c43ccea9efb9bc3112388b1dece5a9f0a0262754f"
-
-QUAGGASUBDIR = ""
diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb b/meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb
new file mode 100644
index 0000000..d165781
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb
@@ -0,0 +1,10 @@
+require quagga.inc
+
+SRC_URI += " \
+            file://0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch \
+"
+
+SRC_URI[md5sum] = "e73d6e527fb80240f180de420cfe8042"
+SRC_URI[sha256sum] = "21ffb7bad0ef5f130f18dd299d219ea1cb4f5c03d473b6b32c83c340cd853263"
+
+QUAGGASUBDIR = ""
-- 
2.9.2.368.g08bb350


