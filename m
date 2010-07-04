Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OVPk4-0000gG-Tf
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 16:00:24 +0200
Received: (qmail invoked by alias); 04 Jul 2010 13:55:32 -0000
Received: from p50886CC2.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.108.194]
	by mail.gmx.net (mp056) with SMTP; 04 Jul 2010 15:55:32 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+zDjkWw6ez4ieGkL1hrgqOPwYQ24QNSgLtbyhMB7
	sUkkSe3aTUJmL9
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 4 Jul 2010 15:50:26 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201007041550.26470.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] libpam-base-files.bb: Change pam.d files location to fix install error.
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
X-List-Received-Date: Sun, 04 Jul 2010 14:00:34 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

=46rom 92b22e619df257257d78dc51332a684d4cd377aa Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Sun, 4 Jul 2010 15:48:11 +0200
Subject: [PATCH] libpam-base-files.bb: Change pam.d files location to fix i=
nstall error.


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 recipes/pam/libpam-base-files.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes/pam/libpam-base-files.bb b/recipes/pam/libpam-base-fil=
es.bb
index ddcfe4c..ad31952 100644
=2D-- a/recipes/pam/libpam-base-files.bb
+++ b/recipes/pam/libpam-base-files.bb
@@ -7,10 +7,10 @@ DEPENDS =3D ""
 RDEPENDS_${PN} =3D "libpam"
 RRECOMMENDS_${PN} =3D "libpam-meta"
=20
=2DPR =3D "r6"
+PR =3D "r7"
=20
 SRC_URI =3D " \
=2D           file://pam.d/* \
+           file://pam.d \
 "
=20
 do_install() {        =20
=2D-=20
1.5.3.4


