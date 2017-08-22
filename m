Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F5CE6FFFE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 09:35:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7M9ZBCb002110
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Aug 2017 02:35:11 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 22 Aug 2017 02:35:10 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 22 Aug 2017 17:24:02 +0800
Message-ID: <20170822092402.32028-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] iperf3: 3.1.3 -> 3.2
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
X-List-Received-Date: Tue, 22 Aug 2017 09:35:10 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade iperf3 from 3.1.3 to 3.2.

* update md5 checksum of license file which update year info and add
  same bsd license for src/net.c
* add dependency openssl

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../recipes-benchmark/iperf3/{iperf3_git.bb => iperf3_3.2.bb}    | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-benchmark/iperf3/{iperf3_git.bb => iperf3_3.2.bb} (83%)

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
similarity index 83%
rename from meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
rename to meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
index 4a01896..4d1b0c4 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_git.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.2.bb
@@ -9,7 +9,9 @@ SECTION = "console/network"
 BUGTRACKER = "https://github.com/esnet/iperf/issues"
 AUTHOR = "ESNET <info@es.net>, Lawrence Berkeley National Laboratory <websupport@lbl.gov>"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8c3434c5a9a53c78c7739f0bc9e5adda"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=d098223e44bdd19585315ee75cd9d2d7"
+
+DEPENDS = "openssl"
 
 SRC_URI = "git://github.com/esnet/iperf.git \
            file://automake-foreign.patch \
@@ -17,8 +19,7 @@ SRC_URI = "git://github.com/esnet/iperf.git \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            "
 
-PV = "3.1.3+gitr${SRCPV}"
-SRCREV = "099244ec686b620393e9845478a554b1c7ca5c8b"
+SRCREV = "88d907f7fb58bfab5d086c5da60c922e1c582c92"
 
 S = "${WORKDIR}/git"
 
@@ -28,4 +29,6 @@ PACKAGECONFIG[lksctp] = "ac_cv_header_netinet_sctp_h=yes,ac_cv_header_netinet_sc
 
 CFLAGS += "-D_GNU_SOURCE"
 
+EXTRA_OECONF = "--with-openssl=${RECIPE_SYSROOT}"
+
 BBCLASSEXTEND = "native"
-- 
2.10.1


