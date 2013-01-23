Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1Ty2E4-00049P-QT
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jan 2013 16:26:57 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 78657D22CD;
	Wed, 23 Jan 2013 16:11:32 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Jan 2013 16:11:23 +0100
Message-Id: <1358953883-23851-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] libc-client: create empty libc-client package to satisfy deps of -dev one
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
X-List-Received-Date: Wed, 23 Jan 2013 15:26:58 -0000

Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-core-standalone-hhvm-sdk-target:
 *      libc-client (= 2007e-r1) *

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
index 9faa2f8..1ecbe68 100644
--- a/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
+++ b/meta-oe/recipes-devtools/libc-client/libc-client_2007e.bb
@@ -32,3 +32,4 @@ do_install() {
         install c-client/c-client.a ${D}${libdir}/libc-client.a
 }
 
+ALLOW_EMPTY_${PN} = "1"
-- 
1.8.0



