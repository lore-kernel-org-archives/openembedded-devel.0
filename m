Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1R1EQ7-0005kT-HT
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Sep 2011 11:27:47 +0200
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id ED5FC77CDC6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Sep 2011 11:22:45 +0200 (CEST)
Received: from e6520eb.lan (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id CA12F4B0056;
	Wed,  7 Sep 2011 11:22:40 +0200 (CEST)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  7 Sep 2011 11:22:37 +0200
Message-Id: <1315387357-21355-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1315349980-6611-1-git-send-email-eric@eukrea.com>
References: <1315349980-6611-1-git-send-email-eric@eukrea.com>
MIME-Version: 1.0
Cc: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
Subject: [meta-oe v2] tzdata & tzcode: update to 2011i
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
X-List-Received-Date: Wed, 07 Sep 2011 09:27:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 ...code-native_2011g.bb =3D> tzcode-native_2011i.bb} |   11 +++++------
 .../tzdata/{tzdata_2011g.bb =3D> tzdata_2011i.bb}    |    4 ++--
 2 files changed, 7 insertions(+), 8 deletions(-)
 rename meta-oe/recipes-extended/tzcode/{tzcode-native_2011g.bb =3D> tzco=
de-native_2011i.bb} (56%)
 rename meta-oe/recipes-extended/tzdata/{tzdata_2011g.bb =3D> tzdata_2011=
i.bb} (72%)

diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb b/met=
a-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
similarity index 56%
rename from meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
rename to meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
index 651d1dd..358a313 100644
--- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
+++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011i.bb
@@ -9,12 +9,11 @@ LIC_FILES_CHKSUM =3D "file://README;md5=3D3ae8198f82258=
417ce29066d3b034035"
 # Also, tzdata (and it is needed to build tzcode) version can differ fro=
m
 # tzcode version, thus this variable
=20
-TZDATA_PV =3D "2011h"
+TZDATA_PV =3D "2011i"
=20
 PR =3D "${INC_PR}.1"
=20
-SRC_URI[tzcode-2011g.md5sum] =3D "ecb564279b28c5b184421c525d997d6c"
-SRC_URI[tzcode-2011g.sha256sum] =3D "636c735d8df1276cc8ab88bc31bb36a21f9=
1ed34e26d181303ecd8fe48021bc2"
-SRC_URI[tzdata-2011h.md5sum] =3D "546d27b6c1e5e1097bd512651815017f"
-SRC_URI[tzdata-2011h.sha256sum] =3D "c098786d053736dd18d4f1fbebdf41554c6=
fd702a36f75c18f1c66712d2abc24"
-
+SRC_URI[tzcode-2011i.md5sum] =3D "cf7f4335b7c8682899fa2814e711c1b2"
+SRC_URI[tzcode-2011i.sha256sum] =3D "f0dd991de3f8d6c599c104e294377c9befa=
1ef40aa5a1d09e2e295a453f3c1ec"
+SRC_URI[tzdata-2011i.md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
+SRC_URI[tzdata-2011i.sha256sum] =3D "f8dde7ca5e61f21ac34c8cdbef5568d00c8=
29981211098f059d8104964c81ffa"
diff --git a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb b/meta-oe/re=
cipes-extended/tzdata/tzdata_2011i.bb
similarity index 72%
rename from meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
rename to meta-oe/recipes-extended/tzdata/tzdata_2011i.bb
index 6863b5a..783b38e 100644
--- a/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
+++ b/meta-oe/recipes-extended/tzdata/tzdata_2011i.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM =3D "file://asia;beginline=3D2;endline=3D=
3;md5=3D06468c0e84ef4d4c97045a
 # just bump it to the latest available version, removing the old one
=20
 PR =3D "${INC_PR}.0"
-SRC_URI[md5sum] =3D "a068c27e7e426fdb12ab0c88506df20d"
-SRC_URI[sha256sum] =3D "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc=
53acbf35e8703d3c"
+SRC_URI[md5sum] =3D "c7a86ec34f30f8d6aa77ef94902a3047"
+SRC_URI[sha256sum] =3D "f8dde7ca5e61f21ac34c8cdbef5568d00c829981211098f0=
59d8104964c81ffa"
--=20
1.7.6



