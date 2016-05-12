Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCD36FF73
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 23:19:45 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id r187so9053549pfr.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2016 16:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=14VmjwCXqdeCZaemKlY3XEw5uGeXkRhTt2WXgTa50ME=;
	b=z9yUJOfJJOuT+HOMqMqxrpZJMQR+9TS1l4fzaUWPog+gQuSob6L5NHcOPQ9bpe8IK/
	ZXnjSLpiQsa4ryey6chuZE0pmBlv2Ca4v81mzbtAzG/n1uVd+Ml38GUjEGJF3JbWcPq7
	VnZsLmXP67EMo85fv+59GA/yUy9nI1Uw03YsQ6ttrYKBGiyUTqKjTlz+kt0XxH9GNGNw
	BHVBcdGLlb9sGXkf67a1g8R39qCfa3DXuayQALYoB4OJg8PbrEs7EIBTWPPdXl5Jddon
	mrzLJIkIGF6vFpmQEw7Q0FKbyx05sJETppN5iCNJ5Fczzoviu2LLDKR3MvC6KChcZnUH
	/vVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=14VmjwCXqdeCZaemKlY3XEw5uGeXkRhTt2WXgTa50ME=;
	b=UtZU1QuLsGfUATTOP3PAc3kn6zKWUzqyi8lUSVKBHEG/Xu3ee6jpLSolWYO9SHSLc/
	PPAYLZGGZNHLwVQvGojq4pelrfNvGL96+7kMUHjMargB4rPpNLkXAu0w73wliUQGj43N
	6GwJGzk4HJC8Da4PB9XcHOl2+O0GWEDUuE0BwN0UTCAy3FNNv1Xp7lxLe5XZ7dyiWv8l
	RzYOXNG3ZNNmkgg6h/MGdibLcD9QzU/5n2nqUok90WkxCe6vyHhLBA7oqVcX7FXwHRvw
	+O+9YdiIgijaG020Sqa6PEZG35JiqLGx5tPz938MgnnyoLBKz9iTXonfpZz2TY8Mqxwi
	bpBg==
X-Gm-Message-State: AOPr4FUmWoavSJcai1HkJwMMzOPomTIrgTNCI6nQd8BZO8b7Y3/SL8L+GZYbT8gXmUM1uA==
X-Received: by 10.98.101.199 with SMTP id z190mr17857954pfb.1.1463095186316;
	Thu, 12 May 2016 16:19:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:ecfa:889b:cbe8:770c?
	([2601:646:8800:5a9a:ecfa:889b:cbe8:770c])
	by smtp.gmail.com with ESMTPSA id
	g70sm22380836pfb.7.2016.05.12.16.19.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 May 2016 16:19:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CA+chaQe2qm1KrCbYrKJGW006osec=3gBn_J4=xm_0JBB96+b5g@mail.gmail.com>
Date: Thu, 12 May 2016 16:19:36 -0700
Message-Id: <49EDAFCE-4E7C-4F3F-965D-2928E2325C21@gmail.com>
References: <1463081158-10495-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1463081158-10495-2-git-send-email-neenareddy.busireddy@nxp.com>
	<7DEAD0AF-B666-40C9-96C6-23D03A40A679@gmail.com>
	<CA+chaQe2qm1KrCbYrKJGW006osec=3gBn_J4=xm_0JBB96+b5g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [meta-oe][PATCH v2 2/2] freeglut: Add a recipe freeglut to replace mesa-glut
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
X-List-Received-Date: Thu, 12 May 2016 23:19:47 -0000
X-Groupsio-MsgNum: 61485
Content-Type: multipart/signed;
	boundary="Apple-Mail=_17EA7668-FD53-476A-81B1-0F82BA6ED63B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_17EA7668-FD53-476A-81B1-0F82BA6ED63B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On May 12, 2016, at 3:28 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> why?
>=20

As a matter of general practice, so if you include some classes whose =
DEPENDS may get overwritten
however I see in this case cmake is using DEPENDS_prepend so we should =
be safe.

> On Fri, May 13, 2016 at 12:10 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
>>=20
>>> On May 12, 2016, at 12:25 PM, Neena Busireddy <
>> neenareddy.busireddy@nxp.com> wrote:
>>>=20
>>> FreeGLUT is a free-software/open-source alternative to the OpenGL
>>> Utility Toolkit (GLUT) library.
>>> More information about this library can be found in
>>> http://freeglut.sourceforge.net/
>>>=20
>>> Signed-off-by: Neena Busireddy <neenareddy.busireddy@nxp.com>
>>> ---
>>> meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb | 17
>> +++++++++++++++++
>>> 1 file changed, 17 insertions(+)
>>> create mode 100644 =
meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>>>=20
>>> diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>> b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>>> new file mode 100644
>>> index 0000000..a98b289
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.0.0.bb
>>> @@ -0,0 +1,17 @@
>>> +DESCRIPTION =3D "FreeGLUT is a free-software/open-source =
alternative to
>> the OpenGL \
>>> +               Utility Toolkit (GLUT) library"
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78adfb"
>>> +
>>> +SRC_URI =3D "
>> =
https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.ta=
r.gz
>> "
>>> +SRC_URI[md5sum] =3D "90c3ca4dd9d51cf32276bc5344ec9754"
>>> +SRC_URI[sha256sum] =3D
>> "2a43be8515b01ea82bcfa17d29ae0d40bd128342f0930cd1f375f1ff999f76a2"
>>> +
>>> +inherit cmake
>>> +
>>> +# depends on virtual/libx11
>>> +REQUIRED_DISTRO_FEATURES =3D "x11"
>>> +
>>> +PROVIDES +=3D "mesa-glut"
>>> +
>>> +DEPENDS =3D "virtual/libx11 libxmu libxi virtual/libgl libglu =
libxrandr=E2=80=9D
>>=20
>> should this be +=3D
>>=20
>>> --
>>> 1.9.1
>>>=20
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>=20
>>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_17EA7668-FD53-476A-81B1-0F82BA6ED63B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc1D5AACgkQuwUzVZGdMxRDQACZAWPnHOAS07/9SyuJ+ZxQDyOP
f7QAoI0sQyamNd+TNGrmWL7EKkmwGQkj
=zeWZ
-----END PGP SIGNATURE-----

--Apple-Mail=_17EA7668-FD53-476A-81B1-0F82BA6ED63B--
