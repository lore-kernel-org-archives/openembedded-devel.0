Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1R5luW-0002UN-I4
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Sep 2011 00:02:19 +0200
Received: from mizar.localdomain (87.0.30.53) by smtp207.alice.it (8.5.124.08)
	id 4DFA189A08554750; Mon, 19 Sep 2011 23:56:42 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 19 Sep 2011 23:56:31 +0200
Message-Id: <1316469391-15036-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
References: <1316469391-15036-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-oe][PATCH 3/3] udev: avoid udev stopping persistent ppd connections
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
X-List-Received-Date: Mon, 19 Sep 2011 22:02:20 -0000

* When a pppd session is disconnected it triggers the udev to ifdown the
* ppp link which kills pppd and inhibits a reconnection.
*
* Now avoid udev stopping ppp connections.
*
* See also:
*  https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/396804
*  https://bugs.launchpad.net/ubuntu/+source/ifupdown/+bug/78043
*  http://ubuntuforums.org/showthread.php?t=1177021
*
*  http://rants.atmurray.net/2007/01/pppd-persist-not-so-persist-with-udev.html
*
* Patch was committed in the openembedded git server with commit id
* 51cee0c4458d26660622197a0c897829625b0669

Signed-off-by: Mario Schuknecht <schuknecht@dresearch-fe.de>
Acked-by: Steffen Sledz <sledz@dresearch-fe.de>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-core/udev/udev-extra-rules/network.sh  |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/udev/udev-extra-rules/network.sh b/meta-oe/recipes-core/udev/udev-extra-rules/network.sh
index 182c26d..d287855 100644
--- a/meta-oe/recipes-core/udev/udev-extra-rules/network.sh
+++ b/meta-oe/recipes-core/udev/udev-extra-rules/network.sh
@@ -9,6 +9,8 @@ test -x /sbin/cardctl && exit 0
 # We get two "add" events for hostap cards due to wifi0
 echo "$INTERFACE" | grep -q wifi && exit 0
 
+# Avoid udev stopping persistent ppp connections
+echo "$INTERFACE" | grep -q ppp && exit 0
 
 # Check if /etc/init.d/network has been run yet to see if we are 
 # called by starting /etc/rcS.d/S03udev and not by hotplugging a device
-- 
1.7.3.4



