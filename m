Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id C210465CBC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 23:13:31 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so138471803pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2015 16:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=iPf7XmoL6Hd3Vh5Nr+v4ICHC3jyw0imNfzcEWuMUJZ0=;
	b=AyL9Z6ptcY5OEWm+1JtY8zqJKSn4vgepWY2V5GJiTKskhg0zJ0IOVCyIUAgcZDbtg+
	/pRo81+A9lnMle6by1IIaKKl7PGEc9P4HROZF67shZvflDl3qo59IlD6jo3vILifxVUa
	uGD5B+X8GgFDivJhWLg4liWW9jFBb1dvYVqOSrCxiJH6w7W2tLjbgriRcuMn9vNimtvt
	+Fh0VK66Q+D0o1/2/ysMQUg2y8oXX661LsKxO6YNoxftQ1y+o7Hr5tzKKwmHD6xBMoNK
	WzEsmSh3BOv7g8TdNPaaY6LuMKlFzf+iBaACVEZaSLVwKtTikvtdEX3jfQT5Kbkttpkk
	4Kqw==
X-Received: by 10.68.95.225 with SMTP id dn1mr61183279pbb.128.1440544411388;
	Tue, 25 Aug 2015 16:13:31 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:316a:3272:24e7:4679?
	([2601:646:8601:4580:316a:3272:24e7:4679])
	by smtp.gmail.com with ESMTPSA id
	n9sm19717714pdi.88.2015.08.25.16.13.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Aug 2015 16:13:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <55DC0F56.6040204@skidata.com>
Date: Tue, 25 Aug 2015 16:13:29 -0700
Message-Id: <E257CA19-37BF-4819-AD56-1D82D3DAAEB5@gmail.com>
References: <1439928871-17797-1-git-send-email-mario@ossystems.com.br>
	<CAD0=qkLXGaNYJ6X_sUXk3EEbi0EvoN1z0ufGvwB8V41Bo4ETyQ@mail.gmail.com>
	<55D580DA.7080004@skidata.com>
	<FA6D4712-DD99-40AC-8393-136CDA3CDDD8@gmail.com>
	<55DC0F56.6040204@skidata.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-java][PATCH 1/3] Don't depend on a hardcoded compiler
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
X-List-Received-Date: Tue, 25 Aug 2015 23:13:34 -0000
X-Groupsio-MsgNum: 57023
Content-Type: multipart/signed;
	boundary="Apple-Mail=_32CF12B9-8460-4FF3-831F-E88415F6FED5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_32CF12B9-8460-4FF3-831F-E88415F6FED5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Otavio/Henning

Please revert this commit. Its causing more pains than the problem it =
solves

Thanks
-Khem

> On Aug 24, 2015, at 11:46 PM, Richard Leitner =
<richard.leitner@skidata.com> wrote:
>=20
>=20
> On 08/25/2015 08:38 AM, Khem Raj wrote:
>>=20
>>> On Aug 20, 2015, at 12:25 AM, Richard Leitner =
<richard.leitner@skidata.com> wrote:
>>>=20
>>> Hi,
>>>=20
>>> On 08/19/2015 01:53 PM, Sven Ebenfeld wrote:
>>>> This patch creates a circular dependency for me:
>>>>=20
>>>> ERROR: Unbuildable tasks were found.
>>>> These are usually caused by circular dependencies and any circular
>>>> dependency chains found will be printed below. Increase the debug
>>>> level to see a list of unbuildable tasks.
>>>>=20
>>>=20
>>> Same problem for me!
>>>=20
>>> My settings are:
>>> PREFERRED_PROVIDER_virtual/java-initial-native =3D =
"cacao-initial-native"
>>> PREFERRED_PROVIDER_virtual/java-native =3D "jamvm-native"
>>> PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-bootstrap-native=94
>>=20
>> can you change this to
>>=20
>> PREFERRED_PROVIDER_virtual/javac-native =3D "ecj-initial-native"
>>=20
>> and retry ?
>=20
> Same problem:
>=20
> NOTE: Preparing runqueue
> ERROR: Unbuildable tasks were found.
> These are usually caused by circular dependencies and any circular
> dependency chains found will be printed below. Increase the debug =
level
> to see a list of unbuildable tasks.
>=20
> Identifying dependency loops (this may take a short while)...
>=20
> ERROR:
> Dependency loop #1 found:
>  Task 674
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_install) (dependent Tasks ['ecj-bootstrap-native.bb, do_compile'])
>  Task 675
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_populate_sysroot) (dependent Tasks ['ecj-bootstrap-native.bb,
> do_install'])
>  Task 684
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_configure) (dependent Tasks ['gnu-config, do_populate_sysroot',
> 'autoconf, do_populate_sysroot', 'zlib, do_populate_sysroot', 'libffi,
> do_populate_sysroot', 'jamvm, do_patch', 'automake,
> do_populate_sysroot', 'libtool-native, do_populate_sysroot',
> 'classpath-native, do_populate_sysroot', 'ecj-bootstrap-native.bb,
> do_populate_sysroot', 'pkgconfig, do_populate_sysroot'])
>  Task 685
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_compile) (dependent Tasks ['jamvm, do_configure'])
>  Task 681
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_install) (dependent Tasks ['jamvm, do_compile'])
>  Task 682
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_populate_sysroot) (dependent Tasks ['jamvm, do_install'])
>  Task 677
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_configure) (dependent Tasks ['ecj-bootstrap-native.bb, do_patch',
> 'jamvm, do_populate_sysroot', 'libecj-bootstrap-native,
> do_populate_sysroot'])
>  Task 678
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_compile) (dependent Tasks ['ecj-bootstrap-native.bb, =
do_configure'])
>=20
>=20
>=20
> Dependency loop #2 found:
>  Task 674
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_install) (dependent Tasks ['ecj-bootstrap-native.bb, do_compile'])
>  Task 675
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_populate_sysroot) (dependent Tasks ['ecj-bootstrap-native.bb,
> do_install'])
>  Task 691
> =
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb=
,
> do_configure) (dependent Tasks ['zip, do_populate_sysroot', =
'gnu-config,
> do_populate_sysroot', 'autoconf, do_populate_sysroot',
> 'ecj-bootstrap-native.bb, do_populate_sysroot', 'automake,
> do_populate_sysroot', 'classpath-native, do_patch', 'libtool-native,
> do_populate_sysroot', 'fastjar, do_populate_sysroot',
> 'gettext-minimal-native, do_populate_sysroot'])
>  Task 692
> =
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb=
,
> do_compile) (dependent Tasks ['classpath-native, do_configure'])
>  Task 688
> =
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb=
,
> do_install) (dependent Tasks ['classpath-native, do_compile'])
>  Task 689
> =
(/opt/yocto/poky/meta-java/recipes-core/classpath/classpath-native_0.99.bb=
,
> do_populate_sysroot) (dependent Tasks ['classpath-native, =
do_install'])
>  Task 684
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_configure) (dependent Tasks ['gnu-config, do_populate_sysroot',
> 'autoconf, do_populate_sysroot', 'zlib, do_populate_sysroot', 'libffi,
> do_populate_sysroot', 'jamvm, do_patch', 'automake,
> do_populate_sysroot', 'libtool-native, do_populate_sysroot',
> 'classpath-native, do_populate_sysroot', 'ecj-bootstrap-native.bb,
> do_populate_sysroot', 'pkgconfig, do_populate_sysroot'])
>  Task 685
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_compile) (dependent Tasks ['jamvm, do_configure'])
>  Task 681
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_install) (dependent Tasks ['jamvm, do_compile'])
>  Task 682
> =
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/jamvm/jamvm_git.bb,=

> do_populate_sysroot) (dependent Tasks ['jamvm, do_install'])
>  Task 677
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_configure) (dependent Tasks ['ecj-bootstrap-native.bb, do_patch',
> 'jamvm, do_populate_sysroot', 'libecj-bootstrap-native,
> do_populate_sysroot'])
>  Task 678
> (/opt/yocto/poky/meta-java/recipes-core/ecj/ecj-bootstrap-native.bb,
> do_compile) (dependent Tasks ['ecj-bootstrap-native.bb, =
do_configure'])
>=20
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_32CF12B9-8460-4FF3-831F-E88415F6FED5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXc9pkACgkQuwUzVZGdMxR6bQCghgsMdMnW2akNLSASZskR7GQ/
82gAoIocec93LIxdM5TnrDz6ScInFKNQ
=mqtC
-----END PGP SIGNATURE-----

--Apple-Mail=_32CF12B9-8460-4FF3-831F-E88415F6FED5--
