Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1EB136093A
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Oct 2016 15:14:47 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id t25so3004990pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Oct 2016 08:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=hwCuCipfj0LNDCDpbAvmYGLFJDf2thelXZhJIYMyFZw=;
	b=adcKQmby43P0CHqvzzINYfklMgaTxrvW9dPlAP8rJrwN5NKryshD//kzqkLabj7yWM
	v3bR9XK0Zy1MlUQJs1CTWXJ1eLqXAPfKsCak4Cnz34Z5RCNB/C7T6uqpHKzLoDp3mc6u
	FVgUhKk/0Ihc9YWv4lxPj0ZikoheZoQJuk4RYXl8awmom/4lrKc0Cyux/F47jlDBMjTW
	63QHRXf0DuE2PHfweNJxnhM+RLCNPW8+6UnjzR2oimiVeQcrkQmH6pb5L4eb61fp27zf
	dpRd1ehz0wJgpNQFuZ7K6jsaw3j4bp45iGKDeI1QywOVNRpMam5+rYoaNsOYtN5AhEV/
	odBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=hwCuCipfj0LNDCDpbAvmYGLFJDf2thelXZhJIYMyFZw=;
	b=UQNJAU05IanUIrYjnqAygUjVZeTZeI1e6fIDDIKDVsKSDDQCOU+eNaPi5XUjG/PPxZ
	1VeE+dbKErnC9BGCyR0kC8FyKcwxNT+C6Q24EUcIK3MHi8EFYeLY1JaaNk9IwxHm4iIX
	OHQmpFR8iXmiZPhMQ/GPW37iIFrLTwF+N4cLPidWIX9iKlqRDV/R9N3E4Xth76PocRPr
	1l5zhKa3k1I28nALUZ95Vxg5wVsLtTmotMWN3AG3nsArzcZ2Y31HVfTP9XDVQiP1kjc3
	2j2AVuZWI2HWYb7eNhjjdDjjpa8NYjt3AYcpOuIbXUw8c6rLnez8EeqqveyQtKGsfwpX
	hvuw==
X-Gm-Message-State: AA6/9RlbmdgjEIKggfvEHdcA1MuLWwM69sFny0EuYKVT+c87JyL5LLpQ0oBkanUzho359w==
X-Received: by 10.98.135.134 with SMTP id i128mr19026443pfe.178.1475853289215; 
	Fri, 07 Oct 2016 08:14:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:cd9d:6261:adca:4b85?
	([2601:646:8882:b8c:cd9d:6261:adca:4b85])
	by smtp.gmail.com with ESMTPSA id
	p26sm14775056pfj.80.2016.10.07.08.14.48
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Oct 2016 08:14:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1475831964-1993-2-git-send-email-schnitzeltony@googlemail.com>
Date: Fri, 7 Oct 2016 08:14:46 -0700
Message-Id: <E5E0F819-27C7-4FFD-9639-39BF2B9BE459@gmail.com>
References: <1475831964-1993-1-git-send-email-schnitzeltony@googlemail.com>
	<1475831964-1993-2-git-send-email-schnitzeltony@googlemail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 2/5] jack: remove portaudio PACKAGECONFIG
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
X-List-Received-Date: Fri, 07 Oct 2016 15:14:49 -0000
X-Groupsio-MsgNum: 63413
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F7825B36-C879-45D3-8DD2-F91E13D8B8B1";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F7825B36-C879-45D3-8DD2-F91E13D8B8B1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 7, 2016, at 2:19 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> portaudio backend is only available for windows builds - see README =
(and if set
> it would cause a cyclic dependency with portaudio's jack =
PACKAGECONFIG)

should be unconditionally keep =E2=80=94portaudio=3Dno ?

>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
> meta-oe/recipes-multimedia/jack/jack_git.bb | 1 -
> 1 file changed, 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-multimedia/jack/jack_git.bb =
b/meta-oe/recipes-multimedia/jack/jack_git.bb
> index 34615b4..06e0322 100644
> --- a/meta-oe/recipes-multimedia/jack/jack_git.bb
> +++ b/meta-oe/recipes-multimedia/jack/jack_git.bb
> @@ -23,7 +23,6 @@ inherit waf pkgconfig
>=20
> PACKAGECONFIG ??=3D "alsa"
> PACKAGECONFIG[alsa] =3D "--alsa=3Dyes,alsa=3Dno,alsa-lib"
> -PACKAGECONFIG[portaudio] =3D =
"--portaudio=3Dyes,--portaudio=3Dno,portaudio"
>=20
> PACKAGES =3D+ "libjack jack-server jack-utils"
>=20
> --
> 2.7.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_F7825B36-C879-45D3-8DD2-F91E13D8B8B1
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlf3u+YACgkQuwUzVZGdMxSMvgCfbpFY26C2jJBTXNCCIcZwa/w8
fpEAn11sxf7N1DV/1JcoQSr4csiYfe2+
=BMS7
-----END PGP SIGNATURE-----

--Apple-Mail=_F7825B36-C879-45D3-8DD2-F91E13D8B8B1--
