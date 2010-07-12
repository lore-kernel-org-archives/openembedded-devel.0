Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OYSZ9-0000dN-TM
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 01:37:54 +0200
Received: (qmail invoked by alias); 12 Jul 2010 23:32:42 -0000
Received: from p5088590D.dip.t-dialin.net (EHLO [192.168.142.128])
	[80.136.89.13]
	by mail.gmx.net (mp071) with SMTP; 13 Jul 2010 01:32:42 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/dydpBQbDdde1Q+UTT4TJWzelLvFsTAaN6v8nf6z
	dn3DGxH08K4XD5
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 01:26:33 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201007130126.34041.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] Distros angstrom/kaeilos: Remove preferred versions for mutter
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
X-List-Received-Date: Mon, 12 Jul 2010 23:37:54 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

While preparing recipes for mutter, this caused me half an hour of headache=
=2E.

=46rom bd77527504ededbe4daed06cddbe1df851c898e3 Mon Sep 17 00:00:00 2001
=46rom: Andreas Mueller <schnitzeltony@gmx.de>
Date: Tue, 13 Jul 2010 01:22:35 +0200
Subject: [PATCH] Distros angstrom/kaeilos: Remove preferred versions for mu=
tter
  (we do not yet have mutter in OE)


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
=2D--
 .../include/angstrom-2008-preferred-versions.inc   |    1 -
 .../include/kaeilos-2009-preferred-versions.inc    |    1 -
 2 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/con=
f/distro/include/angstrom-2008-preferred-versions.inc
index b6ba724..37021c1 100644
=2D-- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -79,7 +79,6 @@ SRCREV_pn-librest ?=3D "14d35103d9649dc1e10c3e9ac2c690b31=
65c8184"
 SRCREV_pn-moblin-menus ?=3D "e1d63681739dd16195d005b3cf15752df294bd3c"
 SRCREV_pn-mojito ?=3D "0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48"
 SRCREV_pn-mozilla-headless-services ?=3D "c7873654894af6c7c6c01194d6185db4=
6667b81f"
=2DSRCREV_pn-mutter ?=3D "aff4cf110307e149d3497d20543cde27b9699758"
 SRCREV_pn-twitter-glib ?=3D "849bec29292df88590e0b2898b50b9b8d766817e"
 SRCREV_pn-xf86-video-psb ?=3D "b6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab"
=20
diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/conf=
/distro/include/kaeilos-2009-preferred-versions.inc
index a63359d..18597ab 100644
=2D-- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
+++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
@@ -89,7 +89,6 @@ SRCREV_pn-librest ?=3D "14d35103d9649dc1e10c3e9ac2c690b31=
65c8184"
 SRCREV_pn-moblin-menus ?=3D "e1d63681739dd16195d005b3cf15752df294bd3c"
 SRCREV_pn-mojito ?=3D "0542c4b0e26c0e3b69c5ad1fa1898dc276fb9f48"
 SRCREV_pn-mozilla-headless-services ?=3D "c7873654894af6c7c6c01194d6185db4=
6667b81f"
=2DSRCREV_pn-mutter ?=3D "aff4cf110307e149d3497d20543cde27b9699758"
 SRCREV_pn-twitter-glib ?=3D "849bec29292df88590e0b2898b50b9b8d766817e"
 SRCREV_pn-xf86-video-psb ?=3D "b6b3bba06fe5a3fe0b1bd6e31a7369dd83812bab"
=20
=2D-=20
1.5.3.4


