Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 659246017E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:48:37 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.14.5/8.14.5) with ESMTP id
	sBUImaK1025059; Tue, 30 Dec 2014 12:48:36 -0600
Received: from bshelton-desktop.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014123012483687-1524144 ;
	Tue, 30 Dec 2014 12:48:36 -0600 
From: Ben Shelton <ben.shelton@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Dec 2014 12:48:11 -0600
Message-Id: <1419965292-10709-2-git-send-email-ben.shelton@ni.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <1419965292-10709-1-git-send-email-ben.shelton@ni.com>
References: <1419965292-10709-1-git-send-email-ben.shelton@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/30/2014 12:48:36 PM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 12/30/2014 12:48:36 PM,
	Serialize complete at 12/30/2014 12:48:36 PM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.13.68, 1.0.33,
	0.0.0000
	definitions=2014-12-30_08:2014-12-30, 2014-12-30,
	1970-01-01 signatures=0
Cc: Guy Morand <guy.morand@netmodule.com>, Guy Morand <morandg@gmail.com>
Subject: [meta-oe][PATCH 1/2] iperf3: Adds git and 3.0.8 version
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
X-List-Received-Date: Tue, 30 Dec 2014 18:48:38 -0000

From: Guy Morand <morandg@gmail.com>

iperf3 is the new successor of iperf. The project is now mature enough as it
started in 2009 and has stable releases. It supports reporting results in the
portable JSON format, provides more information than iperf does and also adds
some features from other tools such as nuttcp and netperf but were missing from
the original iperf.

Signed-off-by: Guy Morand <guy.morand@netmodule.com>
Signed-off-by: Ben Shelton <ben.shelton@ni.com>
Acked-by: Ken Sharp <ken.sharp@ni.com>
---
Natinst-ReviewBoard-ID: 85589
---
 meta-oe/recipes-benchmark/iperf3/iperf3.inc      | 20 ++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb |  6 ++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb   |  7 +++++++
 3 files changed, 33 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3.inc
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3.inc b/meta-oe/recipes-benchmark/iperf3/iperf3.inc
new file mode 100644
index 0000000..029a144
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3.inc
@@ -0,0 +1,20 @@
+SUMMARY = "Network benchmark tool"
+DESCRIPTION = \
+"iperf is a tool for active measurements of the maximum achievable bandwidth \
+on IP networks. It supports tuning of various parameters related to timing, \
+protocols, and buffers. For each test it reports the bandwidth, loss, and \
+other parameters."
+HOMEPAGE = "http://software.es.net/iperf/"
+SECTION = "console/network"
+BUGTRACKER = "https://github.com/esnet/iperf/issues"
+AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
+LICENSE = "BSD"
+
+BRANCH = "master"
+SRC_URI = "\
+           git://github.com/esnet/iperf.git;branch=${BRANCH} \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
new file mode 100644
index 0000000..a39deff
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb
@@ -0,0 +1,6 @@
+require iperf3.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=ab59a0c3a4bc3954d1ece68ea19d77a4"
+
+BRANCH = "3.0-STABLE"
+SRCREV = "24d5cdec3731bc589f6cb7c359d8311dcaa41854"
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
new file mode 100644
index 0000000..77ebe15
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
@@ -0,0 +1,7 @@
+require iperf3.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=062ab1bc33fae1926387ac1274cb0873"
+
+PV = "3.0.8+git${SRCPV}"
+SRCREV = "${AUTOREV}"
+
-- 
2.2.1


