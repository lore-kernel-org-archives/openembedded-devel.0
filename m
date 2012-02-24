Received: from pd95cbf07.dip0.t-ipconnect.de ([217.92.191.7] helo=localhost)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@localhost.localdomain>) id 1S0xUy-0003yW-V1
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Feb 2012 16:55:57 +0100
Received: by localhost (Postfix, from userid 1000)
	id C20B9C2CBB; Fri, 24 Feb 2012 16:47:33 +0100 (CET)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: Tom Rini <tom.rini@gmail.com>,
	openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2012 16:47:19 +0100
Message-Id: <562d0d44a950d86ec19d98621d837e4a227db73a.1330097955.git.sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
References: <c0d07af8a377e188decbae614de96fcf1e78af91.1330097955.git.sledz@dresearch-fe.de>
In-Reply-To: <cover.1330097955.git.sledz@dresearch-fe.de>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
Subject: [2011.03-maintenance 2/7] fakeroot-native: update to 1.14.5
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
X-List-Received-Date: Fri, 24 Feb 2012 15:55:57 -0000

* version 1.9.6 is no longer fetchable
* recipe for version 1.9.6 is not removed yet because of pinnings in
  various distro configurations

Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/fakeroot/fakeroot-native_1.14.5.bb |   23 +++++++++++++++++++++++
 1 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 recipes/fakeroot/fakeroot-native_1.14.5.bb

diff --git a/recipes/fakeroot/fakeroot-native_1.14.5.bb b/recipes/fakeroot/fakeroot-native_1.14.5.bb
new file mode 100644
index 0000000..bb57d84
--- /dev/null
+++ b/recipes/fakeroot/fakeroot-native_1.14.5.bb
@@ -0,0 +1,23 @@
+require fakeroot_${PV}.bb
+
+RDEPENDS_${PN} = "util-linux-native"
+
+SRC_URI += "file://fix-prefix.patch "
+S = "${WORKDIR}/fakeroot-${PV}"
+
+inherit native
+
+EXTRA_OECONF = " --program-prefix="
+
+# Compatability for the rare systems not using or having SYSV
+python () {
+    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
+        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
+}
+
+do_stage_append () {
+    oe_libinstall -so libfakeroot ${STAGING_LIBDIR}/libfakeroot/
+}
+
+SRC_URI[md5sum] = "659a1f3a36554abfc2a3eaad2fdc0604"
+SRC_URI[sha256sum] = "b035c834944bf9482027f48c388de8492e96609825265ac03f05408d0b3aae68"
-- 
1.7.7



