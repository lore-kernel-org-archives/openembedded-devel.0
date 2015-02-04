Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id C68666E6BE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Feb 2015 17:45:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2015 09:41:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,519,1418112000"; d="scan'208";a="647332279"
Received: from bdrobeso-mobl3.amr.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.17.70])
	by orsmga001.jf.intel.com with ESMTP; 04 Feb 2015 09:45:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Feb 2015 17:45:37 +0000
Message-Id: <3b22d908188e4c0f7876800dc580e0198fabafd2.1423071889.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1423071889.git.paul.eggleton@linux.intel.com>
References: <cover.1423071889.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1423071889.git.paul.eggleton@linux.intel.com>
References: <cover.1423071889.git.paul.eggleton@linux.intel.com>
Subject: [meta-python][PATCH 3/3] python-django-south: add version 1.0.2
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

From: Saul Wold <sgw@linux.intel.com>

Signed-off-by: Saul Wold <sgw@linux.intel.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../python/python-django-south_1.0.2.bb                | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-django-south_1.0.2.bb

diff --git a/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
new file mode 100644
index 0000000..a349983
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-django-south_1.0.2.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Migrations for Django"
+DESCRIPTION = "South is an intelligent database migrations library for the Django web framework. It is database-independent and DVCS-friendly, as well as a whole host of other features."
+HOMEPAGE = "http://south.aeracode.org/"
+SECTION = "devel/python"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=17;endline=18;md5=2155d8ae21e7c23101d5febac696b27e"
+
+SRCNAME = "South"
+
+SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c76a9758b2011bc3b6c39f881bba2f66"
+SRC_URI[sha256sum] = "d360bd31898f9df59f6faa786551065bba45b35e7ee3c39b381b4fbfef7392f4"
+
+S = "${WORKDIR}/${SRCNAME}-${PV}"
+
+inherit distutils
+
-- 
1.9.3


