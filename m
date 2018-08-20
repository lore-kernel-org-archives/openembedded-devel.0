Return-Path: <prvs=7639e01b5=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id A1B29790DC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Aug 2018 21:15:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,266,1531778400"; 
   d="scan'208";a="1615974"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2018 23:16:14 +0200
Message-ID: <20180820211615.404-2-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180820211615.404-1-richard.leitner@skidata.com>
References: <20180820211443.32757-1-richard.leitner@skidata.com>
	<20180820211615.404-1-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH 6/7] openjdk-8: use openjdk-common
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
X-List-Received-Date: Mon, 20 Aug 2018 21:15:44 -0000
Content-Type: text/plain

As openjdk-common.inc now serves all OpenJDK version let
openjdk-8-common require it. Furthermore remove the now duplicated
lines.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-8-common.inc | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
index e45bcf4..4d8f935 100644
--- a/recipes-core/openjdk/openjdk-8-common.inc
+++ b/recipes-core/openjdk/openjdk-8-common.inc
@@ -4,8 +4,7 @@ LICENSE  = "GPL-2.0-with-classpath-exception"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3e0b59f8fac05c3c03d4a26bbda13f8f"
 
-inherit java autotools gettext qemu pkgconfig
-inherit openjdk-build-helper
+require openjdk-common.inc
 
 AUTOTOOLS_SCRIPT_PATH = "${S}/common/autoconf/"
 export AUTOCONF_DIR="${AUTOTOOLS_SCRIPT_PATH}"
@@ -160,10 +159,6 @@ do_configure_prepend() {
         export ${@jdk_environment_options(d)}
 }
 
-# Provide the translated target architectures
-export LLVM_CONFIGURE_ARCH="${@openjdk_build_helper_get_llvm_configure_arch(d)}"
-JDK_ARCH = "${@openjdk_build_helper_get_jdk_arch(d)}"
-
 export DEBUG_BINARIES = "true"
 
 ALTERNATIVE_PRIORITY = "50"
-- 
2.11.0


