Received: from einhorn.in-berlin.de ([192.109.42.8] ident=root)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@fensuse.internal.dresearch-fe.de>)
	id 1QcBrn-0007ST-MK for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jun 2011 09:40:52 +0200
X-Envelope-From: sledz@fensuse.internal.dresearch-fe.de
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116]) (authenticated bits=0)
	by einhorn.in-berlin.de (8.13.6/8.13.6/Debian-1) with ESMTP id
	p5U7XZTr008455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 30 Jun 2011 09:33:35 +0200
Received: by fensuse.internal.dresearch-fe.de (Postfix, from userid 1000)
	id DE8E6442A6B; Thu, 30 Jun 2011 09:33:34 +0200 (CEST)
From: Steffen Sledz <sledz@dresearch-fe.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 30 Jun 2011 09:33:31 +0200
Message-Id: <1309419211-20670-1-git-send-email-sledz@dresearch-fe.de>
X-Mailer: git-send-email 1.7.6
X-Scanned-By: MIMEDefang_at_IN-Berlin_e.V. on 192.109.42.8
Subject: [PATCH] udev: avoid udev stopping persistent pppd connections
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
X-List-Received-Date: Thu, 30 Jun 2011 07:40:52 -0000

From: Mario Schuknecht <schuknecht@dresearch-fe.de>

When a pppd session is disconnected it triggers the udev to ifdown the
ppp link which kills pppd and inhibits a reconnection.

Now avoid udev stopping ppp connections.

See also:
 https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/396804
 https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/78043
 http://ubuntuforums.org/showthread.php?t=1177021
 http://rants.atmurray.net/2007/01/pppd-persist-not-so-persist-with-udev.html

Signed-off-by: Mario Schuknecht <schuknecht@dresearch-fe.de>
Acked-by: Steffen Sledz <sledz@dresearch-fe.de>
---
 recipes/udev/udev/network.sh |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/udev/udev/network.sh b/recipes/udev/udev/network.sh
index 182c26d..d287855 100644
--- a/recipes/udev/udev/network.sh
+++ b/recipes/udev/udev/network.sh
@@ -9,6 +9,8 @@ test -x /sbin/cardctl && exit 0
 # We get two "add" events for hostap cards due to wifi0
 echo "$INTERFACE" | grep -q wifi && exit 0
 
+# Avoid udev stopping persistent ppp connections
+echo "$INTERFACE" | grep -q ppp && exit 0
 
 # Check if /etc/init.d/network has been run yet to see if we are 
 # called by starting /etc/rcS.d/S03udev and not by hotplugging a device
-- 
1.7.6



