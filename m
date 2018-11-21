Return-Path: <bradleyb@fuzziesquirrel.com>
Received: from bajor.fuzziesquirrel.com (mail.fuzziesquirrel.com
	[173.167.31.197])
	by mail.openembedded.org (Postfix) with ESMTP id 33BFB6C51A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2018 16:06:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at fuzziesquirrel.com
Sender: bradleyb@bajor.fuzziesquirrel.com
From: Brad Bishop <bradleyb@fuzziesquirrel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Nov 2018 11:06:12 -0500
Message-Id: <20181121160612.26093-1-bradleyb@fuzziesquirrel.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH] libcereal: Add native and nativesdk classes
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
X-List-Received-Date: Wed, 21 Nov 2018 16:06:34 -0000
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Brad Bishop <bradleyb@fuzziesquirrel.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb b/meta-=
oe/recipes-support/libcereal/libcereal_1.2.2.bb
index e733f2fe0..e02b4c960 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.2.2.bb
@@ -14,3 +14,5 @@ S =3D "${WORKDIR}/git"
 inherit cmake
=20
 EXTRA_OECMAKE =3D "-DJUST_INSTALL_CEREAL=3DON"
+
+BBCLASSEXTEND =3D "native nativesdk"
--=20
2.19.1

