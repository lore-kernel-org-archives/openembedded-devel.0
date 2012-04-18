Received: from static-92-33-14-100.sme.bredbandsbolaget.se ([92.33.14.100]
	helo=mailhost.lundinova.se) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <johan.hovold@lundinova.se>) id 1SKTfV-0000W5-HM
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 14:07:29 +0200
Received: from pi (unknown [10.240.22.136])
	(using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailhost.lundinova.se (Postfix) with ESMTP id 91F65E826A;
	Wed, 18 Apr 2012 13:28:38 +0200 (CEST)
Received: from johan by pi with local (Exim 4.77) (envelope-from <johan@pi>)
	id 1SKT3u-00061F-Gw; Wed, 18 Apr 2012 13:28:38 +0200
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Apr 2012 13:27:01 +0200
Message-Id: <1334748421-22883-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.7.8.5
Sender: <johan.hovold@lundinova.se>
Subject: [meta-oe][PATCH] gpsd: fix gpsd init script
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
X-List-Received-Date: Wed, 18 Apr 2012 12:07:29 -0000

Replace return with exit where appropriate.

Current init script uses return outside of functions resulting in
warnings such as the following when using bash as interpreter:

/etc/init.d/gpsd: line 98: return: can only `return' from a function or sourced script

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---
 meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd |   10 +++++-----
 meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb   |    2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd
index 3687d24..ba73daf 100755
--- a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd
+++ b/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd
@@ -95,19 +95,19 @@ case "$1" in
   start)
 		echo "Starting $DESC" "$NAME"
 		do_start
-		return $?
+		exit $?
 	;;
   stop)
 	echo "Stopping $DESC" "$NAME"
 	do_stop
-	return $?
+	exit $?
 	;;
   status)
        ;;
   reload|force-reload)
 	echo "Reloading $DESC" "$NAME"
 	do_reload
-	return $?
+	exit $?
 	;;
   restart)
 	#
@@ -119,11 +119,11 @@ case "$1" in
 	case "$?" in
 	  0|1)
 		do_start
-		return $?
+		exit $?
 		;;
 	  *)
 	 	# Failed to stop
-		return 1
+		exit 1
 		;;
 	esac
 	;;
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
index 927107a..7e2a96c 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r2"
+PR = "r3"
 
 EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
                 --x-libraries=${STAGING_LIBDIR} \
-- 
1.7.8.5



