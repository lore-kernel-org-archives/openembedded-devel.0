Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADE375794
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:30:44 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so13433552pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=mjwgLGCENfodMsc/h6nG9oZK53fsC0QI6HzPT/SqCWE=;
	b=v76/zPxzBWw7PzXy539ec2IMzgWOKX9uJrrAUSIqS5U++ttBPs52y9UUDkTflR+ADM
	X76mWjBaSCpZL/eqB1TlLD9QJpz2EandB1jCbgIIoI1IHdYuKAE0aLBezqdhxbaOkzwv
	H2T+v9zXnWD+LRLg2KA/URoh7wB9JephedRrpdE1IJANf8nfz/8JgeQ3MbVXMaHzIiPY
	hPxCeRPG81Emjia5JwyYchiS9dgasol79c4paWTXUIVy69ko4ykm2HwVRuwjfVVXsjF3
	e4bqVLmtG3cYX249KWWUyeArzNBKQAcktLY7VsYS2UJdiKkuqWWQm5iKqvELx482Qcgn
	vhMA==
X-Received: by 10.68.250.228 with SMTP id zf4mr12653622pbc.90.1440743444842;
	Thu, 27 Aug 2015 23:30:44 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id
	cr4sm4508648pac.10.2015.08.27.23.30.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:30:43 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440667822-23807-1-git-send-email-kai.kang@windriver.com>
Date: Thu, 27 Aug 2015 23:30:38 -0700
Message-Id: <7ABBBA32-C72C-49A1-8B3E-2E8C17A5DB07@gmail.com>
References: <1440667822-23807-1-git-send-email-kai.kang@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-oe][PATCH] efibootmgr: fix build error with gcc 5.2
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
X-List-Received-Date: Fri, 28 Aug 2015 06:30:47 -0000
X-Groupsio-MsgNum: 57097
Content-Type: multipart/signed;
	boundary="Apple-Mail=_27E86101-047E-4A73-A8CA-27AEB53F5664";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_27E86101-047E-4A73-A8CA-27AEB53F5664
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 27, 2015, at 2:30 AM, kai.kang@windriver.com wrote:
>=20
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It fails to build efibootmgr with gcc 5.2:
>=20
> src/lib/disk.o: In function `disk_get_scsi_pci':
> src/lib/disk.c:154: undefined reference to `get_scsi_pci'
> src/lib/efi.o: In function `make_edd30_device_path':
> src/lib/efi.c:474: undefined reference to `get_scsi_idlun'
> collect2: error: ld returned 1 exit status
>=20
> Because functions get_scsi_pci and get_scsi_idlun are declared as
> inline. It has different semantics for inilne function between gcc 4
> and gcc 5.
>=20
> Pass flag '-fgnu89-inline' to gcc to fix the errors.
>=20
> Ref:
> https://gcc.gnu.org/gcc-5/porting_to.html
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
> meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb | 2 +-

can you update it to 0.12+ see https://github.com/rhinstaller/efibootmgr =
not sure if it will work for arm, you should let original
authors from Linaro know.

secondly if you take a closer look then it might be possible to move the =
function definitions into .h file and make them  static inline

> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb =
b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
> index 1870455..501ff2a 100644
> --- a/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
> +++ b/meta-oe/recipes-extended/efibootmgr/efibootmgr_0.6.0.bb
> @@ -19,7 +19,7 @@ SRC_URI =3D =
"http://linux.dell.com/efibootmgr/permalink/efibootmgr-${PV}.tar.gz \
> SRC_URI[md5sum] =3D "9e9a31d79e579644de83a14139b66d10"
> SRC_URI[sha256sum] =3D =
"5167488b92950e60028d1025942ce6bda04638c6fb5e110abb8c8f687844d155"
>=20
> -EXTRA_OEMAKE =3D "'CC=3D${CC}' 'CFLAGS=3D${CFLAGS} -I${S}/src/lib =
-I${S}/src/include'"
> +EXTRA_OEMAKE =3D "'CC=3D${CC}' 'CFLAGS=3D${CFLAGS} -I${S}/src/lib =
-I${S}/src/include -fgnu89-inline'"
>=20
> do_install () {
>     install -D -p -m0755 src/efibootmgr/efibootmgr =
${D}/${sbindir}/efibootmgr
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_27E86101-047E-4A73-A8CA-27AEB53F5664
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXgABIACgkQuwUzVZGdMxSF1QCcC7sCOLgpMEamKwrn+V0ksSbs
ljQAnRBHpT4zFq/yRXhlguxACr0aDDZu
=grPN
-----END PGP SIGNATURE-----

--Apple-Mail=_27E86101-047E-4A73-A8CA-27AEB53F5664--
