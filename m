Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 113EF6E650
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Dec 2016 06:11:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBT6Bq0d022851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Dec 2016 22:11:54 -0800 (PST)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 28 Dec 2016 22:11:52 -0800
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 29 Dec 2016 14:11:23 +0800
Message-ID: <1482991883-9667-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-networking][PATCH] quagga: update to 1.1.0
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
X-List-Received-Date: Thu, 29 Dec 2016 06:11:54 -0000
Content-Type: text/plain

* remove the following 3 patches which already fixed in upstream:
  0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
  quagga-Avoid-duplicate-connected-address.patch
  ripd-fix-two-bugs-after-received-SIGHUP.patch

* inherit pkgconfig to fix configure errors:
  | configure.ac:97: error: possibly undefined macro: AC_MSG_RESULT
  |   If this token and others are legitimate, please use m4_pattern_allow.
  |   See the Autoconf documentation.

* add user quagga to quaggavty supplementary group to fix startup error:
  Starting Quagga daemons: zebra
  privs_init: user(quagga) is not part of vty group specified(quaggavty)

* remove babeld related code from initscript becasue it had been removed
  from quagga

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...heck-ospf6-before-using-it-in-ospf6_clean.patch | 28 -----------
 .../quagga-Avoid-duplicate-connected-address.patch | 54 ----------------------
 .../recipes-protocols/quagga/files/quagga.default  |  1 -
 .../recipes-protocols/quagga/files/quagga.init     |  2 +-
 .../ripd-fix-two-bugs-after-received-SIGHUP.patch  | 50 --------------------
 .../recipes-protocols/quagga/quagga.inc            |  6 +--
 .../quagga/quagga_1.0.20160315.bb                  | 10 ----
 .../recipes-protocols/quagga/quagga_1.1.0.bb       |  6 +++
 8 files changed, 9 insertions(+), 148 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
 delete mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb
 create mode 100644 meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb

diff --git a/meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch b/meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
deleted file mode 100644
index f08bb57..0000000
--- a/meta-networking/recipes-protocols/quagga/files/0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-Upstream-Status: Pending
-
-Subject: ospf6d: check ospf6 before using it in ospf6_clean
-
-The ospf6 variable might be 'NULL' causing segment fault error.
-Check it before referencing it.
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- ospf6d/ospf6d.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/ospf6d/ospf6d.c b/ospf6d/ospf6d.c
-index 3cdd5c1..e3bf1af 100644
---- a/ospf6d/ospf6d.c
-+++ b/ospf6d/ospf6d.c
-@@ -1892,6 +1892,8 @@ ospf6_init (void)
- void
- ospf6_clean (void)
- {
-+  if (ospf6 == NULL)
-+    return;
-   if (ospf6->route_table)
-     ospf6_route_remove_all (ospf6->route_table);
-   if (ospf6->brouter_table)
--- 
-1.9.1
-
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch b/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch
deleted file mode 100644
index a07e33f..0000000
--- a/meta-networking/recipes-protocols/quagga/files/quagga-Avoid-duplicate-connected-address.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-quagga: Avoid duplicate connected address adding to the list
-
-commit 27ba970b9("quagga/ripd: Fix two bugs after received SIGHUP signal")
-introduces an regression: ifp->connected list is cleaned up when ripd is
-restarting, however, for interface addresses which are not specified in
-ripd configuration file, they are never to be added into ifp->connected
-again, this will lead to some abnormal behavior for route advertising.
-
-Instead of cleaning up the ifp->connected list to avoid duplicated
-connected address being added into this list, we can check this
-condition during interface address adding process and return early
-when an identical address has already been added.
-
-Upstream-Status: Pending
-
-Signed-off-by: Hu Yadi <Yadi.hu@windriver.com>
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
-Signed-off-by: Joe MacDonald <joe@deserted.net>
----
---- a/lib/if.c
-+++ b/lib/if.c
-@@ -738,6 +738,16 @@ connected_add_by_prefix (struct interfac
-                          struct prefix *destination)
- {
-   struct connected *ifc;
-+  struct listnode *cnode;
-+  struct connected *c;
-+  int ret = 0;
-+
-+  for (ALL_LIST_ELEMENTS_RO (ifp->connected, cnode, c))
-+    {
-+      ret = connected_same_prefix (p, (c->address));
-+      if(ret == 1)
-+        return NULL;
-+    }
- 
-   /* Allocate new connected address. */
-   ifc = connected_new ();
---- a/ripd/rip_interface.c
-+++ b/ripd/rip_interface.c
-@@ -516,13 +516,6 @@ rip_interface_clean (void)
- 	  thread_cancel (ri->t_wakeup);
- 	  ri->t_wakeup = NULL;
- 	}
--
--      for (conn_node = listhead (ifp->connected); conn_node; conn_node = next)
--        {
--          ifc = listgetdata (conn_node);
--          next = conn_node->next;
--          listnode_delete (ifp->connected, ifc);
--        }
-     }
- }
- 
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.default b/meta-networking/recipes-protocols/quagga/files/quagga.default
index 0c1ce6c..4c4bc23 100644
--- a/meta-networking/recipes-protocols/quagga/files/quagga.default
+++ b/meta-networking/recipes-protocols/quagga/files/quagga.default
@@ -4,7 +4,6 @@ vtysh_enable=yes
 
 # Bind all daemons to loopback only by default
 zebra_options=" --daemon -A 127.0.0.1"
-babeld_options="--daemon -A 127.0.0.1"
 bgpd_options="  --daemon -A 127.0.0.1"
 ospfd_options=" --daemon -A 127.0.0.1"
 ospf6d_options="--daemon -A ::1"
diff --git a/meta-networking/recipes-protocols/quagga/files/quagga.init b/meta-networking/recipes-protocols/quagga/files/quagga.init
index 60b5ab0..df1beb7 100644
--- a/meta-networking/recipes-protocols/quagga/files/quagga.init
+++ b/meta-networking/recipes-protocols/quagga/files/quagga.init
@@ -26,7 +26,7 @@ D_PATH=/usr/sbin
 C_PATH=/etc/quagga
 
 # Keep zebra first and do not list watchquagga!
-DAEMONS="zebra bgpd ripd ripngd ospfd ospf6d isisd babeld"
+DAEMONS="zebra bgpd ripd ripngd ospfd ospf6d isisd"
 
 # Print the name of the pidfile.
 pidfile()
diff --git a/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch b/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
deleted file mode 100644
index 4b8c9a9..0000000
--- a/meta-networking/recipes-protocols/quagga/files/ripd-fix-two-bugs-after-received-SIGHUP.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-ripd: Fix two bugs after received SIGHUP signal
-
-There are two problems for ripd implementation after received
-SIGHUP signal:
-1). ripd didn't clean up ifp->connected list before reload
-    configuration file.
-2). ripd reset ri->split_horizon flag to RIP_NO_SPLIT_HORIZON
-    which lead to the unnecessary route to be advertised.
-
-Upstream-Status: Submitted [http://patchwork.diac24.net/patch/604/]
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
-Signed-off-by: Joe MacDonald <joe@deserted.net>
----
---- a/ripd/rip_interface.c
-+++ b/ripd/rip_interface.c
-@@ -500,6 +500,8 @@
-   struct listnode *node;
-   struct interface *ifp;
-   struct rip_interface *ri;
-+  struct connected *ifc;
-+  struct listnode *conn_node, *next;
- 
-   for (ALL_LIST_ELEMENTS_RO (iflist, node, ifp))
-     {
-@@ -514,6 +516,13 @@
- 	  thread_cancel (ri->t_wakeup);
- 	  ri->t_wakeup = NULL;
- 	}
-+
-+      for (conn_node = listhead (ifp->connected); conn_node; conn_node = next)
-+        {
-+          ifc = listgetdata (conn_node);
-+          next = conn_node->next;
-+          listnode_delete (ifp->connected, ifc);
-+        }
-     }
- }
- 
-@@ -548,8 +557,8 @@
- 	  ri->key_chain = NULL;
- 	}
- 
--      ri->split_horizon = RIP_NO_SPLIT_HORIZON;
--      ri->split_horizon_default = RIP_NO_SPLIT_HORIZON;
-+      ri->split_horizon = RIP_SPLIT_HORIZON;
-+      ri->split_horizon_default = RIP_SPLIT_HORIZON;
- 
-       ri->list[RIP_FILTER_IN] = NULL;
-       ri->list[RIP_FILTER_OUT] = NULL;
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index ae08a2d..bf0b89e 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -28,8 +28,6 @@ SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz; \
            file://watchquagga.default \
            file://volatiles.03_quagga \
            file://quagga.pam \
-           file://ripd-fix-two-bugs-after-received-SIGHUP.patch \
-           file://quagga-Avoid-duplicate-connected-address.patch \
            file://bgpd.service \
            file://isisd.service \
            file://ospf6d.service \
@@ -43,7 +41,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}
 PACKAGECONFIG[cap] = "--enable-capabilities,--disable-capabilities,libcap"
 PACKAGECONFIG[pam] = "--with-libpam, --without-libpam, libpam"
 
-inherit autotools update-rc.d useradd systemd
+inherit autotools update-rc.d useradd systemd pkgconfig
 
 SYSTEMD_PACKAGES = "${PN} ${PN}-bgpd ${PN}-isisd ${PN}-ospf6d ${PN}-ospfd ${PN}-ripd ${PN}-ripngd"
 SYSTEMD_SERVICE_${PN}-bgpd = "bgpd.service"
@@ -202,7 +200,7 @@ INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"
 # Add quagga's user and group
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system quagga ; --system quaggavty"
-USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga --shell /bin/false quagga"
+USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga -G quaggavty --shell /bin/false quagga"
 
 pkg_postinst_${PN} () {
     if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb b/meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb
deleted file mode 100644
index d165781..0000000
--- a/meta-networking/recipes-protocols/quagga/quagga_1.0.20160315.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require quagga.inc
-
-SRC_URI += " \
-            file://0001-ospf6d-check-ospf6-before-using-it-in-ospf6_clean.patch \
-"
-
-SRC_URI[md5sum] = "e73d6e527fb80240f180de420cfe8042"
-SRC_URI[sha256sum] = "21ffb7bad0ef5f130f18dd299d219ea1cb4f5c03d473b6b32c83c340cd853263"
-
-QUAGGASUBDIR = ""
diff --git a/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb b/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
new file mode 100644
index 0000000..1b5c34c
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/quagga_1.1.0.bb
@@ -0,0 +1,6 @@
+require quagga.inc
+
+SRC_URI[md5sum] = "daa303871e07ea5856aae6fd79e89722"
+SRC_URI[sha256sum] = "f7a43a9c59bfd3722002210530b2553c8d5cc05bfea5acd56d4f102b9f55dc63"
+
+QUAGGASUBDIR = ""
-- 
2.7.4


