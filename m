Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6FF77101
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 21:57:22 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id r5so51311483pag.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2016 14:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=4iBFSbrNnbcyLlgCnVDWbNTzF8KZrCzlK7XY1NY2iG0=;
	b=rrxrVUEfFK74xbOiPCgJR0QZeXheZm5bwIDd4y6l8vQZCc00Vg4tpl8nJ39Hwj0Lcn
	6g6ik0Xi5IFHNs9z2txRoyEFethVDnjXJwlYsUmWG7YRmcVPZeFu4yMaouLWMWIomNbj
	NkJggyyLBIdf+2YAYaH554NwORr+poLqtzMHduKZp3BNoCjCBlKgGAyEW2yB7d217t15
	BGFfUNgknKgAPjSQVM7tCT1D1nOFDbN0gNPpx58+9I/MkzS17XXTd7V7XEdCUprJmMBy
	rzQAvkbTQXGYZavre3M2+UFY4/2x4M4HYlTR5onl0lGMyCJRHDPiI+9T2MUAV6NeD/Vj
	GpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4iBFSbrNnbcyLlgCnVDWbNTzF8KZrCzlK7XY1NY2iG0=;
	b=e+mJ170e//UUxOl1bdKHX7q+9+lFJVsRBFI3YdMx0HX4q6BXlh5Cy9nepM5BJFrErp
	rbRdHdb1D80QjW0wmzDh01EZnumV3lbtj+27nieSdtyXjVPWway8uGId/a/1ftTFeZDp
	Q77BEW6gRYebBSpyump6eekrJ5fiGJiH7Lec+/DIhi/Fmn41dFIp1IqwdyWIgekUajDK
	N36vJHphoUsWWR36zvcyYC3dej5FU/TNv4X7S/BerpAHkv5nHPajBWp6cv0QjGmxsgFY
	KUhVI8RQFuusYLCOOXS079byhDrS2ve1y+SPwkBo9akmCA0N0CETbDBYpmputxE8s/DF
	o+6A==
X-Gm-Message-State: AOPr4FV4X4QXQKS6bWgixtzaQx+UDKIwGmopYNIYXYUwJllx6PhTDLinhxw7GzAD478u6g==
X-Received: by 10.66.21.102 with SMTP id u6mr29182488pae.118.1461967042628;
	Fri, 29 Apr 2016 14:57:22 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:9475:a54c:5e22:a356?
	([2601:646:8800:5a9a:9475:a54c:5e22:a356])
	by smtp.gmail.com with ESMTPSA id
	t8sm26179100paw.16.2016.04.29.14.57.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2016 14:57:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1461959353-32423-1-git-send-email-derek@asterius.io>
Date: Fri, 29 Apr 2016 14:57:16 -0700
Message-Id: <36A687F7-36B8-453A-B13D-CF4E8C335CB9@gmail.com>
References: <1461959353-32423-1-git-send-email-derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Derek Straka <derek@asterius.io>
Subject: Re: [meta-oe][PATCH] tinymembench: update to version 0.4.0 plus bux fixes
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
X-List-Received-Date: Fri, 29 Apr 2016 21:57:22 -0000
X-Groupsio-MsgNum: 61272
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E7BF425C-CA06-4F4C-8948-CD51D5D134F9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E7BF425C-CA06-4F4C-8948-CD51D5D134F9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 29, 2016, at 12:49 PM, Derek Straka <derek@asterius.io> wrote:
>=20
> Removed ARM_INSTRUCTION_SET since it builds on qemuarm and qemuarm64 =
without issues
> Also tested the build on qemuppc and qemux86-64


For test, you need to set ARM_INSTRUCTION_SET =3D =E2=80=9Cthumb=E2=80=9D =
in this recipe and see if that works for qemuarm
if that does then it can be removed.

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
> meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb | 12 =
++----------
> 1 file changed, 2 insertions(+), 10 deletions(-)
>=20
> diff --git =
a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb =
b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> index 9898a70..a675bda 100644
> --- a/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> +++ b/meta-oe/recipes-benchmark/tinymembench/tinymembench_git.bb
> @@ -6,9 +6,9 @@ HOMEPAGE =3D =
"https://github.com/ssvb/tinymembench/wiki"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://main.c;endline=3D22;md5=3D879b9bbb60851454885b5fa47eb6b345"
>=20
> -PV =3D "0.3.9+git${SRCPV}"
> +PV =3D "0.4.0+git${SRCPV}"
>=20
> -SRCREV =3D "95e68477588d41187b2d2e52ecf6be0e7eb06b8d"
> +SRCREV =3D "2c789849709d837b4bd114c11ed2d9bdc65afbc6"
> SRC_URI =3D "git://github.com/ssvb/tinymembench.git"
>=20
> S =3D "${WORKDIR}/git"
> @@ -17,11 +17,3 @@ do_install() {
>     install -d ${D}${bindir}
>     install -m755 tinymembench ${D}${bindir}/
> }
> -
> -# Fails to build with thumb-1 (qemuarm)
> -#| {standard input}: Assembler messages:
> -#| {standard input}:66: Error: instruction not supported in Thumb16 =
mode -- `subs r1,r1,#16'
> -#| {standard input}:69: Error: instruction not supported in Thumb16 =
mode -- `subs r1,r1,#16'
> -#| {standard input}:82: Error: selected processor does not support =
Thumb mode `mla r3,r4,r3,r5'
> -#| {standard input}:82: Error: unshifted register required -- `and =
r8,r7,r3,lsr#16'
> -ARM_INSTRUCTION_SET =3D "arm"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_E7BF425C-CA06-4F4C-8948-CD51D5D134F9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcj2MAACgkQuwUzVZGdMxSGbwCeJecbDAUIZD1Phed8kgHFnZuv
GFwAn22oKps+pGHaSBfyZVT9eme9VMsA
=t/cg
-----END PGP SIGNATURE-----

--Apple-Mail=_E7BF425C-CA06-4F4C-8948-CD51D5D134F9--
