Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Fahad_Usman@mentor.com>) id 1Om23l-0001xN-BZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 12:09:22 +0200
Received: from nat-dem.mentorg.com ([139.181.124.2]
	helo=eu2-mail.mgc.mentorg.com) by relay1.mentorg.com with esmtp 
	id 1Om23P-0005l0-CC from Fahad_Usman@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 03:08:59 -0700
Received: from 137.202.157.210 ([137.202.157.210]) by eu2-mail.mgc.mentorg.com
	([137.202.76.30]) via Exchange Front-End Server
	webmail.mentor.com ([192.94.38.218]) with Microsoft Exchange
	Server HTTP-DAV ; Thu, 19 Aug 2010 10:08:58 +0000
Received: from pkl-fusman-ubuntu by webmail.mentor.com;
	19 Aug 2010 15:11:54 +0500
From: Fahad <Fahad_Usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <AANLkTik0m-1QRcExaT9wX2kc5SA8XyBDOGiC7nad5rvz@mail.gmail.com>
References: <1282118880-27729-1-git-send-email-fahad_usman@mentor.com>
	<AANLkTik0m-1QRcExaT9wX2kc5SA8XyBDOGiC7nad5rvz@mail.gmail.com>
Organization: Mentor Graphics
Date: Thu, 19 Aug 2010 15:11:54 +0500
Message-ID: <1282212714.27679.158.camel@pkl-fusman-ubuntu>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Fahad_Usman@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=AWL,BAYES_00,
	RCVD_NUMERIC_HELO autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gawk-native_3.1.4.bb: Removed legacy style staging
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
X-List-Received-Date: Thu, 19 Aug 2010 10:09:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2010-08-18 at 10:40 +0200, Frans Meulenbroeks wrote:
> 2010/8/18 Fahad Usman <fahad_usman@mentor.com>:
> > * converted do_stage to do_install
> >
> > * replaced ${STAGING_BINDIR} with ${D}${bindir}
> >
> > * added NATIVE_INSTALL_WORKS =3D "1"
> >
> > * added PR =3D "r1"
> >
> > Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> > ---
> >  recipes/gawk/gawk-native_3.1.4.bb |    9 ++++++---
> >  1 files changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/recipes/gawk/gawk-native_3.1.4.bb b/recipes/gawk/gawk-nati=
ve_3.1.4.bb
> > index 0a33f71..67d254c 100644
> > --- a/recipes/gawk/gawk-native_3.1.4.bb
> > +++ b/recipes/gawk/gawk-native_3.1.4.bb
> > @@ -1,5 +1,8 @@
> >  INHIBIT_AUTOTOOLS_DEPS =3D "1"
> >  require gawk_${PV}.bb
> > +PR =3D "r1"
> > +
> > +NATIVE_INSTALL_WORKS =3D "1"
> >
> >  inherit native
> >
> > @@ -8,7 +11,7 @@ PATCHTOOL =3D "patch"
> >
> >  S =3D "${WORKDIR}/gawk-${PV}"
> >
> > -do_stage() {
> > -       install -d ${STAGING_BINDIR}
> > -       install -m 755 gawk ${STAGING_BINDIR}
> > +do_install() {
> > +       install -d ${D}${bindir}
> > +       install -m 755 gawk ${D}${bindir}
> >  }
> > --
>=20
> I suggest to merge this with the non-native recipe.
> Also I feel that the default do_install should work here, so a
> specific do_install seems not needed (it is an autotools recipe).
>=20
> Frans
>=20

Hi Frans,
With this do_install function, I get only one binary file
(sysroots/i686-linux/usr/bin/gawk) in the resulting .ipk file, but if I
remove the do_install function from the recipe and let the autotools's
do_install execute, a bunch of other binary files end up in the .ipk
file along with a lot of other stuff. Is it okay to have extra files in
the ipk package or should I leave the do_install function in the recipe.

Secondly, is there a way to merge native and non-native recipes if the
native one need a different do_install function?

Fahad


