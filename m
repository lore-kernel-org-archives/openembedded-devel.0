Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 30E9760290
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 17:56:53 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id s8so40823575pfj.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Oct 2016 10:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=JwjAvQ7h7AsYrJML883AunOs0licAF77mNa/fd/+P/M=;
	b=OfVY01K49VUwUIBO8gwAlyWEUTWbhvM/MVAH0eWZZ4+YydlMQ+obNDUTtlylXjlNIQ
	ELe6nv6EDlQie368/KOhnJeJ/7EdLeefNU8tQ6pD9sl7V+XFzF17t7cJPhkE45eiY03S
	2SbzpxXvFd7OD9OxqbJeX9bWeGiJ8ndzoIMs1SzGQeLJVANC3G+pPdEjXze1JkJsxD6e
	UvhNi46owFqtx/52WHiCZ7WJ5jLAFO+Tn7tYnWIuRdLKMRP1FwtAJHa3YI2eNBYPLe6g
	ySSb/cweveI+em808+M3VZjJwd/dHFhxkCfn6SSTX0c95hDYFStDanaKcS4wObspUucQ
	eV+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=JwjAvQ7h7AsYrJML883AunOs0licAF77mNa/fd/+P/M=;
	b=CEf8TAehLZWCjq9iyYNqaLTk9dV27jZkFXVXSsODvowYTTZdIbvRAuyuDL+MEE9/sH
	EiT+C24M+X2u46yFZmVn7F0f7kWrDAFQMp9us16354QFhJRtfVnbaWEL4eZeLiPfODu8
	07DsHYnR0KBRUGWW3zFLoN7FaZqsds4CY18lspAz4/nUNHdLWmwKiOTzqfzyBRMiblbG
	VdQiGSEys0+mwUSMuO4JIa/pPaLsfgDx7SKmtvr5WLc1Q1LnE4mapUsTKXLshFifiGsK
	nEx+FSXojyc//o8ptiuGa2RXeP4J6iBhybsD//Iz2v0vj0hgc5cscTSHmJcA/6Oq/n48
	sN+g==
X-Gm-Message-State: ABUngvf+gzxi20px4PPNuicb94kO88Qdjy2dDmiy9UI9DrJU0HI1L2qtAMF2z70FfW+1zw==
X-Received: by 10.98.71.215 with SMTP id p84mr26952357pfi.59.1477677415031;
	Fri, 28 Oct 2016 10:56:55 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:3551:a82d:200e:cc39?
	([2601:646:8882:b8c:3551:a82d:200e:cc39])
	by smtp.gmail.com with ESMTPSA id
	p62sm20368597pfb.42.2016.10.28.10.56.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 28 Oct 2016 10:56:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <fab9e87e-d2b6-414c-c3fc-eb8652657e63@3mdeb.com>
Date: Fri, 28 Oct 2016 10:56:53 -0700
Message-Id: <E96491BB-46C3-4375-AFF3-33C4113784AB@gmail.com>
References: <fab9e87e-d2b6-414c-c3fc-eb8652657e63@3mdeb.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-browser] i.MX6DL + mainline + yocto: EGL_NOT_INITIALIZED
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
X-List-Received-Date: Fri, 28 Oct 2016 17:56:54 -0000
X-Groupsio-MsgNum: 63637
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0E97B323-483D-4492-BDDA-E569283359ED";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0E97B323-483D-4492-BDDA-E569283359ED
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 27, 2016, at 11:59 PM, Maciej Pijanowski =
<maciej.pijanowski@3mdeb.com> wrote:
>=20
> Hello,
>=20
> I'm trying to run chromium on Hummingboard i2 using custom BSP layer. =
I'm
> mostly based on meta-etnaviv (libdrm, mesa_etnaviv) for GPU support =
and
> meta-browser for chromium recipe. I'm using mainline 4.7.10 kernel =
atm.
>=20
> I have hw accelerated video decoding with gstreamer and coda. Mesa =
demos (glxgears) as
> well as qt examples (meta-qt5) run smoothly on X11, without engaging =
CPU too much.
>=20
> part of glxinfo output: (full at: http://pastebin.com/qS7zEZxA)
>=20
> OpenGL renderer string: Gallium 0.4 on /dev/dri/card1-Vivante GC880 =
rev 5106
> OpenGL version string: 1.4 Mesa 12.0.0-rc3 (git-e1ac825bd067)
> OpenGL ES profile version string: OpenGL ES 2.0 Mesa 12.0.0-rc3 =
(git-e1ac825bd067)
>=20
> I've tried compiling chromium 48.0.2548.0 and 52.0.2743.76 and they =
both fail to run GPU process.
> Logs presented below.
> chrome://gpu photos in attachments
>=20
> chromium 48: http://pastebin.com/1qhvvLKh
> chromium 52: http://pastebin.com/dMK3PgH7
>=20
> Do you have any idea what may be the cause of this fail? Are there any =
chromium-specific actions that need to be done in order to properly =
initialize GPU ? Or maybe you have some experience with chromium on =
i.MX6 (not legacy kernel) ?
> =E2=80=94

you might look into
https://github.com/Freescale/chromium-imx

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_0E97B323-483D-4492-BDDA-E569283359ED
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgTkWUACgkQuwUzVZGdMxQj1QCeMbKNHbzuXvTXuK81GDMtwMRk
lYQAnisKeJx0zRXS5+1az/zOH8JgNLh2
=m2qb
-----END PGP SIGNATURE-----

--Apple-Mail=_0E97B323-483D-4492-BDDA-E569283359ED--
