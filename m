Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E2A0872606
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 11:01:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2015 03:01:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="646381094"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2015 03:01:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 11:00:45 +0000
Message-Id: <74be454aeded97b7034f6bce3ee60af2cc8f60c3.1420455602.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420455602.git.paul.eggleton@linux.intel.com>
References: <cover.1420455602.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/10] iotop: update to 0.6
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
X-List-Received-Date: Mon, 05 Jan 2015 11:01:06 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb} | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-extended/iotop/{iotop_0.4.4.bb => iotop_0.6.bb} (81%)

diff --git a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
similarity index 81%
rename from meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
rename to meta-oe/recipes-extended/iotop/iotop_0.6.bb
index d629245..05eba3f 100644
--- a/meta-oe/recipes-extended/iotop/iotop_0.4.4.bb
+++ b/meta-oe/recipes-extended/iotop/iotop_0.6.bb
@@ -4,14 +4,12 @@ DESCRIPTION = "iotop does for I/O usage what top(1) does for CPU usage. \
     a table of current I/O usage by processes on the system."
 HOMEPAGE = "http://guichaz.free.fr/iotop/"
 
-PR = "r1"
-
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4325afd396febcb659c36b49533135d4"
 
 SRC_URI = "http://guichaz.free.fr/iotop/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "cdd38b276cbf238676f5d2bcf098ba9c"
-SRC_URI[sha256sum] = "46f3279fb1a7dfc129b5d00950c6e8389e4aedeb58880e848b88d686483df0b0"
+SRC_URI[md5sum] = "5ef9456b26d7694abf3101a72e1e0d1d"
+SRC_URI[sha256sum] = "3adea2a24eda49bbbaeb4e6ed2042355b441dbd7161e883067a02bfc8dcef75b"
 
 inherit distutils
 
@@ -20,6 +18,7 @@ do_install_append() {
     rm -f ${D}${PYTHON_SITEPACKAGES_DIR}/site.py  || true
 }
 
+FILES_${PN} += "${sbindir}"
 RDEPENDS_${PN} = "python-curses python-textutils \
                   python-codecs python-ctypes python-pprint \
                   python-shell"
-- 
1.9.3


