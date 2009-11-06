Received: from [82.208.49.253] (helo=mengele.ibawizard.net ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ynezz@mengele.ibawizard.net>) id 1N6UiN-0002nt-LM
	for openembedded-devel@openembedded.org; Fri, 06 Nov 2009 20:43:22 +0100
Received: by mengele.ibawizard.net (Postfix, from userid 1002)
	id 50A741D36079; Fri,  6 Nov 2009 20:42:03 +0100 (CET)
From: =?utf-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: openembedded-devel@openembedded.org
Date: Fri,  6 Nov 2009 20:42:02 +0100
Message-Id: <1257536522-11924-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1257536522-11924-2-git-send-email-ynezz@true.cz>
References: <1257536522-11924-1-git-send-email-ynezz@true.cz>
	<1257536522-11924-2-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 82.208.49.253
X-SA-Exim-Mail-From: ynezz@mengele.ibawizard.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] xf86-video-geode: update to 2.11.6
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
X-List-Received-Date: Fri, 06 Nov 2009 19:43:23 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
---
 conf/checksums.ini                             |    4 ++++
 recipes/xorg-driver/xf86-video-geode_2.11.6.bb |    7 +++++++
 2 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xorg-driver/xf86-video-geode_2.11.6.bb

diff --git a/conf/checksums.ini b/conf/checksums.ini
index 29c063a..e26fef1 100644
--- a/conf/checksums.ini
+++ b/conf/checksums.ini
@@ -28198,6 +28198,10 @@ sha256=3D2d252847a410636b55bf80900d9432ca438775f=
70377ce81311282a2d12853b5
 md5=3D05f85d897ef41d13de354ac0252bf923
 sha256=3Dd739f6762fe3aa7ef7ca74f87fbe4d6ec3bb13a735e5dfb82b6748eda2b3113=
8
=20
+[http://xorg.freedesktop.org/releases/individual/driver/xf86-video-geode=
-2.11.6.tar.bz2]
+md5=3D3ff0dfb4b3bd8872c6efb70371cb6b98
+sha256=3D4a1ada47bc08db13a57f32e73cbc5a5f0774f87ba447071737e50dfefb741f9=
1
+
 [http://xorg.freedesktop.org/releases/individual/driver/xf86-video-geode=
-2.8.0.tar.bz2]
 md5=3Da2b9c70a32b0a6436d837d67fa7aae18
 sha256=3Df0b68171dd4256c927fbee91ecf84fa28c409b5b6b39cbf47eaa48fd73db305=
f
diff --git a/recipes/xorg-driver/xf86-video-geode_2.11.6.bb b/recipes/xor=
g-driver/xf86-video-geode_2.11.6.bb
new file mode 100644
index 0000000..ba189f4
--- /dev/null
+++ b/recipes/xorg-driver/xf86-video-geode_2.11.6.bb
@@ -0,0 +1,7 @@
+require xorg-driver-video.inc
+PE =3D "1"
+
+COMPATIBLE_HOST =3D 'i.86.*-linux'
+DESCRIPTION =3D "X.org server -- Geode GX2/LX display driver"
+
+RDEPENDS_append_iei-nanogx-466 +=3D "xserver-xorg-module-libint10 xserve=
r-xorg-module-xaa "
--=20
1.5.6.3



