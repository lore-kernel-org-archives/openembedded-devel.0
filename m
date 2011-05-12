Received: from bear.ext.ti.com ([192.94.94.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chase.maupin@ti.com>) id 1QKdwf-0006rv-WF
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 May 2011 00:01:22 +0200
Received: from dlep36.itg.ti.com ([157.170.170.91])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id p4CLwWd1014373
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 12 May 2011 16:58:32 -0500
Received: from dlep26.itg.ti.com (localhost [127.0.0.1])
	by dlep36.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4CLwWie019181;
	Thu, 12 May 2011 16:58:32 -0500 (CDT)
Received: from dsbe71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p4CLwW44025781;
	Thu, 12 May 2011 16:58:32 -0500 (CDT)
Received: from dlee06.ent.ti.com ([157.170.170.11]) by dsbe71.ent.ti.com
	([156.117.232.23]) with mapi; Thu, 12 May 2011 16:58:31 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Denys Dmytriyenko <denis@denix.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 12 May 2011 16:58:29 -0500
Thread-Topic: [oe] [PATCH] pcsc-lite: make configuration file a separate
	package
Thread-Index: AcwQu1cX+O+3jmtIT3CKa1RguHKA6QANDHKA
Message-ID: <131E5DFBE7373E4C8D813795A6AA7F08034B0551DC@dlee06.ent.ti.com>
References: <1305065862-22878-1-git-send-email-Chase.Maupin@ti.com>
	<20110512154302.GC21678@denix.org>
In-Reply-To: <20110512154302.GC21678@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] pcsc-lite: make configuration file a separate	package
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
X-List-Received-Date: Thu, 12 May 2011 22:01:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denis@denix.org]
> Sent: Thursday, May 12, 2011 10:43 AM
> To: openembedded-devel@lists.openembedded.org
> Cc: Maupin, Chase
> Subject: Re: [oe] [PATCH] pcsc-lite: make configuration file a separate
> package
>=20
> On Tue, May 10, 2011 at 05:17:42PM -0500, Chase Maupin wrote:
> > * Move the reader.conf file to be part of a separate package
> >   so that it is not installed by default.
> > * This is done because individual readers that implements an
> >   IFDHandler library need to be able to install their reader.conf
> >   file in the /etc/reader.conf.d directory.  Without this change
>=20
> Chase,
>=20
> Sorry, it did not occur to me yesterday, when helping with the patch,
> but I
> just realised now that /etc/reader.conf.d (like any other dir.d
> denotion)
> should expect a set of config files and not just one specific one.
>=20
> So, I started checking the sources and the ChangeLog from pcsc-lite and
> got it
> confirmed - you can pretty much drop a set of files into that directory
> and
> all of them will be parsed for the configuration. So, since the default
> file
> is only a template with all the configuration commented out, you should
> be
> safe to install your own config files in that directory with different
> names.
> That way you don't need any changes to the pcsc-lite recipe...

Denys,

Thanks.  The documentation I was reading for pcsc-lite made it sound like y=
ou needed the file to be called reader.conf.  I guess ignore this patch for=
 now then and we'll try having a separate reader.conf.pru file installed an=
d see if pcsc-lite can find it.  Thanks for the info.

>=20
> One of the relative enties from ChangeLog:
> - Add the ability to parse all the configuration files of a directory
>   instead of just one configuration file. update-reader.conf is then
> now
>   obsolete.
>=20
> --
> Denys
>=20
> >   those packages will conflict with the reader.conf file installed
> >   by the pcsc-lite package:
> >     * NOTE: the reader.conf file in the package is a commented out
> >             template file, not an actual working configuration
> >             file.
> > * Using this change IFDHandler packages can use RCONFLICT with
> >   the pcsc-lite-collateral package to let users know that these
> >   packages cannot co-exist.
> > * Mark the configuration file an such so that when the package is
> >   updated the user's changes are not lost.
> > * Bump the PR.
> >
> > Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> > ---
> >  recipes/pcsc-lite/pcsc-lite_1.5.2.bb |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb b/recipes/pcsc-
> lite/pcsc-lite_1.5.2.bb
> > index b4af08d..88401b6 100644
> > --- a/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> > +++ b/recipes/pcsc-lite/pcsc-lite_1.5.2.bb
> > @@ -5,6 +5,8 @@ LICENSE =3D "BSD"
> >  DEPENDS =3D "hal"
> >  RDEPENDS_${PN} =3D "hal"
> >
> > +PR =3D "r1"
> > +
> >  SRC_URI =3D "https://alioth.debian.org/frs/download.php/2795/pcsc-
> lite-${PV}.tar.bz2 \
> >             file://pcscd.init "
> >
> > @@ -26,8 +28,11 @@ do_install() {
> >  }
> >
> >  PACKAGES =3D+ "libpcsclite"
> > +PACKAGES =3D+ "${PN}-collateral"
> >
> >  FILES_libpcsclite =3D "${libdir}/libpcsclite.so.*"
> > +FILES_${PN}-collateral =3D "${sysconfdir}/reader.conf.d/*"
> > +CONFFILES_${PN}-collateral =3D "${sysconfdir}/reader.conf.d/*"
> >
> >  SRC_URI[md5sum] =3D "d7d466621bec39354351f09349f6374c"
> >  SRC_URI[sha256sum] =3D
> "a0c11b0b5cc46d4c4ec499b875cfdc4e766fdf12fe2f6ea635e1b11ab7b8821e"
> > --
> > 1.7.0.4
> >
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-
> devel


