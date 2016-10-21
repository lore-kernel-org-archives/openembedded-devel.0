Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 56A4E719EC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 16:41:49 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id d128so340724wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Oct 2016 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iUxaKF02BBDXYAQWptFeHQw5zu+r4iKenIbeNNdgBb4=;
	b=hZG3D0cGNaIdjxYl9EuweRGB9pJTitd2paTfgah0I22G7MmjgaSo48QtO3gvEljXrx
	fQAvVFNLYvAXZ//YTvnmzSqXV2XNWQLnwWLCohkEhQL2Ug9JCIYxKzF3ztAhc4fdnRxa
	fSgPA9mSUJsOBkyd7HUjQAtvoAJbJec4pNvFkiQRF5AY/SvY6zjeAGmmCJWNNJ+WwwrW
	qmGvXUS649kWQ3m6QtUzZ72Kma3G2fx1iVsOUnahzDHvtU2W3/IDKSHG9tx+fbQ0gQld
	a06B0iEYtjAlADEdlxEGMlpZfUUvqdjJRs5yA0XZJN37NU8NGWN8mOk1u0Un2ITeZiKR
	48cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iUxaKF02BBDXYAQWptFeHQw5zu+r4iKenIbeNNdgBb4=;
	b=RTX8/pl5LUudf5zPX/MhDZolwcvEVHAnhK/W6tjImEsVb8PPawOVCw9LXIBRt1dQzf
	euAMGKaNuK7Wt7L/E0n3H7wEkyKHcP0mopPA4RDXd/9zVBKWJX10Yujw6H9L75mprzXG
	Yzt+XR8vIS6SvPRnI1SLnWQZM3ik6hRy0BC1PGSOBGQj31B8PLQa73T3v+B+2J6D8U3k
	hGCw5YJXspri7EgyF7zgQjmnqYDPVbfsne67K4LGqtUGYd8fIhllOMKRH2tUG1GfKqQ5
	v+RJT3JoLkWF8mm0kZrKq2HAUl80/tIP0m3THLlGhzLV75v+hLVXFJrjZ/2SNQNPuEoc
	WQFg==
X-Gm-Message-State: ABUngvfQbL0xLUVfxQJvYvGxpNJ04TVRb+Wfv4xIGkqDIqgsFgyaMIQZKKrnA8KWgZ5oAw==
X-Received: by 10.194.248.43 with SMTP id yj11mr1488782wjc.81.1477068110925;
	Fri, 21 Oct 2016 09:41:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	j189sm5056710wmd.22.2016.10.21.09.41.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 21 Oct 2016 09:41:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 21 Oct 2016 18:41:49 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161021164149.GB2899@jama>
References: <1477052056-14472-1-git-send-email-philip@balister.org>
MIME-Version: 1.0
In-Reply-To: <1477052056-14472-1-git-send-email-philip@balister.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
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
X-List-Received-Date: Fri, 21 Oct 2016 16:41:50 -0000
X-Groupsio-MsgNum: 63557
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f2QGlHpHGjS2mn6Y"
Content-Disposition: inline

--f2QGlHpHGjS2mn6Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 21, 2016 at 08:14:16AM -0400, Philip Balister wrote:
> The fftw-dev package RDEPENDS on the fftw package. Let the recipe create =
an
> empty one to satisfy this requirement.

Then remove RDEPENDS from fftw-dev package instead of installing
completely useless empty package.

> Signed-off-by: Philip Balister <philip@balister.org>
> ---
>  meta-oe/recipes-support/fftw/fftw_3.3.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb b/meta-oe/recipes=
-support/fftw/fftw_3.3.4.bb
> index 0faaea1..0bb6cc2 100644
> --- a/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> +++ b/meta-oe/recipes-support/fftw/fftw_3.3.4.bb
> @@ -69,4 +69,6 @@ FILES_fftwl-wisdom =3D "${bindir}/fftwl-wisdom"
>  FILES_fftwf-wisdom =3D "${bindir}/fftwf-wisdom"
>  FILES_fftw-wisdom-to-conf =3D "${bindir}/fftw-wisdom-to-conf"
> =20
> +ALLOW_EMPTY_${PN}=3D "1"
> +
>  BBCLASSEXTEND =3D "native"
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--f2QGlHpHGjS2mn6Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlgKRUwACgkQN1Ujt2V2gBzG9ACfRgLXtS0yww71NN7rQkPr5L5z
05sAn0thuQDqfvatpslHI4s7WbI7hfhB
=oAV4
-----END PGP SIGNATURE-----

--f2QGlHpHGjS2mn6Y--
