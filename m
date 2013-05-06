Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1UZQ6w-0008L2-LW
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 20:26:14 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r46I86kI027674
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 6 May 2013 11:08:06 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 6 May 2013 11:08:06 -0700
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 6 May 2013 14:06:49 -0400
Message-ID: <1367863609-18196-2-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1367863609-18196-1-git-send-email-aws.ismail@windriver.com>
References: <1367863609-18196-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 1/1] Quagga: sync zebra routing table with the kernel one
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
X-List-Received-Date: Mon, 06 May 2013 18:26:29 -0000
Content-Type: text/plain

When interface goes down, and there are some static routes that are
made with ip route, they are going to be deleted from kernel fib.
That's what kernel does by default. But they are not going to be
deleted from zebra's fib. They will be declared inactive.

This issue was originally discussed in [1] and a patch was proposed.

[1] http://www.gossamer-threads.com/lists/quagga/dev/22609

Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
---
 ...c-zebra-routing-table-with-the-kernel-one.patch |   48 ++++++++++++++++++++
 .../recipes-protocols/quagga/quagga.inc            |    3 +-
 2 files changed, 50 insertions(+), 1 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch

diff --git a/meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch b/meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch
new file mode 100644
index 0000000..35f4637
--- /dev/null
+++ b/meta-networking/recipes-protocols/quagga/files/Zebra-sync-zebra-routing-table-with-the-kernel-one.patch
@@ -0,0 +1,48 @@
+sync zebra routing table with the kernel one when interface is down
+
+Add router to kernel main router table with "ip", then you can see 
+a router item in kernel main router table. Also can see this router
+item in zebra router table. If down the interface, this router item
+will be deleted from kernel main router table, but it will not be 
+deleted from zebra router table, just set as inactive.
+
+This patch is adopted from [1].
+[1] http://www.gossamer-threads.com/lists/quagga/dev/22609
+
+Upstream-Status: Pending
+
+Signed-of-by: Aws Ismail <aws.ismail@windriver.com>
+Signed-of-by: Roy.Li <rongqing.li@windriver.com>
+
+---
+ zebra/zebra_rib.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/zebra/zebra_rib.c b/zebra/zebra_rib.c
+index 154e8d5..63434d0 100644
+--- a/zebra/zebra_rib.c
++++ b/zebra/zebra_rib.c
+@@ -765,6 +765,9 @@ rib_match_ipv6 (struct in6_addr *addr)
+ #define RIB_SYSTEM_ROUTE(R) \
+         ((R)->type == ZEBRA_ROUTE_KERNEL || (R)->type == ZEBRA_ROUTE_CONNECT)
+ 
++#define RIB_KERNEL_ROUTE(R) \
++	((R)->type == ZEBRA_ROUTE_KERNEL)
++
+ /* This function verifies reachability of one given nexthop, which can be
+  * numbered or unnumbered, IPv4 or IPv6. The result is unconditionally stored
+  * in nexthop->flags field. If the 4th parameter, 'set', is non-zero,
+@@ -1135,6 +1138,10 @@ rib_process (struct route_node *rn)
+       redistribute_delete (&rn->p, fib);
+       if (! RIB_SYSTEM_ROUTE (fib))
+ 	rib_uninstall_kernel (rn, fib);
++#ifdef GNU_LINUX
++      else if(RIB_KERNEL_ROUTE (fib) && !if_is_up(if_lookup_by_index(fib->nexthop->ifindex)))
++	del=fib;
++#endif
+       UNSET_FLAG (fib->flags, ZEBRA_FLAG_SELECTED);
+ 
+       /* Set real nexthop. */
+-- 
+1.7.4.1
+
diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 160c458..f9a32a9 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -15,7 +15,7 @@ SNMP_CONF="${@base_contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '', d)}"
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 QUAGGASUBDIR = ""
 # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
@@ -23,6 +23,7 @@ QUAGGASUBDIR = ""
 SRC_URI = "http://download.savannah.gnu.org/releases/quagga${QUAGGASUBDIR}/quagga-${PV}.tar.gz;name=quagga-${PV} \
            file://fix-for-lib-inpath.patch \
            file://quagga-0.99.17-libcap.patch \
+           file://Zebra-sync-zebra-routing-table-with-the-kernel-one.patch \
            file://quagga.init \
            file://quagga.default \
            file://watchquagga.init \
-- 
1.7.0.4



