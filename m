Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 089C07267D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Jan 2015 10:51:54 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Jan 2015 02:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,698,1413270000"; d="scan'208";a="664505020"
Received: from kregan-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.116])
	by orsmga002.jf.intel.com with ESMTP; 05 Jan 2015 02:51:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Jan 2015 10:51:29 +0000
Message-Id: <927c3ded08f90a1fe000ce7f529ded04071515c0.1420454954.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1420454954.git.paul.eggleton@linux.intel.com>
References: <cover.1420454954.git.paul.eggleton@linux.intel.com>
Subject: [meta-networking][PATCH 4/5] traceroute: update to 2.0.21
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
X-List-Received-Date: Mon, 05 Jan 2015 10:51:57 -0000

Also fix LICENSE to be "or any later version" (as specified in the
upstream source headers); both licenses apply so use &.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../traceroute/{traceroute_2.0.20.bb => traceroute_2.0.21.bb}       | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-support/traceroute/{traceroute_2.0.20.bb => traceroute_2.0.21.bb} (89%)

diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
similarity index 89%
rename from meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
rename to meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
index 4476670..9eb667d 100644
--- a/meta-networking/recipes-support/traceroute/traceroute_2.0.20.bb
+++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.21.bb
@@ -7,7 +7,7 @@ tool.  If you're having network connectivity problems, traceroute will \
 show you where the trouble is coming from along the route."
 SECTION = "console/network"
 HOMEPAGE = "http://traceroute.sourceforge.net/"
-LICENSE = "GPL-2.0 LGPL-2.1"
+LICENSE = "GPL-2.0+ & LGPL-2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
@@ -17,8 +17,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/${BP}/${BP}.tar.gz \
            file://filter-out-the-patches-from-subdirs.patch \
 "
 
-SRC_URI[md5sum] = "559f104e155e0e14ee0c717776a745fa"
-SRC_URI[sha256sum] = "2facba9525c95428d7bff3a313fc6ecfd8c529c678ae666c73015558a0edc271"
+SRC_URI[md5sum] = "79289adabd6f3ebf9160fc0815ab3150"
+SRC_URI[sha256sum] = "f7ac93ef30b13a587292b8d6a7e2538a65bc978a3a576eab238c392b884e96e0"
 
 EXTRA_OEMAKE = "VPATH=${STAGING_LIBDIR}"
 
-- 
1.9.3


