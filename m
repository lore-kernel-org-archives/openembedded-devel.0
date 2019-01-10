Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 82F2C7C07B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id B614818011B36;
	Thu, 10 Jan 2019 10:42:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:42:12 +0100
Message-Id: <20190110094212.16763-6-richard@nod.at>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190110094212.16763-1-richard@nod.at>
References: <20190110094212.16763-1-richard@nod.at>
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH 6/6] [meta-oe] mini-iconv: Don't use ${PN}
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
X-List-Received-Date: Thu, 10 Jan 2019 09:50:58 -0000
Content-Transfer-Encoding: quoted-printable

Don't use ${PN} for the source dir, it will break multilib builds.
The correct variable is ${BPN}.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta-oe/recipes-support/mini-iconv/mini-iconv.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb b/meta-oe/r=
ecipes-support/mini-iconv/mini-iconv.bb
index 0f1548aa284f..44f55b58df94 100644
--- a/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
+++ b/meta-oe/recipes-support/mini-iconv/mini-iconv.bb
@@ -13,7 +13,7 @@ SRC_URI[md5sum] =3D "84412221e26505a2b3855d4a1cdcd0e0"
 SRC_URI[sha256sum] =3D "3552262bf1bcf8e859a2a3a7adfb0367af8593383e730c49=
2e981477aac0a0d4"
=20
=20
-S =3D "${WORKDIR}/${PN}"
+S =3D "${WORKDIR}/${BPN}"
=20
 do_install() {
     oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix} LIB=3D${base_li=
bdir}
--=20
2.20.1


