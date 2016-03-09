Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 79BF8605FE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Mar 2016 12:06:41 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id l68so67845039wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Mar 2016 04:06:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Tl2EBVnbPRBDWWf39WufnhwwakO+8+QWrHcDh9eo8Hs=;
	b=F2n7IBhLho7UZm0EwthUMCenDBcl5DRwjh1a0MlmZSfOpttgX+CWm/LB5yuJNUNezc
	pJNkGUevCLiRicDCJvn8SKztlBGMcG2mjDPAQQ+VtPMK79a5AHWTOjcR91zoCvFQqLsA
	er9GhT6baNlqyI2Ar9vDUQFMCL9QgQIUXQUnHnrbzfh02p60EHDp4nDGHsR8jBtRG7f7
	z3eoSZp8o4glsy0TvypjDCcqRJIiLhThI8jT4w8+4Bf6oqWt3qOCTxl3EyAxSteiDJ6f
	IES3DtaGmuTifgJi5g+dmrwBCkqVMvsY1Yb4c4tJqK2MGpuemTZNGf8wPZHCYYV3ds34
	+gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Tl2EBVnbPRBDWWf39WufnhwwakO+8+QWrHcDh9eo8Hs=;
	b=XSC59O3VJSglGOGX06fIGvd73cvHV0/TuEsvvdZ+bz2H4zeE+sGGwCP8O0vug2BS+7
	zqb7IQ+KQ+vKJkDm20YSO/ujCFw0BSHVRQBQBFP73FPP8V0H2yA61abRuKbLYyyWHi/z
	A2YkNtOUccIOayOSphrUYy//kx+DIuBKtjmE2LMOmIrSzyHwxff2wWrHOTG2NpPEY2Tl
	vlntTTnQrHSP/YhAdfcYwUZFjPVzUIdMyfEqj4XQ/ZaOAOEVuTVBSB2KwvFJ4w8vANHf
	5xyEBhk/sWORaEVzmVdZLmPi+i3CmlV+sXR2gWYNhjrGmdVzvbR8QAab/P7Ctd1zh0ku
	m1Aw==
X-Gm-Message-State: AD7BkJLqlZu1NYNqqRvEcdqSsnrQtwoOsTxQraB+c4MiyAaVbzGvxd2beY5O6RAO3iAMiQ==
X-Received: by 10.28.225.137 with SMTP id y131mr383188wmg.102.1457525202196;
	Wed, 09 Mar 2016 04:06:42 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id m6sm7600402wje.21.2016.03.09.04.06.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Mar 2016 04:06:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 9 Mar 2016 13:09:34 +0100
To: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Message-ID: <20160309120934.GA2542@jama>
References: <50B33AC5ED75F74F991980326F1C438D191C80FE@PGSMSX103.gar.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <50B33AC5ED75F74F991980326F1C438D191C80FE@PGSMSX103.gar.corp.intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe] [jethro] Additional version supported in stable branch
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
X-List-Received-Date: Wed, 09 Mar 2016 12:06:42 -0000
X-Groupsio-MsgNum: 60384
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2016 at 03:22:47AM +0000, Chang, Rebecca Swee Fun wrote:
> Dear maintainers,
>=20
> I would like to collect inputs from all of you whether is it possible to =
have 2 versions of libvpx supported in Jethro branch.
>=20
> I have recently submitted libvpx v1.5 upgrade to master branch. I do unde=
rstand that stable branch is mainly used for security updates/fixes.
> So this is why I'm proposing to support 2 versions instead of upgrading i=
n Jethro.
>=20
> The reason behind is, we are enabling video decode/encode feature to cust=
omers but our target BSP components are still based on Jethro.

Then backport the newer version on your layer.

> Please let me know your concern whether this is feasible. Thank you very =
much.

We also backport newer versions for various components, we even have
separate layers for backports from various Yocto releases (so that whole
layer can be dropped when upgrading to newer release without functional
changes in backported recipes).

Doing it in upstream layers would cause unnecessary changes to everybody
else.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlbgEncACgkQN1Ujt2V2gBzgLACfd58zbbu7aGXIOulRFa+4Pulv
f70AoIYdmypxFHxfh4kvl7GKEvg8Udmb
=ui/W
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--
