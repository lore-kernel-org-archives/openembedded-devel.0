Received: from [212.27.42.2] (helo=smtp2-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <caratorn@gmail.com>) id 1LjVh2-0001ke-BP
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 10:34:42 +0100
Received: from smtp2-g21.free.fr (localhost [127.0.0.1])
	by smtp2-g21.free.fr (Postfix) with ESMTP id C63664B0103;
	Tue, 17 Mar 2009 10:33:54 +0100 (CET)
Received: from free.fr (tui75-3-88-168-237-15.fbx.proxad.net [88.168.237.15])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 97B134B008C;
	Tue, 17 Mar 2009 10:33:51 +0100 (CET)
Date: Tue, 17 Mar 2009 10:37:54 +0100
From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20090317093754.GB12668@sourdiere>
References: <20090316195707.GA3793@sourdiere> <20090316203014.GA4171@sourdiere>
	<200903161937.48885.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <200903161937.48885.raj.khem@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 212.27.42.2
X-SA-Exim-Mail-From: caratorn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=AWL,BAYES_20,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] qwo input method recipe
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
X-List-Received-Date: Tue, 17 Mar 2009 09:34:43 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Removed variable PN

Subject: [PATCH 2/2] qwo: add version 0.4

---
 packages/qwo/qwo_0.4.bb |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 packages/qwo/qwo_0.4.bb

diff --git a/packages/qwo/qwo_0.4.bb b/packages/qwo/qwo_0.4.bb
new file mode 100644
index 0000000..14152d9
--- /dev/null
+++ b/packages/qwo/qwo_0.4.bb
@@ -0,0 +1,14 @@
+DESCRIPTION =3D "qwo virtual keyboard"
+AUTHOR =3D "Charles Clement"
+HOMEPAGE =3D "http://www.nongnu.org/qwo/"
+SECTION =3D "x11"
+PRIORITY =3D "optional"
+LICENSE =3D "GPLv2"
+DEPENDS =3D "libxtst libxext virtual/imlib2 libconfig"
+RDEPENDS +=3D "imlib2-loaders"
+PV =3D "0.4"
+PR =3D "r0"
+
+SRC_URI =3D "http://download.savannah.nongnu.org/releases/qwo/qwo-${PV}.=
tar.gz"
+
+inherit autotools
--=20
1.6.2


On Mon, Mar 16, 2009 at 07:37:48PM -0700, Khem Raj wrote:
> On Monday 16 March 2009 13:30:14 Charles Cl=E9ment wrote:
> >=20
> > ---
> >  packages/qwo/qwo_0.4.bb |   15 +++++++++++++++
> >  1 files changed, 15 insertions(+), 0 deletions(-)
> >  create mode 100644 packages/qwo/qwo_0.4.bb
> >=20
> > diff --git a/packages/qwo/qwo_0.4.bb b/packages/qwo/qwo_0.4.bb
> > new file mode 100644
> > index 0000000..bdf6d6d
> > --- /dev/null
> > +++ b/packages/qwo/qwo_0.4.bb
> > @@ -0,0 +1,15 @@
> > +DESCRIPTION =3D "qwo virtual keyboard"
> > +AUTHOR =3D "Charles Clement"
> > +HOMEPAGE =3D "http://www.nongnu.org/qwo/"
> > +SECTION =3D "x11"
> > +PRIORITY =3D "optional"
> > +LICENSE =3D "GPLv2"
> > +DEPENDS =3D "libxtst libxext virtual/imlib2 libconfig"
> > +RDEPENDS +=3D "imlib2-loaders"
> > +PN =3D "qwo"
>=20
> you don't necessarily need PN here
>=20
> > +PV =3D "0.4"
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D "http://download.savannah.nongnu.org/releases/${PN}/${PN=
}-${PV}.tar.gz"
> > +
> > +inherit autotools
> > --=20
> > 1.6.2
> >=20
>=20
> --=20
> Khem Raj



--=20
Charles Cl=E9ment.


