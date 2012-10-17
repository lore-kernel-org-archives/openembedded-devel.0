Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOPPi-0008OQ-48
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:55:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2012 01:41:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,599,1344236400"; d="scan'208";a="207060467"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.85])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2012 01:42:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:42:16 +0100
Message-Id: <709c21097ad7ff84a7995c4094606c27e772a15a.1350463306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 2/4] rrdtool: add pango to DEPENDS
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
X-List-Received-Date: Wed, 17 Oct 2012 08:55:42 -0000

The configure script fails without pangocairo which is provided by
pango.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
index 76a7133..73141b4 100644
--- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
+++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
@@ -4,7 +4,9 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=44fee82a1d2ed0676cf35478283e0aa0"
 
-DEPENDS = "libpng zlib cairo glib-2.0 libxml2"
+DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2"
+
+PR = "r1"
 
 SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
            file://0001-rrdtool-eradicate-tcl-support.patch \
-- 
1.7.9.5



