Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4707769A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 11:10:08 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id l37so12865249wrc.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Mar 2017 03:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VWn646hVTSTjQYfZeCbS4CBVsVdCu4DcZEc+nYMTOgM=;
	b=jFMLZFOWTAZZFG+QvowB+FJepqo08TpAoMmpLtLJwERq4Jkcmdd8EkPltjDWPcRBX8
	qICgI+U5Cxmy85SaYU042Tfg0/2VMReEYwVBruzbsUvPa8dYV4PdOoz9FQie7gspgsSn
	wdVwWarRgKQZhZE1GeaoWCC2cRNq6fjeQAEHctys2537+i0B7rpq2e+U22M3LEMK52AE
	zmLz6UdSpRVGi2LKFHP4Oq94PKFMsI86P+z6tOpE9TeNu2rbzbfYHRMhw7w92oqGwykg
	wj11xKrGyjl/mqtWLP/IQuYVgTEO5uf/GZcdLSw1QjF+GeTvQFNtMDrBP5UuVqJ9xq0s
	0AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=VWn646hVTSTjQYfZeCbS4CBVsVdCu4DcZEc+nYMTOgM=;
	b=JdU07L8r+vhY7sRgfv6kX2sNavMRToEesflA1TlNt+FjX6QWgakGHyqIs00wUorD3y
	hqAiMGp7kpVIlJ4YsaF0W0oNkzP57EjyhE3gklBx1LCoOsEXzIFoIoRhalDByQrLR8r7
	KFE52tLMDXfWaqPb46KS1YpXJQ8B8XVsVUSBKhzyWR5EsAQ1Ed6Bn7+CgPaMgvDf9Kxz
	tLXZAJYafL9DXjNvCIY5Ce4cLtQE+byIiUKiuI/GWmEM1uv21roMa3AAIyBUGxAzqG6Z
	UgfvFgW1/2yFjeYlu3hr4h4ejdxZmL/JsWLC4JdZ6zjrCHBLdY7VniOVYaaNjW56jdTU
	mHxw==
X-Gm-Message-State: AMke39krymiCYgaoNhMi2htn2tHfSZALG6uwlW0KNRpwHAcbkwxm7InE0FmDCVV76MJQtQ==
X-Received: by 10.223.134.157 with SMTP id 29mr1988932wrx.33.1488539409721;
	Fri, 03 Mar 2017 03:10:09 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	o26sm14726956wro.44.2017.03.03.03.10.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 03 Mar 2017 03:10:08 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 3 Mar 2017 12:10:08 +0100
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20170303111008.GB3276@jama>
References: <20170301173049.1177-1-pkj@axis.com>
	<CALbNGRR3DKMiSBnW+=WrWJVHqUzN5FKNoDh=4Na9s1NCnE1ysg@mail.gmail.com>
	<CA+chaQemN9j4vEXqfV4gtSLKvNdsTyjWyHbsqDhGPnSSBn71kA@mail.gmail.com>
	<a6cb55b05ed7466bba2ddfca90518e85@XBOX02.axis.com>
MIME-Version: 1.0
In-Reply-To: <a6cb55b05ed7466bba2ddfca90518e85@XBOX02.axis.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Make use of the new bb.utils.filter() function
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
X-List-Received-Date: Fri, 03 Mar 2017 11:10:09 -0000
X-Groupsio-MsgNum: 65666
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1UWUbFP1cBYEclgG"
Content-Disposition: inline

--1UWUbFP1cBYEclgG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 10:01:50AM +0000, Peter Kjellerstedt wrote:
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org
> > [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
> > Martin Jansa
> > Sent: den 2 mars 2017 21:49
> > To: Andreas M=FCller
> > Cc: openembedded-devel@lists.openembedded.org; Peter Kjellerstedt
> > Subject: Re: [oe] [PATCH] Make use of the new bb.utils.filter()
> > function
> >=20
> > I agree with Andreas, but I'm not opposed to this so strongly.
> >=20
> > Especially as similar patch for oe-core (changing 81 files) was already
> > merged. Similarly the getVar cleanup recently will also cause some
> > headaches when cherry-picking. Unfortunately my "safe" (as it won't
> > break the build) whitespace cleanup won't ever get merged to oe-core,=
=20
> > because it's "too intrusive" :/.
>=20
> Being a big fan of whitespaces cleanups I can understand your=20
> frustration...

I don't like whitespace cleanups at all, but I hate mixing tabs and
spaces for indentation in the same file even more.

> > Someone else with another opinion?
> >=20
> > On Wed, Mar 1, 2017 at 11:02 PM, Andreas M=FCller <
> > schnitzeltony@googlemail.com> wrote:
> >=20
> > > On Wed, Mar 1, 2017 at 6:30 PM, Peter Kjellerstedt
> > > <peter.kjellerstedt@axis.com> wrote:
> > > > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> > >
> > > TBH: I don't like this patch:
> > >
> > > * It combines things which do not share same labels by design. Naming
> > >   package-configs with same label as distro-feature is a nice to have
> > >   but not a design rule.
> > > * To me old style explains better what's going on
>=20
> I guess that is a matter of not being used to the new function. I like=20
> the fact that in many cases the PACKAGECONFIG definition reduces to as=20
> single call to bb.utils.filter().

I agree with Andreas that it was easier to see (for me) what
bb.utils.contains does and it was applicable nicely also for cases where e.=
g.
x11 in DISTRO_FEATURES enables multiple PACKAGECONFIGs like "x11 themes gtk=
" while
bb.utils.filter works nicely only for one-to-one cases and for other
cases we still need to use bb.utils.contains, so it's not so consistent.

But if I need to get used to new function and mixing these 2 because of
oe-core, I don't object strongly to use the same everywhere else.

> > > * Heavy-gozilla-patches tend to cause headaches when cherry-picking
> > >   to older release branches. And yes I know we had these patches in=
=20
> > >   the past and nobody complained.
>=20
> Well, I can split in in 91 individual patches, if that is preferred...

I don't think this is what Andreas wanted, individual patches might be
easier for me to apply (as the big one currently fails to apply in
master-next).

But having 91 patches doesn't really help when someone
cherry-picks bugfix to older release branches and the bug fix will use
bb.utils.filter or be close to bb.utils.filter to cause conflicts in
cherry-pick.

After current builds are finished and pending master-next changes merged
I plan to put it for test in master-next (will resolve conflict
in big patch manually).

> > > Andreas
>=20
> For the record, here is the sed expression I used to switch to the=20
> filter function:
>=20
> sed -ri -e 's/bb.utils.contains\(\s*(.)([^"'\'']*)\1,\s*(.)([^"'\'']*)\3,=
\s*(.)\4\5,\s*(.)\6/bb.utils.filter(\1\2\1, \3\4\3/g' **/*(.)
>=20
> (It uses ZSH syntax to find all files, which means bash users would=20
> have to change it to use find instead.)
>=20
> //Peter
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1UWUbFP1cBYEclgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWLlPEAAKCRA3VSO3ZXaA
HLXuAKCQNCUjnniZLp15vhBRn7OWIL6pYACfaFj5/YHfuLde7BJFnFCWeUqJDKg=
=a+U1
-----END PGP SIGNATURE-----

--1UWUbFP1cBYEclgG--
