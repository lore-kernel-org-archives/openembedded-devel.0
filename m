Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P8KIW-0000qB-3W
	for openembedded-devel@openembedded.org; Wed, 20 Oct 2010 00:05:26 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id A6B3A1D36173;
	Wed, 20 Oct 2010 00:04:02 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 20 Oct 2010 00:04:07 +0200
Message-Id: <1287525847-13430-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] busybox: add ts72xx hwclock-default file and modify hwclock.sh
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
X-List-Received-Date: Tue, 19 Oct 2010 22:05:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This patch simplifies the hwclock.sh init script and adds a possibility t=
o
fallback to default RTC device even if the device specified in HWCLOCKDEV=
ICE
doesn't exist.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/busybox/busybox.inc                  |    2 +-
 recipes/busybox/files/hwclock.sh             |   34 +++++++-------------=
-----
 recipes/busybox/files/ts72xx/hwclock-default |    2 +
 3 files changed, 13 insertions(+), 25 deletions(-)
 mode change 100644 =3D> 100755 recipes/busybox/files/hwclock.sh
 create mode 100644 recipes/busybox/files/ts72xx/hwclock-default

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 401f6ad..362ab9c 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE =3D "GPLv2"
 SECTION =3D "base"
 PRIORITY =3D "required"
=20
-INC_PR =3D "r35"
+INC_PR =3D "r36"
=20
 SRC_URI =3D "\
   file://busybox-cron \
diff --git a/recipes/busybox/files/hwclock.sh b/recipes/busybox/files/hwc=
lock.sh
old mode 100644
new mode 100755
index 1bc9de3..b55da2e
--- a/recipes/busybox/files/hwclock.sh
+++ b/recipes/busybox/files/hwclock.sh
@@ -18,6 +18,12 @@
=20
 [ "$UTC" =3D yes ] && UTC=3D-u || UTC=3D-l
=20
+if  [ ! -z "$HWCLOCKDEVICE" ]; then
+	if [ -e $HWCLOCKDEVICE ]; then
+		DEVICE=3D"-f $HWCLOCKDEVICE"
+	fi
+fi
+
 case "$1" in
         start)
                 if [ "$VERBOSE" !=3D no ]
@@ -30,19 +36,9 @@ case "$1" in
 		then
 			if [ -z "$TZ" ]
 			then
-				if [ -z "$HWCLOCKDEVICE" ]
-				then
-					hwclock -s $UTC
-				else
-					hwclock -s $UTC -f $HWCLOCKDEVICE
-				fi
+				hwclock -s $UTC $DEVICE
 			else
-				if [ -z "$HWCLOCKDEVICE" ]
-				then
-					TZ=3D"$TZ" hwclock -s $UTC
-				else
-					TZ=3D"$TZ" hwclock -s $UTC -f $HWCLOCKDEVICE
-				fi
+				TZ=3D"$TZ" hwclock -s $UTC $DEVICE
 			fi
 		fi
=20
@@ -65,12 +61,7 @@ case "$1" in
 		fi
 		if [ "$HWCLOCKACCESS" !=3D no ]
 		then
-			if [ -z "$HWCLOCKDEVICE" ]
-			then
-				hwclock -w $UTC
-			else
-				hwclock -w $UTC -f $HWCLOCKDEVICE
-			fi
+			hwclock -w $UTC $DEVICE
 		fi
 		if [ "$VERBOSE" !=3D no ]
 		then
@@ -81,12 +72,7 @@ case "$1" in
 	show)
 		if [ "$HWCLOCKACCESS" !=3D no ]
 		then
-			if [ -z "$HWCLOCKDEVICE" ]
-			then
-				hwclock -r $UTC
-			else
-				hwclock -r $UTC -f $HWCLOCKDEVICE
-			fi
+			hwclock -r $UTC $DEVICE
 		fi
 		;;
         *)
diff --git a/recipes/busybox/files/ts72xx/hwclock-default b/recipes/busyb=
ox/files/ts72xx/hwclock-default
new file mode 100644
index 0000000..8ab3fd4
--- /dev/null
+++ b/recipes/busybox/files/ts72xx/hwclock-default
@@ -0,0 +1,2 @@
+HWCLOCKACCESS=3Dyes
+HWCLOCKDEVICE=3D/dev/rtc1
--=20
1.7.0.4



