Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 81E1570180
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Jun 2014 00:01:31 +0000 (UTC)
Received: by mail-wg0-f45.google.com with SMTP id l18so4285029wgh.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jun 2014 17:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=bgQbXN9UzqBkSgWDeeU0FnwWK36ZSX/44RdhvJW+09Q=;
	b=cfP02xctUBg+shEE7SFRTInnHF82VwiG/m6upTDufdq0kNzFLmewShcBvUs7gmGS02
	dZhaipiF0m4AO2u8XVbuiqhybmyQdYJ9yQX7KVjJJ78xuNYe12gkatp56T2+lE0EyPSY
	EuTfLYw8gAlsBdiLPd79m9kniKmfXZNhaP/XVWsMKRBNT75dAf1rfGlRiMPmlyydCWx1
	NhJwqIMw6chxm/n/5m7+loy5IDtnovzZ2irIn7hO74Fqixjg+oH5brLxmK5eHSuyl26x
	ARmzKhval0TzzFIKQabdH6VN1Qs4I17OsJeYw9VpjOy81fIWCwX4V373xPdkF0ibEty+
	oRpw==
X-Received: by 10.180.91.81 with SMTP id cc17mr7629638wib.17.1403308892494;
	Fri, 20 Jun 2014 17:01:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	bq7sm9010280wib.7.2014.06.20.17.01.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Jun 2014 17:01:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 21 Jun 2014 02:01:33 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140621000133.GB2117@jama>
References: <1403134870-29746-1-git-send-email-eduardo@monkey.io>
	<20140619083908.GL2117@jama>
MIME-Version: 1.0
In-Reply-To: <20140619083908.GL2117@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCHv4] monkey: new v1.5.1 release.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Jun 2014 00:01:32 -0000
X-Groupsio-MsgNum: 50485
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="avNtfD0ffNO6L/9g"
Content-Disposition: inline

--avNtfD0ffNO6L/9g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 10:39:08AM +0200, Martin Jansa wrote:
> On Wed, Jun 18, 2014 at 05:41:10PM -0600, Eduardo Silva wrote:
> > This patch add the minor release fix of Monkey HTTP Server v1.5.1. It f=
ixes
> > some problems when switching user when started as root.
> >=20
> > monkey/yocto: 3163d01492ea3d85268dc3773419e94db57ee8df
>=20
> [meta-webserver] is still missing in subject (helps me a lot when
> separating patches on patchwork), you don't need to resend it now, but
> please remember it for next time.

It seems to fail with systemd enabled:

| ERROR: Function failed: SYSTEMD_SERVICE_monkey value monkey.service does =
not exist=20
NOTE: recipe monkey-1.5.1-r0: task do_package: Failed

> > Signed-off-by: Eduardo Silva <eduardo@monkey.io>
> > ---
> >  .../recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monkey_1.5.1.bb}       =
| 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-webserver/recipes-httpd/monkey/{monkey_1.5.0.bb =3D> monke=
y_1.5.1.bb} (83%)
> >=20
> > diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb b/meta=
-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> > similarity index 83%
> > rename from meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> > rename to meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> > index 6fa1b77..2ea18f5 100644
> > --- a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> > +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.1.bb
> > @@ -8,15 +8,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2ee41112a4=
4fe7014dce33e26468ba93"
> >  SECTION =3D "net"
> > =20
> >  SRC_URI =3D "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.g=
z"
> > -SRC_URI[md5sum] =3D "9123fc371334621fde1c060ab17adcd3"
> > -SRC_URI[sha256sum] =3D "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3=
637bd8bab5b1d098a7"
> > +SRC_URI[md5sum] =3D "2fe04135728f5c3a86c3a412059e0da3"
> > +SRC_URI[sha256sum] =3D "28dfc5e57bbcd305727e7af6a1a0587868db1c12864987=
57bfeb72edddf457e7"
> > =20
> >  EXTRA_OECONF =3D " \
> >               --plugdir=3D${libdir}/monkey/ \
> >               --logdir=3D${localstatedir}/log/monkey/ \
> >               --pidfile=3D${localstatedir}/run/monkey.pid \
> >               --default-user=3Dwww-data \
> > -             --datadir=3D ${localstatedir}/www/monkey/ \
> > +             --datadir=3D${localstatedir}/www/monkey/ \
> >               --sysconfdir=3D${sysconfdir}/monkey/ \
> >               --enable-plugins=3D* \
> >               --disable-plugins=3Dpolarssl \
> > --=20
> > 1.9.1
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--avNtfD0ffNO6L/9g
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOky10ACgkQN1Ujt2V2gBwdAwCeIoOOS567aU3UO2ZX8zUyMap5
VIcAn2lFnymsWKicSAH9oAxjrnsskB1Q
=UwV1
-----END PGP SIGNATURE-----

--avNtfD0ffNO6L/9g--
