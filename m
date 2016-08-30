Return-Path: <mikko.ylinen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B15D060797
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2016 06:55:48 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 29 Aug 2016 23:55:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,255,1470726000"; 
   d="scan'208";a="2574541"
Received: from tungchin-suna.ccr.corp.intel.com (HELO
	summit.ger.corp.intel.com) ([10.252.6.144])
	by fmsmga006.fm.intel.com with ESMTP; 29 Aug 2016 23:55:47 -0700
From: Mikko Ylinen <mikko.ylinen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Aug 2016 09:55:45 +0300
Message-Id: <20160830065545.21812-2-mikko.ylinen@linux.intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20160830065545.21812-1-mikko.ylinen@linux.intel.com>
References: <20160830065545.21812-1-mikko.ylinen@linux.intel.com>
Subject: [meta-python][PATCH 2/2] python3-jsonschema: set dependency to vcversioner
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
X-List-Received-Date: Tue, 30 Aug 2016 06:55:50 -0000

The recently added python3-jsonschema depends on vcversioner. The
setuptools tries to fetch it but fails with bitbake if run behind
proxies. Explicitly set DEPENDS to ensure the dependency is installed
before running setup.py for python3-jsonschema.

Signed-off-by: Mikko Ylinen <mikko.ylinen@linux.intel.com>
---
 meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb b/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb
index 5aaee68..53b8839 100644
--- a/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonschema_2.5.1.bb
@@ -1,6 +1,8 @@
 inherit pypi setuptools3
 require python-jsonschema.inc
 
+DEPENDS += "python3-vcversioner"
+
 RDEPENDS_${PN} += " \
     ${PYTHON_PN}-misc \
 "
-- 
2.9.3


