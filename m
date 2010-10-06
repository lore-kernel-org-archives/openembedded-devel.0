Received: from ibawizard.net ([82.208.49.253] helo=mengele.ibawizard.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1P3We9-0004Cd-9i
	for openembedded-devel@openembedded.org; Wed, 06 Oct 2010 18:15:14 +0200
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 82C561D360EE;
	Wed,  6 Oct 2010 18:14:48 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Oct 2010 20:14:58 +0200
Message-Id: <1286388898-7029-1-git-send-email-ynezz@true.cz>
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
Subject: [PATCH] init-scripts: introduce DONTUSETIMESTAMP variable in bootmisc.sh
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
X-List-Received-Date: Wed, 06 Oct 2010 16:15:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

This variable is useful on systems with battery backed RTC. Imagine, that=
 the
board is shut down and then switched on after, for example three days.
Althought the value in RTC is correct, this scripts sets system time with=
 the
wrong values.

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/initscripts/initscripts-1.0/bootmisc.sh |   15 +++++++++------
 recipes/initscripts/initscripts_1.0.bb          |    2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/recipes/initscripts/initscripts-1.0/bootmisc.sh b/recipes/in=
itscripts/initscripts-1.0/bootmisc.sh
index d19477b..6abefcd 100755
--- a/recipes/initscripts/initscripts-1.0/bootmisc.sh
+++ b/recipes/initscripts/initscripts-1.0/bootmisc.sh
@@ -69,12 +69,15 @@ fi
 test -x /etc/init.d/hwclock.sh && /etc/init.d/hwclock.sh start
 if test -e /etc/timestamp
 then
-	SYSTEMDATE=3D`date "+%Y%m%d"`
-	TIMESTAMP=3D`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($0=
,1,4);}'`
-        NEEDUPDATE=3D`expr \( $TIMESTAMP \> $SYSTEMDATE \)`             =
                                   =20
-        if [ $NEEDUPDATE -eq 1 ]; then=20
-		date `cat /etc/timestamp`
-		/etc/init.d/hwclock.sh stop
+	if test "$DONTUSETIMESTAMP" !=3D no
+	then
+		SYSTEMDATE=3D`date "+%Y%m%d"`
+		TIMESTAMP=3D`cat /etc/timestamp | awk '{ print substr($0,9,4) substr($=
0,1,4);}'`
+	        NEEDUPDATE=3D`expr \( $TIMESTAMP \> $SYSTEMDATE \)`            =
                                    =20
+        	if [ $NEEDUPDATE -eq 1 ]; then=20
+			date `cat /etc/timestamp`
+			/etc/init.d/hwclock.sh stop
+		fi
 	fi
 fi
 : exit 0
diff --git a/recipes/initscripts/initscripts_1.0.bb b/recipes/initscripts=
/initscripts_1.0.bb
index cc60624..3987c60 100644
--- a/recipes/initscripts/initscripts_1.0.bb
+++ b/recipes/initscripts/initscripts_1.0.bb
@@ -4,7 +4,7 @@ PRIORITY =3D "required"
 DEPENDS =3D "makedevs"
 RDEPENDS_${PN} =3D "makedevs"
 LICENSE =3D "GPL"
-PR =3D "r124"
+PR =3D "r125"
=20
 SRC_URI =3D "file://functions \
            file://halt \
--=20
1.7.0.4



