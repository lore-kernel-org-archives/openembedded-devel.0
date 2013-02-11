Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U4uld-0001QF-GT
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Feb 2013 15:54:02 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Feb 2013 06:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,643,1355126400"; d="scan'208";a="285711342"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.60])
	by fmsmga001.fm.intel.com with ESMTP; 11 Feb 2013 06:37:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 11 Feb 2013 14:37:55 +0000
Message-Id: <0ed07c88a853557d16d26459f8305bc4795f1a8f.1360593325.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360593325.git.paul.eggleton@linux.intel.com>
References: <cover.1360593325.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360593325.git.paul.eggleton@linux.intel.com>
References: <cover.1360593325.git.paul.eggleton@linux.intel.com>
Subject: [meta-webserver][PATCH 2/2] README: extend for meta-webadmin addition
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
X-List-Received-Date: Mon, 11 Feb 2013 14:54:04 -0000

* Add directory layour info
* Add meta-oe dependency for some recipes

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-webserver/README |   17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta-webserver/README b/meta-webserver/README
index 47136fb..89deecc 100644
--- a/meta-webserver/README
+++ b/meta-webserver/README
@@ -12,9 +12,26 @@ Dependencies
 This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
+subdirectory: meta
 branch: master
 revision: HEAD
 
+For some recipes, the meta-oe layer is required:
+
+URI: git://git.openembedded.org/meta-openembedded
+subdirectory: meta-oe
+branch: master
+revision: HEAD
+
+
+
+Layout
+------
+
+recipes-httpd/      Web servers
+recipes-php/        PHP and PHP applications
+recipes-webadmin/   Standalone web administration interfaces
+
 
 
 Maintenance
-- 
1.7.10.4



