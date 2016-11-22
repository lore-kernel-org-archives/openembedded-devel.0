Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B7D7670022
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 16:54:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id m203so5078685wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2016 08:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=sRn5iWfxykCrNb19t5ANKVGceESD9O2rV3W5rvFJk6Q=;
	b=M3Zhfu75GpoTqtZWrc85KDeNALkplSZKqAqfJAmQBGSkXVZrfR6LvBFPH3FimLztyQ
	ivX4cMmm7W9WYl/qBJ9XZbmtSNThwP+I74SGrP0lOH8wRQgKd6otF7eSAhSrqzh8QisL
	kJ1Xll/4FLqZFVvjJJzV0sh/AQ60JmQPscWPBHzf+zpZN4cVANJ17Lsk7gAocSS/AbLJ
	wLaZcPRYWWrlvVgB106KOHcHykO4nf/ayxPNVlYCGL5v2hY+D+yAQxZL17SM61HR28vp
	40dbfOPGyWKwroKF7TC3am0uykV+pWiLvz90usG2DAoyyBOQLom1MFLSQoHCiAPIagXp
	anWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=sRn5iWfxykCrNb19t5ANKVGceESD9O2rV3W5rvFJk6Q=;
	b=VdH4BuCE8U4sSYFP7RyXV38IR/bTXMVMQt0D0osait/l7cIc3Q7Q0mxQ79CQemp1wt
	JloxonWzS0HNXQsJcZaVYfQbgYMtZFw35/0/pt4UPwlUpqYKVV4lgWTYB4bHMDoxy/rD
	o9THa2amibree4wMh/ucVJpRwrh5TQ+SKDYVpUBwvsAcNsXcjN85e4nQlVgvIx0R6E38
	iDWQyfahtTXo5X7XF81PqWCb/vn8Wdk44luWl1r+dKmYiUn40dwWMo7tfsuvKHN3PlBO
	NFoFOCm7GlM6zBuKRntY+8UHoxqFvcCx+emkidNHGq2zqzV7JP18ZDtnLVEjy8inbI8+
	ST3Q==
X-Gm-Message-State: AKaTC03p5WWbhXXrVROt/+hndUPDdkeqjqo5tiZOytp5EYC0ezw9BXvNkeV4ynobemb6kA==
X-Received: by 10.28.139.131 with SMTP id n125mr3274041wmd.116.1479833651993; 
	Tue, 22 Nov 2016 08:54:11 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	yj10sm31865211wjb.3.2016.11.22.08.54.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 22 Nov 2016 08:54:11 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 22 Nov 2016 17:54:12 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161122165412.GD3348@jama>
References: <20161109020926.14361-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161109020926.14361-1-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-oe][PATCH] breakpad: Upgrade to latest
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
X-List-Received-Date: Tue, 22 Nov 2016 16:54:11 -0000
X-Groupsio-MsgNum: 63949
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="T7mxYSe680VjQnyC"
Content-Disposition: inline

--T7mxYSe680VjQnyC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 08, 2016 at 06:09:26PM -0800, Khem Raj wrote:
> Switch to using git
> Gets aarch64 support
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../breakpad/{breakpad_svn.bb =3D> breakpad_git.bb}      | 18 ++++++++++=
+++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>  rename meta-oe/recipes-devtools/breakpad/{breakpad_svn.bb =3D> breakpad_=
git.bb} (87%)
>=20
> diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb b/meta-oe/=
recipes-devtools/breakpad/breakpad_git.bb
> similarity index 87%
> rename from meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> rename to meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> index b573ea5..6dc6500 100644
> --- a/meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> +++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
> @@ -13,9 +13,21 @@ inherit autotools
> =20
>  BBCLASSEXTEND =3D "native"
> =20
> -SRCREV =3D "r1435"
> -SRC_URI =3D "svn://google-breakpad.googlecode.com/svn;module=3Dtrunk;pro=
tocol=3Dhttp"
> -S =3D "${WORKDIR}/trunk"

Please define some sane PV, now it goes backwards:
breakpad-git: Package version for package breakpad-dbg went backwards
which would break package feeds from (0:svn-r0.36 to 0:git-r0.0)
[version-going-backwards]

> +SRCREV_breakpad =3D "2f6cb866d615d6240a18c7535c994c6bb93b1ba5"
> +SRCREV_glog =3D "d8cb47f77d1c31779f3ff890e1a5748483778d6a"
> +SRCREV_gmock =3D "f7d03d2734759ee12b57d2dbcb695607d89e8e05"
> +SRCREV_gtest =3D "ec44c6c1675c25b9827aacd08c02433cccde7780"
> +SRCREV_protobuf =3D "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
> +SRCREV_lss =3D "1549d20f6d3e7d66bb4e687c0ab9da42c2bff2ac"
> +
> +SRC_URI =3D "git://github.com/google/breakpad;name=3Dbreakpad \
> +           git://github.com/google/glog.git;destsuffix=3Dgit/src/third_p=
arty/glog;name=3Dglog \
> +           git://github.com/google/googlemock.git;destsuffix=3Dgit/src/t=
esting;name=3Dgmock \
> +           git://github.com/google/googletest.git;destsuffix=3Dgit/src/t=
esting/gtest;name=3Dgtest \
> +           git://github.com/google/protobuf.git;destsuffix=3Dgit/src/thi=
rd_party/protobuf/protobuf;name=3Dprotobuf \
> +           git://chromium.googlesource.com/linux-syscall-support;protoco=
l=3Dhttps;destsuffix=3Dgit/src/third_party/lss;name=3Dlss \
> +"
> +S =3D "${WORKDIR}/git"
> =20
>  COMPATIBLE_MACHINE_powerpc =3D "(!.*ppc).*"
> =20
> --=20
> 2.10.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--T7mxYSe680VjQnyC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDR4MwAKCRA3VSO3ZXaA
HFGNAJ0XLcqGv67ikt70DhQ0yPX9JbWpYwCgrMVc/wOwK2oPN1qsqlxbK57Sdy4=
=0p8l
-----END PGP SIGNATURE-----

--T7mxYSe680VjQnyC--
