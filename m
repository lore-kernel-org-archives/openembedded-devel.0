Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 1B03C786CD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:57:34 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id g2so1981723qkd.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6hpMMoz5HOUJW99p5F8eFIml+o0+UAt/jFOs+SmgmH0=;
	b=M2RPufjYutvy2oNOzGvM2pXe3vN20NFuJygfCzoMV8hQNVI7MLKQghYkZ07tktRyhE
	5kNrBdS5C7BfCpQyw+SVT5InaYY62yk9WMAPSG1l6p9nkGc8UCVsw3y2eKDAde+RfipW
	fuzur19hAoJpo1YW0V6ivbI72kELpEmyWptCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6hpMMoz5HOUJW99p5F8eFIml+o0+UAt/jFOs+SmgmH0=;
	b=NTgUdd2NTDBETAdMSvh7Pd8wUwYXN6JWTx3OyQo1LBqmEaoWHGcyMp/5hccAtk39yg
	GZIBTGTN/0YkFPyC4To26amZESZ4XNeo/ZZLz3sViMaKCSxMiqYgpMxF25r7tAmkrB1Y
	CsoHHFycWhfSS3PDQ7qDXn0qvP3bLfAwiy/MWc7YPaL3RIbqShjyCzamC9XOgeJ3hxOl
	5EWFXF95lXVAYHrhEVteE/SIoZhjRT3SB2h376TtU8YEF0kp9jG+0ps/DgZP+WrkCX4D
	ZNLK402bxRF0XVctlZH0S7lEVA2BlNEAgGIuUgu44wvewqx1ClMu/8LPqRYSVBUt0BQv
	O1Qg==
X-Gm-Message-State: APf1xPCI5R5gdPtN6f0WSW4wcGX/Py8yD/gzkc3UaIZ0CYg+pc00oQxo
	+7BNRMxGu2wJBSh8BJX4H0c3OA==
X-Google-Smtp-Source: AG47ELu3AOEZA4JG+apNxaSJbuME4Tjbh/0oqM4UaUDVoZ10Ilg1aGJI4d72mzwqwyZwmmJKH8BUcA==
X-Received: by 10.55.128.195 with SMTP id b186mr5166675qkd.118.1519221455949; 
	Wed, 21 Feb 2018 05:57:35 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	g9sm21228553qtg.90.2018.02.21.05.57.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 05:57:35 -0800 (PST)
Date: Wed, 21 Feb 2018 08:57:32 -0500
From: Tom Rini <trini@konsulko.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Message-ID: <20180221135732.GI4311@bill-the-cat>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<1519148811.24236.321.camel@linuxfoundation.org>
	<CANx9H-AioXLbdF=aZjuFSU3Ev3d131wFQbF1b-RH1PtMES3-3Q@mail.gmail.com>
	<f16ec80b-f2b9-c154-5262-ac4562da8cba@gmail.com>
	<1519152750.24236.330.camel@linuxfoundation.org>
	<CAP9ODKrxvspWQ9hXd7gWvGmTzTqHUYZyMejL=yVXHqG258ggkA@mail.gmail.com>
	<CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKo=z65e9_kj0fxpGRugsKTOun6mnTzdfpAbkmekKSKpCA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: Splitting meta-oe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Feb 2018 13:57:35 -0000
X-Groupsio-MsgNum: 70791
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3r2sERxeG5twY2zu"
Content-Disposition: inline

--3r2sERxeG5twY2zu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 09:10:25PM -0300, Otavio Salvador wrote:
> On Tue, Feb 20, 2018 at 9:07 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > On Tue, Feb 20, 2018 at 3:52 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> I could combo-layer pieces of meta-oe into poky but I'd imagine that
> >> would create more problems than it would solve too and given the
> >> general dislike of combo-layer, I think ultimately better layer tooling
> >> would be a better answer and more acceptable to everyone.
> >
> > Poky creates more problems then it solves
>=20
> ... send was too soon ...
>=20
> Poky creates more problems then it solves.
>=20
>  - it causes confusion
>  - it avoids the urgency in adopting a setup script
>  - it does not use the layers as we market as being a good thing
>=20
> So adding more things to it, just makes it worse.
>=20
> The setup script is more urgent to be discussed then splitting meta-oe.

I agree that a setup script of some sort (off the top of my head,
something that takes layer-names as input, checks vs a list,
fetches/clones, creates a wrapper around bitbake-layers to always add
them) should be a high priority.  I don't have a problem telling my
customers to clone meta-openembedded and then use the layers that are
needed in that specific project.  But it's painful to have a shell
for-loop in the docs we provide so they can setup a build.

--=20
Tom

--3r2sERxeG5twY2zu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJajXrMAAoJEIf59jXTHXZSNmcQAMADBWhVu+SREdwln2clMOR9
3jNVnTL6K/DP58UuZPlxFKhU5Yag620JgVOIHTUD/wDQxP9tpSStBh1USrdAk8qr
4kpbCSkO7Us2I9ttX6MgynarkhSMmh+GVC2kKK08WkhW2nZLAsIwsjx6VHhtxvJb
dten+U3il7/igVZFL5HEt2YafQQQ4S31ke9XpRfOFMJYjDxEPDlGVHJJWuIybUxp
7WNHjemh7CpfOGz3Q23ceGmjyTWqkw544mbPbmoWBfkFb810bgetMuEjThIE0nEt
PiBYoY6UHFVarfR7HqaDUxf3FTA3O2RiWjSLnGjZmzjwmU6t1PvhySmDIm2GByh4
xpKMO/KIaYOWZZygSRaU5rOert/kXCSLxR6Fu4jrs8kipuA53e2mWRGZzt+8omEO
2yOkYRzboGtcGg+Hh7Tqm83eXySITRx+KoWms7HPWD6jZhbP2dxWtrBArEVPv/w3
y+cRXO5YcOO8aZmM3yIRnxR7g9OAu1/MzrhxLrn3A92gscv0GEGMdfFBeQU9D/0g
tphp4yDoH3Ofi7VYELgssGeLSktbTnfxaOIa9ZD05ZTJaO75/nJ2BhrYgEvVjzEh
St3Yj23RVOdhyfHqp3BOI0LP8TNsA/2cDH8dMgxHGaNuJj6R+rx+dRPprQIEdenA
N8YwuHlGhhHdal4ug5DH
=Zzp2
-----END PGP SIGNATURE-----

--3r2sERxeG5twY2zu--
