Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P2pt5-0001LK-Fo
	for openembedded-devel@openembedded.org; Mon, 04 Oct 2010 20:35:48 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id B4C681D363E6;
	Mon,  4 Oct 2010 20:35:26 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  4 Oct 2010 22:35:32 +0200
Message-Id: <1286224532-392-1-git-send-email-ynezz@true.cz>
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
Subject: [PATCH] busybox: add posibility to specify correct rtc device for hwclock init script
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
X-List-Received-Date: Mon, 04 Oct 2010 18:35:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

With this patch it's now possible to specify rtc device using HWCLOCKDEVI=
CE
variable in /etc/default/hwclock and the system time is then set using co=
rrect
device and vice versa. It's wise to have such functionality, beacuse ther=
e're
SBCs with more then one rtc device, for example ts72xx.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/busybox/busybox.inc      |    2 +-
 recipes/busybox/files/hwclock.sh |   28 ++++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/recipes/busybox/busybox.inc b/recipes/busybox/busybox.inc
index 1046b2f..401f6ad 100644
--- a/recipes/busybox/busybox.inc
+++ b/recipes/busybox/busybox.inc
@@ -11,7 +11,7 @@ LICENSE =3D "GPLv2"
 SECTION =3D "base"
 PRIORITY =3D "required"
=20
-INC_PR =3D "r34"
+INC_PR =3D "r35"
=20
 SRC_URI =3D "\
   file://busybox-cron \
diff --git a/recipes/busybox/files/hwclock.sh b/recipes/busybox/files/hwc=
lock.sh
index 71538fb..1bc9de3 100644
--- a/recipes/busybox/files/hwclock.sh
+++ b/recipes/busybox/files/hwclock.sh
@@ -30,9 +30,19 @@ case "$1" in
 		then
 			if [ -z "$TZ" ]
 			then
-	                   hwclock -s $UTC
+				if [ -z "$HWCLOCKDEVICE" ]
+				then
+					hwclock -s $UTC
+				else
+					hwclock -s $UTC -f $HWCLOCKDEVICE
+				fi
 			else
-			   TZ=3D"$TZ" hwclock -s $UTC
+				if [ -z "$HWCLOCKDEVICE" ]
+				then
+					TZ=3D"$TZ" hwclock -s $UTC
+				else
+					TZ=3D"$TZ" hwclock -s $UTC -f $HWCLOCKDEVICE
+				fi
 			fi
 		fi
=20
@@ -55,7 +65,12 @@ case "$1" in
 		fi
 		if [ "$HWCLOCKACCESS" !=3D no ]
 		then
-			hwclock -w $UTC
+			if [ -z "$HWCLOCKDEVICE" ]
+			then
+				hwclock -w $UTC
+			else
+				hwclock -w $UTC -f $HWCLOCKDEVICE
+			fi
 		fi
 		if [ "$VERBOSE" !=3D no ]
 		then
@@ -66,7 +81,12 @@ case "$1" in
 	show)
 		if [ "$HWCLOCKACCESS" !=3D no ]
 		then
-			hwclock -r $UTC
+			if [ -z "$HWCLOCKDEVICE" ]
+			then
+				hwclock -r $UTC
+			else
+				hwclock -r $UTC -f $HWCLOCKDEVICE
+			fi
 		fi
 		;;
         *)
--=20
1.7.0.4



