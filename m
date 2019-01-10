Return-Path: <richard@nod.at>
X-Greylist: delayed 487 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 10 Jan 2019 09:50:57 UTC
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 84DA07C085
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 575C918011B32;
	Thu, 10 Jan 2019 10:42:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:42:09 +0100
Message-Id: <20190110094212.16763-3-richard@nod.at>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190110094212.16763-1-richard@nod.at>
References: <20190110094212.16763-1-richard@nod.at>
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [PATCH 3/6] [meta-multimedia] caps: Don't use ${PN}
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Don't use ${PN} for the source dir, it will break multilib builds.
The correct variable is ${BPN}.

The bitbake defaults are:
BP =3D "${BPN}-${PV}"
S =3D "${WORKDIR}/${BP}"

Therefore we can remove this line.

Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb b/met=
a-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
index fe864c49cc23..0404bd51595f 100644
--- a/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
+++ b/meta-multimedia/recipes-multimedia/caps/caps_0.9.24.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://quitte.de/dsp/caps.html"
 LICENSE =3D "GPL-3"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
=20
-SRC_URI =3D "http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
+SRC_URI =3D "http://quitte.de/dsp/${BPN}_${PV}.tar.bz2 \
            file://Avoid-ambiguity-in-div-invocation.patch \
            file://0001-basic.h-Use-c99-supported-stdint-types.patch \
            file://append_ldflags.patch \
@@ -13,8 +13,6 @@ SRC_URI =3D "http://quitte.de/dsp/${PN}_${PV}.tar.bz2 \
 SRC_URI[md5sum] =3D "c1d634038dcb54702306c0e30cb1c626"
 SRC_URI[sha256sum] =3D "f746feba57af316b159f0169de5d78b4fd1064c2c0c8017c=
b5856b2f22e83f20"
=20
-S =3D "${WORKDIR}/${PN}-${PV}"
-
 EXTRA_OEMAKE =3D " \
     CC=3D'${CXX}' \
     CFLAGS=3D'${CFLAGS} -ffast-math -funroll-loops -fPIC -DPIC' \
--=20
2.20.1


