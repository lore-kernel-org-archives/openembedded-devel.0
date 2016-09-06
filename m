Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id B58F97756F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Sep 2016 18:28:55 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id gi6so1550741pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Sep 2016 11:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=K81uFRRLcgtEFW3ksMzQ1o423fZoKdkQKqcA/F44Yp4=;
	b=Udhh8dIxnJJGapSHm0raflCwfhfb0bHONlFlTkDRu7MsHg3AXNGN3vrWejfivL89wt
	c3yRM+TGa08CBHvTcKQkKvILDipSC+0P7BlEH7Q+yjVaYlv0fPOxM6xgCp+/r4EFbNPQ
	Z9PwJEjXroSUWAkBDLC+UpBCROVAW2MOMNm0cIGm3M6ICBi1QkublGvIadwEC29ZyZfv
	LkMYH28oMJ0Zay+I49qnAGdWxWNDaJ1pPHEzCbZ/nrOKM9iVHWf9lfVn+5KbwZFRXkus
	zhysANG2SaCP7rk+5+aLkF2pGsdEPiU7Cdk79ocz806ClsIUg2NlmmvBPMDdIjl+B3AD
	86+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=K81uFRRLcgtEFW3ksMzQ1o423fZoKdkQKqcA/F44Yp4=;
	b=WHL1vNYq8v8425ZCi3tGfYAuS1lLl8Tx/YotuNs0EgHgKL8VP3HxahuJE42bLozXtD
	MgmlmoSIXyQm8atxdRAwp0/FPJt6DXn9f2xZLUw/USNWTad6n3l2NczAidLoEzWFEcME
	IXdDCG5pPtEopS7QFRn0pFSOziYrmzmrjLRzneKDZ7XU2fGs9m/6HOfnw6vU3Be7/EaM
	pFdOq6IAsdK9yAosaLEzY6l59h8TWk+yhF/1dvxyt0ncNL30PvET6jKX8rkbF3dW33Sv
	b9ZAMdm7u+aUauH+W4i2+TxFMpMlFI5pC/+voh/eA0DuHC6CGRpSt2AoJFrbuCBNBrKG
	4Yjg==
X-Gm-Message-State: AE9vXwNfUPxOrdMeV/IKPL93s7Iy76qt8Av4YqaFUEyOEGqpaHMNhoJ3ZRYJJ8VJ1+Vuig==
X-Received: by 10.66.85.196 with SMTP id j4mr7091955paz.40.1473186535968;
	Tue, 06 Sep 2016 11:28:55 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:99d4:c55f:fbd3:66fa?
	([2601:647:4c00:3edf:99d4:c55f:fbd3:66fa])
	by smtp.gmail.com with ESMTPSA id 7sm42737785pfk.6.2016.09.06.11.28.55
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Sep 2016 11:28:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
Date: Tue, 6 Sep 2016 11:28:58 -0700
Message-Id: <294CDBE1-7350-4CDB-90C0-6E5110BF2466@gmail.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
	<1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 5/5] samba: fix build by linking with bfd instead of gold
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
X-List-Received-Date: Tue, 06 Sep 2016 18:28:56 -0000
X-Groupsio-MsgNum: 62985
Content-Type: multipart/signed;
	boundary="Apple-Mail=_351E0B6A-AC63-47A7-A2AE-F1F85B6C81BC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_351E0B6A-AC63-47A7-A2AE-F1F85B6C81BC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 4, 2016, at 1:15 PM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> Use this workaround as long as there is no better (upstream) fix
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
> meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb =
b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> index e35d527..3205c5d 100644
> --- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> +++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> @@ -88,7 +88,7 @@ EXTRA_OECONF +=3D "--enable-fhs \
>                 "
> DISABLE_STATIC =3D ""
>=20
> -LDFLAGS +=3D "-Wl,-z,relro,-z,now"
> +LDFLAGS +=3D "-Wl,-z,relro,-z,now =
${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=3Dbfd =
', '', d)}=E2=80=9D

what is the original problem ?


>=20
> do_install_append() {
>     if ${@bb.utils.contains('PACKAGECONFIG', 'systemd', 'true', =
'false', d)}; then
> --
> 2.5.5
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_351E0B6A-AC63-47A7-A2AE-F1F85B6C81BC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlfPCuoACgkQuwUzVZGdMxSJoQCfXc1bJx8KlK6iVd6PiePVvu6X
ejkAn1gB28+qZfZaQpLV9hxeLP70NetB
=FACI
-----END PGP SIGNATURE-----

--Apple-Mail=_351E0B6A-AC63-47A7-A2AE-F1F85B6C81BC--
