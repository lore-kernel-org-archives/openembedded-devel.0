Received: from outbound.soverin.net (outbound.soverin.net [116.202.65.218])
 by mx.groups.io with SMTP id smtpd.web11.10699.1610555296365439081
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Jan 2021 08:28:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@embed.me.uk header.s=soverin header.b=bqu7waTD;
 spf=pass (domain: embed.me.uk, ip: 116.202.65.218, mailfrom: ml@embed.me.uk)
Received: from smtp.soverin.net (unknown [10.10.3.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	by outbound.soverin.net (Postfix) with ESMTPS id 7D57E6028A
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 Jan 2021 16:28:14 +0000 (UTC)
Received: from smtp.soverin.net (smtp.soverin.net [159.69.232.138]) by soverin.net
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=embed.me.uk;
	s=soverin; t=1610555294;
	bh=kpdI96IINLJLCwVufWp6/LOS3figI+qGe4t0whPm3GE=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=bqu7waTDp6umGg2EBTHU6ZvDBxMpJfUTgmRpvfWzkvzd3Nt9lnKVPdpTCMMK8zAjn
	 UO/HRtvW4X4VBPwhT88H15g5VSY6VdkKw8z41XglTRnTiofFHAHKr171ORVojWoK6K
	 NW7LSGhves8+axMwDfTAl+EMMUd3fhl0lCcwOFJADn0pqI/jPV2Dx6dGNAVZPpJSks
	 /kNJv3WFbSbBikWZkniNArAAKJVgJB0pQEne3atNt6g8CXb3tgS+kncH2Qhy17cGLm
	 nhPC9sHwTRNA+2X6jJaUDrjmSBSQCDdK1ISeApITUo8plttO+bZJeNYAQbe0QX7S3z
	 Zaq/qAIsrKVug==
Subject: Re: [oe] Yocto recipe for scikit-learn
To: openembedded-devel@lists.openembedded.org
References: <5cd73e00-fc8f-0bb2-8985-824ae53e2083@embed.me.uk>
 <21945.1610554793767268949@lists.openembedded.org>
From: "Jack Mitchell" <ml@embed.me.uk>
Message-ID: <246d3d88-0c56-733d-553d-0cb3f83c1c9e@embed.me.uk>
Date: Wed, 13 Jan 2021 16:28:13 +0000
MIME-Version: 1.0
In-Reply-To: <21945.1610554793767268949@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: quoted-printable

On 13/01/2021 16:19, kodali13451@gmail.com wrote:
> I tried to build "scipy" first using your repo, I have encountered the
> below two errors:
>=20
> 1.=C2=A0ERROR: Nothing PROVIDES 'python3-pybind11-native'
> -=C2=A0python3-scipy_1.5.2.bb DEPENDS on or otherwise requires it - Is =
this
> required to add this dependency?
> 2. ERROR: python3-scipy-1.5.2-r0 do_prepare_recipe_sysroot: The file
> /usr/lib/libblas.so.3 is installed by both openblas and lapack, abortin=
g
>=20
>=20

You need to use the full layer, rather than trying to copy over
individual components. scikit-learn is a complex recipe to build and
requires a lot of moving parts, without full understanding of the OE
system you should take the layer verbatim. Both errors will be addressed
by using the full layer as it depends on meta-python which is part of
meta-openembedded, and it also bbappends lapack in order to prefer openbl=
as.

Regards,
Jack.

--=20
Jack Mitchell, Consultant
https://www.tuxable.co.uk
