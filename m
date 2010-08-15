Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OkUXv-0005mh-5a
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Aug 2010 06:10:23 +0200
Received: by qyk11 with SMTP id 11so2182494qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 21:09:46 -0700 (PDT)
Received: by 10.229.10.203 with SMTP id q11mr162033qcq.282.1281845386201;
	Sat, 14 Aug 2010 21:09:46 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id r36sm5591015qcs.27.2010.08.14.21.09.44
	(version=SSLv3 cipher=RC4-MD5); Sat, 14 Aug 2010 21:09:45 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Aug 2010 23:09:43 -0500
Message-Id: <1281845383-10378-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] mplayer: bump PR for packages depending on jpeg which changed .so name with 6b -> 8b upgrade
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
X-List-Received-Date: Sun, 15 Aug 2010 04:10:24 -0000

Commit fca4a21b18063f16d5dff4adc914a2f131af3696 missed mplayer_svn.bb.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/mplayer/mplayer_svn.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/mplayer/mplayer_svn.bb b/recipes/mplayer/mplayer_svn.bb
index 4623357..13ffb89 100644
--- a/recipes/mplayer/mplayer_svn.bb
+++ b/recipes/mplayer/mplayer_svn.bb
@@ -43,7 +43,7 @@ RCONFLICTS_${PN} = "mplayer-atty"
 RREPLACES_${PN} = "mplayer-atty"
 
 PV = "0.0+1.0rc3+svnr${SRCPV}"
-PR = "r23"
+PR = "r24"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_angstrom = "1"
 DEFAULT_PREFERENCE_shr = "1"
-- 
1.5.6.4



