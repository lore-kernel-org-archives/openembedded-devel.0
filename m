Return-Path: <joe@deserted.net>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6B465D31
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:01:51 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so3215774iec.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=rzhR4qf5lm5AerR6FORL2I0UNuAOEc02CJHR19CVtdc=;
	b=h0XmmpqHy9d5MsOJGuo5g3nH1Mn3qw5i7SpvQGEUNCZ2LuALgX9pbo0aQ+dZ/7nO+6
	J17rCutOfqKzaurai2HlS4CacbpfdCLiTa98KRvU0ZW2B7I/IUGMuf0sjFLmlvuWKLJC
	J+eFzUBtqjscc25sR5dEBFsRmohTzwee+Arl7LcGpl4/d3Eu5wxFsLN+gf0gf43o/CUq
	O4aYRbLuSQwVCIm5/zWayxHZbEHR8BlbthZKGxr8bEEtBJCjNGFAgAwzK/dj6kzGI0gR
	OQ3nilB+NLTA6XSffLLPbfLtYxly+VnBeE5Jqr1aTIsR7pE8TWSu8qLQc/YbeNz8Dws+
	0qiA==
X-Gm-Message-State: ALoCoQm73MJb65rn4ADuaa4vgV34JR29hcGjWAY2OgPr8kHQLRRMQ9fYR5uzpn+Q/XitE9kRMVa2
X-Received: by 10.50.253.130 with SMTP id aa2mr1948469igd.39.1398387712547;
	Thu, 24 Apr 2014 18:01:52 -0700 (PDT)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	sc2sm3666588igb.5.2014.04.24.18.01.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 24 Apr 2014 18:01:51 -0700 (PDT)
Date: Thu, 24 Apr 2014 21:01:48 -0400
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140425010147.GG10115@deserted.net>
References: <1398242092-43050-1-git-send-email-javier.viguera@digi.com>
MIME-Version: 1.0
In-Reply-To: <1398242092-43050-1-git-send-email-javier.viguera@digi.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [meta-networking][PATCH] stunnel: fix configure ssl parameter
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
X-List-Received-Date: Fri, 25 Apr 2014 01:01:52 -0000
X-Groupsio-MsgNum: 49471
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xjyYRNSh/RebjC6o"
Content-Disposition: inline

--xjyYRNSh/RebjC6o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [meta-networking][PATCH] stunnel: fix configure ssl parameter] On 14.=
04.23 (Wed 10:34) Javier Viguera wrote:

> '--with-ssl=3DDIR' configure parameter expects the location of the
> libraries and include files in the sysroot. This means the directory
> containing the 'lib' and 'include' subdirectories, not the include
> directory itself.
>=20
> This fixes an error at configure time:
>=20
> checking
> <local-path>/tmp/sysroots/ccimx6adpt/usr/include/include/openssl/engine.h
> usability... no
>=20
> (notice duplicated include entry in above line)
>=20
> Signed-off-by: Javier Viguera <javier.viguera@digi.com>
> ---
>=20
> Notes:
>     To backport to Dora as well.
>=20
>  meta-networking/recipes-support/stunnel/stunnel_4.56.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb b/me=
ta-networking/recipes-support/stunnel/stunnel_4.56.bb
> index 086d0b7aafea..938f043a9d97 100644
> --- a/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> +++ b/meta-networking/recipes-support/stunnel/stunnel_4.56.bb
> @@ -12,4 +12,4 @@ SRC_URI[sha256sum] =3D "9cae2cfbe26d87443398ce50d7d5db5=
4e5ea363889d5d2ec8d2778a01c
> =20
>  inherit autotools
> =20
> -EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_INCDIR}' --disable-fips"
> +EXTRA_OECONF +=3D "--with-ssl=3D'${STAGING_EXECPREFIXDIR}' --disable-fip=
s"
--=20
-Joe MacDonald.
:wq

--xjyYRNSh/RebjC6o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlNZs/sACgkQwFvcllog0XyxzwCeNxgOAxe6936djPpX6aEKnC56
q+EAnRqlARg5pjmu1a/wJCS4iqV0cIxO
=BZio
-----END PGP SIGNATURE-----

--xjyYRNSh/RebjC6o--
