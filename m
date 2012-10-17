Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOPPh-0008OQ-D8
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 10:55:41 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Oct 2012 01:41:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,599,1344236400"; d="scan'208";a="207060459"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.85])
	by orsmga001.jf.intel.com with ESMTP; 17 Oct 2012 01:42:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Oct 2012 09:42:15 +0100
Message-Id: <5aef17a84c87f7a15a4a1cea221b65f849a0c894.1350463306.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1350463306.git.paul.eggleton@linux.intel.com>
References: <cover.1350463306.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 1/4] libc-client: correct LICENSE
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
X-List-Received-Date: Wed, 17 Oct 2012 08:55:41 -0000

The license is Apache 2.0 according to the included LICENSE.txt file.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../libc-client/libc-client_2007e.bb               |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
index e67639e..9faa2f8 100644
--- a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
+++ b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
@@ -1,11 +1,13 @@
 DESCRIPTION = "UW c-client library for mail protocols"
 SECTION = "devel"
 
-LICENSE = "University of Washingtons Free-Fork License"
+LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a6a4ddbb7cd2999f6827ee143f6fcd97"
 
 DEPENDS = "openssl libpam"
 
+PR = "r1"
+
 SRC_URI = "ftp://ftp.cac.washington.edu/imap/imap-${PV}.tar.gz \
            file://quote_cctype.patch"
 
-- 
1.7.9.5



