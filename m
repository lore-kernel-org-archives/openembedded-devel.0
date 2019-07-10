Return-Path: <prvs=087ee24f7=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id B6DD27EEBB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jul 2019 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1562743909; x=1594279909;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=yMGknApcD31HV/tfZxzbdOkNgApJjwyUZvkCqWXuL8E=;
	b=AwEU6ujIGtcgyjNkFK/fCC2ycWd6YOvgYQeBbpjlEybnOipkEkmTMcdI
	MmzpuLPFsRpQe7qbm1bRXjpyz8ie3hB14JjTwHma30+67MMnKeZBGdRU9
	W8oCjl9hqwai5aKcUXSbRVdYqZEghpG9sLY55v4wJs4xqL57n3Hf7LkWV
	laOvKVcrcETGanbXZcf+EHx2YfbLeIDua9PnVR/AuHUX3EoWQrmJp3in6
	KPVFD1ZCldCO4LzVUVrocPT6k0V7BFasgCi/mZrGRAYdIkLKUspeRsqIO
	jT2hGyZxiJnmxQuQVB1idkPC5wCh9hBK2WuklGCING9bbKMgXi8/rd/PC Q==;
IronPort-SDR: H3b1NF/V1kwfVMlZgJadqTEBPQ/qDW5qosi8ria57ftfkCLvegwB/ITLQoIR+WOILLE0yGPwE8
	tXEhx6yk+YWs8YcWY9Xpvd8T0lwW0tQL0w0lPkw/u0VIMNTyDTglvuKSd30/eV3vxvDtyU0xm6
	+ysVI0rHIn2x4dN/SQjMdgwX0VuaIPiYOGjHbNewKJa0Tar7+YAq5CQu9bjcJ8NxXq6+i4W7Yu
	EZOBzxOwgne7zn6FwTxsbSBCH82wAJcI+mO6PFPAcjzfF3G50aTnTsGwuGjudqCmwy01Yj5agk
	ogw=
X-IronPort-AV: E=Sophos;i="5.63,473,1557180000"; d="scan'208";a="18259388"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jul 2019 09:31:30 +0200
Message-ID: <20190710073130.21801-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [meta-java][PATCH] icedtea7-native: use openjdk build helper functions
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
X-List-Received-Date: Wed, 10 Jul 2019 07:31:49 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Replace target arch selection switch with functions from the openjdk
build helper.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/icedtea/icedtea7-native.inc | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
index b578cb2..c7c3bd6 100644
--- a/recipes-core/icedtea/icedtea7-native.inc
+++ b/recipes-core/icedtea/icedtea7-native.inc
@@ -94,18 +94,8 @@ JDK_DIR = "icedtea7-native"
 JDK_INSTALL_DIR = "${D}/${libdir_jvm}/${JDK_DIR}"
 
 do_configure_prepend() {
-        case "${TRANSLATED_TARGET_ARCH}" in
-                x86-64)
-                        libarch=amd64
-                ;;
-                i386|i486|i586|i686)
-                        libarch=x86
-                ;;
-                *)
-                        arch=${TARGET_ARCH}
-                        libarch=${TARGET_ARCH}
-                ;;
-        esac
+	arch="${@openjdk_build_helper_get_icedtea_arch(d)}"
+	libarch="${@openjdk_build_helper_get_icedtea_arch(d)}"
 
 	# Automatically copy everything that starts with "icedtea" and ends with
 	# ".patch" into the patches directory.
-- 
2.20.1


