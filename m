Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1PcPNf-0000x9-WC
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 22:34:24 +0100
Received: (qmail 10690 invoked by uid 503); 10 Jan 2011 22:12:03 -0000
Received: from b9.ovh.net (HELO mail179.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 10 Jan 2011 22:12:03 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 10 Jan 2011 23:33:55 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 10 Jan 2011 23:33:54 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 10 Jan 2011 22:33:42 +0100
Message-Id: <1294695225-16321-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1294695225-16321-1-git-send-email-eric@eukrea.com>
References: <1294695225-16321-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8881661415288843594
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: [PATCH] tslib-git: update to git master
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
X-List-Received-Date: Mon, 10 Jan 2011 21:34:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

* 5243db505b109df3001f doesn't exist so fetch is failing.
error: pathspec '5243db505b109df3001f' did not match any file(s) known to git.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/tslib/tslib_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/tslib/tslib_git.bb b/recipes/tslib/tslib_git.bb
index 9b177d7..7c37395 100644
--- a/recipes/tslib/tslib_git.bb
+++ b/recipes/tslib/tslib_git.bb
@@ -1,8 +1,8 @@
 SRC_URI = "git://github.com/kergoth/tslib.git;protocol=git"
 S = "${WORKDIR}/git"
-SRCREV = "5243db505b109df3001f"
+SRCREV = "860d69cadedef0dec8ba6259ab5850691d3402e7"
 PV = "1.0+gitr${SRCPV}"
-PR = "${INC_PR}.3"
+PR = "${INC_PR}.4"
 
 DEFAULT_PREFERENCE = "-1"
 
-- 
1.6.3.3



