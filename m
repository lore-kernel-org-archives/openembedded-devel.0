Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 83E547C083
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 16B4E18011B30;
	Thu, 10 Jan 2019 10:42:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:42:08 +0100
Message-Id: <20190110094212.16763-2-richard@nod.at>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190110094212.16763-1-richard@nod.at>
References: <20190110094212.16763-1-richard@nod.at>
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>,
	=?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
Subject: [PATCH 2/6] [meta-gnome] wv: Don't use ${PN}
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

The bitbake defaults are:
BP =3D "${BPN}-${PV}"
S =3D "${WORKDIR}/${BP}"

Therefore we can remove this line.

Cc: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
Signed-off-by: Richard Weinberger <richard@nod.at>
---
 meta-gnome/recipes-gnome/wv/wv_1.2.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb b/meta-gnome/recipes=
-gnome/wv/wv_1.2.4.bb
index 8ed1fcd15ca8..03ee5b4ac4aa 100644
--- a/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
+++ b/meta-gnome/recipes-gnome/wv/wv_1.2.4.bb
@@ -16,6 +16,4 @@ SRC_URI[sha256sum] =3D "673109910e22d4cf94cc8be4dcb9a0c=
41b5fbdb1736d4b7bdc7778894d
=20
 inherit autotools pkgconfig
=20
-S =3D "${WORKDIR}/${PN}-${PV}"
-
 EXTRA_OECONF =3D ""
--=20
2.20.1


