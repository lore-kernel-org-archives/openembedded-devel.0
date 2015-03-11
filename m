Return-Path: <magnus@minimum.se>
Received: from mail.glesys.se (mail.glesys.se [195.238.77.166])
	by mail.openembedded.org (Postfix) with ESMTP id CEA58739FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2015 07:48:06 +0000 (UTC)
Received: from DEV095.hms.se (smtp.hms.se [88.131.56.171])
	(Authenticated sender: magnus@minimum.se)
	by mail.glesys.se (Postfix) with ESMTPSA id 19336600B27;
	Wed, 11 Mar 2015 08:45:12 +0100 (CET)
From: Magnus Olsson <magnus@minimum.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Mar 2015 08:47:55 +0100
Message-Id: <1426060075-11913-1-git-send-email-magnus@minimum.se>
X-Mailer: git-send-email 1.9.1
Subject: [meta-java][PATCH] openjdk-7-jre: RDEPENDS openjdk-7-common
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
X-List-Received-Date: Wed, 11 Mar 2015 07:48:08 -0000

-jre binaries such as keytool, policytool and more requires libjli.so
so ensure there's a RDEPEND that provides it.

Same goes for openjdk-7-java (java binary FILERDEPENDS libjli.so).

Both of these already DEPENDS -common, so the build was not broken before
but this patch will also silence the QA file-rdeps issue.

Signed-off-by: Magnus Olsson <magnus@minimum.se>
---
 recipes-core/openjdk/openjdk-7-common.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/openjdk/openjdk-7-common.inc
index e14603c..55d010e 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -323,7 +323,8 @@ FILES_${JDKPN}-jdk = " \
                        ${JDK_HOME}/lib \
                        ${JDK_HOME}/include \
                       "
-RDEPENDS_${JDKPN}-jre = "${JDKPN}-java"
+RDEPENDS_${JDKPN}-jre = "${JDKPN}-java ${JDKPN}-common"
+RDEPENDS_${JDKPN}-java = "${JDKPN}-common"
 RPROVIDES_${JDKPN}-jre = "java2-runtime"
 
 RDEPENDS_${JDKPN}-jdk = "${JDKPN}-jre"
-- 
1.9.1


