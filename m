Received: from 23.97.mail-out.ovh.net ([87.98.169.92] helo=97.mail-out.ovh.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QWxwD-0007FD-Ad
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Jun 2011 23:47:49 +0200
Received: from mail419.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by 97.mail-out.ovh.net (Postfix) with SMTP id 0822E4AAD3C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jun 2011 23:26:45 +0200 (CEST)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 15 Jun 2011 23:25:39 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO
	localhost.localdomain) (ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 15 Jun 2011 23:25:39 +0200
From: =?UTF-8?q?Eric=20B=C3=A9nard?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jun 2011 23:25:39 +0200
Message-Id: <1308173139-15748-1-git-send-email-eric@eukrea.com>
X-Mailer: git-send-email 1.7.5.3
MIME-Version: 1.0
X-Ovh-Tracer-Id: 2545378215505734985
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
Subject: [PATCH 2011.03] eeze 1.0.0: fix checksums
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
X-List-Received-Date: Wed, 15 Jun 2011 21:47:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

the 1.0.0 archive seems to have been changed on the march 17th
when 1.0.1 was created.
This creates a failure when trying to build from scratch using
Angstrom 2008.1 from the maintenance branch.

Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
---
 recipes/efl1/eeze_1.0.0.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/efl1/eeze_1.0.0.bb b/recipes/efl1/eeze_1.0.0.bb
index 12d70d9..b050473 100644
--- a/recipes/efl1/eeze_1.0.0.bb
+++ b/recipes/efl1/eeze_1.0.0.bb
@@ -6,5 +6,5 @@ SRC_URI =3D "\
   ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
 "
=20
-SRC_URI[md5sum] =3D "31f9b2a8fce56a73c99c1c5d2a449fb6"
-SRC_URI[sha256sum] =3D "27da2b12f60b3c23cd52d16d601b5ab61734b9038beb3ab4=
0129ac770f048d84"
+SRC_URI[md5sum] =3D "8fa2aa89ba48f262700a3cf88cb1c777"
+SRC_URI[sha256sum] =3D "d8ffb1af53c03c5860cd90ae78aa5ae0ce2d027a462509de=
aca5ee3adacd0cee"
--=20
1.7.5.3



