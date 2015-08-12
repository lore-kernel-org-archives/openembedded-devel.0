Return-Path: <prvs=659569f5e=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 8DD1960167
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2015 15:04:58 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Ap0EAIZfy1WsEApK/2dsb2JhbABdg29pBqpdlH6GAQKCEwEBAQEBAYELhCQBAQR5EBg5VwYOBYgz0EkBAQEBBgEBAQEej3dlBxeEFQWMWYg6hQSJeIZukROCNRuBVW+BBUOBBAEBAQ
X-IPAS-Result: Ap0EAIZfy1WsEApK/2dsb2JhbABdg29pBqpdlH6GAQKCEwEBAQEBAYELhCQBAQR5EBg5VwYOBYgz0EkBAQEBBgEBAQEej3dlBxeEFQWMWYg6hQSJeIZukROCNRuBVW+BBUOBBAEBAQ
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 12 Aug 2015 17:03:54 +0200
Message-ID: <1439391837-10238-3-git-send-email-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
References: <1439391837-10238-1-git-send-email-richard.leitner@skidata.com>
MIME-Version: 1.0
X-Originating-IP: [172.16.60.30]
Cc: otavio.salvador@ossystems.com.br
Subject: [PATCH 2/5] openjdk-7: move "--disable-pulse-java" from common to 75b13 only
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
X-List-Received-Date: Wed, 12 Aug 2015 15:04:59 -0000
Content-Type: text/plain

The "--disable-pulse-java" configuration is no longer available in
IcedTea 2.6.1, therefore move it to the 2.5.4 (75b13) version only.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 recipes-core/openjdk/openjdk-7-common.inc        | 1 -
 recipes-core/openjdk/openjdk-7-release-75b13.inc | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index 837f0b8..5f293df 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -93,7 +93,6 @@ EXTRA_OECONF = " \
 	--disable-hotspot-tests \
 	--disable-langtools-tests \
 	--disable-jdk-tests \
-	--disable-pulse-java \
 	--disable-docs \
 	--disable-nss \
 	--disable-system-lcms \
diff --git a/recipes-core/openjdk/openjdk-7-release-75b13.inc b/recipes-core/openjdk/openjdk-7-release-75b13.inc
index e60679b..219fd50 100644
--- a/recipes-core/openjdk/openjdk-7-release-75b13.inc
+++ b/recipes-core/openjdk/openjdk-7-release-75b13.inc
@@ -4,6 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 FILESPATH =. "${FILE_DIRNAME}/openjdk-7-75b13:"
 
+EXTRA_OECONF += " --disable-pulse-java "
+
 # Name of the directory containing the compiled output
 BUILD_DIR = "openjdk.build"
 BUILD_DIR_ECJ = "openjdk.build-ecj"
-- 
2.1.4


