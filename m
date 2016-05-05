Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B82365CC3
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 May 2016 15:18:45 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id g17so33320312wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 May 2016 08:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=YbXBkZlX024cT4le66DrLolnY5d+rGACuhsrE0b/jbA=;
	b=XAfABsBs7K0FpbfNYLn766m7PsTlR4AjEo0aqEJpRWuKMPi+bQYZDHs4eiGRTLgRZ1
	tH96BTD0LTRfkQY9Ktbk6pAsD/dJY0n7izWc9pxOm/ncpUfD+zKu9PubzTJKUFwzXvyj
	kqWSklEGakHHHetKGj+ujMxVURkrbZATLcGSZJMPODIIoByaHhPmE6BotzKD4Mfo7184
	R7wQyaj6htFxJvD9yLBUAhfMYLiimP9hHQ7LzKEskwRedklZ3g12gX3Xc5auKUbugsjq
	5u3Du9q4tuvCmrCVnyUHYuHsvcrRkcvcB12AutDNKn05AFfe9XWUE6rEv0oRRAkjVJJZ
	47Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=YbXBkZlX024cT4le66DrLolnY5d+rGACuhsrE0b/jbA=;
	b=CbLJMWpISvz7bH63w2gR88zNZz13XbvqhPzkvxJUq6Up+xPFZrLRwwqh8yqo6z7bZF
	3WUDa8rMEo8JPIqSTOVE7NVM1LgjhLEHZh0x6kvPytUbSTTdwYrueUoV7VpEFBGeXXt3
	xQX3R8nD3QPUMut8qDc87ATUwr1pyxmsSkv3KN/5/3DYcwU2bgqyFn0s9WDgKC3se3HU
	et+/WyfPuGLWKOl7JKdmQh7BmVrwBrkv354BF5v0BOrdVxhPOS2oLP6K8a84re5PmKpI
	5E82eKC9yGD42qfC5x3WxTdpLV2kQFMM8+BCEYN114ssOqpfFeGdJ6eaxXzv5wPmw5sE
	ZC5Q==
X-Gm-Message-State: AOPr4FUl6OVOhR0zgqtNFiUWn3cloUoKvHb7UlQWSCnfOxTzApZDyPDHqyzizHUV5bKTxw==
X-Received: by 10.28.11.143 with SMTP id 137mr3828765wml.92.1462461525525;
	Thu, 05 May 2016 08:18:45 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	q77sm3659179wmd.12.2016.05.05.08.18.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 May 2016 08:18:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 May 2016 17:20:08 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160505152008.GA2562@jama>
References: <1462332742-168809-1-git-send-email-Yue.Tao@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1462332742-168809-1-git-send-email-Yue.Tao@windriver.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: yue.tao@windriver.com
Subject: Re: [meta-networking][PATCH] net-snmp: enable ipv6 support
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
X-List-Received-Date: Thu, 05 May 2016 15:18:49 -0000
X-Groupsio-MsgNum: 61337
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XsQoSWH+UP9D9v3l"
Content-Disposition: inline

--XsQoSWH+UP9D9v3l
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 04, 2016 at 11:32:22AM +0800, Yue Tao wrote:
> From: Zhu Yanjun <yanjun.zhu@windriver.com>
>=20
> Add packageconfig for ipv6 and enable it when it's defined in distro_feat=
ures.
>=20
> Signed-off-by: Zhu Yanjun <yanjun.zhu@windriver.com>
> Signed-off-by: Yue Tao <Yue.Tao@windriver.com>
> ---
>  meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb=
 b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 1a50932..e4d7b17 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -39,6 +39,9 @@ PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[elfutils] =3D "--with-elf, --without-elf, elfutils"
>  PACKAGECONFIG[libnl] =3D "--with-nl, --without-nl, libnl"
> =20
> +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6',=
 '', d)}"
> +PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,,"

Don't use deprecated base_contains

I've fixed it in master-next.

> +
>  EXTRA_OECONF =3D "--disable-embedded-perl \
>                  --with-perl-modules=3Dno \
>                  --disable-manuals \
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--XsQoSWH+UP9D9v3l
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlcrY3cACgkQN1Ujt2V2gByBWACgkTUD/Rbn0RtHL4PsCC4qjK/6
uN8AoLVv2OV/c0uOGHoHTOxoh6N0Z4FB
=HJMU
-----END PGP SIGNATURE-----

--XsQoSWH+UP9D9v3l--
