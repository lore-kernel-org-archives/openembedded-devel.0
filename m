Return-Path: <haris.okanovic@ni.com>
X-Greylist: delayed 2620 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 May 2017 17:01:10 UTC
Received: from mx0b-00010702.pphosted.com (mx0a-00010702.pphosted.com
	[148.163.156.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4EAD47809D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 May 2017 17:01:10 +0000 (UTC)
Received: from pps.filterd (m0098781.ppops.net [127.0.0.1])
	by mx0a-00010702.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
	v4JGFmWL023157; Fri, 19 May 2017 11:17:29 -0500
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mx0a-00010702.pphosted.com with ESMTP id 2aj3he84dv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Fri, 19 May 2017 11:17:29 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com
	(us-aus-exhub2.ni.corp.natinst.com [130.164.68.32])
	by us-aus-skprod3.natinst.com (8.16.0.17/8.16.0.17) with ESMTPS id
	v4JGHRnh018485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2017 11:17:28 -0500
Received: from us-aus-exch3.ni.corp.natinst.com (130.164.68.13) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 19 May 2017 11:17:25 -0500
Received: from us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) by
	us-aus-exch3.ni.corp.natinst.com (130.164.68.13) with Microsoft SMTP
	Server (TLS) id 15.0.1156.6; Fri, 19 May 2017 11:17:25 -0500
Received: from harisdt.amer.corp.natinst.com (130.164.49.7) by
	us-aus-exhub2.ni.corp.natinst.com (130.164.68.32) with Microsoft SMTP
	Server
	id 15.0.1156.6 via Frontend Transport; Fri, 19 May 2017 11:17:25 -0500
From: Haris Okanovic <haris.okanovic@ni.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 19 May 2017 11:17:23 -0500
Message-ID: <20170519161723.32426-1-haris.okanovic@ni.com>
X-Mailer: git-send-email 2.12.1
In-Reply-To: <20161222200250.23273-1-haris.okanovic@ni.com>
References: <20161222200250.23273-1-haris.okanovic@ni.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-05-19_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=4 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0
	adultscore=0
	classifier=spam adjust=30 reason=mlx scancount=1
	engine=8.0.1-1703280000 definitions=main-1705190102
Cc: haris.okanovic@ni.com, clarson@kergoth.com
Subject: [PATCH v4] hwloc: Add
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
X-List-Received-Date: Fri, 19 May 2017 17:01:11 -0000
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
 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb

diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
new file mode 100644
index 000000000..e067f2799
--- /dev/null
+++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
@@ -0,0 +1,26 @@
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
+DEPENDS += "cairo ncurses udev libxml2 zlib libpciaccess"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'virtual/libx11', '', d)}"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
+
+# Split hwloc library into separate subpackage
+PACKAGES_prepend = " lib${PN} "
+FILES_lib${PN} += "${libdir}/lib${PN}.so*"
+RDEPENDS_${PN} += "lib${PN} (= ${EXTENDPKGV})"
+
+# XXX dev-so QA check doesn't like soname symlinks in non-dev packages
+INSANE_SKIP_lib${PN} += "dev-so"
-- 
2.12.1


