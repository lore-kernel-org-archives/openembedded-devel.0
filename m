Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 82BC57718A
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Feb 2016 15:16:57 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r129so9607288wmr.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Feb 2016 07:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UXt+WDueNvjJDX4CGcf83muJghkx6Y6NfJFUfRxrNfU=;
	b=lmk3NLVAalGrgAHSZUiAM51zbEih51QK7Vt0pF++AUX2enU1teq2etkKvDBK2IZEB0
	ueCbXVE2L+4jlzu7s9S3yE9FGamwhN7Vzj7xixnY2lwpjGEljpO005hCddSwdRfX4o0n
	ng8DtmS5NiejAJbHNjymoZk3Ilbpw2TON1UkHlcCE9NAvWHRFfNmM6OETixDuTt+JLSv
	/D0WsqEQByA9sYNvuuw660bFNzGF3oQqS6dK3aELDYJqrtjC0bpB8tZABks3wuKNygmw
	Om88aPkAqtSQ9RHmCpngECDd8RkBgzW5Hp6tFgYZufoGJ37Xvlg/xksdgGxSiUXuw5rc
	3pdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=UXt+WDueNvjJDX4CGcf83muJghkx6Y6NfJFUfRxrNfU=;
	b=P5BgTPJhX3BtzH68wibj+S/YwmK2mgiPvFJkyFgCikqFjpn3WHDX160a5XuXQg5kk9
	UsmI7IO2o9slDe/HL+Fino3SELzBP+0hvQLqueF0CQmqFAxC2tlvR7u0/zRiwdzNQpiE
	DhrefSNZHBHnHDsWNohe14at5ZphicSKIq1B/IJEwe0Q4ujUybhPkJhuiAcI7q7FlV3g
	cNczNzDYP+gtBr3u/T/Qh2MtopdeAiJGgjsFxUbLcF0v7lTftRPRHNTj1iXM6MEQlxDB
	UvVwuu1QmNxNto3OroNKBYSgiFed9jTWYL4OLdORvpj1RiEqEPYNi7B1bIj+LtKu9l20
	eUfw==
X-Gm-Message-State: AG10YORyUVHEEAS9rkF3fgFvU8H08/RgBC/RAf6Qz1d1xenI3mM+qp1FOwMKxdNiMplang==
X-Received: by 10.28.187.198 with SMTP id l189mr3329769wmf.0.1454339817681;
	Mon, 01 Feb 2016 07:16:57 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	m67sm9456918wma.10.2016.02.01.07.16.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Feb 2016 07:16:56 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 1 Feb 2016 16:19:44 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160201151944.GE2639@jama>
References: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1454260743-18688-1-git-send-email-BrunoVern.a@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [PATCH 1/3] Fixes runtime error when loading modules
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
X-List-Received-Date: Mon, 01 Feb 2016 15:16:57 -0000
X-Groupsio-MsgNum: 59791
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jKBxcB1XkHIR0Eqt"
Content-Disposition: inline

--jKBxcB1XkHIR0Eqt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2016 at 06:19:01PM +0100, BrunoVernay wrote:
> Signed-off-by: BrunoVernay <BrunoVern.a@gmail.com>

openldap in master was upgraded to 2.4.43 more than month ago:

commit 03d613e570ae262b32322d1fa2eeb47c38518478
Author:     fan.xin <fan.xin@jp.fujitsu.com>
AuthorDate: Fri Dec 11 09:50:39 2015 +0900
Commit:     Martin Jansa <Martin.Jansa@gmail.com>
CommitDate: Fri Dec 18 12:43:22 2015 +0100

    openldap: upgrade to 2.4.43

Rebase, re-verify and re-send with subject following:
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

Regards,

> ---
>  meta-oe/recipes-support/openldap/openldap_2.4.42.bb | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb b/meta-o=
e/recipes-support/openldap/openldap_2.4.42.bb
> index 49fcb56..caca16b 100644
> --- a/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> +++ b/meta-oe/recipes-support/openldap/openldap_2.4.42.bb
> @@ -148,6 +148,8 @@ PACKAGES +=3D "${PN}-overlay-proxycache"
>  # it was disabled for cross-compiling.
>  CPPFLAGS_append =3D " -D_GNU_SOURCE -DURANDOM_DEVICE=3D\'/dev/urandom\'"
> =20
> +LDFLAGS +=3D "-pthread"
> +
>  do_configure() {
>      cp ${STAGING_DATADIR_NATIVE}/libtool/build-aux/ltmain.sh ${S}/build
>      rm -f ${S}/libtool
> --=20
> 2.5.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--jKBxcB1XkHIR0Eqt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlavd48ACgkQN1Ujt2V2gBz2IACePZWHEFIkQnsR87Ytr6JI5uhZ
8ywAn0XprVz9rINE5QjafbpsM4ETxTGT
=Y49R
-----END PGP SIGNATURE-----

--jKBxcB1XkHIR0Eqt--
