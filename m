Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0797E6612D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 18:28:42 +0000 (UTC)
Received: by wmec201 with SMTP id c201so36871923wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Dec 2015 10:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=EYNLOcSxoe3b8SsUaHm97AzlHbJ/1Yrxz1BxAus4Opg=;
	b=sab1Bts5Juso2/WiPT9vgjUxfbKSQKG9nfaGs/XotgAnULihH51YkmYMtDRFWtsFLm
	bPaCKYlUOUZLR1HhnjlfvUGjMWFRwkRkhjhpyv4G+ssz8LIIofMDDeOu5Hlzl10SEpoR
	C/hEkGetPGQt5SBIgTlPH++WdpjsFuTaEELhneZUqlr/QTC8qTdCy2PAbvCcHYnP3bTO
	Zc+/QqqQaHxBJO5lJu4pqSCQc/+aqUW9Eefls6hkag/vwpf5OvAT5wSJ+WvuDu/Y8uYT
	SB9izE7FmigM2GRGCR97J6TlxVtGrl2oidnkJf8RGVUwS40Po1bnvhyW1vP7NBW5EbX7
	1Rog==
X-Received: by 10.28.183.198 with SMTP id h189mr612789wmf.44.1449772123146;
	Thu, 10 Dec 2015 10:28:43 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id r74sm2015079wmb.2.2015.12.10.10.28.41
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Dec 2015 10:28:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 10 Dec 2015 19:30:26 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151210183026.GN2246@jama>
References: <5669BE05.7030904@webthatworks.it>
MIME-Version: 1.0
In-Reply-To: <5669BE05.7030904@webthatworks.it>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-qt5] [meta-ruby] jethro: dependencies on xfce-layer and xfconf probably make qt5 unbuildable without X
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
X-List-Received-Date: Thu, 10 Dec 2015 18:28:44 -0000
X-Groupsio-MsgNum: 58964
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7gLe/sNPhR777EPF"
Content-Disposition: inline

--7gLe/sNPhR777EPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2015 at 07:01:41PM +0100, Ivan Sergio Borgonovo wrote:
> I was trying to see if I could build
> core-image-minimal | meta-toolchain-qt5
> and I stumbled into
>=20
> ERROR: Layer 'ruby-layer' depends on layer 'xfce-layer', but this layer=
=20
> is not enabled in your configuration

Why do you use ruby-layer?

meta-qt5 no longer requires ruby-layer, because ruby-native was moved to
oe-core.

Similarly imsettings now doesn't need to be in meta-ruby, because it was
moved there just because of ruby dependency, so now it can be moved
back.

Regards,

> that probably is due to
>=20
> http://patchwork.openembedded.org/patch/107727/
>=20
> I'm willing to try to make it "optimal" and I'm trying to figure out=20
> what it is all about.
>=20
> Any help would be apreciated.
>=20
> Most probably whatever imsettings is should be optional rather than a=20
> required.
>=20
> Of course problem occurs just with jethro, there is no imsettings in=20
> fido and I've been able to bake and run images for my board without X.
>=20
> thanks
>=20
> --=20
> Ivan Sergio Borgonovo
> http://www.webthatworks.it
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7gLe/sNPhR777EPF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZpxMEACgkQN1Ujt2V2gBxhxwCgqDESnOO06yOGfR1lImfySgX9
Q4MAnjNBowHkSSEsQ5Enq1QGjSYNDXD+
=0Bqn
-----END PGP SIGNATURE-----

--7gLe/sNPhR777EPF--
