Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 3038 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 22 Dec 2016 20:53:29 UTC
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 1832471975
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 20:53:29 +0000 (UTC)
Received: from us-aus-exhub1.ni.corp.natinst.com
	(us-aus-exhub1.ni.corp.natinst.com [130.164.68.41])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	uBMK2rjj017778
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:02:53 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Dec 2016 14:02:53 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Thu, 22 Dec 2016 14:02:52 -0600
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Thu, 22 Dec 2016 14:02:52 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 22 Dec 2016 14:02:50 -0600
Message-ID: <20161222200250.23273-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-12-22_16:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1612220323
Cc: haris.okanovic@ni.com
Subject: [PATCH] hwloc: Add
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
X-List-Received-Date: Thu, 22 Dec 2016 20:53:33 -0000
Content-Type: text/plain

https://www.open-mpi.org/projects/hwloc/

"The Portable Hardware Locality (hwloc) software package provides a
portable abstraction (across OS, versions, architectures, ...) of the
hierarchical topology of modern architectures, including NUMA memory
nodes, sockets, shared caches, cores and simultaneous multithreading.
It also gathers various system attributes such as cache and memory
information as well as the locality of I/O devices such as network
interfaces, InfiniBand HCAs or GPUs."

This recipe adds libhwloc and lstopo utility as two packages.

Testing: Built in OE/Krogoth. Installed to x86_64 machine. Successfully
ran `lstopo` and verified it printed correct CPU and cache info.

Signed-off-by: Haris Okanovic <haris.okanovic@ni.com>
---
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
new file mode 100644
index 0000000..3a88f5b
--- /dev/null
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -0,0 +1,25 @@
+SUMMARY = "The Portable Hardware Locality (hwloc) software package \
+ provides a portable abstraction of the hierarchical topology of modern \
+ architectures."
+HOMEPAGE = "https://www.open-mpi.org/software/hwloc/"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
+
+SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/downloads/${BP}.tar.bz2"
+SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
+
+inherit autotools
+
+# Split hwloc library into separate subpackage
+PACKAGES_prepend = "lib${PN}"
+FILES_lib${PN} += "${libdir}/lib${PN}.so*"
+${PN}_RDEPENDS += "lib${PN}"
+
+do_install_append() {
+    # Let ldconfig do it's thing, no need for these symlinks
+    test -L "${D}${libdir}/lib${PN}.so.5"
+    test -L "${D}${libdir}/lib${PN}.so"
+    rm "${D}${libdir}/lib${PN}.so.5"
+    rm "${D}${libdir}/lib${PN}.so"
+}
-- 
2.10.1


