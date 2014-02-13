Return-Path: <joe@deserted.net>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE9B6E8DC
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2014 03:57:14 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id uy17so12290857igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Feb 2014 19:57:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=eIG5nQvclTAjMlDU2AxhkcSpeBGzm5jSaJYtzSFFhoA=;
	b=EpZksTt2mH3Sq3AqnvUq26xIa2r1rBsre5/mvl25DwhDsZcQdZovQV/JFAi5jEdwRn
	mPxIgaMb6hI9EIyutzm+8iKH1Ek3bpKRj0lFxfM+QvE8C6vxStoylAN1E1x3Cwa0K1vc
	6KBR40OtmQWTpSmxXIFbceBSOPyEccQjEeN4Ld83Uains96wy7PjpBgIxBOGrqRvRQ2C
	Uk74iJd8iJZOUDSIKzdNLZ6PmUA2TbLuodD+YBAkfGNvQMPBcRTymSVFhyNALG4wcUtR
	tDxQ3QJdJ/MdiARxJ8yKlKqt0Iu7dgV4lOpSfLmMYWKgXFrfzKLOlC4mk/2O8cPGE0TC
	sJQQ==
X-Gm-Message-State: ALoCoQl8Tf/PnqCX8UM8zqFLnTt02jhLTT9luBNUK+oEQX5wTDzzpFEEYVW9vDKESEoN73JFvZXz
X-Received: by 10.50.11.36 with SMTP id n4mr1411284igb.3.1392263835354;
	Wed, 12 Feb 2014 19:57:15 -0800 (PST)
Received: from deserted.net (24-246-4-250.cable.teksavvy.com. [24.246.4.250])
	by mx.google.com with ESMTPSA id
	pn6sm2703517igb.4.2014.02.12.19.57.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 12 Feb 2014 19:57:14 -0800 (PST)
Date: Wed, 12 Feb 2014 22:57:12 -0500
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140213035710.GI23405@deserted.net>
References: <1390973218-16702-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1390973218-16702-1-git-send-email-rongqing.li@windriver.com>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH meta-networking] quagga: fix a typOS
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
X-List-Received-Date: Thu, 13 Feb 2014 03:57:14 -0000
X-Groupsio-MsgNum: 48137
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k1BdFSKqAqVdu8k/"
Content-Disposition: inline

--k1BdFSKqAqVdu8k/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Merged, thanks.
-J.

[[oe] [PATCH meta-networking] quagga: fix a typOS] On 14.01.29 (Wed 13:26) =
rongqing.li@windriver.com wrote:

> From: Roy Li <rongqing.li@windriver.com>
>=20
> it should be CPP, not cpp; this typOS makes vtysh unable to work.
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../quagga/files/build-fix-extract.pl-for-cross-compilation.patch    |  =
  2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-protocols/quagga/files/build-fix-ext=
ract.pl-for-cross-compilation.patch b/meta-networking/recipes-protocols/qua=
gga/files/build-fix-extract.pl-for-cross-compilation.patch
> index e3ccc2a..7e5beef 100644
> --- a/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl=
-for-cross-compilation.patch
> +++ b/meta-networking/recipes-protocols/quagga/files/build-fix-extract.pl=
-for-cross-compilation.patch
> @@ -22,7 +22,7 @@ index 7612aff..4c3a47f 100755
>       $file =3D $_;
>  =20
>  -    open (FH, "cpp -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@to=
p_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/isi=
sd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
> -+    open (FH, "@cpp@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@=
top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/i=
sisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
> ++    open (FH, "@CPP@ -DHAVE_CONFIG_H -DVTYSH_EXTRACT_PL -DHAVE_IPV6 -I@=
top_builddir@ -I@srcdir@/ -I@srcdir@/.. -I@top_srcdir@/lib -I@top_srcdir@/i=
sisd/topology @SNMP_INCLUDES@ @CPPFLAGS@ $file |");
>       local $/; undef $/;
>       $line =3D <FH>;
>       close (FH);
--=20
-Joe MacDonald.
:wq

--k1BdFSKqAqVdu8k/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlL8QpYACgkQwFvcllog0XxOMACfV3DcH9rvS/OJbmNJvdVFNCYV
ClUAni6MwhRGQ0CqEb3SNcqnkuZlHyLZ
=W1zy
-----END PGP SIGNATURE-----

--k1BdFSKqAqVdu8k/--
