Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id A8B5B71CCB
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Mar 2017 01:02:03 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id g2so9854150pge.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Mar 2017 17:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=4Yq+ehRXCiD0RjE6lxLkg7MyP+sUJBU3iavXM4/qoXA=;
	b=Fiol/PcqXrqvoQ523jJQDFNcVDdnoo87rFiDWhlBqXtwmprlBrbyqyoKI3U0/ltGiF
	Hz5jTQxzX+6Gm51vwIdKgDnBii+W5vEdlLG3R8YIeJHLE6L4FoQPxyOSeub0+lx7axPS
	zWs6UGVICy2wTUM+JD4GNJ7g53FRFHurnxCTH5HRlwH4Tnw3ia3CVlaoCo9b4fgwRqxV
	4nN3CGQhNdZJlRascQbb4SyJUKEJRkqztKzW+5P4TCh8KnevDrbETlJaPZW+XnSy2w4a
	m8rcFT3XV1Rxy1o1ZzKrNuS7ROFrAa3sGRLDflGyNbFcdfCCNEi5tC7TiOBmHAxu2FnI
	Y5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=4Yq+ehRXCiD0RjE6lxLkg7MyP+sUJBU3iavXM4/qoXA=;
	b=gqAki/c1cR+IWW33DMJDJiA01nu39CPXSjXpND08Q2aj27ROMn8qwplgtfGc1VrKy9
	KqZHMG6UKK2fRyCNPr5LN8E7jmPsCajLm6F7GS6UzPFh+gAXDUObJF0fn4eyInHoTtwy
	ASvA50MLPvkgFvM9muevGE6fIw/tigiabJkIOt4IhGFxvWDSqcaIkg5Pht2Y1d96m/1N
	A7OjyYuyU9PcL0riYhlW3t9BA+g+PW2L/vM+DBIPPdza13YSu6hOKfzjlAAReMNAoxLM
	QGnr1z6TikNmilDt7vAzpksv0Y5FCkS4fUTmbBZV1bun7dVVErsM/tVvK02w0VPczrZ2
	YtVg==
X-Gm-Message-State: AMke39n12kZdPf9PnRpKT8vAFEORyCGvuJ6r1u6dlLps5AluSVaGdk67nQsSBgSb8xDSIQ==
X-Received: by 10.84.231.207 with SMTP id g15mr36941406pln.2.1489280525014;
	Sat, 11 Mar 2017 17:02:05 -0800 (PST)
Received: from CACSVMO-14452.local ([2601:646:8882:b8c:cc95:4c5a:d83a:64d2])
	by smtp.gmail.com with ESMTPSA id
	d63sm26001331pfg.132.2017.03.11.17.02.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Mar 2017 17:02:03 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <043bc3e6-5d17-140c-7f74-7d584cfd0639@gmail.com>
Date: Sat, 11 Mar 2017 17:02:02 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>
Subject: Re: [meta-initramfs][PATCH] klibc: add dependency on coreutils-native
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
X-List-Received-Date: Sun, 12 Mar 2017 01:02:04 -0000
X-Groupsio-MsgNum: 65754
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="7Ku3WFefva34Ipc9l9UN6P7TTVvSekl7B"

--7Ku3WFefva34Ipc9l9UN6P7TTVvSekl7B
Content-Type: multipart/mixed; boundary="X6BAAQ23nxLS6MLOxn2padMVjp8pM6xGf";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <043bc3e6-5d17-140c-7f74-7d584cfd0639@gmail.com>
Subject: Re: [oe] [meta-initramfs][PATCH] klibc: add dependency on
 coreutils-native
References: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1489280314-12185-1-git-send-email-andrea.adami@gmail.com>

--X6BAAQ23nxLS6MLOxn2padMVjp8pM6xGf
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 3/11/17 4:58 PM, Andrea Adami wrote:
> As seen doing world builds after the host-tools changes dash needs nl.
>=20
>   GEN     usr/dash/builtins.c
> TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0/git/usr/dash/
> mkbuiltins: 100: TOPDIR/tmp-glibc/work/core2-64-oe-linux/klibc/2.0.4-r0=
/git/
> usr/dash/mkbuiltins: nl: not found
>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
>  meta-initramfs/recipes-devtools/klibc/klibc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-initramfs/recipes-devtools/klibc/klibc.inc b/meta-ini=
tramfs/recipes-devtools/klibc/klibc.inc
> index f00e31a..bd0ab61 100644
> --- a/meta-initramfs/recipes-devtools/klibc/klibc.inc
> +++ b/meta-initramfs/recipes-devtools/klibc/klibc.inc
> @@ -4,7 +4,7 @@ minimal entaglement, and portability, not speed."
>  SECTION =3D "libs"
>  LICENSE =3D "BSD-3-Clause & GPL-2.0 & MIT & Zlib"
>  LIC_FILES_CHKSUM =3D "file://usr/klibc/LICENSE;md5=3Dd75181f10e998c21e=
b147f6d2e43ce8b"
> -DEPENDS =3D "linux-libc-headers perl-native"
> +DEPENDS =3D "linux-libc-headers perl-native coreutils-native"

Nothing particular against this patch but, if we are getting down to
building own versions of coreutils, that means we are pretty much
generating a build distro almost, I wonder if we can have sanitized
distros where we can trust them to assume some of these provides.

>  SRCREV =3D "4d19974d7020488f63651244e1f9f51727c3f66c"
> =20
>  SRC_URI =3D "git://git.kernel.org/pub/scm/libs/klibc/klibc.git"
>=20


--X6BAAQ23nxLS6MLOxn2padMVjp8pM6xGf--

--7Ku3WFefva34Ipc9l9UN6P7TTVvSekl7B
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAljEngoACgkQuwUzVZGdMxRgtACbBrWP86QSk8WHt9VUYeChIB7D
QXIAnR+pJ7NHJYvo7NTsmARClTfObbDG
=8ZcW
-----END PGP SIGNATURE-----

--7Ku3WFefva34Ipc9l9UN6P7TTVvSekl7B--
