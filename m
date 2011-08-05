Received: from smtp208.alice.it ([82.57.200.104])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1QpS7e-0001ML-SP
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 23:40:03 +0200
Received: from mizar.localdomain (87.2.250.64) by smtp208.alice.it (8.5.124.08)
	id 4DE64DF10634C6FE; Fri, 5 Aug 2011 23:30:32 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri,  5 Aug 2011 23:30:15 +0200
Message-Id: <f4f0e18f46651290556cba9c44f49b2db6177ccb.1312578809.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312578809.git.andrea.adami@gmail.com>
References: <cover.1312578809.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1312578809.git.andrea.adami@gmail.com>
References: <cover.1312578809.git.andrea.adami@gmail.com>
Subject: [PATCH 2/2] klibc.bbclass: shared include for building against klibc
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
X-List-Received-Date: Fri, 05 Aug 2011 21:40:03 -0000

* from meta-zaurus
* reworked in meta-smartphones/meta-zaurus

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-oe/classes/klibc.bbclass |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/classes/klibc.bbclass

diff --git a/meta-oe/classes/klibc.bbclass b/meta-oe/classes/klibc.bbclass
new file mode 100644
index 0000000..d684367
--- /dev/null
+++ b/meta-oe/classes/klibc.bbclass
@@ -0,0 +1,9 @@
+# klcc-cross depends on klibc
+DEPENDS =+ "klcc-cross"
+
+export CC=${TARGET_PREFIX}klcc
+
+# reset inherited OE flags to avoid e.g. ggdb3 and keep size small
+export CFLAGS=""
+export CPPFLAGS=""
+export LDFLAGS=""
-- 
1.7.3.4



