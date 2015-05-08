Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 8011B73F85
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 May 2015 02:19:08 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so57513764pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 May 2015 19:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=uJEcWwBBspSlu1kab9+u0+ktSuDJZdlB29h/K4usdLc=;
	b=L0VXV1LPCHZebp34gwe5cKz8g1fiyvnOwwaeSNJPeOlszpQSiPYKMVBN0xWzN/Hfnq
	K9875n6wFWfEX0xpcxosbI8cp7HVTzuHWT2RdTb+X/Ve/5On3kO9aAZePH+a7nSYfmaj
	/9dp8Ep0kNUqnFXaQyjYiWmqGuWILnkX5u5M4AHQ7T+2Izty6Mfkn49Fms00497ZFb+H
	vYIAz1BxHzrNpB9iSzkCmlOFJvUsVAuP3DOkkKZUPQp/CjL+HSg0lJUGx+TygvWbnKkl
	Kk2GTVx5hEM9ieoAA6IYU4W6FaLxT12ZZJSjzibWH5YkEwODA4zovIeX2caoV6DUZo2L
	1e+A==
X-Received: by 10.70.138.8 with SMTP id qm8mr2654069pdb.96.1431051549787;
	Thu, 07 May 2015 19:19:09 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:6d9c:46fd:9111:cff8?
	([2601:9:3580:84c:6d9c:46fd:9111:cff8])
	by mx.google.com with ESMTPSA id q4sm3423753pdo.42.2015.05.07.19.19.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 May 2015 19:19:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1430382588-11298-1-git-send-email-b40290@freescale.com>
Date: Thu, 7 May 2015 19:19:01 -0700
Message-Id: <9E717424-BA4E-4597-A8A6-DFB38A731D3F@gmail.com>
References: <1430382588-11298-1-git-send-email-b40290@freescale.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Subject: Re: [meta-browser][PATCH] firefox_10.0.11esr: ${PN} usage in SRC_URI Should use ${BPN} instead to avoid breaking multilib
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
X-List-Received-Date: Fri, 08 May 2015 02:19:09 -0000
X-Groupsio-MsgNum: 55376
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A194C763-751E-4E13-916B-25922AF63846";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A194C763-751E-4E13-916B-25922AF63846
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Apr 30, 2015, at 1:29 AM, B40290@freescale.com wrote:
>=20
> From: Chunrong Guo <B40290@freescale.com>
>=20
>    fix the following warning:
>    |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry =
mozilla-lib32-firefox.png: file could not be found
>    |WARNING: Unable to get checksum for lib32-firefox SRC_URI entry =
mozilla-lib32-firefox.desktop: file could not be found
>=20

Looks good to me.

> Signed-off-by: Chunrong Guo <B40290@freescale.com>
> ---
> recipes-mozilla/firefox/firefox_10.0.11esr.bb | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/recipes-mozilla/firefox/firefox_10.0.11esr.bb =
b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
> index cd303ff..f89da58 100644
> --- a/recipes-mozilla/firefox/firefox_10.0.11esr.bb
> +++ b/recipes-mozilla/firefox/firefox_10.0.11esr.bb
> @@ -8,8 +8,8 @@ LICENSE =3D "MPLv1 | GPLv2+ | LGPLv2.1+"
> LIC_FILES_CHKSUM =3D =
"file://toolkit/content/license.html;endline=3D39;md5=3D9cb02f27e77e702043=
b827c9418bfbf8"
>=20
> SRC_URI =3D =
"ftp://ftp.mozilla.org/pub/mozilla.org/firefox/releases/${PV}/source/firef=
ox-${PV}.source.tar.bz2;name=3Darchive \
> -           file://mozilla-${PN}.png \
> -           file://mozilla-${PN}.desktop \
> +           file://mozilla-${BPN}.png \
> +           file://mozilla-${BPN}.desktop \
>            =
file://fixes/Allow-.js-preference-files-to-set-locked-prefs-with-.patch =
\
>            =
file://fixes/Avoid-spurious-Run-items-in-application-handlers-con.patch =
\
>            =
file://fixes/Properly-launch-applications-set-in-HOME-.mailcap.patch \
> --
> 1.9.2
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_A194C763-751E-4E13-916B-25922AF63846
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVMHRwACgkQuwUzVZGdMxSGqwCdGY0Fu5A8e9/OGDLHX0+vTN4b
FMYAn3SAgWpj3mDE5xyncS8WcjXmhFvF
=fh42
-----END PGP SIGNATURE-----

--Apple-Mail=_A194C763-751E-4E13-916B-25922AF63846--
