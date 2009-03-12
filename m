Received: from [212.27.42.5] (helo=smtp5-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <caratorn@gmail.com>) id 1LhgyV-0007h6-7w
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Mar 2009 10:13:11 +0100
Received: from smtp5-g21.free.fr (localhost [127.0.0.1])
	by smtp5-g21.free.fr (Postfix) with ESMTP id D8117D480AE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:12:57 +0100 (CET)
Received: from free.fr (tui75-3-88-168-237-15.fbx.proxad.net [88.168.237.15])
	by smtp5-g21.free.fr (Postfix) with ESMTP id EC737D480DE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2009 10:12:54 +0100 (CET)
Date: Thu, 12 Mar 2009 10:16:54 +0100
From: =?iso-8859-1?B?PT91dGYtOD9xP0NoYXJsZXM9MjBDbD1DMz1BOW1lbnQ/PQ==?=
	<caratorn@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090312091654.GA4382@sourdiere>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: [PATCH] Pyrex 0.9.8.5 Fix SRC_URI
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
X-List-Received-Date: Thu, 12 Mar 2009 09:13:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I had trouble downloading Pyrex archive, here's a patch

Signed-off-by: Charles Cl=E9ment <caratorn@gmail.com>
---
 packages/python/python-pyrex_0.9.8.5.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/packages/python/python-pyrex_0.9.8.5.bb b/packages/python/py=
thon-pyrex_0.9.8.5.bb
index 94db793..f9e5dd0 100644
--- a/packages/python/python-pyrex_0.9.8.5.bb
+++ b/packages/python/python-pyrex_0.9.8.5.bb
@@ -8,7 +8,7 @@ SRCNAME =3D "Pyrex"
 PR =3D "ml0"
=20
 SRC_URI =3D "\
-  http://nz.cosc.canterbury.ac.nz/~greg/python/${SRCNAME}/${SRCNAME}-${P=
V}.tar.gz \
+  http://www.cosc.canterbury.ac.nz/greg.ewing/python/${SRCNAME}/${SRCNAM=
E}-${PV}.tar.gz
   file://pyrex-fix-optimized-mode.patch;patch=3D1 \
 "
 S =3D "${WORKDIR}/${SRCNAME}-${PV}"
--=20
1.6.2


--=20
Charles Cl=E9ment.


