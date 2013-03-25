Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1UK3a9-0006RS-0k
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Mar 2013 10:20:45 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 6D788D22B2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2013 10:03:51 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 Mar 2013 10:03:38 +0100
Message-Id: <1364202218-30828-1-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] glog: add 0.3.3 version
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
X-List-Received-Date: Mon, 25 Mar 2013 09:20:51 -0000

The glog library implements application-level logging. This library
provides logging APIs based on C++-style streams and various helper
macros.

glog.inc cause meta-linaro has glog_svn.bb recipe as well

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/glog/glog.inc      | 9 +++++++++
 meta-oe/recipes-support/glog/glog_0.3.3.bb | 6 ++++++
 2 files changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-support/glog/glog.inc
 create mode 100644 meta-oe/recipes-support/glog/glog_0.3.3.bb

diff --git a/meta-oe/recipes-support/glog/glog.inc b/meta-oe/recipes-support/glog/glog.inc
new file mode 100644
index 0000000..97f3728
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog.inc
@@ -0,0 +1,9 @@
+DESCRIPTION = "The glog library implements application-level logging. This \
+library provides logging APIs based on C++-style streams and various helper \
+macros."
+HOMEPAGE = "https://code.google.com/p/google-glog/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
+
+inherit autotools pkgconfig
diff --git a/meta-oe/recipes-support/glog/glog_0.3.3.bb b/meta-oe/recipes-support/glog/glog_0.3.3.bb
new file mode 100644
index 0000000..de3f076
--- /dev/null
+++ b/meta-oe/recipes-support/glog/glog_0.3.3.bb
@@ -0,0 +1,6 @@
+require glog.inc
+
+SRC_URI = "http://google-glog.googlecode.com/files/glog-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "a6fd2c22f8996846e34c763422717c18"
+SRC_URI[sha256sum] = "fbf90c2285ba0561db7a40f8a4eefb9aa963e7d399bd450363e959929fe849d0"
-- 
1.8.1.2



