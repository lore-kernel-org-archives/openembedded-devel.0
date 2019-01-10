Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 85C237C08A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 7B82218013D99;
	Thu, 10 Jan 2019 10:42:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:42:10 +0100
Message-Id: <20190110094212.16763-4-richard@nod.at>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190110094212.16763-1-richard@nod.at>
References: <20190110094212.16763-1-richard@nod.at>
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [PATCH 4/6] [meta-multimedia] libdc1394: Don't use ${PN}
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Don't use ${PN} for the source dir, it will break multilib builds.
The correct variable is ${BPN}.

Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.b=
b b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
index b6bb447bc2af..3b3ac83e2530 100755
--- a/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
+++ b/meta-multimedia/recipes-multimedia/libdc1394/libdc1394_git.bb
@@ -19,7 +19,7 @@ SRC_URI =3D "git://git.code.sf.net/p/libdc1394/code;bra=
nch=3Dmaster;protocol=3Dgit \
            file://install_examples.patch \
           "
=20
-S =3D "${WORKDIR}/git/${PN}"
+S =3D "${WORKDIR}/git/${BPN}"
=20
 inherit autotools-brokensep pkgconfig
=20
--=20
2.20.1


