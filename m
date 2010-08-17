Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OlGdY-0004Er-0f for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 09:31:28 +0200
Received: from f053036067.adsl.alicedsl.de ([78.53.36.67]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OlGdI-0005yV-EE for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 07:30:52 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1281897933.3693.41.camel@mattotaupa>
References: <1281861970.3854.14.camel@mattotaupa>
	<1281897933.3693.41.camel@mattotaupa>
Date: Tue, 17 Aug 2010 09:30:48 +0200
Message-ID: <1282030248.3641.19.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: evince_2.30.0.bb: Problem with new style staging?
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
X-List-Received-Date: Tue, 17 Aug 2010 07:31:28 -0000
X-Groupsio-MsgNum: 22315
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-0gAToApHVwafaGo5tQdC"

--=-0gAToApHVwafaGo5tQdC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Am Sonntag, den 15.08.2010, 20:45 +0200 schrieb Paul Menzel:
> Am Sonntag, den 15.08.2010, 10:46 +0200 schrieb Paul Menzel:
>=20
> > I set up a basic build host with no GNOME installed and did `bitbake
> > beagleboard-demo-image` with the standard local.conf provided by
> > =C8=A6ngstr=C3=B6m and org.openembedded.dev.
> >=20
> > Compile is failing because it is looking for a file on the build hosts
> > environment (and not stagang(?)).
> >=20
> >         xsltproc -o evince-C.omf --stringparam db2omf.basename evince -=
-stringparam db2omf.format 'docbook' --stringparam db2omf.dtd "-//OASIS//DT=
D DocBook XML V4.1.2//EN" --stringparam db2omf.lang C --stringparam db2omf.=
omf_dir "/usr/share/omf" --stringparam db2omf.help_dir "/usr/share/gnome/he=
lp" --stringparam db2omf.omf_in "/home/paul/oe/build/angstrom-dev/work/armv=
7a-angstrom-linux-gnueabi/evince-2.30.0-r1/evince-2.30.0/help/evince.omf.in=
"  `/home/paul/oe/build/angstrom-dev/sysroots/i686-linux/usr/bin/pkg-config=
 --variable db2omf gnome-doc-utils` C/evince.xml || { rm -f "evince-C.omf";=
 exit 1; }
> >         warning: failed to load external entity "/usr/share/xml/gnome/x=
slt/docbook/omf/db2omf.xsl"
> >         cannot parse /usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl
> >         make[2]: *** [evince-C.omf] Error 1
> >         make[2]: Leaving directory `/home/paul/oe/build/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/evince-2.30.0-r1/evince-2.30.0/help'
> >         make[1]: *** [all-recursive] Error 1
> >         make[1]: Leaving directory `/home/paul/oe/build/angstrom-dev/wo=
rk/armv7a-angstrom-linux-gnueabi/evince-2.30.0-r1/evince-2.30.0'
> >         make: *** [all] Error 2
> >         FATAL: oe_runmake failed
> >         ERROR: Function do_compile failed
> >=20
> > The call of `xsltproc` seems to point to the wrong location. Does anyon=
e
> > know how to fix this error besides installing those files on the build
> > host?
>=20
> Judging from `run.do_compile.6321` `PKG_CONFIG_PATH` gets set
> incorrectly.
>=20
>         export PKG_CONFIG_PATH=3D"/oe/build/angstrom-dev/sysroots/armv7a-=
angstrom-linux-gnueabi/usr/lib/pkgconfig:/oe/build/angstrom-dev/sysroots/ar=
mv7a-angstrom-linux-gnueabi/usr/share/pkgconfig"
>=20
> I checked `gnome-doc-utils.pc` in these directories and both point to
> `/usr/share/xml/gnome/xslt/docbook/omf/db2omf.xsl`, which is incorrect
> (`datadir=3D/usr/share`)
>=20
> In the staging(?) path
> `/oe/build/angstrom-dev/sysroots/i686-linux/usr/lib/pkgconfig/`
> everything is set up correctly.
>=20
>         datadir=3D/oe/build/angstrom-dev/sysroots/i686-linux/usr/share
>=20
> Also running=20
>=20
>         /oe/build/angstrom-dev/sysroots/i686-linux/usr/bin/pkg-config --v=
ariable db2omf gnome-doc-utils
>=20
> in a clean environment without exporting `PKG_CONFIG_PATH` works.
>=20
> Is this a problem with new style staging? Could you please provide a
> hint on how to fix this.

I am stuck. Could someone take a look at this please and give me a hint
on how to proceed? (I know the week just started.)


Thanks,

Paul

--=-0gAToApHVwafaGo5tQdC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkxqOqgACgkQPX1aK2wOHVhuvQCdGyRBNI80LFN39dRxgJkjLDRl
UsUAoIZDU5SbLZqrGSYprFJcFrdkPlr8
=WKPb
-----END PGP SIGNATURE-----

--=-0gAToApHVwafaGo5tQdC--
