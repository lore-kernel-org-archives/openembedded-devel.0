Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UT7y9-0005CD-8F
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Apr 2013 11:51:20 +0200
Received: by mail-pa0-f47.google.com with SMTP id bj1so241197pad.34
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Apr 2013 02:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=l2utezC4boUHkXCPZ6kP3U9TvP5a3/HHcSxUbMHPQqE=;
	b=JQhv6pYtflSBaunkDLQHBNmjKOlqDNdWXm4zeBEt/ZBgIBskqOt8C1n0mwKXpeUMDn
	nFytV8MyBZdQ69kZWxKODGO9b6p9Rxbcshugd4KSBf63f8hXOPe4N8tnSdsjVmjm4ofP
	XH+vJDGbV8ekfMDeMw6aS83wRWsR5mCIByfXR9hvRteqwuII0V2cAdkUx8jBfMGAiGL2
	/bn3EOE7vxGEvAo5ihSbkPaCnizjxyI+D3+d5qerlB7SwrVz8CyTTww58tOhGcBK6y0U
	QTKuzTpvKA79qmWN4SftnMmWgSO8gO3fKQU4euEq3NaEtGNXG/G0EsZ/XL1uBTvZ3QX2
	x+og==
X-Received: by 10.68.164.33 with SMTP id yn1mr18258302pbb.71.1366364005996;
	Fri, 19 Apr 2013 02:33:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id hp1sm14145956pac.3.2013.04.19.02.33.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 19 Apr 2013 02:33:24 -0700 (PDT)
Date: Fri, 19 Apr 2013 11:33:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130419093325.GF2489@jama>
References: <cover.1366267106.git.paul.eggleton@linux.intel.com>
	<f7b25f907b18cf3b37d192bc8d79e8b0262a6124.1366267106.git.paul.eggleton@linux.intel.com>
	<51710428.1050309@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <51710428.1050309@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe, meta-webserver][PATCH 1/2] cherokee: move to meta-webserver and tweak
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
X-List-Received-Date: Fri, 19 Apr 2013 09:51:24 -0000
X-Groupsio-MsgNum: 44331
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7cm2iqirTL37Ot+N"
Content-Disposition: inline

--7cm2iqirTL37Ot+N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 19, 2013 at 09:45:28AM +0100, Jack Mitchell wrote:
> On 18/04/13 07:39, Paul Eggleton wrote:
> > * Set SUMMARY instead of DESCRIPTION
> >
> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> > ---
> >   .../recipes-httpd}/cherokee/cherokee/cherokee.init                 | =
   0
> >   .../recipes-httpd}/cherokee/cherokee_1.2.98.bb                     | =
   4 ++--
> >   2 files changed, 2 insertions(+), 2 deletions(-)
> >   rename {meta-oe/recipes-connectivity =3D> meta-webserver/recipes-http=
d}/cherokee/cherokee/cherokee.init (100%)
> >   rename {meta-oe/recipes-connectivity =3D> meta-webserver/recipes-http=
d}/cherokee/cherokee_1.2.98.bb (93%)
> >
> > diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.in=
it b/meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
> > similarity index 100%
> > rename from meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.init
> > rename to meta-webserver/recipes-httpd/cherokee/cherokee/cherokee.init
> > diff --git a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb b=
/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> > similarity index 93%
> > rename from meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> > rename to meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> > index 6c030a6..1510e70 100644
> > --- a/meta-oe/recipes-connectivity/cherokee/cherokee_1.2.98.bb
> > +++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
> > @@ -1,5 +1,5 @@
> > -DESCRIPTION =3D "Cherokee Web Server fast and secure"
> > -DESCRIPTION_cget =3D "Small downloader based in the Cherokee client li=
brary"
> > +SUMMARY =3D "Cherokee Web Server fast and secure"
> > +SUMMARY_cget =3D "Small downloader based in the Cherokee client librar=
y"
> >   HOMEPAGE =3D "http://www.cherokee-project.com/"
> >   SECTION =3D "network"
> >   LICENSE =3D "GPLv2"
>=20
> Building this morning I received this warning:
>=20
> WARNING: Unable to get checksum for cherokee SRC_URI entry=20
> cherokee.service: file could not be found
>=20
> On a second build it disappeared, something to look into?

Thanks for report..

pushing
$ git mv
=2E/meta-oe/recipes-connectivity/cherokee/cherokee/cherokee.service
meta-webserver/recipes-httpd/cherokee/cherokee/

now
>=20
> Cheers,
>=20
>=20
>=20
> --=20
>=20
>    Jack Mitchell (jack@embed.me.uk)
>    Embedded Systems Engineer
>    http://www.embed.me.uk
>=20
> --
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7cm2iqirTL37Ot+N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFxD2UACgkQN1Ujt2V2gBySegCfbg7RdgaUlloRX8BnVBZmPQsp
UGMAn0ZYVczM689SLGOovUV40kqkO8F0
=SqX9
-----END PGP SIGNATURE-----

--7cm2iqirTL37Ot+N--
