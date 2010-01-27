Received: from ibawizard.net
	([82.208.49.253] helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@true.cz>) id 1NaCCG-0000c6-CF
	for openembedded-devel@openembedded.org; Wed, 27 Jan 2010 19:00:59 +0100
Received: from localhost.localdomain (localhost [127.0.0.1])
	by mengele.ibawizard.net (Postfix) with ESMTP id 534CE1D36078;
	Wed, 27 Jan 2010 18:58:32 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2010 18:58:36 +0100
Message-Id: <1264615116-13972-1-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.6.0.4
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@true.cz
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC][PATCH] udev: get rid of 'timestamp in the future' tar messages
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
X-List-Received-Date: Wed, 27 Jan 2010 18:00:59 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This patch tries to get rid of spew of the useless tar messages durring b=
oot
process on machines without RTC, such as the Beagleboard. Example:

Please wait: booting...
Starting udev
tar: dev/.udev/uevent_seqnum: time stamp 1970-01-01 01:00:21 is 14.122497=
521 s in the future
tar: dev/.udev/rules.d: time stamp 1970-01-01 01:00:07 is 0.119201623 s i=
n the future
tar: dev/.udev/db/\x2fdevices\x2fvirtual\x2fblock\x2fram9: time stamp 197=
0-01-01 01:00:22 is 15.118713341 s in the future

[ more then 100 similar lines cutted off]

Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 recipes/udev/udev-141/init |    2 +-
 recipes/udev/udev_141.bb   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/udev/udev-141/init b/recipes/udev/udev-141/init
index 24ca9d8..66705e6 100644
--- a/recipes/udev/udev-141/init
+++ b/recipes/udev/udev-141/init
@@ -44,7 +44,7 @@ if [ "$DEVCACHE" !=3D "" ]; then
 	   cmp -s /tmp/uname /etc/udev/saved.uname && \
 	   cmp -s /tmp/cmdline /etc/udev/saved.cmdline && \
 	   cmp -s /tmp/atags /etc/udev/saved.atags; then
-		(cd /; tar xf $DEVCACHE)
+		(cd /; tar xf $DEVCACHE > /dev/null 2>&1)
 		not_first_boot=3D1
 	fi
 fi
diff --git a/recipes/udev/udev_141.bb b/recipes/udev/udev_141.bb
index df5e346..d1fee30 100644
--- a/recipes/udev/udev_141.bb
+++ b/recipes/udev/udev_141.bb
@@ -6,7 +6,7 @@ LICENSE =3D "GPL"
 # Untested
 DEFAULT_PREFERENCE =3D "-1"
=20
-PR =3D "r20"
+PR =3D "r21"
=20
 # needed for init.d script
 RDEPENDS_${PN} +=3D "udev-utils"
--=20
1.6.0.4



