Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QrdcN-0004OM-Ps
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 00:20:47 +0200
Received: from mizar.localdomain (87.2.250.64) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A0545978A; Fri, 12 Aug 2011 00:10:22 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 12 Aug 2011 00:10:09 +0200
Message-Id: <1313100609-2846-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <f4f0e18f46651290556cba9c44f49b2db6177ccb.1312578809.git.andrea.adami@gmail.com>
References: <f4f0e18f46651290556cba9c44f49b2db6177ccb.1312578809.git.andrea.adami@gmail.com>
Subject: [PATCH v2] klibc.bbclass: shared include for building against klibc
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
X-List-Received-Date: Thu, 11 Aug 2011 22:20:48 -0000

* from org.openembedded.dev
* reworked in meta-zaurus
* added missing quotes
* explain more clearly why the compiler/linker flags are reset

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/classes/klibc.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/classes/klibc.bbclass

diff --git a/meta-oe/classes/klibc.bbclass b/meta-oe/classes/klibc.bbclass
new file mode 100644
index 0000000..4dd9e8e
--- /dev/null
+++ b/meta-oe/classes/klibc.bbclass
@@ -0,0 +1,9 @@
+# klcc-cross depends on klibc
+DEPENDS =+ "klcc-cross"
+
+export CC = "${TARGET_PREFIX}klcc"
+
+# klcc uses own optimizations by default. See klcc(1) man file.
+export CFLAGS=""
+export CPPFLAGS=""
+export LDFLAGS=""
-- 
1.7.3.4



