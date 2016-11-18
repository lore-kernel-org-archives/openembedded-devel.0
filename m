Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 63EEB60797
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 10:57:41 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id g23so4957640wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 02:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=qPlP8VLlDyfMdVGaLWuLIO4Qi/ezl9WOYIiU+EmBzmk=;
	b=eoX0xktu3xQh3j9Qxl0yQYAKFLAKl8DLwAuox+7ch+jtFDE/ILWgCFllyZcyK92B5t
	iye/MIdISREVKcXzgQt+6Pjq7IHDGzznDAOh+0DdVIj31HhmB50s2dVq0hNgxI7YtEvB
	TgA6o0vPN5Qdfsi5k6ToNvgibAeQkz6yDcBzRp7zJVl5CUM7WWN/XQ2ItpvqgykV9Ao9
	xJG5vBxSa0KAmlG4hrv7wl4WR6QspL0YnHz0KzTbuwvy6zy5VL0cf5t3juE/aFRlZjIS
	c65ElEkqK4z48LQFdG8bwHrXc5+jdiyGLlYbcPx93QqBEiTWFHLokltvwkOWespQ+54l
	UFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=qPlP8VLlDyfMdVGaLWuLIO4Qi/ezl9WOYIiU+EmBzmk=;
	b=ev9WQuqVdGPX6fyWsuEzhqLPuG18IlrXLfpT7/c/zIv/UM3kaK4BzbGIs3sN4Sctbq
	wWaTGdnudanFyjfjgKhyjIQ2Kk9EV8Y1vV6fu6cZ+IkmBz4CAiqyLBZvcrt21lgMVUiy
	DDa8IMDNXPF2MKX1/lKBOKqwafOnocR273faf9VSYpQlE+Le1Rd/UrzMl4a7aPc73q5g
	EYW6e9Ak1zoc9dv9BHowNTjPezPqHRNpWWcntRB1uLNFtK1o8qpSJclN3m6596XRO/o5
	a4n33g+Dlq6arB1HfZ+CK32YWFET8Y+S0CdTbYbP6CVL+i8dkOko8y/kKHuAozySnQFW
	JmIQ==
X-Gm-Message-State: AKaTC00YwxbXRtleCn4mgYyGUaBuDzyRHARGb98lzEejk9OIkowNX0+kdmE0ViYe9Lnu0Q==
X-Received: by 10.28.73.135 with SMTP id w129mr9079494wma.42.1479466662558;
	Fri, 18 Nov 2016 02:57:42 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	bj1sm8218990wjc.17.2016.11.18.02.57.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 18 Nov 2016 02:57:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Nov 2016 11:57:42 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161118105742.GA3324@jama>
References: <20161104101423.20557-1-ruben.de.smet@rubdos.be>
	<CADNbA1q0Tm6-+caB187piY3bDMHbUHavbK3HL9Z1DivHdFZYbA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADNbA1q0Tm6-+caB187piY3bDMHbUHavbK3HL9Z1DivHdFZYbA@mail.gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-python][PATCH v2] python-scales: add recipe for version 1.0.9
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
X-List-Received-Date: Fri, 18 Nov 2016 10:57:43 -0000
X-Groupsio-MsgNum: 63878
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 04, 2016 at 09:45:50AM -0400, Derek Straka wrote:
> On Fri, Nov 4, 2016 at 6:14 AM, Ruben De Smet <ruben.de.smet@rubdos.be>
> wrote:
>=20
> > A python module for tracking server state and statisticst
> >
> > Signed-off-by: Ruben De Smet <ruben.de.smet@rubdos.be>
> > ---
> >  meta-python/recipes-devtools/python/python-scales.inc   | 17
> > +++++++++++++++++
> >  .../recipes-devtools/python/python3-scales_1.0.9.bb     |  2 ++
> >  2 files changed, 19 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python-scales.i=
nc
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python3-scales_1.0.9.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python-scales.inc
> > b/meta-python/recipes-devtools/python/python-scales.inc
> > new file mode 100644
> > index 0000000..4a10a78
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python-scales.inc
> > @@ -0,0 +1,17 @@
> > +SUMMARY =3D "Metrics for Python"
> > +DESCRIPTION =3D "Tracks server state and statistics, allowing you to s=
ee
> > what \
> > +your server is doing. It can also send metrics to Graphite for graphing
> > or to \
> > +a file for crash forensics."
> > +SECTION =3D "devel/python"
> > +LICENSE =3D "Apache-2.0"
> > +# LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D3b83ef96387f14655fc854ddc=
3c6bd
> > 57"
> >
> Is there a reason this is commented out?  You'll need something or it will
> give a QA Issue about license-checksum

Yes it does and fails.

ERROR: python3-scales-1.0.9-r0 do_populate_lic: QA Issue: python3-scales: R=
ecipe file fetches files and does not have license file information (LIC_FI=
LES_CHKSUM) [license-checksum]
ERROR: python3-scales-1.0.9-r0 do_populate_lic: Fatal QA errors found, fail=
ing task.
ERROR: python3-scales-1.0.9-r0 do_populate_lic: Function failed: populate_l=
ic_qa_checksum

>=20
> > +SRCNAME =3D "scales"
> > +
> > +SRC_URI[md5sum] =3D "c61167f2b5f506f0a34a7b8a295a9567"
> > +SRC_URI[sha256sum] =3D "8b6930f7d4bf115192290b44c757af
> > 5e254e3fcfcb75ff9a51f5c96a404e2753"
> > +
> > +inherit pypi
> > +
> > +
> > +RDEPENDS_${PN} +=3D " \
> > +    ${PYTHON_PN}-six \
> >
> Missing a closing quote here
>=20
> > diff --git a/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> > b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> > new file mode 100644
> > index 0000000..91b48c2
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-scales_1.0.9.bb
> > @@ -0,0 +1,2 @@
> > +inherit setuptools3
> > +require python-scales.inc
> > --
> > 2.10.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgu3qUACgkQN1Ujt2V2gBxclQCdEN+Qe4OVjcNCLptjImH/bJ9m
G/0AoKPCwy0x6i9qogP8SmtHLqK3NlEg
=IACW
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--
