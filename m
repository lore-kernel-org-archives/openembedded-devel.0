Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 63B9E702AB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 13:57:43 +0000 (UTC)
Received: by mail-we0-f181.google.com with SMTP id q59so8938286wes.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=RzR35YzXF+pRsFn/87JcM9eu18mbtc1bvWQCTAfnKwQ=;
	b=oV7AvZyLtf8FaBaM9GTLt11/XDQveOKvzpbA4yCngZ8Og46XoMjlXzxBF3taF3OhMT
	+9EWp+F1ch6BI3WSSWCIH2cYAL08aCSwuYOiWXpyxGcDei9rIo7sGdVsVrbKTPuM6RSq
	zUzOEM9JCmwko5ohWHi4/qCVS4yYrTgUPuBHt7S/q3Mlw8EOZDFQotXHGjPIpWQoj0nK
	OcPDXcTxTmy1xMHHt5q2rbcGWEv7+2bN4DVfm28mV02/7XBSygYuHUqLLMlPa3phaSsY
	6/X/6Mq/WShLBWHZfm5sJjpkA3VClIAav6HhjbK+3Qt6HXRSttrJSRbtm0ZRKbCllKpC
	w9lg==
X-Received: by 10.180.82.228 with SMTP id l4mr19140973wiy.78.1405000664348;
	Thu, 10 Jul 2014 06:57:44 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fu7sm32171669wib.2.2014.07.10.06.57.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Jul 2014 06:57:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Jul 2014 15:57:48 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140710135748.GB2433@jama>
References: <1404990575-2064-1-git-send-email-jukka.rissanen@linux.intel.com>
	<1404990575-2064-2-git-send-email-jukka.rissanen@linux.intel.com>
	<20140710120659.GA2433@jama>
	<1404998180.9749.53.camel@jrissane-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1404998180.9749.53.camel@jrissane-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH v2 2/2] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Thu, 10 Jul 2014 13:57:46 -0000
X-Groupsio-MsgNum: 50816
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jho1yZJdad60DJr+"
Content-Disposition: inline

--jho1yZJdad60DJr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2014 at 04:16:20PM +0300, Jukka Rissanen wrote:
> On to, 2014-07-10 at 14:06 +0200, Martin Jansa wrote:
> > On Thu, Jul 10, 2014 at 02:09:35PM +0300, Jukka Rissanen wrote:
> > > Use the latest version of usb-modeswitch (2.2.0) and
> > > usb-modeswitch-data (20140529). The data package depends
> > > on new usb-modeswitch version so upgrade both of them at
> > > the same time.
> > >=20
> > > =20
> > > -RDEPENDS_${PN} =3D "usb-modeswitch"
> > > +RDEPENDS_${PN} =3D "usb-modeswitch (>=3D 2.2.0)"
> >=20
> > Do we really need the version here?
> >=20
> > If yes then add comment explaining why.
>=20
>=20
> Hmm, I thought the commit message already states that. Do you want that
> also in the recipe itself?

I read it as explanation why you're upgrading 2 recipes in the same
commit, but it doesn't say why you need explicit version in
RDEPENDS_${PN} (instead of letting bitbake do it automatically).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jho1yZJdad60DJr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlO+m9wACgkQN1Ujt2V2gBzJ3wCfQY0SfID92SLxTIpV8AFF/tC8
JckAn0dvrF9UUxZlnCIl8RhlV63E3fYs
=o6Dj
-----END PGP SIGNATURE-----

--jho1yZJdad60DJr+--
