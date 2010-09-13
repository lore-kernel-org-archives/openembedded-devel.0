Received: from 68.mail-out.ovh.net ([91.121.185.69])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OvEnM-0003Xp-No
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Sep 2010 21:34:29 +0200
Received: (qmail 7074 invoked by uid 503); 13 Sep 2010 19:45:51 -0000
Received: from 30.mail-out.ovh.net (213.186.62.213)
	by 68.mail-out.ovh.net with SMTP; 13 Sep 2010 19:45:51 -0000
Received: (qmail 26402 invoked by uid 503); 13 Sep 2010 19:17:18 -0000
Received: from b9.ovh.net (HELO mail431.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 13 Sep 2010 19:17:18 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 13 Sep 2010 21:33:43 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 13 Sep 2010 21:33:41 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Sep 2010 21:33:36 +0200
Message-Id: <1284406416-3055-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8977081433248542025
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.69
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] busybox/mdev.conf: add net/tun
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
X-List-Received-Date: Mon, 13 Sep 2010 19:34:29 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

having tun in /dev/net/tun allows openvpn to run without any hack
on the target

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/files/mdev.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/files/mdev.conf b/recipes/busybox/files/mdev.conf
index 163ebfe..91068a9 100644
--- a/recipes/busybox/files/mdev.conf
+++ b/recipes/busybox/files/mdev.conf
@@ -31,3 +31,5 @@ timer 0:0 0660 =snd/
 event.* 0:0 0660 =input/ @/etc/mdev/find-touchscreen.sh
 mice 0:0 0660 =input/ 
 mouse.* 0:0 0660 =input/
+
+tun[0-9]* 0:0 0660 =net/
\ No newline at end of file
-- 
1.6.3.3



