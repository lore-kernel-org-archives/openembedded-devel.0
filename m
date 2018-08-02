Return-Path: <prvs=745a9cfa4=Andreas.Obergschwandtner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id F097778DE9
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Aug 2018 14:45:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.51,436,1526335200"; d="scan'208";a="11652914"
From: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Aug 2018 16:45:23 +0200
Message-ID: <20180802144523.28023-2-andreas.obergschwandtner@skidata.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180802144523.28023-1-andreas.obergschwandtner@skidata.com>
References: <20180802144523.28023-1-andreas.obergschwandtner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex4srv.skidata.net (192.168.111.82)
Subject: [meta-java][PATCH 2/2] icedtea: disable error format-overflow for gcc 7
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
X-List-Received-Date: Thu, 02 Aug 2018 14:45:34 -0000
Content-Type: text/plain

no patch has been found in debian and hotspot repo for
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881824. The warning was
added with gcc 7.

Signed-off-by: Andreas Obergschwandtner <andreas.obergschwandtner@skidata.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index 93463be..453fae3 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -24,6 +24,14 @@ CFLAGS_append = " -fno-tree-dse"
 CXXFLAGS_append = " -fno-tree-dse"
 CXX_append = " -std=gnu++98"
 
+# Disable format-overflow error with host g++ >= 7.3.
+# Bug is reported https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=881824
+# but no patch was found for Debian.
+FLAGS_GCC7 = " -Wno-error=format-overflow"
+
+CFLAGS_append = " ${@java_version_specific_cflags(d)}"
+CXXFLAGS_append = " ${@java_version_specific_cflags(d)}"
+
 inherit native java autotools pkgconfig
 
 JAVA_HOME[unexport] = "1"
-- 
2.17.1


