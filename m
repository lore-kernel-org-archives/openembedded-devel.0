Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 900677701C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 15:25:00 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so43689972pad.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Sep 2015 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=/32iGycLCwIPJQSCBSjq4pih/9IX4jo6TVfhiWw/o4E=;
	b=qZrnZ6X5lXgNp5/WfWnCZDtIecBYjU5KlzE/9K1R+8hVy59GnARCno4BAIHazysX2V
	+nIdTd84WdrsQWTJKaVNAOP/8BfErZsvk2w8pYvofrH0zhytpXzLwC+VAHNPwdladGEk
	SeK/6f0TVoeCmyia090qHT3Yrs3p1M7S+X0uYiqy9gyOTZ0u1lsACvcfRW8bnFrk/oQB
	qM9oVcr6NaBpw3f7tMUp3S/vcCUBPqE/6hOZebyEXW+4fAOhT7oMM1BZ10UCVOf+wwKb
	aueEx07gDGcPGcdOgSMLeOM9DlNUte0byJ06DKR/3ISkUaG0uobDF+miHn3gbP+123PF
	kxTQ==
X-Received: by 10.68.190.170 with SMTP id gr10mr5502780pbc.91.1443626701231;
	Wed, 30 Sep 2015 08:25:01 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:1dd2:3410:e15e:5df3?
	([2601:646:8601:4580:1dd2:3410:e15e:5df3])
	by smtp.gmail.com with ESMTPSA id pm8sm1366256pbc.9.2015.09.30.08.25.00
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 30 Sep 2015 08:25:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443611744-32468-1-git-send-email-adrian.ratiu@ni.com>
Date: Wed, 30 Sep 2015 08:24:55 -0700
Message-Id: <394DAAF7-103E-46D8-8495-F4209BE5857C@gmail.com>
References: <1443602914-22199-1-git-send-email-adrian.ratiu@ni.com>
	<1443611744-32468-1-git-send-email-adrian.ratiu@ni.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3094)
Subject: Re: [meta-oe][PATCH V2] meta-oe: recipes-devtools: add libubox recipe
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
X-List-Received-Date: Wed, 30 Sep 2015 15:25:02 -0000
X-Groupsio-MsgNum: 57599
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C5CE8D06-9716-49F9-BBBD-D8D18307231A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C5CE8D06-9716-49F9-BBBD-D8D18307231A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 30, 2015, at 4:15 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> =
wrote:
>=20
> libubox contains C utility functions used by OpenWrt projects
>=20
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
> meta-oe/recipes-devtools/libubox/libubox_git.bb | 32 =
+++++++++++++++++++++++++
> 1 file changed, 32 insertions(+)
> create mode 100644 meta-oe/recipes-devtools/libubox/libubox_git.bb
>=20
> diff --git a/meta-oe/recipes-devtools/libubox/libubox_git.bb =
b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> new file mode 100644
> index 0000000..4be3ac1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/libubox/libubox_git.bb
> @@ -0,0 +1,32 @@
> +DESCRIPTION =3D "C utility functions for OpenWrt"
> +SECTION =3D "libs"
> +LICENSE =3D "libubox-custom-license=E2=80=9D

where is the license file ?

> +LIC_FILES_CHKSUM =3D "\
> +    file://avl.c;endline=3D39;md5=3D00810155fed3d604816ec5814523d60a =
\
> +    file://avl-cmp.c;endline=3D15;md5=3D1603e6094b432a5f3f320877a06f41b=
5 \
> +    file://base64.c;endline=3D61;md5=3D51fdff010d45b0086ac0a6e035693dc0=
 \
> +    file://blobmsg.c;endline=3D15;md5=3D7ed64c1570e8c9b46c4fc6fbd16c489=
e \
> +    file://list.h;endline=3D28;md5=3D2d5f5475fbd0f08741354c5a99c2e983 =
\
> +    file://md5.h;endline=3D39;md5=3D048bf9f68963c207a0c2b3a94c9d2aaa =
\
> +    file://md5.c;endline=3D51;md5=3D0a448eea0bcbc89e3c7e6608f2d119a0 =
\
> +    file://usock.h;endline=3D18;md5=3Df0dfdc8de858e66d66d74036611bba14 =
\
> +"
> +
> +PACKAGES =3D "${PN} ${PN}-dbg ${PN}-dev ${PN}-staticdev=E2=80=9D

why override default PACKAGES ?

> +
> +DEPENDS =3D "json-c"
> +
> +SRC_URI =3D "git://git.openwrt.org/project/libubox.git"
> +
> +SRCREV =3D "136a5196266d03d537f822c4e67d2fde2ed59505"
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +EXTRA_OECMAKE =3D "-DBUILD_EXAMPLES=3DOFF -DBUILD_LUA=3DOFF"
> +
> +FILES_${PN} +=3D "\
> +    ${libdir}/libubox.so \
> +    ${libdir}/libblobmsg_json.so \

can they be versioned ?

> +"
> --
> 2.1.4
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_C5CE8D06-9716-49F9-BBBD-D8D18307231A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYL/ssACgkQuwUzVZGdMxRgRwCfZbomLknkMy8XOx2FEqRLw3Uk
UkYAnj4Xr8qcouLeUiEWYFDCOk8I91cb
=S4LQ
-----END PGP SIGNATURE-----

--Apple-Mail=_C5CE8D06-9716-49F9-BBBD-D8D18307231A--
