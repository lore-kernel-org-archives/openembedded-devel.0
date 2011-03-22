Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q23OM-0003cU-4w for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 16:21:06 +0100
Received: from f053033163.adsl.alicedsl.de ([78.53.33.163]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1Q23Mc-0006Mh-8b; Tue, 22 Mar 2011 15:19:18 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4D88B92B.3090703@opendreambox.org>
References: <1300790542.3827.19.camel@mattotaupa>
	<4D88B92B.3090703@opendreambox.org>
Date: Tue, 22 Mar 2011 16:19:16 +0100
Message-ID: <1300807156.26064.24.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
Subject: Re: [PATCH 1/3] ipkg: remove legacy staging and install `libipkg.pc` properly
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
X-List-Received-Date: Tue, 22 Mar 2011 15:21:06 -0000
X-Groupsio-MsgNum: 30509
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-2pgB0b9YXx1Y1CDnBOpT"

--=-2pgB0b9YXx1Y1CDnBOpT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Andreas,


Am Dienstag, den 22.03.2011, 15:58 +0100 schrieb Andreas Oberritter:

> On 03/22/2011 11:42 AM, Paul Menzel wrote:
> > --- a/recipes/ipkg/ipkg_0.99.163.bb
> > +++ b/recipes/ipkg/ipkg_0.99.163.bb
> > @@ -1,5 +1,5 @@
> >  include ipkg.inc
> > -PR =3D "r8"
> > +PR =3D "r9"
> > =20
> >  S =3D "${WORKDIR}/ipkg-${PV}"
> > =20
> > @@ -12,15 +12,10 @@ SRC_URI =3D "http://www.handhelds.org/pub/packages/=
ipkg/ipkg-${PV}.tar.gz \
> >  	file://lonk-link-name.patch \
> >  	"
> > =20
> > -do_stage() {
> > -	oe_libinstall -so libipkg ${STAGING_LIBDIR}
> > -	install -d ${STAGING_INCDIR}/libipkg/
> > -	for f in *.h
> > -	do
> > -		install -m 0644 $f ${STAGING_INCDIR}/libipkg/
> > -	done
> > +do_install () {
> > +	install -d ${D}${libdir}/pkgconfig
> > +	install -m 0644 ${WORKDIR}/libipkg.pc ${D}${libdir}/pkgconfig/libipkg=
.pc
> >  }
>=20
> how do the library and headers get installed? Is there a do_install()
> inside ipkg.inc? In that case, you should use do_install_append()
> instead or move the two new lines to ipkg.inc.

I thought they were picked up automatically and got confused because I
had not run `bitbake -c clean libipkg` beforehand. I sent a v3 of this
patch.

> Despite this, I'd prefer moving it to obsolete, too.

I propose to push the cleanup and move it to obsolete afterward or
remove it right away. I am adding Florian to CC to let him comment on
`gpe-package`, which depends on `libipkg`.


Thanks,

Paul

--=-2pgB0b9YXx1Y1CDnBOpT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEABECAAYFAk2IvfQACgkQPX1aK2wOHVi13ACeOGoLi7rE1Q/lii+tiLZcfTVl
W6YAnjYVtQrq0tYrwWdbk9UgQXYpVsqy
=YEs0
-----END PGP SIGNATURE-----

--=-2pgB0b9YXx1Y1CDnBOpT--
