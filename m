Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id E8B2F6FEF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 15:44:08 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 66so6470260pfy.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2016 08:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=R1SIJAHZk8AM5GOmRICQk5gCUzdASM5Vsa7IydINCJM=;
	b=AKQQuSE30vfOnw2z4Okon8HVWLxkxRtSXA8Fp6kO3K425JHKXj1CjSWXut7r/cpE5u
	ScMizLOf+SuvrMf4kO6XyXAlyfa9lZfqqLvz0LXrRckwJiCgk3GKGblkKDITgBIXQ3d8
	V/XhckEj1VIVFOXw0JeDok8VLmcwbRBtr5oZiTbtSDn+1ejd41dA2VbpHXgM4LjHaaB4
	za1eYZxorBFde/4T+ZdeW9gLC0Bgyxz3y1tLKfn1Rd/hdXDLA9UnVeevoRgKbKiYJAym
	Wq/COKHmRQgEZ0wea0Tnn3+EZhT1jPCHFHPdapQplQ0xUpSOVkyHgVB8mCiWUMSsSFAq
	h+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=R1SIJAHZk8AM5GOmRICQk5gCUzdASM5Vsa7IydINCJM=;
	b=WhQUbwmlN0ZV13+L5zNkeoSfAAYxyGzsfnvMUchzJx3nKMUyiNL4U/xtas0WvpmwVC
	ibntarZqUAX5a1WZnieCBE3Qyzw5/JNuL5jvoIR2rmF4c8FCRqu9Fs0Mi6AHMPeiWdCi
	AG7k5S26kShpex89HSVSgkNcGe+oAl3jRr0Zhzq+/NmEOnPWdqEr16S2uTQq/hyGNsjf
	MJGmVEKDnzFjDp6hl8E5gD+RtlD/K11WDB2ZK2LrECoRRieHdLkzQFK9T7D2VwckBeAZ
	+XnH2WnCPosZIwwDpVVxrfhF34rfB44smchN/hgyZmMjB9mqyt0PtrKJ1Nbk3WhVSa9l
	TCHg==
X-Gm-Message-State: ALyK8tKnf0G8hOvXaLwWeFqZyeNFxDIMtDk+qqS3fFzJ+JCyYjNG8HoQwaucwIbp/1o3pA==
X-Received: by 10.98.54.198 with SMTP id d189mr3076580pfa.39.1466178248888;
	Fri, 17 Jun 2016 08:44:08 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ql1sm69449184pac.2.2016.06.17.08.44.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2016 08:44:07 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CADNbA1o+aK2tr=1jHwJ21Szk28vWZMVNM4mXGCkebJHaZbYHCA@mail.gmail.com>
Date: Fri, 17 Jun 2016 08:44:06 -0700
Message-Id: <7B3B5092-EF7E-45D2-84E7-37E6AB73D57A@gmail.com>
References: <1465435705-3794-1-git-send-email-derek@asterius.io>
	<E49AE6D7-2850-4C61-B163-F39F26CF732A@gmail.com>
	<CADNbA1o+aK2tr=1jHwJ21Szk28vWZMVNM4mXGCkebJHaZbYHCA@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Mailer: Apple Mail (2.3124)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] geis: add CFLAG to ignore misleading indentations
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
X-List-Received-Date: Fri, 17 Jun 2016 15:44:09 -0000
X-Groupsio-MsgNum: 61868
Content-Type: multipart/signed;
	boundary="Apple-Mail=_924DECFC-7BD7-448E-9570-3BAFFE7DEE53";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_924DECFC-7BD7-448E-9570-3BAFFE7DEE53
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 17, 2016, at 6:38 AM, Derek Straka <derek@asterius.io> wrote:
>=20
> It didn't seem worthwhile to create a patchset to fix whitespace =
issues.  I can create the patches if people prefer that to suppressing =
the error.

Usually yes for OE it doesn't matter, however upstream of these =
components will prefer it, and would be good fix once for all and submit =
it to upstream
directly

>=20
> -Derek
>=20
> On Fri, Jun 17, 2016 at 12:17 AM, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
>=20
> > On Jun 8, 2016, at 6:28 PM, Derek Straka <derek@asterius.io =
<mailto:derek@asterius.io>> wrote:
> >
> > Signed-off-by: Derek Straka <derek@asterius.io =
<mailto:derek@asterius.io>>
> > ---
> > meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
<http://geis_2.2.17.bb/> | 2 ++
> > 1 file changed, 2 insertions(+)
> >
> > diff --git =
a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
<http://geis_2.2.17.bb/> =
b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
<http://geis_2.2.17.bb/>
> > index bc88143..9b087a8 100644
> > --- a/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
<http://geis_2.2.17.bb/>
> > +++ b/meta-oe/recipes-support/canonical-multitouch/geis_2.2.17.bb =
<http://geis_2.2.17.bb/>
> > @@ -24,6 +24,8 @@ SRC_URI[md5sum] =3D =
"2ff9d76a3ea5794516bb02c9d1924faf"
> > SRC_URI[sha256sum] =3D =
"8a60f5683852094038904e690d23cc5a90a980fc52da67f0f28890baa25c70eb"
> >
> > EXTRA_OECONF =3D "--disable-integration-tests"
> > +TARGET_CFLAGS +=3D "-Wno-error=3Dmisleading-indentation=E2=80=9D
>=20
> why not fix the code
>=20
> > +
>=20
> >
> > FILES_${PN}-bin =3D "${bindir}"
> > RDEPENDS_${PN}-bin =3D " \
> > --
> > 1.9.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org =
<mailto:Openembedded-devel@lists.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel =
<http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>=20
>=20


--Apple-Mail=_924DECFC-7BD7-448E-9570-3BAFFE7DEE53
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldkGsYACgkQuwUzVZGdMxQdmACeMjXx8kB8EenGm/K8UKaOxoXa
mOAAmgKO+4zzq6xsEOcIKS91tFq6g/xn
=4mii
-----END PGP SIGNATURE-----

--Apple-Mail=_924DECFC-7BD7-448E-9570-3BAFFE7DEE53--
