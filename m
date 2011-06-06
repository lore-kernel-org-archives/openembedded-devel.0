Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QThKo-0000Ia-0T
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Jun 2011 23:27:42 +0200
Received: (qmail invoked by alias); 06 Jun 2011 21:24:25 -0000
Received: from p5B0A3086.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.48.134]
	by mail.gmx.net (mp013) with SMTP; 06 Jun 2011 23:24:25 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+70sIivO27cnJDAisKUEE7nnIyHV3CFOPMZPOV8D
	gbbTrr1mUx1jJ0
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 Jun 2011 23:25:45 +0200
Message-Id: <1307395545-3738-3-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
References: <1307395545-3738-1-git-send-email-schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: [PATCH v2 2/2] mx28evk: set valid console
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
X-List-Received-Date: Mon, 06 Jun 2011 21:27:42 -0000

The initial patch was build tested only because hardware for tests was not
available. Christian Borutta reported the following log:

INIT: Id "S" respawning too fast: disabled for 5 minutes

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 conf/machine/mx28evk.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/mx28evk.conf b/conf/machine/mx28evk.conf
index e093ffa..823b502 100644
--- a/conf/machine/mx28evk.conf
+++ b/conf/machine/mx28evk.conf
@@ -17,7 +17,7 @@ XSERVER = "xserver-kdrive-fbdev"
 require conf/machine/include/imx28.inc
 
 # used by sysvinit_2
-SERIAL_CONSOLE = "115200 ttymxc0"
+SERIAL_CONSOLE = "115200 ttyAM0"
 
 ROOT_FLASH_SIZE = "128"
 
-- 
1.7.4.4



