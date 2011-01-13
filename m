Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PdTt7-0007Jd-Ji
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 21:35:17 +0100
Received: (qmail 28212 invoked by uid 503); 13 Jan 2011 20:38:25 -0000
Received: from b9.ovh.net (HELO mail620.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 13 Jan 2011 20:38:25 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Jan 2011 22:35:08 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Jan 2011 22:35:07 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Jan 2011 21:34:27 +0100
Message-Id: <1294950867-17198-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <4D2F1728.3050308@mentor.com>
References: <4D2F1728.3050308@mentor.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 7060236841999707465
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] strace 4.5.20: stable since 04/14/2010 so remove DP=-1
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
X-List-Received-Date: Thu, 13 Jan 2011 20:35:17 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/strace/strace_4.5.20.bb |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/recipes/strace/strace_4.5.20.bb b/recipes/strace/strace_4.5.20.bb
index 89c5fd3..3de5469 100644
--- a/recipes/strace/strace_4.5.20.bb
+++ b/recipes/strace/strace_4.5.20.bb
@@ -1,11 +1,7 @@
 DESCRIPTION = "strace is a system call tracing tool."
 SECTION = "console/utils"
 LICENSE = "BSD"
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-DEFAULT_PREFERENCE_mips = "1"
-DEFAULT_PREFERENCE_mipsel = "1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/strace/strace-${PV}.tar.bz2 \
           file://mips-nolargefile.patch \
-- 
1.6.3.3



