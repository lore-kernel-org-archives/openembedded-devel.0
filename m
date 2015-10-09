Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BF995755FA
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Oct 2015 07:20:40 +0000 (UTC)
Received: by pabve7 with SMTP id ve7so20281574pab.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Oct 2015 00:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Yzc11pt6z/vBP2Bj62VK64sbxyBJbtU9/MNUh8kuTfM=;
	b=qbu1FlrwxqlNhMKUsoFMp49+AvaDkW4xZ5AyZhdQdnHV0sw1t6RhKYQZI6yZOK4W0K
	eE8MkwcUVsLOQDDn5GbnSvc4vSA1D4f2Qyc6ojLldU+MCA/zfxXXgb1y1DXnZflUTvCL
	ImU8h/4uQgTtXWCF9UZl5PBHu38gLLNYIBp74bnNu4UXGnjfLDWxW5yMq0xbhH4p9y+V
	TX8xoi9qGIogrUb6rSOgO9rT3Ur2h5i3ckC18tEVmbYv9ryG6rXq3sUtcJ2qvs1QYNSO
	aAVX4Vi912o1mHTWea3/3SRgqh6FsqIFfOE5SMUAdltesZwo9EnCNZeppG8WtNJrAoKg
	CULA==
X-Received: by 10.66.230.169 with SMTP id sz9mr13441379pac.136.1444375240364; 
	Fri, 09 Oct 2015 00:20:40 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:24ad:a72d:669c:5092?
	([2601:646:8601:4580:24ad:a72d:669c:5092])
	by smtp.gmail.com with ESMTPSA id ch3sm454960pbb.18.2015.10.09.00.20.39
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 09 Oct 2015 00:20:39 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20151008095912.GA2385@jama>
Date: Fri, 9 Oct 2015 00:20:38 -0700
Message-Id: <8A50AA18-F461-4AF7-8CE4-2BABCB8710C4@gmail.com>
References: <1443510290-26782-1-git-send-email-kai.kang@windriver.com>
	<1443510290-26782-2-git-send-email-kai.kang@windriver.com>
	<20151008095912.GA2385@jama>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.1)
Subject: Re: [PATCH 1/2] efivar: 0.7 -> 0.21
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
X-List-Received-Date: Fri, 09 Oct 2015 07:20:42 -0000
X-Groupsio-MsgNum: 57748
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2BCF8461-B4AD-4302-8BB6-C7D4CD12F787";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2BCF8461-B4AD-4302-8BB6-C7D4CD12F787
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 8, 2015, at 2:59 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
>=20
> On Tue, Sep 29, 2015 at 03:04:49PM +0800, kai.kang@windriver.com =
wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>=20
>> Upgrade efivar from 0.7 to 0.21.
>>=20
>> * update HOMEPAGE and git repo.
>> * add -native recipe to provide command makeguids
>>  and add patch for target package to use this native makeguids =
command
>=20
> -native version is failing on hosts with older gcc (like Ubuntu 12.04
> with 4.6*).
>=20
> http://errors.yoctoproject.org/Errors/Details/20231/

may be use gcc-native ?

>=20
>>=20
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>> .../efivar/0001-efivar-fix-for-cross-compile.patch | 31 =
++++++++++++++++++++++
>> meta-oe/recipes-extended/efivar/efivar_0.21.bb     | 28 =
+++++++++++++++++++
>> meta-oe/recipes-extended/efivar/efivar_git.bb      | 18 -------------
>> 3 files changed, 59 insertions(+), 18 deletions(-)
>> create mode 100644 =
meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile.p=
atch
>> create mode 100644 meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> delete mode 100644 meta-oe/recipes-extended/efivar/efivar_git.bb
>>=20
>> diff --git =
a/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile=
.patch =
b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile=
.patch
>> new file mode 100644
>> index 0000000..4bd7d95
>> --- /dev/null
>> +++ =
b/meta-oe/recipes-extended/efivar/efivar/0001-efivar-fix-for-cross-compile=
.patch
>> @@ -0,0 +1,31 @@
>> +=46rom 7036e8b0dca61432970789e5397b6fb02b362c2b Mon Sep 17 00:00:00 =
2001
>> +From: Kai Kang <kai.kang@windriver.com>
>> +Date: Fri, 25 Sep 2015 18:14:31 +0800
>> +Subject: [PATCH] efivar: fix for cross compile
>> +
>> +It builds and calls elf file makeguids to generate a header file =
which
>> +doesn't work for cross compile. Fix it.
>> +
>> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> +---
>> + src/Makefile | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/Makefile b/src/Makefile
>> +index 6eac858..ef4eb1d 100644
>> +--- a/src/Makefile
>> ++++ b/src/Makefile
>> +@@ -65,8 +65,8 @@ makeguids.o : makeguids.c
>> + makeguids : makeguids.o fakeguid.o
>> + 	$(CC) $(cflags) -o $@ $^ -ldl
>> +
>> +-include/efivar/efivar-guids.h : makeguids guids.txt
>> +-	./makeguids guids.txt guids.bin names.bin guid-symbols.S $@
>> ++include/efivar/efivar-guids.h : guids.txt
>> ++	makeguids guids.txt guids.bin names.bin guid-symbols.S $@
>> +
>> + guidlist.o : guids.S include/efivar/efivar-guids.h
>> + 	$(CC) $(cflags) -c -o guidlist.o guids.S
>> +--
>> +2.6.0.rc2.10.gf4d9753
>> +
>> diff --git a/meta-oe/recipes-extended/efivar/efivar_0.21.bb =
b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> new file mode 100644
>> index 0000000..2e3b643
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/efivar/efivar_0.21.bb
>> @@ -0,0 +1,28 @@
>> +SUMMARY =3D "Tools to manipulate UEFI variables"
>> +DESCRIPTION =3D "efivar provides a simple command line interface to =
the UEFI variable facility"
>> +HOMEPAGE =3D "https://github.com/rhinstaller/efivar"
>> +
>> +LICENSE =3D "LGPLv2.1"
>> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D6626bb1e20189cfa95f2c508ba286393"
>> +
>> +DEPENDS_class-target =3D "popt efivar-native"
>> +
>> +SRCREV =3D "aab6c2a64d90b6e5a63661fb5bd6be8d878b0784"
>> +SRC_URI =3D "git://github.com/rhinstaller/efivar.git"
>> +SRC_URI_append_class-target =3D " =
file://0001-efivar-fix-for-cross-compile.patch"
>> +
>> +S =3D "${WORKDIR}/git"
>> +
>> +do_install() {
>> +    oe_runmake install DESTDIR=3D${D}
>> +}
>> +
>> +do_compile_class-native() {
>> +    oe_runmake -C src makeguids
>> +}
>> +
>> +do_install_class-native() {
>> +    install -D ${B}/src/makeguids ${D}${bindir}/makeguids
>> +}
>> +
>> +BBCLASSEXTEND =3D "native"
>> diff --git a/meta-oe/recipes-extended/efivar/efivar_git.bb =
b/meta-oe/recipes-extended/efivar/efivar_git.bb
>> deleted file mode 100644
>> index 18446a0..0000000
>> --- a/meta-oe/recipes-extended/efivar/efivar_git.bb
>> +++ /dev/null
>> @@ -1,18 +0,0 @@
>> -SUMMARY =3D "Tools to manipulate UEFI variables"
>> -DESCRIPTION =3D "efivar provides a simple command line interface to =
the UEFI variable facility"
>> -HOMEPAGE =3D "https://github.com/vathpela/efivar"
>> -
>> -LICENSE =3D "LGPLv2.1"
>> -LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Da6f89e2100d9b6cdffcea4f398e37343"
>> -
>> -DEPENDS =3D "popt"
>> -
>> -SRCREV =3D "c9e1f24a81b5374408bca5616402276e47171cf7"
>> -PV =3D "0.7+git${SRCPV}"
>> -SRC_URI =3D "git://github.com/vathpela/efivar.git"
>> -
>> -S =3D "${WORKDIR}/git"
>> -
>> -do_install() {
>> -    oe_runmake install DESTDIR=3D${D}
>> -}
>> --
>> 2.6.0.rc2.10.gf4d9753
>>=20
>=20
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_2BCF8461-B4AD-4302-8BB6-C7D4CD12F787
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYXasYACgkQuwUzVZGdMxQQMQCeMqh7X1DgECa1hNCV30osME6l
GTAAoJNtd3XGrAhPFizqnp0URzBmlxNB
=mqug
-----END PGP SIGNATURE-----

--Apple-Mail=_2BCF8461-B4AD-4302-8BB6-C7D4CD12F787--
