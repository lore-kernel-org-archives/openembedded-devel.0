Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F2DD6E667
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 16:07:38 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h186so5688679pfg.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2016 09:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=uwdXIgJmuHD8KgFPNfIxCZIH0JNAPXy7UWSd0BvtPKo=;
	b=DNq1NfcGLA298iFbsh7dP5R59wnysea/hhX0lM0lbxqhLuly5qnZfVdh8J/bnLl7Di
	n3WO6X31vfzaUdWE1jBMhMHz+jsdZRg6AW6AT3Q/dk/+bvpNkLojEBjEaZrHMl8cT6hU
	B5jpUBrBAhv1cPMij81bd8phGaABHDKrQDtimRe+oSZq9N/bnq1lCw1UuQnNIzOj5sZt
	pZpYWegNdpiakPmivO86XYApBoP4finqkJTSmNMnNCCj45SvOSMJwHI1sTGvPnYnsIl+
	Nz8hgDPHPNhUxU5KNSoEaJ2nNK5sv25hv2i4Xw1p83LSxKNu/L15zro7+Ax6rI7KLH/I
	C9JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=uwdXIgJmuHD8KgFPNfIxCZIH0JNAPXy7UWSd0BvtPKo=;
	b=O9cghdAAhTF95LECXLLjuG5Bfn3x+x2dSVT4rIpeiLhUb2GJMb++t//SewgDzaxCMw
	NtwxlQu2QjPfcQ9fZq4+ZGfcB1yMuQyfvzBeYVD1t/yMHUH8t7eU+d48ZgjWTsbcM0Zl
	VencT+RHt1iBxvhH7BBpYG+xKR+FuCTZRWGBhJf0Fjt6vgizxx4WA/rF+0+uCXL/+nEU
	HvZDCzdiSzaMNumKtwlhw58orHuq33GcNiT6dbSgaZQNMc/Lte4rAtIEhC/LJhQOrYoK
	GG/qmnexjjDQ59C8y6VP95R6UOLEQZ4TTEA+XdAAIXAsRa+TNfdt1Mek+HgUUxLsgqBX
	9egw==
X-Gm-Message-State: AEkooutHSCWNravtF1kNRPa6vYuz+IDrs4+uY5HCCyuqUjKpzfOV5Fn4oYKfyXUZpfH5Tg==
X-Received: by 10.98.32.138 with SMTP id m10mr65739128pfj.146.1471363659329;
	Tue, 16 Aug 2016 09:07:39 -0700 (PDT)
Received: from ?IPv6:2601:647:4c00:3edf:8111:5203:81eb:cf56?
	([2601:647:4c00:3edf:8111:5203:81eb:cf56])
	by smtp.gmail.com with ESMTPSA id
	g21sm40384250pfj.88.2016.08.16.09.07.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 16 Aug 2016 09:07:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <fa2fc853-b871-1ad1-a1cc-408fed9967bf@smile.fr>
Date: Tue, 16 Aug 2016 09:07:33 -0700
Message-Id: <8C2AB8DB-2C87-4D7A-9762-5F9720E56397@gmail.com>
References: <1471343516-6946-1-git-send-email-jeremy.rosen@smile.fr>
	<CAJTo0LYKYph9e_JaLVbFbByCCwk9a2zmHVLAMEoed7h5rGeArQ@mail.gmail.com>
	<fa2fc853-b871-1ad1-a1cc-408fed9967bf@smile.fr>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH] [jethro] fix gcc-cross when BUILD_* are set
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
X-List-Received-Date: Tue, 16 Aug 2016 16:07:39 -0000
X-Groupsio-MsgNum: 62671
Content-Type: multipart/signed;
	boundary="Apple-Mail=_23C1B093-1325-4AF7-B798-AC217BFC49DB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_23C1B093-1325-4AF7-B798-AC217BFC49DB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 16, 2016, at 6:13 AM, J=C3=A9r=C3=A9my Rosen =
<jeremy.rosen@smile.fr> wrote:
>=20
>=20
>=20
> On 16/08/2016 12:40, Burton, Ross wrote:
>> On 16 August 2016 at 11:31, J=C3=A9r=C3=A9my Rosen =
<jeremy.rosen@smile.fr> wrote:
>>=20
>>> When building with a compiler which is not gcc the gcc-croos will =
still
>>> use the $CC and $CXX variables
>>>=20
>>> These variables are not set properly to BUILD_CC and BUILD_CXX by =
the
>>> recipe.
>>>=20
>>> This is problematic now for jethro because gcc-6 is the default =
compiler
>>> for some distros (debian testing) which can't build jethro anymore
>>>=20
>> Needs to go to openembedded-core@, and needs to be for/tested with =
master
>> before hitting the stable branches.
> I'll try, but testing on master is tricky.
> Master build correctly with gcc-6 and doesn't trigger the bug. i'll =
try to trick my debian to trigger the bug=E2=80=A6

may be a centos6 VM ?

>=20
>> Ross
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_23C1B093-1325-4AF7-B798-AC217BFC49DB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlezOkoACgkQuwUzVZGdMxRTuwCeMplftOQpodpOLmZBRkT63NoS
DeIAn0ANYb5hQkkTNMtEPf1hLpPDGFCZ
=ZntU
-----END PGP SIGNATURE-----

--Apple-Mail=_23C1B093-1325-4AF7-B798-AC217BFC49DB--
