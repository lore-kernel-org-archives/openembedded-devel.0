Return-Path: <martin.jansa@gmail.com>
Received: from mail-wj0-f196.google.com (mail-wj0-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2999271DDC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 14:58:34 +0000 (UTC)
Received: by mail-wj0-f196.google.com with SMTP id ip10so3407959wjb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2017 06:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=6XxvjtSENRV6E7hM+CGkBBRLmctKSJLPrsW8wJMBEBQ=;
	b=ON6pkUnbRJs7gxlDb+9eQ+wsMxp+6X0CYcF8R7/BQG3us2LHnKq/DvHz/fC8v+dEgx
	zIsoatNAVf/uiTse9+AKAQRxgLIVpMXcUxxtuXVNkENotkQXRRxcRTKNnn3kLLsqH135
	TzP9pQ/VaOKbVAfGf4QkWODsMEOB90QscTMJ34D+pvZ50rUT2wvMRYC0tnGTeL0ivWEB
	R9F/5CkxFM4+0AvVDQzQAin0nOqCyCk3WhlKOg2GdnJNnUmRTEsuj7N6wmHc0XV/E6It
	TB3lgSq3Wy374M3UtrNwJfWBBWFlmUqYkFJb4njL3nzuIShXzNuF0irSdpq3WKrH1I6u
	f6AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=6XxvjtSENRV6E7hM+CGkBBRLmctKSJLPrsW8wJMBEBQ=;
	b=m2NobYIqFsy5vpIZ7Hkv9XDMUeLEjQL8nXOJEtFMKGmT7sWD86mkSgHWAsswryScDJ
	i3aYuAebyaPx/rkyiavrkMgvBOduHzne4V59u9aM1PEv4RKmi+dWYm5lby+3BGibWPN6
	6X+ZqmI+AgO0Xqe1bOX/Bu7pMwN/RE2RR3Z0fPpw4jteQSfZH25TyKjoi5kE6CEH20k3
	HmRw8dNSfn2oDfpHfs5bM+stFGuVvmBzBLH9MAagzXwO9t1y4dhVtQZPDOPv/cJ1/1v+
	WE7vPovPjTP3KUqtPhegF7rK3i9G+6onufrKSCEbAAQssRi9ILxvDi3ng7b+HqunUaDx
	dZnw==
X-Gm-Message-State: AIkVDXL5HuFDKCQsEZ326qZ4+SRdPszLYl+i2duXifLTNoU1AvqVRIIJVpHgSllPNPGR7A==
X-Received: by 10.223.133.164 with SMTP id 33mr3951478wrt.39.1485356315059;
	Wed, 25 Jan 2017 06:58:35 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	198sm1956390wmn.11.2017.01.25.06.58.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jan 2017 06:58:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 25 Jan 2017 15:58:37 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20170125145837.GD3260@jama>
References: <1484780365-11240-1-git-send-email-jslater@windriver.com>
	<20170119085959.GD3265@jama>
MIME-Version: 1.0
In-Reply-To: <20170119085959.GD3265@jama>
User-Agent: Mutt/1.7.2 (2016-11-26)
Subject: Re: [meta-webserver][PATCH 1/1] netdata: derive PV from SRCPV
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
X-List-Received-Date: Wed, 25 Jan 2017 14:58:35 -0000
X-Groupsio-MsgNum: 64846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J5MfuwkIyy7RmF4Q"
Content-Disposition: inline

--J5MfuwkIyy7RmF4Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 19, 2017 at 09:59:59AM +0100, Martin Jansa wrote:
> On Wed, Jan 18, 2017 at 02:59:25PM -0800, Joe Slater wrote:
> > Currently, PV is "git" and contains no version information.
> >=20
> > Signed-off-by: Joe Slater <jslater@windriver.com>
> > ---
> >  .../recipes-webadmin/netdata/netdata_git.bb        |    1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb b/m=
eta-webserver/recipes-webadmin/netdata/netdata_git.bb
> > index 317ddcc..bd43cea 100644
> > --- a/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> > +++ b/meta-webserver/recipes-webadmin/netdata/netdata_git.bb
> > @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.md;md5=3D747afe070=
ea9d6c2be0a31353609a35b"
> > =20
> >  SRC_URI =3D "git://github.com/firehol/netdata.git;protocol=3Dhttps"
> >  SRCREV =3D "36c1304e37094174ea51001903058e65053107ca"
> > +PV =3D "git+${SRCPV}"
>=20
> 1.0.1+git${SRCPV} as configure.ac says

This will make the version going backwards, but as people using this
recipe didn't care about the "git" version I guess they don't care
about:
netdata-1.0.1+gitAUTOINC+36c1304e37: Package version for package
netdata-dbg went backwards which would break package feeds from
(0:git-r0.45 to 0:1.0.1+git0+36c1304e37-r0.0) [version-going-backwards]

as well, if anyone cares, please send PE bumps for netdata, libubox,
relayd, cppzmq:
libubox-1.0.1+gitAUTOINC+155bf39896: Package version for package libubox
went backwards which would break package feeds from (0:git-r0.53 to
0:1.0.1+git0+155bf39896-r0.0) [version-going-backwards]

relayd-0.0.1+gitAUTOINC+2970ff60ba: Package version for package
relayd-dbg went backwards which would break package feeds from
(0:git-r0.48 to 0:0.0.1+git0+2970ff60ba-r0.0) [version-going-backwards]

cppzmq-4.1.5+gitAUTOINC+68a7b09cfc: Package version for package
cppzmq-dev went backwards which would break package feeds from
(0:git-r0.48 to 0:4.1.5+git0+68a7b09cfc-r0.0) [version-going-backwards]
>=20
> > =20
> >  # patch to disable timeout because timeout are not available with actu=
al version
> >  # of core-utils
> > --=20
> > 1.7.9.5
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

--J5MfuwkIyy7RmF4Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWIi9HAAKCRA3VSO3ZXaA
HKuuAKCqXGLrinGhNCYv+o+FRgbhpqA7dgCdGZqhYdwARCc93ZZF2BRHn0Um6IE=
=BPBF
-----END PGP SIGNATURE-----

--J5MfuwkIyy7RmF4Q--
