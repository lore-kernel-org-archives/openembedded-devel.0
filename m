Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Rm8Aj-00026A-WC
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Jan 2012 19:17:46 +0100
Received: from localhost.localdomain (unknown [82.233.81.124])
	by smtp3-g21.free.fr (Postfix) with ESMTP id C0F4DA67C4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Jan 2012 19:10:10 +0100 (CET)
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 14 Jan 2012 19:10:08 +0100
Message-Id: <1326564608-31175-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.7.5
MIME-Version: 1.0
Subject: [meta-oe] libjpeg-turbo: native depends on nasm-native
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
X-List-Received-Date: Sat, 14 Jan 2012 18:17:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

else I get the following error during configure :
| configure: error: no nasm (Netwide Assembler) found

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb b/meta-oe/rec=
ipes-core/jpeg/libjpeg-turbo_svn.bb
index cf1a383..d6e3b03 100644
--- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
+++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
@@ -28,3 +28,4 @@ FILES_libturbojpeg =3D "${libdir}/libturbojpeg.so"
 INSANE_SKIP_libturbojpeg =3D "dev-so"
=20
 BBCLASSEXTEND =3D "native"
+DEPENDS_virtclass-native =3D "nasm-native"
--=20
1.7.7.5



