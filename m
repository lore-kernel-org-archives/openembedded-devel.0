Received: from 13.77.mail-out.ovh.net ([188.165.51.210]
	helo=77.mail-out.ovh.net) by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Pd8Xr-0006aC-UK
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Jan 2011 22:47:56 +0100
Received: (qmail 28412 invoked by uid 503); 12 Jan 2011 21:36:19 -0000
Received: from 64.mail-out.ovh.net (91.121.185.65)
	by 77.mail-out.ovh.net with SMTP; 12 Jan 2011 21:36:18 -0000
Received: (qmail 28747 invoked by uid 503); 12 Jan 2011 21:01:59 -0000
Received: from b6.ovh.net (HELO mail30.ha.ovh.net) (213.186.33.56)
	by 64.mail-out.ovh.net with SMTP; 12 Jan 2011 21:01:59 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 12 Jan 2011 23:20:44 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 12 Jan 2011 23:20:43 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Jan 2011 22:20:28 +0100
Message-Id: <1294867230-7827-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 1957658463811251529
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-Ovh-Tracer-Id: 2220837568108735817
Subject: [PATCH 1/3] strace: add patch allowing compilation with kernel headers >= 2.6.32
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
X-List-Received-Date: Wed, 12 Jan 2011 21:47:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

tested with kernel headers 2.6.31 & 2.6.37 : both compile fine.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/strace/strace_4.5.14.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes/strace/strace_4.5.14.bb b/recipes/strace/strace_4.5.14.bb
index 33a44ad..395e4ee 100644
--- a/recipes/strace/strace_4.5.14.bb
+++ b/recipes/strace/strace_4.5.14.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
 LICENSE = "BSD"
-PR = "r9"
+PR = "r10"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://glibc-2.5.patch \
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
            file://strace-arm-no-cachectl.patch \
            file://strace-dont-include-linux-dirent-h.patch \
            file://mips-sigcontext.patch \
+           file://strace-linux-2.6.32.patch \
           "
 
 # The strace-4.5.14-avr32.patch conflicts with some other patches.
-- 
1.6.3.3



