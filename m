Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by mail.openembedded.org (Postfix) with ESMTP id A7D6F6080F
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  2 Apr 2016 18:17:00 +0000 (UTC)
Received: by mail-lb0-f179.google.com with SMTP id vo2so104215008lbb.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 02 Apr 2016 11:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=i3p+ZfJ411B9XOTc1lT5KkUx9j4CgWNI2B/DvJZE3yc=;
	b=jxbq1VdHuDHITDcnY2jpUr9L5PhdjDsDi42mQGe8SpM1X013j8iSdpb4+6iH8/EMgE
	/syvuj9uxN6QE2vBag+Rzro4WralmoSdsZ9rzVTNV7c5u1UPzKZ5HMz6r7y4ziBAvJLU
	y8qfwRnxzWAS25gXEPHFXA9p2+fs9yK6UKPh1rPWDPd2BNk+mXSNrtaO2rDenumNZhYm
	QbwUTQm7a/o2s3Bk0U5tGBLQf6o+j/rZzG5OT5m/7/ylB2JgpqmP+h93rcZAZrsSJ3ra
	cbpZ/Tj8mCfBmp8IamRhZr2Pba3HBaQ8esqrgehbBWBzl3yvvnJ9VqXw/L0pAH7zENHX
	T9sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=i3p+ZfJ411B9XOTc1lT5KkUx9j4CgWNI2B/DvJZE3yc=;
	b=DDemjsu63OxCZu4EcQ01ZlF/SJR+kCSTmV0F843XKf2pbI9uP8otEziEy7Se4ncq4D
	5FEQVbHvh1nYr5szlEJ//SVwsGsAXTcx6oAh7+AcrKjYzd4peNOfRDhkZWAw0U7ZSlF8
	IcXqEbTItQreNE/dKTGsYmXY7CMrIzaFgdpb2ZFJQrICc4Mg1OhuxGUGRP5AgLPFKaRp
	bHkmyj7/ocmgAfS+uUm1oXNHN7Xv4yuyChxqyUVNGYyBeQbBHZlEeySysY5TKNm/s83v
	GNm0ONEpfsVLn17nDt2VBctXQshRvpYSr55LWWffxVb8dVdpfphvwjdcd10FXV6zq6tJ
	CH4Q==
X-Gm-Message-State: AD7BkJJ8WnfkEVQhwhjBb5FVBnnSpMHEW4eIF0gAY1Zg51UhmLMKrdMtGfy5zuZ3pmpYgw==
X-Received: by 10.28.234.151 with SMTP id g23mr4372745wmi.40.1459621019167;
	Sat, 02 Apr 2016 11:16:59 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m6sm19934211wje.21.2016.04.02.11.16.57
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Apr 2016 11:16:57 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 2 Apr 2016 20:17:14 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160402181714.GG2567@jama>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<20160401133809.GF2567@jama>
	<CAEaCVQjmZGJOX332YqUH8eLOAGURiKXS4-f40P6KqNE7FgZ9qQ@mail.gmail.com>
	<CA+chaQfbTZu=JZO2FaLLCSFZtzHpL3=x3qrA16EAWrB=Yx+Unw@mail.gmail.com>
	<CAEaCVQjGbaWfr5ZT7-4S1jNStoWUQ3QJyNhZ+-nOYpe2EBvZgA@mail.gmail.com>
	<CAEaCVQjW0cmMDNyc3LhZQxv+RWfVmx9Bj-qgQx9AH1_+0=sTDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEaCVQjW0cmMDNyc3LhZQxv+RWfVmx9Bj-qgQx9AH1_+0=sTDA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Sat, 02 Apr 2016 18:17:04 -0000
X-Groupsio-MsgNum: 60805
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GdbWtwDHkcXqP16f"
Content-Disposition: inline

--GdbWtwDHkcXqP16f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 01, 2016 at 11:20:49AM -0600, Eduardo Silva wrote:
> on this case should be "RDEPENDS_${PN} =3D "zlib" OK ?

NO

> On Fri, Apr 1, 2016 at 11:01 AM, Eduardo Silva <eduardo@monkey.io> wrote:
>=20
> > Oh, sorry I misunderstood. The program requires zlib to run, so it's a
> > build (headers) and runtime dependency.
> >
> > On Fri, Apr 1, 2016 at 10:57 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> >> Then it's probably build time dependency as the warning says, not runt=
ime
> >> dependency like you did.
> >>
> >> Read what the component build does, if it checks for zlib in configure
> >> then
> >> you really need to add it to DEPENDS not RDEPENDS_${PN}.
> >>
> >> On Fri, Apr 1, 2016 at 6:53 PM, Eduardo Silva <eduardo@monkey.io> wrot=
e:
> >>
> >> > > +LIC_FILES_CHKSUM =3D
> >> > "file://${S}/LICENSE;md5=3D2ee41112a44fe7014dce33e26468ba93"
> >> >
> >> > >
> >> > > LIC_FILES_CHKSUM is relative to ${S}, so LIC_FILES_CHKSUM =3D
> >> > > "file://LICENSE.. should work fine
> >> > >
> >> > >
> >> > Thanks, I have updated my local copy
> >> >
> >> >
> >> > > > +
> >> > > > +RDEPENDS_${PN} =3D "zlib"
> >> > >
> >> > > If it does link with libz then the runtime dependency should be ad=
ded
> >> > > automatically by shlibs code in package.bbclass if it's not the ca=
se
> >> > > can you add comment explaining why it needs to be added explicitly?
> >> > >
> >> > >
> >> > I added that because I got a QA warning message:
> >> >
> >> > WARNING: QA Issue: fluentbit-dev rdepends on zlib, but it isn't a bu=
ild
> >> > dependency? [build-deps]
> >> > WARNING: QA Issue: fluentbit rdepends on zlib, but it isn't a build
> >> > dependency? [build-deps]
> >> >
> >> > what's your suggestion in this case ?
> >> >
> >> > best
> >> >
> >> >
> >> >
> >> > > > +
> >> > > > +inherit cmake
> >> > > > --
> >> > > > 2.5.0
> >> > > >
> >> > > > --
> >> > > > _______________________________________________
> >> > > > Openembedded-devel mailing list
> >> > > > Openembedded-devel@lists.openembedded.org
> >> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> > >
> >> > > --
> >> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> >> > >
> >> > > --
> >> > > _______________________________________________
> >> > > Openembedded-devel mailing list
> >> > > Openembedded-devel@lists.openembedded.org
> >> > > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> > >
> >> > >
> >> >
> >> >
> >> > --
> >> > Eduardo Silva
> >> > Monkey Software
> >> > --
> >> > _______________________________________________
> >> > Openembedded-devel mailing list
> >> > Openembedded-devel@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >
> >> --
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >>
> >
> >
> >
> > --
> > Eduardo Silva
> > Monkey Software
> >
>=20
>=20
>=20
> --=20
> Eduardo Silva
> Monkey Software
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--GdbWtwDHkcXqP16f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcADKkACgkQN1Ujt2V2gBxpPQCgsSWxhgLFA7tTGLAZkgm26rhu
pLMAoKkIdtqPY7EtPwMCfQlqr3213a4h
=hr38
-----END PGP SIGNATURE-----

--GdbWtwDHkcXqP16f--
