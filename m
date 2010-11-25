Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLXyL-0006ox-IR
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 10:18:33 +0100
Received: (qmail 17264 invoked by uid 503); 25 Nov 2010 09:21:43 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 25 Nov 2010 09:21:43 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 25 Nov 2010 11:17:19 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 25 Nov 2010 11:17:19 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Nov 2010 10:14:18 +0100
Message-Id: <1290676461-13283-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290676461-13283-1-git-send-email-eric@eukrea.com>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2999115878566571338
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
Subject: [PATCH 2/5] shr: remove busybox's prefered version
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
X-List-Received-Date: Thu, 25 Nov 2010 09:18:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

and use the latest stable as a default.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 conf/distro/include/preferred-shr-versions.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/preferred-shr-versions.inc b/conf/distro/include/preferred-shr-versions.inc
index 22e1c82..bc08fdb 100644
--- a/conf/distro/include/preferred-shr-versions.inc
+++ b/conf/distro/include/preferred-shr-versions.inc
@@ -13,7 +13,6 @@ PREFERRED_VERSION_emacs-x11 = "23.1"
 PREFERRED_VERSION_ncurses = "5.7"
 PREFERRED_VERSION_ncurses-native = "5.7"
 PREFERRED_VERSION_python-pycairo = "1.8.0"
-PREFERRED_VERSION_busybox = "1.17.3"
 
 # we need new headers for libc, now OLDEST_KERNEL_linux-gnueabi = "2.6.24"
 # and 2.6.31 for fsodeviced
-- 
1.6.3.3



