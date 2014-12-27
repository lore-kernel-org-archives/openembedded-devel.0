Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 96B6D713B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 17:22:31 +0000 (UTC)
Received: by mail-pd0-f175.google.com with SMTP id g10so14575531pdj.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 09:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=dbACu7yJ1GaCVn2mhALhiLFQRHnd7E/ubSB7WE8EtII=;
	b=Nl1PYR0O/9cmlfk7pNm8TZgQUJNIAWJpNBFeNNc76Mbm5PoPzvHVngfoKkcuJfBq3D
	y335xRvy/em0x7cUKe/YNJ1uPHZOgT/6a2zTMH6LHkSJqazwH1q//tDrFekRfC8TbAwH
	6HIB3yXYarNQOR+lEetV72eFE+Kh/JAMvRUS2jb5bXCtRiuN+vJ/gTyAiuNvNMTrS2dE
	4xyfue726fAm+20dUWjJYqXXWLfREaXIZQazekcYhvxGETafwlyi3yFc58liu7IBfDjz
	/5E2Dp85QCtdlKP5d4wWZw2Ycd6Whmrh7vSeqetMAIBukvFscQ2u4k7KSUBsfu9KpRtF
	UGAA==
X-Received: by 10.70.108.232 with SMTP id hn8mr55569515pdb.99.1419700952230;
	Sat, 27 Dec 2014 09:22:32 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id
	fu1sm31202444pbb.91.2014.12.27.09.22.30
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Dec 2014 09:22:31 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	otavio@ossystems.com.br
Date: Sat, 27 Dec 2014 09:21:57 -0800
Message-Id: <ad4734201b02f7acec08ad4571571e125d05b975.1419700394.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
In-Reply-To: <cover.1419700394.git.akuster808@gmail.com>
References: <cover.1419700394.git.akuster808@gmail.com>
Subject: [PATCH 10/27] hostapd: several fixes for init script
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Dec 2014 17:22:31 -0000

From: Jackie Huang <jackie.huang@windriver.com>

* restart: The stop may delay a few seconds according to different wireless
  devices, on debian/ubuntu, the init script directly sleep 8 seconds
  to wait the stop complete, here we add a delay function (sleep in a loop)
  to ensure the stop is completed before start.
* add status command.
* add --oknodo for stop so it will not break restart if there is no
  running process.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-connectivity/hostapd/hostapd-2.2/init  | 27 +++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
index 79f74b6..8ba4e07 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd-2.2/init
@@ -8,6 +8,23 @@ test -f $DAEMON || exit 0
 
 set -e
 
+# source function library
+. /etc/init.d/functions
+
+delay_stop() {
+	count=0
+	while [ $count -lt 9 ] ; do
+	        if pidof $DAEMON >/dev/null; then
+	                sleep 1
+	        else
+	                return 0
+	        fi
+		count=`expr $count + 1`
+	done
+	echo "Failed to stop $DESC."
+	return 1
+}
+
 case "$1" in
     start)
 	echo -n "Starting $DESC: "
@@ -16,20 +33,24 @@ case "$1" in
 	;;
     stop)
 	echo -n "Stopping $DESC: "
-	start-stop-daemon -K -x $DAEMON
+	start-stop-daemon -K --oknodo -x $DAEMON
 	echo "$NAME."
 	;;
     restart)
 	$0 stop
-	$0 start
+	delay_stop && $0 start
 	;;
     reload)
 	echo -n "Reloading $DESC: "
 	killall -HUP $(basename ${DAEMON})
 	echo "$NAME."
 	;;
+    status)
+	status $DAEMON
+	exit $?
+	;;
     *)
-	echo "Usage: $0 {start|stop|restart|reload}"
+	echo "Usage: $0 {start|stop|restart|reload|status}"
 	exit 1
 	;;
 esac
-- 
1.9.1


