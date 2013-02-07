Received: from tygrysek.juszkiewicz.com.pl ([178.33.81.99])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <marcin.juszkiewicz@linaro.org>) id 1U3ZSw-0007Mx-Qj
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Feb 2013 22:57:21 +0100
Received: from puchatek.dom (87-206-60-225.dynamic.chello.pl [87.206.60.225])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marcin@juszkiewicz.com.pl)
	by tygrysek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 16757D22CD;
	Thu,  7 Feb 2013 11:51:18 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2013 11:50:56 +0100
Message-Id: <1360234263-18278-2-git-send-email-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
References: <1360234263-18278-1-git-send-email-marcin.juszkiewicz@linaro.org>
Subject: [meta-oe][PATCH 1/8] google-glog: added svn version
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
X-List-Received-Date: Thu, 07 Feb 2013 21:57:26 -0000

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 meta-oe/recipes-support/google-glog/google-glog_svn.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-oe/recipes-support/google-glog/google-glog_svn.bb

diff --git a/meta-oe/recipes-support/google-glog/google-glog_svn.bb b/meta-oe/recipes-support/google-glog/google-glog_svn.bb
new file mode 100644
index 0000000..b70aa82
--- /dev/null
+++ b/meta-oe/recipes-support/google-glog/google-glog_svn.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "The glog library implements application-level logging. This \
+library provides logging APIs based on C++-style streams and various helper \
+macros."
+HOMEPAGE = "https://code.google.com/p/google-glog/"
+
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=dc9db360e0bbd4e46672f3fd91dd6c4b"
+
+SRC_URI = "svn://google-glog.googlecode.com/svn/;module=trunk;protocol=http"
+
+SRCREV = "${AUTOREV}"
+
+PV = "0.3.2+svn${SRCPV}"
+
+S = "${WORKDIR}/trunk"
+
+inherit autotools pkgconfig
-- 
1.8.0



