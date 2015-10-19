Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E641277086
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 18:44:38 +0000 (UTC)
Received: from localhost.localdomain (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 1630B23188
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 20:44:38 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 19 Oct 2015 20:44:32 +0200
Message-Id: <1445280272-23937-4-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
References: <1445280272-23937-1-git-send-email-dv@pseudoterminal.org>
Subject: [meta-multimedia][PATCH 4/4] libsrtp: add new recipe
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
X-List-Received-Date: Mon, 19 Oct 2015 18:44:42 -0000

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 .../recipes-support/libsrtp/libsrtp_1.5.2.bb           | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb

diff --git a/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
new file mode 100644
index 0000000..8ee6634
--- /dev/null
+++ b/meta-multimedia/recipes-support/libsrtp/libsrtp_1.5.2.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "library implementing Secure RTP (RFC 3711)"
+HOMEPAGE = "https://github.com/cisco/libsrtp"
+SECTION = "libs"
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=15bc16b9d2e305974dde47e733883714"
+
+SRC_URI = "https://github.com/cisco/libsrtp/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz"
+SRC_URI[md5sum] = "2309aa6027992810a4285b042c71e644"
+SRC_URI[sha256sum] = "86e1efe353397c0751f6bdd709794143bd1b76494412860f16ff2b6d9c304eda"
+
+inherit autotools
+
+do_install[postfuncs] += " rm_unused_bindir "
+
+rm_unused_bindir() {
+	rmdir ${D}/${bindir}
+}
-- 
1.9.1


