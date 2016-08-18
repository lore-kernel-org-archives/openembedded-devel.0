Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 87EEF731C9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:42:38 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id y134so77813pfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=NSBuF8GBcAsCUnYRps4/pzxNLp70fz9R3bxxllZuzx4=;
	b=NWm1GYZqF5v7y14z97JXC6GuldEgqHuKB2aoVsRclogqwkLz73kDE24gqBKoicijvy
	rei/PLynctCInfz9mzWnhV2x8WZ06ktjSSyybx8buJWi+sCvpoGgBIP+Avft+qDY+hMk
	8gmEc8R0W1osim25p9kjgdXGmA7fB5rLTg3k/a8Q1t153zIgRPVLNPPNlPj/5AUfaMpp
	abdISQkDDE25dlRXGwIZxfvBlfmAF93CRKeeAJDcX9iPnIf4TUEARlgcMMJRa4PddaaZ
	WY9MwmvwdjEPsMrHUKuHSr7BiHsKC4UGKtGBA+kb0yJm6Nlyqw0zTciJYpVndSjAWMlj
	8BIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=NSBuF8GBcAsCUnYRps4/pzxNLp70fz9R3bxxllZuzx4=;
	b=K1Dcs0PDpAbf0fM7Dg1ARWMiKY22slRRAECmxnO+5DjKcrWn9zOZ1Dn60jpgvIjVU3
	SWtdfWhXrpWUVDkelSnLK3KwrP1f7HmdezNvuNXliWhUzNqdNBcReS2MiXKAEWCmiIi0
	3zGodqeZhEx5FC7pSiByVMU84fK0A/tjch9CxfM3MtymoelihXMPt5PIelBcD9dvrdmQ
	AEgVgPX1jNGJ/Y1adoJEhSHJ9d0Afdf1/GUEW7wOPQiWOW9B/gBED6sH5ykKN40/GqY6
	Ddv84H8U1mVWV73qfUplTPDjMjQI/fvQj7WgdV+A6X7+mxWVUkzqLBLNvh2+/KME+i1c
	6upA==
X-Gm-Message-State: AEkooutD2BAJIh1kN9Y+UjfyzsxNHVjTiZ0BinkeVvLZzsUyIO6jEjwpIEJc3IkSwwzH5Q==
X-Received: by 10.98.152.129 with SMTP id d1mr6230506pfk.126.1471542158872;
	Thu, 18 Aug 2016 10:42:38 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:e111:2047:280c:be38?
	([2601:647:4c00:3edf:e111:2047:280c:be38])
	by smtp.gmail.com with ESMTPSA id
	ad15sm5259338pac.33.2016.08.18.10.42.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 18 Aug 2016 10:42:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471525556-47918-1-git-send-email-fahad_usman@mentor.com>
Date: Thu, 18 Aug 2016 10:42:37 -0700
Message-Id: <114FD618-198C-43A4-BD65-30170BCE0965@gmail.com>
References: <1471525556-47918-1-git-send-email-fahad_usman@mentor.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH] testfloat: Fix No GNU_HASH in the elf binary warnings
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
X-List-Received-Date: Thu, 18 Aug 2016 17:42:38 -0000
X-Groupsio-MsgNum: 62728
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9E368F6F-9AFA-47AC-9390-DDDE5DCD3622";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9E368F6F-9AFA-47AC-9390-DDDE5DCD3622
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 18, 2016, at 6:05 AM, Fahad Usman <fahad_usman@mentor.com> =
wrote:
>=20
> These warnings are observed when testfloat is built with certain
> external toolchains.
>=20
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
> meta-oe/recipes-extended/testfloat/testfloat_3a.bb | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb =
b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
> index 28e9677..bb6e2ae 100644
> --- a/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
> +++ b/meta-oe/recipes-extended/testfloat/testfloat_3a.bb
> @@ -20,6 +20,8 @@ SRC_URI[SoftFloat.sha256sum] =3D =
"946fd23180559d60eb6683dda1cf8b142f5426dedfefb97b
>=20
> S =3D "${WORKDIR}"
>=20
> +TARGET_CC_ARCH +=3D "${LDFLAGS}=E2=80=9D

it probably is not using LDFLAGS for linking cmline in makefile
I think that will be an upstreamable fix.

> +
> do_compile(){
>     oe_runmake -C SoftFloat-${PV}/build/Linux-Cross-Compile/
>     oe_runmake -C TestFloat-${PV}/build/Linux-Cross-Compile/
> --
> 2.8.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_9E368F6F-9AFA-47AC-9390-DDDE5DCD3622
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle1840ACgkQuwUzVZGdMxRCcwCfbCrqgBnl+VPAl2di9ON3w6fH
ANwAn0z1gel2yo2Nw+3cLHIUlZG53Kpn
=p2P2
-----END PGP SIGNATURE-----

--Apple-Mail=_9E368F6F-9AFA-47AC-9390-DDDE5DCD3622--
