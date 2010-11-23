Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PKwAx-0006NN-G3
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Nov 2010 17:57:05 +0100
Received: (qmail 14384 invoked by uid 503); 23 Nov 2010 17:00:14 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 23 Nov 2010 17:00:13 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Nov 2010 18:55:49 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 23 Nov 2010 18:55:47 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Nov 2010 17:53:13 +0100
Message-Id: <1290531194-31338-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17443285783044664649
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] sarge-at91: fix kernel build
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
X-List-Received-Date: Tue, 23 Nov 2010 16:57:06 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

without this fix, the kernel can't build for sarge-at91,
tested with angstrom-2010.x and minimal distros.
http://tinderbox.openembedded.net/public/logs/task/10846611.txt

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/linux/linux-2.6.21/sumversionfix.patch |   12 ++++++++++++
 recipes/linux/linux_2.6.21.bb                  |    1 +
 2 files changed, 13 insertions(+), 0 deletions(-)
 create mode 100644 recipes/linux/linux-2.6.21/sumversionfix.patch

diff --git a/recipes/linux/linux-2.6.21/sumversionfix.patch b/recipes/linux/linux-2.6.21/sumversionfix.patch
new file mode 100644
index 0000000..78461cb
--- /dev/null
+++ b/recipes/linux/linux-2.6.21/sumversionfix.patch
@@ -0,0 +1,12 @@
+diff --git a/scripts/mod/sumversion.c b/scripts/mod/sumversion.c
+index 8a28756..bd2981b 100644
+--- a/scripts/mod/sumversion.c
++++ b/scripts/mod/sumversion.c
+@@ -7,6 +7,7 @@
+ #include <ctype.h>
+ #include <errno.h>
+ #include <string.h>
++#include <linux/limits.h>
+ #include "modpost.h"
+ 
+ /*
diff --git a/recipes/linux/linux_2.6.21.bb b/recipes/linux/linux_2.6.21.bb
index 4aefbd1..97a6c03 100644
--- a/recipes/linux/linux_2.6.21.bb
+++ b/recipes/linux/linux_2.6.21.bb
@@ -12,6 +12,7 @@ SRC_URI = "${KERNELORG_MIRROR}/pub/linux/kernel/v2.6/linux-${PV}.tar.bz2;name=ke
            file://tsc2003.c \
 	   file://tsc2003-config.diff \
 	   file://defconfig \
+           file://sumversionfix.patch \
 	   "
 
 SRC_URI_append_simpad = "\
-- 
1.6.3.3



