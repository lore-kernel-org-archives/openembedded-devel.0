Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f181.google.com (mail-yw0-f181.google.com
	[209.85.161.181])
	by mail.openembedded.org (Postfix) with ESMTP id CE7F57871B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 14:21:00 +0000 (UTC)
Received: by mail-yw0-f181.google.com with SMTP id y186so535190ywf.7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 06:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=2qRk1g6VNU2ghURvhJTR4vo1U/+FMjZACFgDRAlH2Z4=;
	b=VD4142AFC8JYeNFTxtnMMHrQvi7wp1jlRHtSiwNwSyHeFJMV132NuNBfNo6VUAS8Tb
	DW4suWrV11b3hjUKy/WCxYEvE9EDGjIGIF1Y0iiF8tXI9o9fhgsXrpmAs3U1VSqz41X0
	RbIMHTMWXlX8IbAbXKz9lXrZJ9yxKvmee7iXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=2qRk1g6VNU2ghURvhJTR4vo1U/+FMjZACFgDRAlH2Z4=;
	b=nGYOPQVs27xq9UCaPGXf/EWWu//2+2IxGy8xWVjXkM+V1psWnN+faQMvBFbdW6L3oV
	Jtilm2OmpA+TzPWEYhfZznmhmT7UnT06Ia5YjrDGl5Pchn75ACnfDwfOMrDkKhdGFsZL
	P4Eu5EwThISVq4DXaJrkdoMy/57gvz05mGZajsochaZbNLUI5h4QuLGRPoZpgdC1mL0I
	akWWDkVNLrzJVhMoFpKaonyhN+/LQlSLXSnJ5r6pmpLtYLgff+4bEU+kLqOwQrqeDu6x
	pS1E58GznZzDnhAyQoDdYheHRQUPS2Id/0en62XEq9977FPmAODWh+fBxdXtARqiAee9
	vjig==
X-Gm-Message-State: APf1xPCUHaLCMCDUDyLVO8xMR6GsidlDOvgzEVaXIiozEfqSEwjlAN2J
	oqFiJtO42Rus3ViWNHjWsCoeVA==
X-Google-Smtp-Source: AH8x225aHuILHVuacxd+qUTSIMj1tzXyZ9bjk2WjQOI41ORjlizib9e9VtZBQOe3G2492Qtf+HEdfA==
X-Received: by 10.129.0.2 with SMTP id 2mr2321036ywa.417.1519222861618;
	Wed, 21 Feb 2018 06:21:01 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	c125sm10009715ywe.34.2018.02.21.06.21.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Feb 2018 06:21:01 -0800 (PST)
Date: Wed, 21 Feb 2018 09:20:58 -0500
From: Tom Rini <trini@konsulko.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Message-ID: <20180221142058.GJ4311@bill-the-cat>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<f808dcd5-82b9-b9c7-2c4a-b5b35b21fb42@gmail.com>
	<CADkTA4MdQgigdN+hSsyZjk=1nfDB3M2799Pf-jy4WYt=6PdXyA@mail.gmail.com>
	<8d5be4e4-3fd9-a0f2-c5cf-b967cf428416@gmail.com>
	<CADkTA4P46zCdHEUeAdsC7Ej+N3gp7-6Rxx=UTTYN7U91fL3Z1w@mail.gmail.com>
	<CA+chaQd=LFUw8wV0h6O2O_RvH2R9APE=X3Mn+DarPSwxefs6bg@mail.gmail.com>
	<CA+chaQfpXBL3=z3QwTKQ6MNBKUVhbMjA6G+nADz562zFuYUTUw@mail.gmail.com>
	<CAAQYJAsOFo6md-ZCRg+KmGQtC9O+pwFzVjpEMOXOFVFWzr4iMw@mail.gmail.com>
	<CA+chaQfcD5n9Gs+Hos26qOqE5D8ch0JwTm+7pn_ZtysPCpHmjw@mail.gmail.com>
	<20180221140252.d4rmbn73c3nzsvac@mentor.com>
MIME-Version: 1.0
In-Reply-To: <20180221140252.d4rmbn73c3nzsvac@mentor.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Wed, 21 Feb 2018 14:21:01 -0000
X-Groupsio-MsgNum: 70799
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="InRyi6yyXSYzKD4c"
Content-Disposition: inline

--InRyi6yyXSYzKD4c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2018 at 09:02:53AM -0500, Joe MacDonald wrote:
> [Re: [oe] Splitting meta-oe?] On 18.02.21 (Wed 11:22) Martin Jansa wrote:
>=20
> > There is good example of inter-layer dependencies from real world:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2017-Februar=
y/111447.html
> >=20
> > Do you want
> > A) new git repository meta-libio-socket-ssl-perl so that meta-networking
> > will depend on this on instead of whole meta-perl
> > B) meta-ddclient which will probably depend on both meta-perl and
> > meta-networking
> > C) ddclient and its dependencies in meta-perl
> > D) libio-socket-ssl-perl moved to oe-core, so that next time we can say
> > that oe-core is just like old oe-classic just with a bit less stuff in =
it
> >=20
> > Neither of these options is ideal, but meta-networking getting meta-perl
> > dependency is the one which causes fewest issues to OE users.
>=20
> Yeah, I've been thinking about this and trying to decide what is the
> "right" thing to do here.  Because I already have added layer
> dependencies in meta-networking that I didn't originally envision, so
> what's one more that is, as you say, almost certainly in the majority of
> consumers' projects anyway?  But it does force a new layer dependency on
> consumers of the meta-networking layer who may not care about ddclient,
> and I'd like to avoid that if possible.
>=20
> Honestly, now that I'm back from my vacation, I think the right thing is
> to add the dependency and then start thinking about a way to specify
> layer dependencies with greater granularity than on a meta-layer basis.
> Like, there's no question meta-networking depends on core.  It's
> nonsense to think of it without that dependency.  But it'd be nice to be
> able to specify a layer dependency that only exists if your project
> includes specific recipes out of that layer.
>=20
> But that kind of mechanism seems highly prone to breakage and likely to
> be highly contentious even if it was shown to be reliable, so it may not
> get beyond a "that'd be nice" thing for me.
>=20
> Unless someone else has already implemented it and I'm just not aware of
> how to use it?  :-)

One thing I've been thinking about is that some layers need more
sub-layers.  Taking a very tiny peek into meta-networking, perhaps
re-organize into meta-networking-core, meta-networking-iscsi,
meta-networking-vpn, etc.  Or maybe that won't help with dependencies.
But the need for layer X for a single recipe can sometimes I think be
solved by re-thinking the layer.

All that said, it might be better instead to add something like
RECIPE_LAYERDEPENDS so that for the one-or-two offs, the recipe will
fail to build (and implement that similar to the logic in
image-container.bbclass? so that you only get a failure on building that
recipe rather than anything in the layer) ?

--=20
Tom

--InRyi6yyXSYzKD4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJajYBKAAoJEIf59jXTHXZSjSwP/Rng5Nb0vph5MibsrwQmhPQd
aJHHjd5ZjjgNyxh+rS4CIm8i5Hqp4qMKhjmDFiLFNHEjLVM8bXkGnx0/qIwvrV87
rKMy17qakAEFq0rDzchRrDvv0gIBhnZcPvLeyORBfCK1Ss4llxfl5LBHx8ajHnSb
wkv88rnFQef877YsLhsux0j4cx8lwUbiDMTcr4H0CYT8EHcdDBJE75oZ0CpUq3Du
5ZBd/2U3hrNka/nE73i+eAktCJq2Uy627LY8Qz40jh6TD3bqZGREzrSTI5EbpfNc
2uAqPa7+so9mnD52P9fsShOUvyt5hE5FpgyQWRoVFY8kMhgiwUE22OvXd67yjuv/
jYspgRXOSojvElyr3xHxkelscHefoUnBZ0UHNFN1a7eryAH0v6XwbgnyMMIWlTvG
yD2L9ISRpdtHut4eWy9L7IQuKi6ssefsRss9gq6klb99S9SIzDzCYE/51cydN0uO
ccS9qzLY4fTnWdyw3zO0ZKO+EYhCfInXX7OFNWuVL2Tow36LVbzdRKGyBYd2cOL9
hslv6u4fbRc2PTVPd5eLppZ62gTLNJsCndbcesbn1Ok7lpeKDRm9CCc5P5NkrRkT
ds06ncYyFDbaf6EfauVik9sm7M1tgNFCwYKehId5WB35/wmaRHjGv6goGquKblwX
z7eaF80asPHfe6gn5XR5
=4pbc
-----END PGP SIGNATURE-----

--InRyi6yyXSYzKD4c--
