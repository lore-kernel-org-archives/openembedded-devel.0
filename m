Return-Path: <morandg@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC9B7139A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Oct 2014 14:07:56 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id m15so9294956wgh.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Oct 2014 07:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=YOh8imSDn4hMiDWGpmzwgXcZLn0QTRQ1JT7wQ2PuHSU=;
	b=dyILKhxyYlogrKxQyT2iHBVwm70k2lT0WwTRaDQeBcDeHDYixIe9kWv5WHhwTdFIbR
	H5DWD/R89kw1lgsnbUCngaWYNYoqUAKuQeoXnB4g/VLUi8rWiH6/tHyyePDxniY9fp9x
	4BkHRiHwo0atnWrk+he82I1wzBudFlaE0J94SSrwbxnEq87ViSLWSWRfi9p13/lbJ+2W
	eeu3BGFeVusStFo9e5teYOjrS8bWmJHOYzY/E8xZNNSG/FZRafGwL0/LPkkmXqKI0XD3
	LZ1HpGQtdncY8o/+eL/LA23V2FrbKie3C47M5GWitTPonF/wO2rOiRYaSfSCttx1Rm2H
	vX/w==
X-Received: by 10.194.95.234 with SMTP id dn10mr5215630wjb.73.1412690877032;
	Tue, 07 Oct 2014 07:07:57 -0700 (PDT)
Received: from treme.netmodule.intranet
	(68.255.200.213.static.wline.lns.sme.cust.swisscom.ch.
	[213.200.255.68])
	by mx.google.com with ESMTPSA id d6sm14898946wiz.0.2014.10.07.07.07.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Oct 2014 07:07:56 -0700 (PDT)
From: Guy Morand <morandg@gmail.com>
X-Google-Original-From: Guy Morand <guy.morand@netmodule.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Oct 2014 16:08:24 +0200
Message-Id: <1412690904-15774-1-git-send-email-guy.morand@netmodule.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Guy Morand <guy.morand@netmodule.com>
Subject: [meta-oe][PATCH] iperf3: Adds git and 3.0.8 version
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
X-List-Received-Date: Tue, 07 Oct 2014 14:08:03 -0000

iperf3 is the new successor of iperf. The project is now mature enough as it
started in 2009 and has stable releases. It supports reporting results in the
portable JSON format, provides more information than iperf does and also adds
some features from other tools such as nuttcp and netperf but were missing from
the original iperf.

Signed-off-by: Guy Morand <guy.morand@netmodule.com>
---
 meta-oe/recipes-benchmark/iperf3/iperf3.inc      |   20 ++++++++++++++++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_3.0.8.bb |    6 ++++++
 meta-oe/recipes-benchmark/iperf3/iperf3_git.bb   |    7 +++++++
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
1.7.10.4


