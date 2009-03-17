Received: from [212.27.42.6] (helo=smtp6-g21.free.fr)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <caratorn@gmail.com>) id 1LjVg8-0001jd-2w
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Mar 2009 10:33:46 +0100
Received: from smtp6-g21.free.fr (localhost [127.0.0.1])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 88B00E080E3;
	Tue, 17 Mar 2009 10:32:57 +0100 (CET)
Received: from free.fr (tui75-3-88-168-237-15.fbx.proxad.net [88.168.237.15])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 624A2E0808E;
	Tue, 17 Mar 2009 10:32:55 +0100 (CET)
Date: Tue, 17 Mar 2009 10:36:58 +0100
From: Charles =?iso-8859-1?Q?Cl=E9ment?= <caratorn@gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	openembedded-devel@lists.openembedded.org
Message-ID: <20090317093658.GA12668@sourdiere>
References: <20090316195707.GA3793@sourdiere> <20090316202219.GA4160@sourdiere>
	<200903161930.49305.raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <200903161930.49305.raj.khem@gmail.com>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 212.27.42.6
X-SA-Exim-Mail-From: caratorn@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.7 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_NEUTRAL autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] qwo input method recipe
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
X-List-Received-Date: Tue, 17 Mar 2009 09:33:47 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for your comments, here's an updated version

Subject: [PATCH 1/2] libconfig: Add version 1.3.1

---
 packages/libconfig/libconfig_1.3.1.bb |   19 +++++++++++++++++++
 1 files changed, 19 insertions(+), 0 deletions(-)
 create mode 100644 packages/libconfig/libconfig_1.3.1.bb

diff --git a/packages/libconfig/libconfig_1.3.1.bb b/packages/libconfig/l=
ibconfig_1.3.1.bb
new file mode 100644
index 0000000..0856afb
--- /dev/null
+++ b/packages/libconfig/libconfig_1.3.1.bb
@@ -0,0 +1,19 @@
+DESCRIPTION =3D "Library for manipulating structured configuration files=
"
+AUTHOR =3D "Mark Lindner"
+HOMEPAGE =3D "http://www.hyperrealm.com/libconfig/"
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+LICENSE =3D "LGPLv2"
+DEPENDS =3D ""
+PV =3D "1.3.1"
+PR =3D "r0"
+
+SRC_URI =3D "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar.gz"
+
+S =3D "${WORKDIR}/libconfig-${PV}"
+
+inherit autotools
+
+do_stage() {
+	autotools_stage_all
+}
--=20
1.6.2


On Mon, Mar 16, 2009 at 07:30:42PM -0700, Khem Raj wrote:
> On Monday 16 March 2009 13:22:19 Charles Cl=E9ment wrote:
> > Library libconfig is needed for package qwo.
> >=20
> > ---
> >  packages/libconfig/libconfig_1.3.1.bb |   22 ++++++++++++++++++++++
> >  1 files changed, 22 insertions(+), 0 deletions(-)
> >  create mode 100644 packages/libconfig/libconfig_1.3.1.bb
> >=20
> > diff --git a/packages/libconfig/libconfig_1.3.1.bb b/packages/libconf=
ig/libconfig_1.3.1.bb
> > new file mode 100644
> > index 0000000..cae25f4
> > --- /dev/null
> > +++ b/packages/libconfig/libconfig_1.3.1.bb
> > @@ -0,0 +1,22 @@
> > +DESCRIPTION =3D "Library for manipulating structured configuration f=
iles"
> > +AUTHOR =3D "Mark Lindner"
> > +HOMEPAGE =3D "http://www.hyperrealm.com/libconfig/"
> > +SECTION =3D "libs"
> > +PRIORITY =3D "optional"
> > +LICENSE =3D "LGPLv2"
> > +DEPENDS =3D ""
> > +PV =3D "1.3.1"
> > +PR =3D "r0"
> > +
> > +SRC_URI =3D "http://www.hyperrealm.com/libconfig/libconfig-${PV}.tar=
.gz"
> > +
> > +S =3D "${WORKDIR}/libconfig-${PV}"
> > +
> > +inherit autotools
> > +
> > +do_stage() {
>=20
> snip ...
>=20
> > +	install -m 644 libconfig.h ${STAGING_INCDIR}
> > +	install -m 644 libconfig.h++ ${STAGING_INCDIR}
> > +	oe_libinstall -a -so libconfig ${STAGING_LIBDIR}
> > +	oe_libinstall -a -so libconfig++ ${STAGING_LIBDIR}
>=20
> can you use autotools_stage_all instead.
>=20
> > +}
> > --=20
> > 1.6.2
> >=20
>=20
> --=20
> Khem Raj



--=20
Charles Cl=E9ment.


