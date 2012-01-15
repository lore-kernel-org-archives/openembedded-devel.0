Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1RmTIT-0002FZ-Qt
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Jan 2012 17:51:18 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id B2DA4A64F9;
	Sun, 15 Jan 2012 17:42:55 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Jan 2012 17:42:47 +0100
Message-Id: <1326645768-13447-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.5
MIME-Version: 1.0
Subject: [meta-java 1/2] openjdk-6-6b24: fix icedtea-launcher-stdc++.patch
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
X-List-Received-Date: Sun, 15 Jan 2012 16:51:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

without this fix I get (on a FC16) :
| Checking patches/icedtea-launcher-stdc++.patch
| /usr/bin/patch: **** rejecting absolute target file name: /openjdk/hots=
pot/make/linux/makefiles/launcher.make
| ERROR patch patches/icedtea-launcher-stdc++.patch FAILED!

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 .../openjdk-6-6b24/icedtea-launcher-stdc++.patch   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.=
patch b/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
index ebe34e7..b97745d 100644
--- a/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
+++ b/recipes-core/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
@@ -1,7 +1,7 @@
 Index: openjdk/hotspot/make/linux/makefiles/launcher.make
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 --- openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:33:=
37.000000000 +0100
-+++ /openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:37=
:54.055022618 +0100
++++ openjdk/hotspot/make/linux/makefiles/launcher.make	2011-12-20 10:37:=
54.055022618 +0100
 @@ -51,7 +51,7 @@
  else
    LAUNCHER.o                 =3D launcher.o
--=20
1.7.7.5



