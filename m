Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R4Yz5-0003Aw-Lr
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:01:39 +0200
Received: by mail-fx0-f47.google.com with SMTP id 1so1786584fxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 06:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=KTQxPB8ujVnG9xrwcm38boAnacfEeQFtsuQOBzfNED0=;
	b=MqAnLDurP42hj4UD9QlAgDDrmbs/6xAKRKdaYMg+z8teu1SY/iFUkEWhpXtU7NSeIJ
	Y9fu2trD3EL1xA2MavDRCZMa77X2+GAdSQyPynwfCpS9HleiKyhTOq2YGk6Ov1LVNp9N
	E/5ejzimkWdRWxum1Y89oJEnpl/lQblP+8gg8=
Received: by 10.223.39.217 with SMTP id h25mr14100fae.125.1316181384184;
	Fri, 16 Sep 2011 06:56:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w14sm10632828fae.13.2011.09.16.06.56.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Sep 2011 06:56:23 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Sep 2011 15:56:06 +0200
Message-Id: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <cover.1316181282.git.Martin.Jansa@gmail.com>
References: <cover.1316181282.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/10] connman: drop initscript file used by SHR
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
X-List-Received-Date: Fri, 16 Sep 2011 14:01:39 -0000

* moved to meta-shr

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../connman/connman/shr/connman                    |   42 --------------------
 1 files changed, 0 insertions(+), 42 deletions(-)
 delete mode 100755 meta-oe/recipes-connectivity/connman/connman/shr/connman

diff --git a/meta-oe/recipes-connectivity/connman/connman/shr/connman b/meta-oe/recipes-connectivity/connman/connman/shr/connman
deleted file mode 100755
index 708b1b4..0000000
--- a/meta-oe/recipes-connectivity/connman/connman/shr/connman
+++ /dev/null
@@ -1,42 +0,0 @@
-#!/bin/sh
-
-DAEMON="/usr/sbin/connmand -I usb0"
-PIDFILE=/var/run/connmand.pid
-DESC="Connection Manager"
-
-if [ -f /etc/default/connman ] ; then
-	. /etc/default/connman
-fi
-
-set -e
-
-do_start() {
-	$DAEMON
-}
-
-do_stop() {
-	start-stop-daemon --stop --name connmand --quiet
-}
-
-case "$1" in
-  start)
-	echo "Starting $DESC"
-	do_start
-	;;
-  stop)
-	echo "Stopping $DESC"
-	do_stop
-	;;
-  restart|force-reload)
-	echo "Restarting $DESC"
-	do_stop
-	sleep 1
-	do_start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|force-reload}" >&2
-	exit 1
-	;;
-esac
-
-exit 0
-- 
1.7.6.1



