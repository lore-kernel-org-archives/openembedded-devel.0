Received: from smtp201.alice.it ([82.57.200.97])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <GNUtoo@no-log.org>) id 1QApQ0-00077j-OA
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Apr 2011 22:15:04 +0200
Received: from localhost.localdomain (95.249.56.93) by smtp201.alice.it
	(8.5.124.08) (authenticated as editempo@alice.it)
	id 4CC05A4C063ACBB8; Fri, 15 Apr 2011 22:12:47 +0200
From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Apr 2011 22:12:36 +0200
Message-Id: <1302898356-22075-1-git-send-email-GNUtoo@no-log.org>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] xserver-nodm-init 2.0: remove DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Fri, 15 Apr 2011 20:15:04 -0000

That fix was made in order to prevent distributions like Angstrom2010
  from picking the 1.0 version:
Angstrom 2008 picked the 2.0 version while Angstrom 2010 use the 1.0 version.
  That can prevent Xorg session from starting on the target device(like bug20 in my case):
The 1.0 lacks the following session start:
    xinit /etc/X11/Xsession -- `which $XSERVER` $ARGS >/var/log/Xsession.log 2>&1
And has that instead:
    /etc/X11/Xserver &
Which has the effect of starting Xorg only(and not the session,display manager etc...)

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
---
 recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb b/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb
index 5d6ca39..317d58a 100644
--- a/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb
+++ b/recipes/xserver-nodm-init/xserver-nodm-init_2.0.bb
@@ -3,7 +3,6 @@ LICENSE = "GPL"
 SECTION = "x11"
 PRIORITY = "optional"
 RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"
-DEFAULT_PREFERENCE = "-1"
 PR = "r4"
 
 SRC_URI = "file://xserver-nodm"
-- 
1.7.0.4



