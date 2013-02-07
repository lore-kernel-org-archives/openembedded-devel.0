Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3ZSw-0007Mu-9m
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 22:57:21 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 1C52AD22E9;
	Thu,  7 Feb 2013 11:51:23 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2013 11:50:58 +0100
Message-Id: <1360234263-18278-4-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 3/8] oniguruma: add 5.9.3 version
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
X-List-Received-Date: Thu, 07 Feb 2013 21:57:26 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/onig/onig_5.9.3.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/onig/onig_5.9.3.bb

diff --git a/meta-oe/recipes-support/onig/onig_5.9.3.bb b/meta-oe/recipes-support/onig/onig_5.9.3.bb
new file mode 100644
index 0000000..230e585
--- /dev/null
+++ b/meta-oe/recipes-support/onig/onig_5.9.3.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Regular expressions library. The characteristics of this \
+library is that different character encoding for every regular expression \
+object can be specified."
+HOMEPAGE = "http://www.geocities.jp/kosako3/oniguruma/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0d4861b5bc0c392a5aa90d9d76ebd86f"
+
+SRC_URI = "http://www.geocities.jp/kosako3/oniguruma/archive/onig-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "0d4eda2066d3c92970842a6790ce897a"
+SRC_URI[sha256sum] = "c3bba66b2a84760e6582c40881db97c839d94f327870009724bb8b4d0c051f2a"
+
+DEPENDS = "libevent"
+
+inherit autotools binconfig
-- 
1.8.0



