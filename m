Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id A989D6BBDD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 15:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Nov 2018 10:32:45 -0500
Message-Id: <20181128153245.14713-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libcereal: Allow empty package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2018 15:33:03 -0000
Content-Transfer-Encoding: quoted-printable

libcereal is header-only so create the empty base package so that
libcereal can be sanely included in an SDK via IMAGE_INSTALL, RDEPENDS,
and the like.

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb b/meta-=
oe/recipes-support/libcereal/libcereal_1.2.2.bb
index e02b4c960..365b40b17 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
@@ -15,4 +15,6 @@ inherit cmake
=20
 EXTRA_OECMAKE =3D "-DJUST_INSTALL_CEREAL=3DON"
=20
+ALLOW_EMPTY_${PN} =3D "1"
+
 BBCLASSEXTEND =3D "native nativesdk"
--=20
2.19.1

