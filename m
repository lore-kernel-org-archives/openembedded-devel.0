Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TIiqf-000383-5Z
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Oct 2012 18:28:01 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2012 09:15:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,517,1344236400"; d="scan'208";a="229137527"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.40])
	by fmsmga002.fm.intel.com with ESMTP; 01 Oct 2012 09:15:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  1 Oct 2012 17:14:53 +0100
Message-Id: <d29b0ca4bcad6cef7d286472ac890cd8ae21b37b.1349107616.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 1/6] Add meta-webserver layer
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
X-List-Received-Date: Mon, 01 Oct 2012 16:28:01 -0000

Add a layer for web servers, web-based applications and other related
software.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/COPYING.MIT     |   17 +++++++++++++++++
 meta-webserver/README          |   37 +++++++++++++++++++++++++++++++++++++
 meta-webserver/conf/layer.conf |   13 +++++++++++++
 3 files changed, 67 insertions(+)
 create mode 100644 meta-webserver/COPYING.MIT
 create mode 100644 meta-webserver/README
 create mode 100644 meta-webserver/conf/layer.conf

diff --git a/meta-webserver/COPYING.MIT b/meta-webserver/COPYING.MIT
new file mode 100644
index 0000000..fb950dc
--- /dev/null
+++ b/meta-webserver/COPYING.MIT
@@ -0,0 +1,17 @@
+Permission is hereby granted, free of charge, to any person obtaining a copy 
+of this software and associated documentation files (the "Software"), to deal 
+in the Software without restriction, including without limitation the rights 
+to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
+copies of the Software, and to permit persons to whom the Software is 
+furnished to do so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in 
+all copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
+AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
+LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
+OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
+THE SOFTWARE.
diff --git a/meta-webserver/README b/meta-webserver/README
new file mode 100644
index 0000000..47136fb
--- /dev/null
+++ b/meta-webserver/README
@@ -0,0 +1,37 @@
+meta-webserver
+==============
+
+This layer provides support for building web servers, web-based
+applications and related software.
+
+
+
+Dependencies
+------------
+
+This layer depends on:
+
+URI: git://git.openembedded.org/openembedded-core
+branch: master
+revision: HEAD
+
+
+
+Maintenance
+-----------
+
+Send patches / pull requests to openembedded-devel@lists.openembedded.org
+with '[meta-webserver]' in the subject.
+
+Layer maintainer: Paul Eggleton <paul.eggleton@linux.intel.com>
+
+
+License
+-------
+
+All metadata is MIT licensed unless otherwise stated. Source code included
+in tree for individual recipes is under the LICENSE stated in each recipe
+(.bb file) unless otherwise stated.
+
+This README document is Copyright (C) 2012 Intel Corporation.
+
diff --git a/meta-webserver/conf/layer.conf b/meta-webserver/conf/layer.conf
new file mode 100644
index 0000000..6f1855b
--- /dev/null
+++ b/meta-webserver/conf/layer.conf
@@ -0,0 +1,13 @@
+# Layer configuration for meta-webserver layer
+# Copyright 2012 Intel Corporation
+
+# We have a conf and classes directory, add to BBPATH
+BBPATH .= ":${LAYERDIR}"
+
+# We have various recipe-* directories, add to BBFILES
+BBFILES += "${LAYERDIR}/recipes-*/*/*.bb ${LAYERDIR}/recipes-*/*/*.bbappend"
+
+BBFILE_COLLECTIONS += "webserver"
+BBFILE_PATTERN_webserver := "^${LAYERDIR}/"
+BBFILE_PRIORITY_webserver = "6"
+
-- 
1.7.9.5



