Return-Path: <marc.ferland@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3D2896AE39
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2013 17:20:56 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id n20so814683qaj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jun 2013 10:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=1uIFnuDFrfa5GtgBN7KSrfBRiluMNoc2loJZ3Jz98dY=;
	b=xyXpFBlPKxokN9dwI1TZb/gllDNzRlJFds0ujAgqRw7QGBvvRYCWY49YxEbh6Sb2jn
	ma5rjGsWK/AUQhE93dMjohB5o6cIxeucpfxFt5FoB+tLnr/0posAJ3WNKxfxYAQII3j7
	5BOgxMHkuPl5k4rvyctJndklqcCAJzUOMznLKVBmZHSzAFUHx7EuzO4hQ0RIn7jI+lwA
	273K2MOzGXTHK9SbBKulbLNY8TYJBROdbE2pS29ij8hvuqp+vDx7ITpXeJlmtMZREBpR
	eJZ0c6fRUSODWQX1LkJn+5JsGj6psbQ1rOam8Q5IowLBRg/s8S3e548bBeNtgdq8yvGb
	QRew==
X-Received: by 10.224.180.10 with SMTP id bs10mr869138qab.85.1372180856460;
	Tue, 25 Jun 2013 10:20:56 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id s9sm20347157qeo.3.2013.06.25.10.20.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 10:20:55 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Tue, 25 Jun 2013 13:21:07 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 25 Jun 2013 13:20:46 -0400
Message-Id: <1372180846-19937-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] lmsensors: fix fancontrol init script
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
X-List-Received-Date: Tue, 25 Jun 2013 17:20:56 -0000

Make the 'fancontrol stop' command work again by using the fancontrol
pid file instead of matching the process by name. While at it, also do
a bit of cleaning.

Signed-off-by: Marc Ferland <ferlandm@sonatest.com>
---
 meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
index f179310..4433020 100644
--- a/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
+++ b/meta-oe/recipes-support/lm_sensors/lmsensors/fancontrol.init
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/sh
 ### BEGIN INIT INFO
 # Provides:          fancontrol
 # Required-Start:    $local_fs
@@ -16,8 +16,7 @@ PATH=/sbin:/usr/sbin:/bin:/usr/bin
 DESC="fan control daemon"
 NAME="fancontrol"
 FANCONTROL=`which $NAME`
-
-. /etc/init.d/functions || exit 1
+PIDFILE="/var/run/fancontrol.pid"
 
 # Exit if the package is not installed
 [ -x "$FANCONTROL" ] || exit 0
@@ -25,12 +24,12 @@ FANCONTROL=`which $NAME`
 case "$1" in
     start)
         echo -n "Starting $DESC: $NAME... "
-        /sbin/start-stop-daemon -S -x $FANCONTROL -b -- $FANCONTROL_ARGS
+        start-stop-daemon -S -p $PIDFILE -b -x $FANCONTROL
         echo "done."
         ;;
     stop)
         echo -n "Stopping $DESC: $NAME... "
-        /sbin/start-stop-daemon -K -x $FANCONTROL
+        start-stop-daemon -K -p $PIDFILE
         echo "done."
         ;;
     restart)
-- 
1.8.1.2


