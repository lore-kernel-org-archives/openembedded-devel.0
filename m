Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 670B073FA3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Mar 2016 09:13:31 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l68so25116654wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Mar 2016 01:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=JL+wC4YEkXtwEGFdJwO/Ae/I1Uw5Vzw75etA/O1S1rI=;
	b=wLizQezw+YcXUMAWH0fwbMkqaooi5bAg7WNv6hE3fkJP7hMipuwQ0xJH8Z+CxfgY45
	iGFo+alMtDIbn5H32B6bZyDRbkx01Hr4w3V9PgjSMJHFDenfDFSIflCmSQ6psdl5KZRg
	9XC2IPNztYsxqBb46+g+GBrbttsVKodV93I9szzSHByB9lmmOGqBdryEATdLIGXonwB7
	NjmX/7RJwxcM6pAFSAtBiYpa4qCw4mJupbNEbFNQbw03phQEDI8vYwIH1IumvWShxoN8
	blJFjx1EkicLg8zRn814kYySW4udre8KPM8APiwflXA8H0Su4E1u1wKc1YZ/J1ix4oMh
	kueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=JL+wC4YEkXtwEGFdJwO/Ae/I1Uw5Vzw75etA/O1S1rI=;
	b=BP6AvzwUyMloFw6QEKfHXY3N3Trt9NM8tsB2iz8npQftahUHE2mhPrqlBThJh4ACeu
	Gw4mzhEFsqFUDhISrQ30MVP9++zuaWPnIbuor7iQVSajVxTorA6S15xMngT+TPbfaRL7
	MqYHanysK4ouFAa1O/SqZ9ueQUKeJDnVDjrISgGx+PO0Hje6PkH/XBVZ3UX4BA6tv2oH
	xyKzgGkusbTVdedFpQ88g5plImSVtRl0ld8bk+iHx6dJwi8DRHwwP8gMzlj8qmCkGrDK
	vaPd6ximbKZk1wqrsuloEvfdo6MuYaL1SGVm+V3YeFZ0WsjNT0kGUVFJenUPCbdJPoVM
	7HMw==
X-Gm-Message-State: AD7BkJLPLwWmKEASrTK+RvEr3oomVtZytCkoDNtN9vTyFI9bx/9+API8azby15lMyVAvFA==
X-Received: by 10.194.19.5 with SMTP id a5mr1762052wje.46.1456996412142;
	Thu, 03 Mar 2016 01:13:32 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ls5sm39473310wjb.33.2016.03.03.01.13.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Mar 2016 01:13:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 3 Mar 2016 10:15:35 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160303091535.GC2569@jama>
References: <1456994787-29216-1-git-send-email-anders.roxell@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1456994787-29216-1-git-send-email-anders.roxell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: koen.kooi@linaro.org
Subject: Re: [PATCH] meta-oe: cunit: delete *.la files
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
X-List-Received-Date: Thu, 03 Mar 2016 09:13:32 -0000
X-Groupsio-MsgNum: 60310
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 03, 2016 at 09:46:27AM +0100, Anders Roxell wrote:
> Remove from blacklist and fix populate_sysroot issue:
> ERROR: cunit-2.1-3-r0 do_populate_sysroot: QA Issue: libcunit.la failed
> sanity test  (workdir) in path
> .../cunit/2.1-3-r0/sysroot-destdir/usr/lib [la]
> ERROR: cunit-2.1-3-r0 do_populate_sysroot: QA staging was broken by the
> package built above
> ERROR: cunit-2.1-3-r0 do_populate_sysroot: Function failed: do_qa_staging

Can we use remove-libtool bbclass instead?

Also meta-oe: doesn't belong to commit summary (only as [meta-oe] tag in e-=
mail)

>=20
> Suggested-by: Koen Kooi <koen.kooi@linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---
>  meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb b/meta-oe/reci=
pes-devtools/cunit/cunit_2.1-3.bb
> index ab8cf76..ad62e52 100644
> --- a/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> +++ b/meta-oe/recipes-devtools/cunit/cunit_2.1-3.bb
> @@ -18,5 +18,6 @@ EXTRA_OECONF =3D "--enable-memtrace --enable-automated =
--enable-basic --enable-con
>  FILES_${PN}-dev +=3D "${datadir}/CUnit"
>  FILES_${PN}-doc +=3D "${docdir}"
> =20
> -# http://errors.yoctoproject.org/Errors/Details/35136/
> -PNBLACKLIST[cunit] ?=3D "BROKEN: QA Issue: libcunit.la failed sanity tes=
t (workdir)"
> +do_install_append() {
> +    find ${D} -name "*.la" -delete
> +}
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbYALcACgkQN1Ujt2V2gBx/qACgubleSQyen2p/Q4x5Ac4vdopz
VPkAoKnOQjtplt/iUkMW7FpftQscogCk
=sp7h
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
