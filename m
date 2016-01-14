Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id D6E2260112
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 10:43:05 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id l65so42476076wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jan 2016 02:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=WuOdlLNXSCkdikiU3zCDRK13/Uz3GMQqmbg7IxkgEIk=;
	b=pUJMY9zlBNW/XZHdiU+2MbTzYAQvd7GxdlVS9w9I1jtLGiXTpE5/E0IKHzGqQMqr5R
	f9/XS0MWb+OsXAO1mezglZTWngyqvL2TWr2qSMqjMvs/R3vK23jRerKjS+p8qeWnuWwg
	gm1c4BEXoimcQi016eSsExExoVu83hvGnk7q0L8CvLfHaWePCWPb+i5U3ESXgKEACXKI
	lM1kyF2EFoD+dVRNTJMsJVT+wGKz6jEZShSNQN9KB4mVp5YZWAREFvX8gNRxu4/iasxj
	+2VyixNL/OkxrXZvrDkNE1nt57sduSKps9aluBKl3/h1KWUUuOi9e9xmmhQlN9jcd867
	E0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=WuOdlLNXSCkdikiU3zCDRK13/Uz3GMQqmbg7IxkgEIk=;
	b=U8GtUp2kmUPvjrvhxNDWZVp+qo7RodoqZiBsv8pz9UMUOegG9aAa8VOqEsLT3qIynI
	6/P54XN3WyHVQOMkUD96YYHkGEvGHYgIpkeWzkB/rZ2aJCk9bXiEOu8cS5LJ4bj+vxEA
	raB0Ar/r96Psc4odjyIeWVtXjGJIcvxOtZa/fbC3ZacinmQ5lxrI8sVVOK0S++usFUSW
	6Cvu12datQk5wKprtPLZWkp+e7lxA3PeOgJw+P/5mAQ1ruHRAiH74fRyWzj6VcA0X4b1
	5PCL9IA18YV6lBojS4zulUixZtUWiUnZ+WwqblMpQaPoMDJc9jq1R7QlQCyldsXwlF/y
	c0dA==
X-Gm-Message-State: ALoCoQmioNj1Zc7pncxA0yMzkQa4EWmVOSfGRH5m9AtnSI+EJvmtXe91tkngMk8YvKA/d3/EIRNE7lU/sfxS8CPaZFwkJv/dMA==
X-Received: by 10.28.11.77 with SMTP id 74mr32981899wml.36.1452768186051;
	Thu, 14 Jan 2016 02:43:06 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	ft4sm5435491wjb.37.2016.01.14.02.43.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Jan 2016 02:43:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 14 Jan 2016 11:43:55 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160114104355.GA2582@jama>
References: <BLU436-SMTP8654CB430C712153FB89F1D6F50@phx.gbl>
MIME-Version: 1.0
In-Reply-To: <BLU436-SMTP8654CB430C712153FB89F1D6F50@phx.gbl>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-networking][PATCH v2] wolfssl: update to version 3.8.0
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
X-List-Received-Date: Thu, 14 Jan 2016 10:43:06 -0000
X-Groupsio-MsgNum: 59534
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3/rZRmxL6MmkK24"
Content-Disposition: inline

--u3/rZRmxL6MmkK24
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 07, 2016 at 10:20:51AM -0700, LC Mac wrote:
> Version 3.8.0 of includes VxWorks example client/server, AESNI use
> with AES-GCM, Stunnel compatibility, C# wrapper, and more.

We don't have 3.6.6 version yet, so this doesn't apply.

OE @ ~/meta-openembedded $ pwam 111559
2016-01-14 11:33:36
URL:http://patchwork.openembedded.org/patch/111559/mbox/ [1691] ->
"pw-am-111559.patch" [1]
Applying: wolfssl: update to version 3.8.0
error: meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb:
does not exist in index
Patch failed at 0001 wolfssl: update to version 3.8.0
The copy of the patch that failed is found in: .git/rebase-apply/patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

OE @ ~/meta-openembedded $ ls meta-networking/recipes-connectivity/wolfssl/=
wolfssl_3.4.0.bb


>=20
> Signed-off-by: lchristina26 <leah@wolfssl.com>
> ---
>  .../wolfssl/{wolfssl_3.6.6.bb =3D> wolfssl_3.8.0.bb}                    =
| 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_3.6.6.bb =
=3D> wolfssl_3.8.0.bb} (83%)
>=20
> diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.b=
b b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
> similarity index 83%
> rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
> rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
> index 2366fb1..ac5dff0 100644
> --- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.6.6.bb
> +++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_3.8.0.bb
> @@ -14,8 +14,8 @@ RPROVIDES_${PN} =3D "cyassl"
> =20
>  SRC_URI =3D "http://www.wolfssl.com/${BP}.zip"
> =20
> -SRC_URI[md5sum] =3D "ec6ed4c5847454ac928215a46b3e0c33"
> -SRC_URI[sha256sum] =3D "bc49a142c17b1e52a126417e5d7cbadcb7f18f5c81e446c1=
2e214483395159ea"
> +SRC_URI[md5sum] =3D "a73d90c5439adea97a5002a73b46ddeb"
> +SRC_URI[sha256sum] =3D "36369304dd107b2ae1360c91f3d0eea491802dcacb215556=
2652bf5257117016"
> =20
>  inherit autotools
> =20
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

--u3/rZRmxL6MmkK24
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaXeeIACgkQN1Ujt2V2gBwOOwCeL0w+48vS3mG7qs1DmREmqnAP
76QAn04xSqV2B8WqzN0yggE+sXMQZe4n
=x5KR
-----END PGP SIGNATURE-----

--u3/rZRmxL6MmkK24--
