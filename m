Received: from 30.mail-out.ovh.net ([213.186.62.213])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PBwS3-0007Ee-K8
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 23:25:32 +0200
Received: (qmail 2184 invoked by uid 503); 29 Oct 2010 21:03:50 -0000
Received: from b9.ovh.net (HELO mail632.ha.ovh.net) (213.186.33.59)
	by 30.mail-out.ovh.net with SMTP; 29 Oct 2010 21:03:49 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Oct 2010 23:24:47 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Oct 2010 23:24:46 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Oct 2010 23:25:41 +0200
Message-Id: <1288387543-1277-5-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1288387543-1277-4-git-send-email-eric@eukrea.com>
References: <1288387543-1277-1-git-send-email-eric@eukrea.com>
	<1288387543-1277-2-git-send-email-eric@eukrea.com>
	<1288387543-1277-3-git-send-email-eric@eukrea.com>
	<1288387543-1277-4-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 4295871096254606669
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 213.186.62.213
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 5/7] busybox/find-touchscreen: handle input/device case
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
X-List-Received-Date: Fri, 29 Oct 2010 21:25:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On a new configuration using 2.6.36 kernel + busybox 1.17.1 ,
find-toucscreen.sh fails because $MDEV is input/event0 and not event0.

This patch fixes this problem by removing input/ if present in $MDEV.

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/busybox/files/find-touchscreen.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/busybox/files/find-touchscreen.sh b/recipes/busybox/files/find-touchscreen.sh
index 1582ea8..cfce788 100644
--- a/recipes/busybox/files/find-touchscreen.sh
+++ b/recipes/busybox/files/find-touchscreen.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 
+MDEV=`echo $MDEV | sed 's#input/##g'`
+
 if [ `egrep "input:.*-e0.*,3,.*a0,1,.*18,.*" /sys/class/input/$MDEV/device/modalias|wc -l` -gt 0 ]; then
 	ln -sf /dev/input/$MDEV /dev/input/touchscreen0
 fi
-- 
1.6.3.3



