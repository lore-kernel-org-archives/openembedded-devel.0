Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 120147680C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 10:59:19 +0000 (UTC)
Received: by wicfx6 with SMTP id fx6so85418514wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2015 03:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7V3Pr9yWGR8L453EZ+FmrKz9gZSFwgATay70hsJ3azw=;
	b=LNb0UotYXVxnSjzbF+EpxMq8tz1MM8pVDpo8/CKU5LMZ2GKQ6DUC5t6Z0wt3ElvKEs
	W6Ja1q4qv9i8ifEVrn5Tij5FXpgd+X85FScZZUy42bu/NOvewU/beGMPMJobzUMIu8Kw
	8IlZlbMLr/bBKLU1+0icMgtuzfSr8Kp5LDu0vRCeDorQOP0H7yq7+KJqUqZkoxeOfmlZ
	6V+m0up+L/9f2rIrYOOY8OxchHF73BdK3xHmcFRF0+sXJODf9T3D7vwzClxHCoMGIs4p
	Jy6YQo1ns//Qx8kt+Ju9bLfSV8w7KK1AsfRtRDsiCaaG5eDGPzSi09WISn4okIgykp0J
	MYVw==
X-Received: by 10.194.222.227 with SMTP id qp3mr11589484wjc.36.1445425159479; 
	Wed, 21 Oct 2015 03:59:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	gl9sm9656158wjb.10.2015.10.21.03.59.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Oct 2015 03:59:18 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 21 Oct 2015 12:59:37 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151021105937.GA2556@jama>
References: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0B97F40A-B08B-44AC-A4C4-24DA6B8CF061@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-oe][PATCH 1/6] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Wed, 21 Oct 2015 10:59:22 -0000
X-Groupsio-MsgNum: 57943
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2015 at 08:48:51PM +0200, Jens Rehsack wrote:
>=20
> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in 3=
=2E5
> (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the=
-arm-backend).
>=20
> Ensure JIT is built with llvm

I'm tempted to leave this one after jethro is branched, unless
default LLVM_RELEASE is updated in oe-core/jethro mesa as well.

Otherwise everybody will need to set LLVM_RELASE in their mesa bbappend
or we'll need to bbappend it in meta-oe.

What others think?

And was this tested with mesa or just with java?

Regards,

>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta-oe/recipes-core/llvm/llvm.inc                 |  8 +---
>  ...r-output-from-configure-if-CFLAGS-is-set-.patch | 52 ----------------=
------
>  .../{llvm3.3 =3D> llvm3.5}/arm_fenv_uclibc.patch     |  0
>  .../llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb}      | 11 +++--
>  4 files changed, 9 insertions(+), 62 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/llvm/llvm3.3/Remove-error-output=
-from-configure-if-CFLAGS-is-set-.patch
>  rename meta-oe/recipes-core/llvm/{llvm3.3 =3D> llvm3.5}/arm_fenv_uclibc.=
patch (100%)
>  rename meta-oe/recipes-core/llvm/{llvm3.3_3.3.bb =3D> llvm3.5_3.5.2.bb} =
(71%)

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYncBcACgkQN1Ujt2V2gBxPBwCfbMULgc76HXMulMVm2fazOh6P
ZhgAn0mE6YIu2J7tYb+AMR6rPROC9hEY
=YYtf
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
