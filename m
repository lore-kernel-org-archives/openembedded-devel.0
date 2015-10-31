Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4D77A73CC7
	for <Openembedded-devel@lists.openembedded.org>;
	Sat, 31 Oct 2015 00:31:23 +0000 (UTC)
Received: by pasz6 with SMTP id z6so88083966pas.2
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 30 Oct 2015 17:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=LpF4b73KXlzaWqPC/VkC1gPfu0rnfL2AwCniSTe8yG0=;
	b=OvcVGops9D+z9SO8lhaP+U87hd2ACehNT9c3lPPkxyi1ChSjc1iwH3gbGU4YEWV0sd
	nusRkt3WHDMrWWBeUlX55/LitmNhrTIls2OFci0yvV99NzNEr4c7fL8TFAty6BbJfmzw
	QSLJVE/glrBo4hmgMJO9T+0tFztWx+XcEqCpKNy4W7sThGT10msOkZ0U91r3qC4h1Kdl
	KEJ1+ToyPDJ/Nuyzp62//f3UOvILv97+Dl+z40zwuwcrzSOSVUMu2EOQV/svBrMG5GvG
	axGGxRHP2AQaElOhr8HrsA0HuuFwY5AcBdGtpV59ZAX/jwElguTe9qVUkDHGbTzB3aJS
	yRMA==
X-Received: by 10.66.233.36 with SMTP id tt4mr11750487pac.24.1446251484318;
	Fri, 30 Oct 2015 17:31:24 -0700 (PDT)
Received: from ?IPv6:2601:641:c000:1d0:9139:22be:56a:125d?
	([2601:641:c000:1d0:9139:22be:56a:125d])
	by smtp.gmail.com with ESMTPSA id
	jt1sm10323776pbc.83.2015.10.30.17.31.22
	for <Openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Oct 2015 17:31:23 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.1 \(3096.5\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=WxQUoJmsbQBwWXwRosHJorbM4Kkmr7K2CJRavyJVZaNQ@mail.gmail.com>
Date: Fri, 30 Oct 2015 17:31:20 -0700
Message-Id: <9E1160C7-1E0F-40A2-8BEE-038D7DCDD8CD@gmail.com>
References: <1446232789-12178-1-git-send-email-armccurdy@gmail.com>
	<CALbNGRS-8OJ=XiWQcKjQeKZ9BBvBwUZMJ_yXr2HZ=DKL+S7Eqg@mail.gmail.com>
	<CAJ86T=WxQUoJmsbQBwWXwRosHJorbM4Kkmr7K2CJRavyJVZaNQ@mail.gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3096.5)
Subject: Re: [meta-oe][PATCH] ninja-native: add initial recipe, ninja 1.6.0
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
X-List-Received-Date: Sat, 31 Oct 2015 00:31:26 -0000
X-Groupsio-MsgNum: 58231
Content-Type: multipart/signed;
	boundary="Apple-Mail=_62BE507C-D848-42F2-BC63-8110BBB9AC5B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_62BE507C-D848-42F2-BC63-8110BBB9AC5B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 30, 2015, at 4:41 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Fri, Oct 30, 2015 at 12:31 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Fri, Oct 30, 2015 at 8:19 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> .../recipes-devtools/ninja/ninja-native_1.6.0.bb   | 25 =
++++++++++++++++++++++
>>> 1 file changed, 25 insertions(+)
>>> create mode 100644 =
meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>>>=20
>>> diff --git a/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb =
b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>>> new file mode 100644
>>> index 0000000..c00710a
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-devtools/ninja/ninja-native_1.6.0.bb
>>> @@ -0,0 +1,25 @@
>>> +SUMMARY =3D "Ninja is a small build system with a focus on speed."
>>> +HOMEPAGE =3D "http://martine.github.com/ninja/"
>>> +LICENSE =3D "Apache-2.0"
>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"
>>> +
>>> +DEPENDS =3D "re2c-native"
>>> +
>>> +inherit native
>>> +
>>> +SRCREV=3D"484c16336f19bd8970bb6e75322d61b92a229899"
>>> +
>>> +SRC_URI =3D "git://github.com/martine/ninja.git;branch=3Drelease"
>>> +
>>> +S=3D"${WORKDIR}/git"
>>> +
>>> +do_configure[noexec] =3D "1"
>>> +
>>> +do_compile() {
>>> +    python ${S}/configure.py --bootstrap
>>> +}
>>> +
>>> +do_install() {
>>> +    install -d ${D}${bindir}
>>> +    install -m 0755 ${S}/ninja ${D}${bindir}/
>>> +}
>>> --
>>> 1.9.1
>>>=20
>> Yes ninja-native needs a more central place. Currently we have it (at
>> least - I checked my environment only) in
>>=20
>> meta-qt5
>> meta-browser
>> meta-tizen
>>=20
>> Once applied: Would you send patches to the other layers?
>=20
> Those layers all currently use older versions of ninja.
>=20
> Since I can't easily test all the packages in these layers, it's
> probably best if the respective layer maintainers take care of
> removing their own ninja-native recipes at their own pace (ie once
> they've tested against ninja 1.6.0 in meta-oe and confirmed that
> everything works as expected).

While thats right, you can help sending same patch to the layers and =
help them
testing part can be left to them. Somehow the layer maintainers should =
know about this
whether its sending a patch or filing a bug doesn't matter.

--Apple-Mail=_62BE507C-D848-42F2-BC63-8110BBB9AC5B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY0C9wACgkQuwUzVZGdMxT2FQCgkBDY8Ehy4AlUxnL1S9M+ECeJ
ji4AnAx8pvCxp2zUG9Ol0EtWdkhFdo7K
=+h3o
-----END PGP SIGNATURE-----

--Apple-Mail=_62BE507C-D848-42F2-BC63-8110BBB9AC5B--
