Return-Path: <haris.okanovic@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0413B6B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Jan 2017 16:20:48 +0000 (UTC)
Received: from us-aus-exch2.ni.corp.natinst.com
	(us-aus-exch2.ni.corp.natinst.com [130.164.68.12])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTPS id
	v04GKmFg009910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Jan 2017 10:20:48 -0600
Received: from us-aus-exch4.ni.corp.natinst.com (130.164.68.14) by
	us-aus-exch2.ni.corp.natinst.com (130.164.68.12) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 4 Jan 2017 10:20:48 -0600
Received: from us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) by
	us-aus-exch4.ni.corp.natinst.com (130.164.68.14) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Wed, 4 Jan 2017 10:20:47 -0600
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub1.ni.corp.natinst.com (130.164.68.41) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Wed, 4 Jan 2017 10:20:48 -0600
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 4 Jan 2017 10:20:43 -0600
Message-ID: <20170104162043.15103-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.10.1
In-Reply-To: <CA+chaQc2H42_1M5Asu8XDJnRW=SWgWSjn=yGCaL4+vBbJ2DcvQ@mail.gmail.com>
References: <CA+chaQc2H42_1M5Asu8XDJnRW=SWgWSjn=yGCaL4+vBbJ2DcvQ@mail.gmail.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-01-04_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000
	definitions=main-1701040255
Cc: haris.okanovic@ni.com
Subject: [meta-oe][PATCH v3] hwloc: Add
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
X-List-Received-Date: Wed, 04 Jan 2017 16:20:49 -0000
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
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
new file mode 100644
index 0000000..1bf7a55
--- /dev/null
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Portable Hardware Locality (hwloc) software package"
+DESCRIPTION = "The Portable Hardware Locality (hwloc) software package \
+ provides a portable abstraction of the hierarchical topology of modern \
+ architectures."
+HOMEPAGE = "https://www.open-mpi.org/software/hwloc/"
+SECTION = "base"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3282e20dc3cec311deda3c6d4b1f990b"
+
+SRC_URI = "https://www.open-mpi.org/software/${PN}/v1.11/downloads/${BP}.tar.bz2"
+SRC_URI[md5sum] = "96c34136ff416d2b13a7821c27477bed"
+SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac90698782bb36e5504f4bac1bba2394ba14dbbad24"
+
+inherit autotools
+
+# Split hwloc library into separate subpackage
+PACKAGES_prepend = " lib${PN} "
+FILES_lib${PN} += "${libdir}/lib${PN}.so*"
+RDEPENDS_${PN} += "lib${PN} (= ${EXTENDPKGV})"
+
+# XXX dev-so QA check doesn't like soname symlinks in non-dev packages
+INSANE_SKIP_lib${PN} += "dev-so"
-- 
2.10.1


