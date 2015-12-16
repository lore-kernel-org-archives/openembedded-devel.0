Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0A2EE6FFDF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Dec 2015 06:41:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBG6fwZ6015218
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 22:41:58 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Dec 2015 22:41:58 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 16 Dec 2015 14:42:07 +0800
Message-ID: <1450248127-18155-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-java][PATCH] openjdk-7: skip the already-stripped test
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
X-List-Received-Date: Wed, 16 Dec 2015 06:42:00 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

libfreetype.so.6 is copied from STAGING_LIBDIR and
binaries/libraries in sysroot are already stripped
since the following commit in oe-core:
"30f3774 staging: Strip files in sysroot"

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index d0351e4..4feb80f 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -294,6 +294,10 @@ RRECOMMENDS_${JDKPN}-java = "java2-vm"
 INSANE_SKIP_${JDKPN}-vm-zero = "dev-so"
 INSANE_SKIP_${JDKPN}-common = "dev-so"
 
+# libfreetype.so.6 is copied from STAGING_LIBDIR
+# which is already stripped.
+INSANE_SKIP_${JDKPN}-jre = "already-stripped"
+
 FILES_${JDKPN}-jdk = " \
     ${JDK_HOME}/bin \
     ${JDK_HOME}/lib \
-- 
2.3.5


