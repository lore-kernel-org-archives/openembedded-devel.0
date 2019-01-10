Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 81F567C03F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id D24711802175F;
	Thu, 10 Jan 2019 10:42:50 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:42:07 +0100
Message-Id: <20190110094212.16763-1-richard@nod.at>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH 1/6] [meta-filesystems] fuse-exfat: Don't use ${PN}
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
X-List-Received-Date: Thu, 10 Jan 2019 09:50:57 -0000
Content-Transfer-Encoding: quoted-printable

Don't use ${PN} for the source dir, it will break multilib builds.
The correct variable is ${BPN}.

The bitbake defaults are:
BP =3D "${BPN}-${PV}"
S =3D "${WORKDIR}/${BP}"

Therefore we can remove this line.

Cc: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 .../recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb           | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1=
.2.3.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.=
3.bb
index 99bf2bed411f..18fc9cd6f13d 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -17,5 +17,4 @@ inherit autotools pkgconfig
 SRC_URI[md5sum] =3D "fca71e6598f79d037a3c7c969cb5710c"
 SRC_URI[sha256sum] =3D "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8ac=
d357dd463c2355d9"
=20
-S =3D "${WORKDIR}/${PN}-${PV}"
 EXTRA_OECONF +=3D "sbindir=3D${base_sbindir}"
--=20
2.20.1


