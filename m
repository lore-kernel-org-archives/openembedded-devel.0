Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by mail.openembedded.org (Postfix) with ESMTP id 5D80B70D30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 19:37:46 +0000 (UTC)
Received: by mail-lb0-f176.google.com with SMTP id u10so2309961lbd.35
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Aug 2014 12:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=G0zU3UsdQKv8LmZhiTMS/pAewSI6blV5/Ls3rjHsogA=;
	b=z3ho/7+kdi3n0N1AzHX3uCiVOSvhWzt5BQIGUhOy5+C3Po1w1ZUqGwEYAki8dOHIxD
	DX+Pa/rDcMqh0uW3bZJfcksOWDO/4siGHC8j1iZKdmvVhqCwPtstANXHW+I/1qGx1mQ6
	wvGopLfNreCdV5Y81C7PzavQEHTxCFbcTfaOC1tfLD68I5siUg1RxSJSJQfTqDsR2cZI
	b0YtMS9ehjQq0oUoQOGM/ixdICrhksFKTiNqIgPCg9V1PPGrWHsc4prSWes7dEXQxljt
	cKZrq5ENJY1AVB0+oXrav3LGzqn6gdIA/Zds3QU8kHQgFn+ZtZtVBKcWBUYIcHpk2x+4
	Q9jA==
X-Received: by 10.153.4.6 with SMTP id ca6mr13954251lad.32.1408131467169;
	Fri, 15 Aug 2014 12:37:47 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g8sm5498197lam.23.2014.08.15.12.37.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Aug 2014 12:37:46 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 15 Aug 2014 21:38:24 +0200
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20140815193824.GI22747@jama>
References: <CAP9ODKpr3f2MkPgO-3sYR7ik1OvTG_NPm+8wNdu7w5yd1w-NAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpr3f2MkPgO-3sYR7ik1OvTG_NPm+8wNdu7w5yd1w-NAg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [for-daisy] php 5.4.14: use pkg-config for libxml2 detection
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
X-List-Received-Date: Fri, 15 Aug 2014 19:37:52 -0000
X-Groupsio-MsgNum: 51717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7IgncvKP0CVPV/ZZ"
Content-Disposition: inline

--7IgncvKP0CVPV/ZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Isn't daisy still using libxml2-config?

binconfig-disabled was introduced only in master
(5870bd272b0b077d0826fb900b251884c1c05061) so this would need some
explanation why is it ineeded in daisy.

On Fri, Aug 15, 2014 at 03:11:16PM -0300, Otavio Salvador wrote:
> commit 466e0278acc96aabd29877933b22ae19e23cf810
> Author: Koen Kooi <koen.kooi@linaro.org>
> Date:   Thu Jun 19 08:54:28 2014 +0200
>=20
>     php 5.4.14: use pkg-config for libxml2 detection
>=20
>     Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
>=20
> --=20
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7IgncvKP0CVPV/ZZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPuYbAACgkQN1Ujt2V2gBy7ZgCfSfPeCqAuhBAxQZ3DFJQWOsPk
5vIAn1/5vJlh+F1No3g/RkUee1BShgr/
=2hiB
-----END PGP SIGNATURE-----

--7IgncvKP0CVPV/ZZ--
