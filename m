Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PIiWO-00067U-DY
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 14:58:05 +0100
Received: (qmail 3716 invoked by uid 503); 17 Nov 2010 14:01:25 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 17 Nov 2010 14:01:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 17 Nov 2010 15:56:50 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 17 Nov 2010 15:56:48 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Nov 2010 14:55:40 +0100
Message-Id: <1290002140-17255-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 16077850671439523145
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
Subject: [PATCH] amend.bbclass: handle PACKAGE_ARCH change in an amend.inc
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
X-List-Received-Date: Wed, 17 Nov 2010 13:58:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* setting PACKAGE_ARCH = "${MACHINE_ARCH}" in and amend.inc actually
leads to a packaga with the correct machine arch but the
work/stage/stamp dirs are not correct because MULTIMACH_ARCH is not
updated after amend.inc is parsed.

* this patch updates MULTIMACH_ARCH if PACKAGE_ARCH is changed in
amend.inc

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 classes/amend.bbclass |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/classes/amend.bbclass b/classes/amend.bbclass
index a03de64..da60611 100644
--- a/classes/amend.bbclass
+++ b/classes/amend.bbclass
@@ -42,5 +42,11 @@ python () {
             depends = set()
         depends |= set(newdata)
     d.setVar("__depends", depends)
+
+    mach_arch = bb.data.getVar('MACHINE_ARCH', d, 1)
+    pkg_arch = bb.data.getVar('PACKAGE_ARCH', d, 1)
+    multi_arch = bb.data.getVar('MULTIMACH_ARCH', d, 1)
+    if pkg_arch and pkg_arch == mach_arch and pkg_arch != multi_arch:
+        multi_arch = pkg_arch
+        bb.data.setVar('MULTIMACH_ARCH', multi_arch, d)
 }
-- 
1.7.2.3



