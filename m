Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 446F36A465
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Jul 2013 14:47:38 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2013 07:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,659,1367996400"; d="scan'208";a="345067086"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.68])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2013 07:47:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Jul 2013 15:47:23 +0100
Message-Id: <5eac17e51739330054a2dfb9d651bc0a2b931329.1373726565.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1373726565.git.paul.eggleton@linux.intel.com>
References: <cover.1373726565.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/3] mosh: add new recipe for version 1.2.4
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
X-List-Received-Date: Sat, 13 Jul 2013 14:47:38 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb | 29 +++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb

diff --git a/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
new file mode 100644
index 0000000..e9881bc
--- /dev/null
+++ b/meta-oe/recipes-connectivity/mosh/mosh_1.2.4.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Remote shell supporting roaming and high-latency connections"
+DESCRIPTION = "Remote terminal application that allows roaming, supports \
+intermittent connectivity, and provides intelligent local echo and line \
+editing of user keystrokes. Mosh is a replacement for SSH. It's more \
+robust and responsive, especially over Wi-Fi, cellular, and \
+long-distance links."
+HOMEPAGE = "http://mosh.mit.edu"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "protobuf-native protobuf ncurses zlib libio-pty-perl openssl"
+
+SRC_URI = "http://mosh.mit.edu/mosh-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "c2d918f4d91fdc32546e2e089f9281b2"
+SRC_URI[sha256sum] = "e74d0d323226046e402dd469a176075fc2013b69b0e67cea49762c957175df46"
+
+inherit autotools
+
+PACKAGE_BEFORE_PN += "${PN}-server"
+FILES_${PN}-server = "${bindir}/mosh-server"
+
+# mosh uses SSH to authenticate and the client uses OpenSSH-specific features
+RDEPENDS_${PN} += "openssh-ssh"
+# The server seemed not to work with dropbear either
+RDEPENDS_${PN}-server += "openssh-sshd"
+# Note: the server also requires a UTF-8 locale, but there's no way
+# to add a dependency for this
+
-- 
1.8.1.2


