Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 565197025E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 09:10:05 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so2194661wgh.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=raLpqe0xKAcxqrHIS195hosle9Pg52MA3JQJQd2PeR4=;
	b=e6cTyci6jVdDXKqJsxcm1UcYOa3xVhkZuGb3KtKQ2P+JZn/Jsb029V4KtHWSoiSUTv
	KTpo8tqweU1sJcnm3ovXvQ8ENVi7UX+bnhs9zQKME2kX4QgTZK3B7b5MoUl2el/RRi8w
	+AYY72meBY9sdpl/cu1Qe72lq6HggXYOXgLYgohhxAQUrob/ONez/Zleye2X9xjD9Idh
	OYcmGSeBO5vRtp/HMtYvsKXcr1BWHGUkgKK0aPnrR7WyeociS/7jrHR4THbvS4CVtTLq
	HZXoTOuoDO6wwYQkcWBsTLmKQoIVPsm/3Y7grEypA2UJ0O2gwaW4F33I//T23KupfEs9
	W9bA==
X-Received: by 10.180.99.102 with SMTP id ep6mr14521425wib.1.1407316206224;
	Wed, 06 Aug 2014 02:10:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fe5sm1000607wjc.12.2014.08.06.02.10.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Aug 2014 02:10:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 6 Aug 2014 11:10:35 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140806091035.GE14848@jama>
References: <1406316789-27514-1-git-send-email-akuster@mvista.com>
	<53E1DC2A.5040903@windriver.com>
MIME-Version: 1.0
In-Reply-To: <53E1DC2A.5040903@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-networking][PATCH] V4 wireshark: fix build depends
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
X-List-Received-Date: Wed, 06 Aug 2014 09:10:08 -0000
X-Groupsio-MsgNum: 51437
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wTWi5aaYRw9ix9vO"
Content-Disposition: inline

--wTWi5aaYRw9ix9vO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 06, 2014 at 03:41:30PM +0800, Rongqing Li wrote:
>=20
>=20
> On 07/26/2014 03:33 AM, Armin Kuster wrote:
> > This should address issues found in test-dependencies 2014-07-25
> >
> > wireshark/wireshark/latest lost dependency on  libcap libnl libnl-genl =
libnl-nf libnl-route portaudio-v19 sbc
> >
> > Signed-off-by: Armin Kuster <akuster@mvista.com>
> > ---
> >   meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb | 2=
 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0=
-rc2.bb b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > index 5d6df40..b965fdf 100644
> > --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0-rc2.bb
> > @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://www.wireshark.org"
> >   SECTION =3D "network"
> >   LICENSE =3D "GPL-2.0"
> >
> > -DEPENDS =3D "perl-native libpcap pcre expat glib-2.0 libsmi"
> > +DEPENDS =3D "perl-native libcap libpcap pcre expat glib-2.0 libsmi lib=
nl portaudio-v19 sbc"
> >
> >   inherit autotools pkgconfig
> >
>=20
> 1. I can not download wireshark-1.12.0-rc2.tar.bz2, seems it has been=20
> removed
>=20
> wget=20
> http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2=
=2Etar.bz2
> --2014-08-06 15:00:13--=20
> http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.0-rc2=
=2Etar.bz2
> Resolving wiresharkdownloads.riverbed.com=20
> (wiresharkdownloads.riverbed.com)... 69.4.231.52
> Connecting to wiresharkdownloads.riverbed.com=20
> (wiresharkdownloads.riverbed.com)|69.4.231.52|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-08-06 15:00:14 ERROR 404: Not Found.

rc3 and final 1.12.0 were released already, someone willing to send a
patch?

> 2. which layers do I found the libsmi/portaudio recipes?
>=20
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wTWi5aaYRw9ix9vO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPh8QsACgkQN1Ujt2V2gByDYwCgrvd8e59AIAj1vMxzjdu5H53R
O/QAn12EbJuOY1Me5fLIJGdgxw7Aua2K
=WClB
-----END PGP SIGNATURE-----

--wTWi5aaYRw9ix9vO--
