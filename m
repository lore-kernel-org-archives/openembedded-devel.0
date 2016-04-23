Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id BE6B8731D9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2016 01:22:43 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id zm5so44492452pac.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Apr 2016 18:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=KiYZH0t+SfiZmUAcbM+1D556/p4DCgU6WfLNvbZfkCc=;
	b=Qd8nphFLrYRYrOM5WrFLJsDr/Anf7ZyQ+YEp4SXQJkqhsH5ytdix6iIq2iqd1xATE/
	4c7i1Sugnp+ogS+4gzPN0cufuW2+74Tw5DZGCCD6Ggt9YfNht0kkYK/HrEpPCNGXgLJV
	8UbUKlpJ/H32FYtfm1ww2jPtSdIJuXgeTTqgppwr7w01JetykGw6qQIfCyboc4PKJP98
	mkSOopHVxr/7F7yf0rA0x08RZRv5bXLPrD6nVhymOlTm/Sv/2pi0w86KG1nUMholuhmf
	VyG9V0EHWdoz0W6Kjn9cR2fEFWXsYLKL3x5qDtFKXLqZ9TrQhg6AEfdM8GmK3F5BoJTY
	5bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=KiYZH0t+SfiZmUAcbM+1D556/p4DCgU6WfLNvbZfkCc=;
	b=ZorxcPAX0Hl3DK9pfjbyl7iKXswHwsHzcgEZ9GlUAk5TX+qrjskYdv6PeHd27ynJBd
	KoxVuTIDb0pJQKBjKjmcu3HiOkSG2YZ+GKH58JIRdZ1Dr8gI/Y+2PlX5h0M346KYlUFY
	I2AUoNbuSY/NIpxU4V3t0HUn3vgMMWM4vvEe2qfucvnfaFVxUpUYhEWitG1vrDiwuz2l
	lAfPt8bSwmCzC2j3ArijUNxYmGU025GvFNmu69uT8VAprCFcsA4+Q6rtIF8Ry5VgZyFB
	g7LAC/qhmQwxjq/FJbKtl4a2s8tUX0vkNF6dgDCs6+/0qUSF4RBPYTKAeVcbRUZS0aOO
	I8Yg==
X-Gm-Message-State: AOPr4FUIshFC4DX1A8XySZoJs5HXmw2C4IXZfoUfW11CwLFwgIlXqd1OT5mfLaLEanl+8w==
X-Received: by 10.66.67.11 with SMTP id j11mr32904082pat.45.1461374563949;
	Fri, 22 Apr 2016 18:22:43 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:a061:e2e8:8aca:7170?
	([2601:646:8800:5a9a:a061:e2e8:8aca:7170])
	by smtp.gmail.com with ESMTPSA id
	m184sm11026248pfb.22.2016.04.22.18.22.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 22 Apr 2016 18:22:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAMZfsd6f7-s4pVyiNPs2sVmi+EC6yMyjCJeYTPobm0f6ffE2_w@mail.gmail.com>
Date: Fri, 22 Apr 2016 18:22:37 -0700
Message-Id: <AF020D52-486E-40B4-BE5D-5F4CAB2E9130@gmail.com>
References: <CAMZfsd6f7-s4pVyiNPs2sVmi+EC6yMyjCJeYTPobm0f6ffE2_w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Cc: Yocto Project <yocto@yoctoproject.org>
Subject: Re: [meta-qt5] EGL Error : Could not create the egl surface: error = 0x300b
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
X-List-Received-Date: Sat, 23 Apr 2016 01:22:43 -0000
X-Groupsio-MsgNum: 61136
Content-Type: multipart/signed;
	boundary="Apple-Mail=_58A7AEB8-D5E1-43A3-B787-471AB0926DF7";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_58A7AEB8-D5E1-43A3-B787-471AB0926DF7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Apr 22, 2016, at 6:07 PM, Ryan Elkholy, PhD, PE =
<ryanelkholy@gmail.com> wrote:
>=20
> Hello,
>=20
> I am am trying to make a build that includes meta-qt5 without x11 or
> wayland on the Minnowboard Turbot (x86-64). I was successful in =
building my
> image but the problem occurred when testing my basic qt app on the =
image.
> When trying to run the app I get the following error:
>=20
> EGL Error : Could not create the egl surface: error =3D 0x300


Do you have =E2=80=98directfb=E2=80=99 in DISTRO_FEATURES
>=20
> I have been trying to find a solution for this for weeks with no luck. =
I am
> able tu run my application when including x11, but I am trying to =
avoid it.
> Does anyone know any solution for this? Any insight will be helpful =
because
> I have been stumped for weeks. If nobody knows of a solution is it =
possible
> to dig deeper into this error and see what is causing it? If so, how?
>=20
> Thanks
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_58A7AEB8-D5E1-43A3-B787-471AB0926DF7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcazmAACgkQuwUzVZGdMxR1zgCeIYqdNX9neh7jLhxeV9I0wyOH
NFMAnAtMWhl2G4msVO1w+vP9peAfI/77
=dTZ9
-----END PGP SIGNATURE-----

--Apple-Mail=_58A7AEB8-D5E1-43A3-B787-471AB0926DF7--
