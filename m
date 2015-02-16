Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5DACE65C85
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 17:48:21 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id k48so30595624wev.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 09:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i3EMoZ1K+MPtCNfBD1nXCO39g4W1gwvNsYq829jtSbI=;
	b=iGVNrbQMuWgSdjyyPhcH+BjQsNZzjAjj5jKBynyQv2StSEcVTMMAtkoPqUOP8w91LP
	fP/qUr+XrE7HS1gznALr+9oxL3/bQID1DLPRMJPDmdEx2NPsSL37T0bSkze1IyFBRuub
	W5NE9CL7OGZ3/Mh8fB6mzoq6HrdFYuomPApzig/To6cFZ8rvvjPl9076eQHRIGyCmeWO
	BnZMkm02lJm/DxVVAuIIBO6jWdVrO6tdwAQvMQS5UxREi+UNPV+cwsj2y22ozqLDToKE
	cACk/McuF/sURNdeQsyDIdSDgPySbkS+bfBqP8egoWK7vw+j6e+NTqWlwSK01Q3vVhkf
	oRRA==
X-Received: by 10.180.189.67 with SMTP id gg3mr47860857wic.4.1424108902682;
	Mon, 16 Feb 2015 09:48:22 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	kr5sm18884337wjc.1.2015.02.16.09.48.21
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Feb 2015 09:48:22 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 16 Feb 2015 18:48:30 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150216174830.GJ2297@jama>
References: <1423651677-15387-1-git-send-email-sven.ebenfeld@gmail.com>
	<54DE1411.5010902@gmail.com>
MIME-Version: 1.0
In-Reply-To: <54DE1411.5010902@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] stunnel: Update to 5.10
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
X-List-Received-Date: Mon, 16 Feb 2015 17:48:22 -0000
X-Groupsio-MsgNum: 54329
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mPOSj6iWmtyhwOMz"
Content-Disposition: inline

--mPOSj6iWmtyhwOMz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2015 at 04:11:13PM +0100, Sven Ebenfeld wrote:
> If you accept this patch, can you as well backport it to dizzy?

No, version upgrades aren't usually backported to release branches,
unless there is very good reason to do that.

>=20
> Am 11.02.2015 um 11:47 schrieb Sven Ebenfeld:
> > Signed-off-by: Sven Ebenfeld <sven.ebenfeld@gmail.com>
> > ---
> >  .../recipes-support/stunnel/stunnel_4.56.bb            | 17 ----------=
-------
> >  .../recipes-support/stunnel/stunnel_5.10.bb            | 18 ++++++++++=
++++++++
> >  2 files changed, 18 insertions(+), 17 deletions(-)
> >  delete mode 100644 meta-networking/recipes-support/stunnel/stunnel_4.5=
6.bb
> >  create mode 100644 meta-networking/recipes-support/stunnel/stunnel_5.1=
0.bb
> >=20
> > diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/=
meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> > deleted file mode 100644
> > index 74f2234..0000000
> > --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> > -DESCRIPTION =3D "SSL encryption wrapper between remote client and loca=
l (inetd-startable) or remote server."
> > -SECTION =3D "net"
> > -LICENSE =3D "GPLv2"
> > -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Df41ebed8571077706fee0b860c4=
d6666"
> > -DEPENDS =3D "openssl zlib tcp-wrappers"
> > -
> > -RDEPENDS_${PN} +=3D "perl"
> > -
> > -SRC_URI =3D "https://www.stunnel.org/downloads/archive/4.x/${BP}.tar.g=
z"
> > -
> > -SRC_URI[md5sum] =3D "ac4c4a30bd7a55b6687cbd62d864054c"
> > -SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db54e5ea363889d5d2=
ec8d2778a01c871293"
> > -
> > -inherit autotools
> > -
> > -EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-f=
ips"
> > diff --git a/meta-networking/recipes-support/stunnel/stunnel_5.10.bb b/=
meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> > new file mode 100644
> > index 0000000..0feacc1
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/stunnel/stunnel_5.10.bb
> > @@ -0,0 +1,18 @@
> > +SUMMARY =3D "Program for providing universal TLS/SSL tunneling service"
> > +DESCRIPTION =3D "SSL encryption wrapper between remote client and loca=
l (inetd-startable) or remote server."
> > +SECTION =3D "net"
> > +LICENSE =3D "GPLv2"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D866cdc7459d91e092b174388fab=
8d283"
> > +
> > +DEPENDS =3D "openssl zlib tcp-wrappers"
> > +
> > +RDEPENDS_${PN} +=3D "perl"
> > +
> > +SRC_URI =3D "ftp://ftp.stunnel.org/stunnel/archive/5.x/${BP}.tar.gz"
> > +
> > +SRC_URI[md5sum] =3D "a0edda805eb7d6ea600a230fb0979ea1"
> > +SRC_URI[sha256sum] =3D "032bfc1854f8a0b9e452343c36ec6b52c7e0daef086342=
3c6b13a61a7c92eb23"
> > +
> > +inherit autotools
> > +
> > +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-f=
ips"
> > \ No newline at end of file
> >=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--mPOSj6iWmtyhwOMz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTiLW4ACgkQN1Ujt2V2gBw6GACgmelldYIwnY/FZLtREFiwSHki
lf0An04w6UckILDGgop/St9BqpTxTdhw
=LRZD
-----END PGP SIGNATURE-----

--mPOSj6iWmtyhwOMz--
