Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB1E6E660
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 17:08:25 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id s8so9122908pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=8rM4SjgQG8wl9pKiS7A5gEwe7A4ASFTOjJhyeNsREYs=;
	b=WQyYnFFk5HrddkzUoz+4uS+eAXj3Mg2Uq2MhbKBl51HP1/peQHu9tmGOzkjdJEK0hx
	U5vjfrrJ4qaDWlDWPyKr79bpAQBZ9+O01DR7JT0sQhrLuMpyltzgbJfdx4uBdkVz1aWU
	xV6f+lqaXoGAmeRfLgz/cpvLXSqS8J/m4VsH/Hcd3dWMCrR+TiL8Tc/s/f2Tb2fqDvdE
	V7/IOUb3fCcWzMLIC4brdcDRC6baYChomb4VmcN8UvKr0EI3PyPjc1F6RwsY7kDC3Hex
	bHfiiXXtQn6BlZuLIpj8qwhnSHVpsLMGSR5vi/9rliV6aoIlxlpA1yOkER0h+GKtd+5B
	D4Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=8rM4SjgQG8wl9pKiS7A5gEwe7A4ASFTOjJhyeNsREYs=;
	b=QmBPaNNGUw7a7kzUjjz/KrsAkoOxOgWf5pbOktOm/otlvHemFKiGhjr2yQ+RhJ4RY/
	dkgZsDA091Iq889es2ViQmYUqObaz9xv+EZboJT+GQ7dlz7Lfaf75k/mcf7n536hQo7G
	iYWKlYysfOiS6PItOZI/QUyvTPY39I7KdsyqrRBOpGYpdiSHOuGJpuqSJQY7DmXQ99AH
	fXmlaWslvvCacqxFboEqWMQTwhGeupV/f/Nai79yV2R/mO+K2C1BojF62De/vWNA0d0H
	ehm+bLjy9FyafA/iEt1vDfFFJwpbKY9TtikggE66s1TpIDzDHGzVcKMBi3pKSkLKfbPq
	ukew==
X-Gm-Message-State: ABUngvf9pk7ydWI1jZoMWvV4nk/gZc06PNOWu9J9fkWPUkg/cHwBuYF1Dk2oJp0K6ULWMQ==
X-Received: by 10.98.153.204 with SMTP id t73mr3345184pfk.144.1477069707505;
	Fri, 21 Oct 2016 10:08:27 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id s6sm6527110pfg.46.2016.10.21.10.08.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 21 Oct 2016 10:08:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1477052056-14472-1-git-send-email-philip@balister.org>
Date: Fri, 21 Oct 2016 10:08:25 -0700
Message-Id: <36CFFABF-F18A-405E-BA43-08713EC46478@gmail.com>
References: <1477052056-14472-1-git-send-email-philip@balister.org>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] fftw: Allow an empty package for fftw.
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
X-List-Received-Date: Fri, 21 Oct 2016 17:08:26 -0000
X-Groupsio-MsgNum: 63559
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DFDA061B-AD0E-4821-94B8-0EF7CBAACFA8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DFDA061B-AD0E-4821-94B8-0EF7CBAACFA8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 21, 2016, at 5:14 AM, Philip Balister <philip@balister.org> =
wrote:
>=20
> The fftw-dev package RDEPENDS on the fftw package. Let the recipe =
create an
> empty one to satisfy this requirement.
>=20
> Signed-off-by: Philip Balister <philip@balister.org>
> ---
> meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb =
b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> index 0faaea1..0bb6cc2 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> @@ -69,4 +69,6 @@ FILES_fftwl-wisdom =3D "${bindir}/fftwl-wisdom"
> FILES_fftwf-wisdom =3D "${bindir}/fftwf-wisdom"
> FILES_fftw-wisdom-to-conf =3D "${bindir}/fftw-wisdom-to-conf"
>=20
> +ALLOW_EMPTY_${PN}=3D =E2=80=9C1"

as Martin said

RDEPENDS_${PN}-dev =3D =E2=80=9C=E2=80=9D

should be done.

> +
> BBCLASSEXTEND =3D "native"
> --
> 2.5.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_DFDA061B-AD0E-4821-94B8-0EF7CBAACFA8
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgKS4kACgkQuwUzVZGdMxR2NQCgki4Kdmq87PORkUfq9mRafS84
+NAAoIpXemsULYd4mv4Go4WV6cPUAeBf
=7iLS
-----END PGP SIGNATURE-----

--Apple-Mail=_DFDA061B-AD0E-4821-94B8-0EF7CBAACFA8--
