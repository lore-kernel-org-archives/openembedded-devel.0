Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f177.google.com (mail-pd0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id E5937767B7
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  8 Aug 2015 23:15:53 +0000 (UTC)
Received: by pdco4 with SMTP id o4so57735704pdc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 Aug 2015 16:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=BkcXQXb4QOVGdIqqldvOP21mwouQTwJsU7+CYfsz2CI=;
	b=umlzV9BUBJfs6Ya8Cpd/yYk1UeITfDNyYysafuSYgXtSYXwXnspM4ljw3i48LFMann
	k3Ic+9znj+8fzxYgSG2CxpKzRbwPXcOwyM/Ww3b+RkZnYMtd6dTRGDDN75LyW6IdjszD
	Tj1GbMPrSnG4+bcNsq/w2JGg8kdAZCI6AYfZeJKM/VC5ZKiVRUplmC0sAkbzpjnhIP1e
	RnOOcYOi1yprqpV8UrBteh1rOBAJf6Owl0jDak3B/8nhszz4yoCGL0tzRPdHIsPBJgBf
	6klmB+V3D11iBJthdGGyZzTFsuGx8Lf6MZ+XLi4cUZG3K575fBi5jpBy/Er/sMU/kVOs
	6QMw==
X-Received: by 10.70.133.233 with SMTP id pf9mr21751811pdb.131.1439075752337; 
	Sat, 08 Aug 2015 16:15:52 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:61b5:b56b:3665:2b08?
	([2601:646:8601:4580:61b5:b56b:3665:2b08])
	by smtp.gmail.com with ESMTPSA id
	fs13sm13250737pdb.29.2015.08.08.16.15.51
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Aug 2015 16:15:51 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1435713866-2884-1-git-send-email-rongqing.li@windriver.com>
Date: Sat, 8 Aug 2015 16:15:47 -0700
Message-Id: <03299321-1BC0-41FF-80AD-89020E69FFFB@gmail.com>
References: <1435713866-2884-1-git-send-email-rongqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH] php: fix a building failure on aarch64
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
X-List-Received-Date: Sat, 08 Aug 2015 23:15:54 -0000
X-Groupsio-MsgNum: 56613
Content-Type: multipart/signed;
	boundary="Apple-Mail=_735F2A43-8AFA-4557-85F2-5D46691EFEAB";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_735F2A43-8AFA-4557-85F2-5D46691EFEAB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 30, 2015, at 6:24 PM, rongqing.li@windriver.com wrote:
>=20
> From: Roy Li <rongqing.li@windriver.com>
>=20
> When -O0 of gcc is used to compile the macro ZEND_SIGNED_MULTIPLY_LONG
> in Zend/zend_multiply.h, the compiling will fail with the below error:
>  : Assembler messages:
>  :3113: Error: operand 2 should be an integer register -- `mul =
x1,[x29,200],[x29,192]'
>  :3114: Error: operand 2 should be an integer register -- `smulh =
x0,[x29,200],[x29,192]'
>=20
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
> meta-oe/recipes-devtools/php/php_5.5.26.bb | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta-oe/recipes-devtools/php/php_5.5.26.bb =
b/meta-oe/recipes-devtools/php/php_5.5.26.bb
> index 8b64b2b..85fdccb 100644
> --- a/meta-oe/recipes-devtools/php/php_5.5.26.bb
> +++ b/meta-oe/recipes-devtools/php/php_5.5.26.bb
> @@ -101,6 +101,7 @@ PACKAGECONFIG[imap] =3D =
"--with-imap=3D${STAGING_DIR_HOST} \
> export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
> export PHP_PEAR_PHP_BIN =3D "${STAGING_BINDIR_NATIVE}/php"
> CFLAGS +=3D " -D_GNU_SOURCE -g -DPTYS_ARE_GETPT -DPTYS_ARE_SEARCHED =
-I${STAGING_INCDIR}/apache2"
> +CFLAGS_append_aarch64 =3D " -O2=E2=80=9D

removing -O0 if its in CFLAGS is better that way you do not force -O2 =
always

CFLAGS_remove_aarch64 =3D =E2=80=9C-O0=E2=80=9D is more suitable.

>=20
> EXTRA_OEMAKE =3D "INSTALL_ROOT=3D${D}"
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_735F2A43-8AFA-4557-85F2-5D46691EFEAB
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXGjaYACgkQuwUzVZGdMxSFAwCfden+TAdQXMxucyFk51BCujrD
EKoAnj2rAvm1VqzLty98epq6mfKHC81H
=S1iJ
-----END PGP SIGNATURE-----

--Apple-Mail=_735F2A43-8AFA-4557-85F2-5D46691EFEAB--
