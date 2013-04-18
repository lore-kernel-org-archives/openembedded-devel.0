Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1USimm-0006WC-R8
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Apr 2013 08:57:39 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2013 23:39:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,499,1363158000"; d="scan'208";a="324173607"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.215])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2013 23:39:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Apr 2013 07:39:37 +0100
Message-Id: <f7b25f907b18cf3b37d192bc8d79e8b0262a6124.1366267106.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366267106.git.paul.eggleton@linux.intel.com>
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366267106.git.paul.eggleton@linux.intel.com>
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe, meta-webserver][PATCH 1/2] cherokee: move to meta-webserver and tweak
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
X-List-Received-Date: Thu, 18 Apr 2013 06:57:48 -0000
X-List-Received-Date: Thu, 18 Apr 2013 06:57:48 -0000

* Set SUMMARY instead of DESCRIPTION

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../recipes-httpd}/cherokee/cherokee/cherokee.init                 |    0
 .../recipes-httpd}/cherokee/cherokee_1.2.98.bb                     |    4 ++--
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename {meta-oe/recipes-connectivity => meta-webserver/recipes-httpd}/cherokee/cherokee/cherokee.init (100%)
 rename {meta-oe/recipes-connectivity => meta-webserver/recipes-httpd}/cherokee/cherokee_1.2.98.bb (93%)

diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
similarity index 100%
rename from meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init
rename to meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
rename to meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 6c030a6..1510e70 100644
--- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -1,5 +1,5 @@
-DESCRIPTION = "Cherokee Web Server fast and secure"
-DESCRIPTION_cget = "Small downloader based in the Cherokee client library"
+SUMMARY = "Cherokee Web Server fast and secure"
+SUMMARY_cget = "Small downloader based in the Cherokee client library"
 HOMEPAGE = "http://www.cherokee-project.com/"
 SECTION = "network"
 LICENSE = "GPLv2"
-- 
1.7.10.4



