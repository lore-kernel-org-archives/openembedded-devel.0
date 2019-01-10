Return-Path: <richard@nod.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 56A507C083
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 09:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id E6DC018013D8D;
	Thu, 10 Jan 2019 10:42:51 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jan 2019 10:42:11 +0100
Message-Id: <20190110094212.16763-5-richard@nod.at>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190110094212.16763-1-richard@nod.at>
References: <20190110094212.16763-1-richard@nod.at>
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>
Subject: [PATCH 5/6] [meta-oe] mksh: Don't use ${PN}
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
 meta-oe/recipes-shells/mksh/mksh_56.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-shells/mksh/mksh_56.bb b/meta-oe/recipes-she=
lls/mksh/mksh_56.bb
index 324b5b61157f..e4eb54286a20 100644
--- a/meta-oe/recipes-shells/mksh/mksh_56.bb
+++ b/meta-oe/recipes-shells/mksh/mksh_56.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] =3D "dd86ebc421215a7b44095dc13b05692=
1ba81e61b9f6f4cdab08ca135d0
=20
 inherit update-alternatives
=20
-S =3D "${WORKDIR}/${PN}"
+S =3D "${WORKDIR}/${BPN}"
=20
 ALTERNATIVE_${PN} =3D "sh"
 ALTERNATIVE_LINK_NAME[sh] =3D "${base_bindir}/sh"
--=20
2.20.1


