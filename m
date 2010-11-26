Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PLvWV-0000Ee-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 11:27:26 +0100
Received: (qmail 16677 invoked by uid 503); 26 Nov 2010 10:30:29 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 26 Nov 2010 10:30:29 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 26 Nov 2010 12:26:06 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 26 Nov 2010 12:26:05 +0200
From: =?utf-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 26 Nov 2010 11:22:53 +0100
Message-Id: <1290766973-11967-2-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.6.3.3
In-Reply-To: <1290766973-11967-1-git-send-email-eric@eukrea.com>
References: <1290766973-11967-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
X-Ovh-Tracer-Id: 10033175546519661898
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
Subject: [PATCH 2/2] qt-demo-init: correctly handle qtdemo for qt4-x11
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
X-List-Received-Date: Fri, 26 Nov 2010 10:27:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Eric Bénard <eric@eukrea.com>
---
 recipes/qt4/qt-demo-init/qtdemo-init |   21 ++++++++++++++++++---
 recipes/qt4/qt-demo-init_0.1.bb      |    2 +-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/recipes/qt4/qt-demo-init/qtdemo-init b/recipes/qt4/qt-demo-init/qtdemo-init
index 8eb8771..ee84be2 100644
--- a/recipes/qt4/qt-demo-init/qtdemo-init
+++ b/recipes/qt4/qt-demo-init/qtdemo-init
@@ -3,7 +3,7 @@
 set -e
 
 if [ -f /usr/bin/qtdemo ]; then
-	QTDEMO=qtdemo
+	QTDEMO="qtdemo > /var/log/Xsession.log 2>&1"
 else
 	QTDEMO="qtdemoE -qws"
 fi
@@ -18,14 +18,29 @@ case "$1" in
 		if [ ! -f /etc/pointercal ]; then
 			/usr/bin/ts_calibrate
 		fi
-		QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
+		if [ $QTDEMO == qtdemo ]; then
+			Xorg &
+			export DISPLAY=:0
+			$QTDEMO &
+		else
+			QWS_MOUSE_PROTO=tslib:$TSLIB_TSDEVICE $QTDEMO &
+		fi
 	else
+		if [ $QTDEMO == qtdemo ]; then
+			Xorg &
+			export DISPLAY=:0
+		fi
 		$QTDEMO &
 	fi
 	;;
   stop)
 	echo "Stopping qtdemo"
-	killall qtdemoE
+	if [ $QTDEMO == qtdemo ]; then
+		killall Xorg
+		killall qtdemo
+	else
+		killall qtdemoE
+	fi
 	;;
   restart)
 	$0 stop
diff --git a/recipes/qt4/qt-demo-init_0.1.bb b/recipes/qt4/qt-demo-init_0.1.bb
index 223ea7e..89eec6c 100644
--- a/recipes/qt4/qt-demo-init_0.1.bb
+++ b/recipes/qt4/qt-demo-init_0.1.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Init script for qtdemo"
 LICENSE = "MIT"
 SRC_URI = "file://qtdemo-init"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "all"
 
-- 
1.6.3.3



