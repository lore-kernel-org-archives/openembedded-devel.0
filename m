Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8406E6A1
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:45:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2015 09:41:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="647332276"
Received: from bdrobeso-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.70])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2015 09:45:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 17:45:36 +0000
Message-Id: <3635b52651db158a6880c1f37e0a043022d8774b.1423071889.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423071889.git.paul.eggleton@linux.intel.com>
References: <cover.1423071889.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423071889.git.paul.eggleton@linux.intel.com>
References: <cover.1423071889.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 2/3] python-django: add version 1.6.10
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
X-List-Received-Date: Wed, 04 Feb 2015 17:45:49 -0000

Updated version of the recipe in meta-openstack. Also made LICENSE more
accurate and set SUMMARY instead of DESCRIPTION since the value is
short.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-devtools/python/python-django_1.6.10.bb   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-django_1.6.10.bb

diff --git a/meta-python/recipes-devtools/python/python-django_1.6.10.bb b/meta-python/recipes-devtools/python/python-django_1.6.10.bb
new file mode 100644
index 0000000..8623002
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-django_1.6.10.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A high-level Python Web framework"
+HOMEPAGE = "http://www.djangoproject.com/"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fa8608154dcdd4029ae653131d4b7365"
+
+SRCNAME = "Django"
+
+SRC_URI = "https://pypi.python.org/packages/source/D/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "d7123f14ac19ae001be02ed841937b91"
+SRC_URI[sha256sum] = "54eb59ce785401c7d1fdeed245efce597e90f811d6a20f6b5c6931c0049d63a6"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
+FILES_${PN} += "${datadir}/django"
+
-- 
1.9.3


