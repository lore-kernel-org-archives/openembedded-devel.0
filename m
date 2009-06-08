Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael@sles10-64.ott.cti.com>) id 1MDV7w-0002Y0-KK
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jun 2009 05:02:24 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 72DA44C343E;
	Sun,  7 Jun 2009 22:52:58 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26205-02; Sun,  7 Jun 2009 22:52:58 -0400 (EDT)
Received: by smtp.cbnco.com (Postfix, from userid 1003)
	id 522E14D3B78; Sun,  7 Jun 2009 22:52:58 -0400 (EDT)
X-Spam-Score: 
X-Spam-Checker-Version: SpamAssassin 3.1.8 (2007-02-13) on sid.cbnco.com
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=7.0 tests=ALL_TRUSTED,AWL,BAYES_00
	autolearn=ham version=3.1.8
Received: from sles10-64.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTP id 43C9841D404;
	Sun,  7 Jun 2009 22:52:55 -0400 (EDT)
Received: by sles10-64.ott.cti.com (Postfix, from userid 1000)
	id 4220F4147F; Sun,  7 Jun 2009 22:52:55 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  7 Jun 2009 22:52:51 -0400
Message-Id: <1244429571-27482-1-git-send-email-msmith@cbnco.com>
X-Mailer: git-send-email 1.6.3
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: [PATCH] Add bwm-ng 0.6: lightweight network and disk bandwidth monitor
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
X-List-Received-Date: Mon, 08 Jun 2009 03:02:26 -0000

Signed-off-by: Michael Smith <msmith@cbnco.com>
---
 conf/checksums.ini           |    4 ++++
 recipes/bwm-ng/bwm-ng_0.6.bb |   16 ++++++++++++++++
 2 files changed, 20 insertions(+), 0 deletions(-)
 create mode 100644 recipes/bwm-ng/bwm-ng_0.6.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index c3c83c3..62f5a77 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -3234,6 +3234,10 @@ sha256=c94dbfa293cbc61b8571d025e90fd1f06a34f8d4e5b11a59856bfc1f13014de3
 md5=b9d77c57bda2e019207a1874d9bb4dea
 sha256=c94dbfa293cbc61b8571d025e90fd1f06a34f8d4e5b11a59856bfc1f13014de3
 
+[http://downloads.sourceforge.net/bwmng/bwm-ng-0.6.tar.gz]
+md5=d3a02484fb7946371bfb4e10927cebfb
+sha256=c1134358e268329d438b0996399003b0f0b966034fb4b5b138761c2f3c62ffdd
+
 [http://downloads.sourceforge.net/bwmon/bwmon-1.3.tar.gz]
 md5=53c44b73aa67d5e0282adfe928f3ba44
 sha256=624381208d0faae6c123bc6198a59d6c4316cd4fffb1ba5aca206374f5a42df6
diff --git a/recipes/bwm-ng/bwm-ng_0.6.bb b/recipes/bwm-ng/bwm-ng_0.6.bb
new file mode 100644
index 0000000..5a28162
--- /dev/null
+++ b/recipes/bwm-ng/bwm-ng_0.6.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Lightweight console network and disk bandwidth monitor"
+LICENSE = "GPLv2"
+DEPENDS = "ncurses"
+PR = "r0"
+
+SRC_URI = "${SOURCEFORGE_MIRROR}/bwmng/bwm-ng-${PV}.tar.gz"
+
+inherit autotools
+
+# Use /proc/net/dev and /proc/diskstats rather than full libstatgrab.
+# Disable netstat -i parser as it's not compatible with busybox netstat.
+EXTRA_OECONF = " \
+    --with-procnetdev --with-diskstats \
+    --with-libstatgrab=no \
+    --with-netstatlinux=no \
+"
-- 
1.6.3



