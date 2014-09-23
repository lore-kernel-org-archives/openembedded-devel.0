Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5143860167
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 16:57:32 +0000 (UTC)
Received: by mail-wi0-f179.google.com with SMTP id d1so5532778wiv.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Sep 2014 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=lBvlO0stfQiSFTcbU//ZxdsZZnGclqMCi3XgRVECqbA=;
	b=Dfybmm8bIIoc97vhz+jWmh8vH+rc9j8647rn6pW90zbSAaGsi2OPNmwO6U/eE5tX88
	+ZofW3Gw41SDjJWW/QjOM/uWboG/IVMk9zyIdx7/cXFfCV2t0Fn3L49nylvp+iee39IQ
	VaJitusm461JsytA0McuWLP6PJnmBXYmmJRJPfWVeWdTFRvXJ4S1veiPsx6HlQsjhSFU
	Tle/OZ3JVp+Zki+qamiffgNBBBm1DNTl7p7635+Gz46roHVUFXqK0lRPqmprrHyBZFJR
	+cwODncr2Vewz6ZhOBE4FtfoTfeTkMnPHTZetlPjFp/gSYGpBiZE7vDMlY9XpUWzcmlU
	VX0A==
X-Received: by 10.194.216.74 with SMTP id oo10mr1048744wjc.126.1411491452163; 
	Tue, 23 Sep 2014 09:57:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	dc9sm2925581wib.5.2014.09.23.09.57.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Sep 2014 09:57:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 23 Sep 2014 18:58:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140923165816.GD25706@jama>
References: <1410930481-10381-1-git-send-email-rongqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1410930481-10381-1-git-send-email-rongqing.li@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] wireshark: not put the CC options into CFLAGS_FOR_BUILD
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
X-List-Received-Date: Tue, 23 Sep 2014 16:57:32 -0000
X-Groupsio-MsgNum: 52193
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline

--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 17, 2014 at 01:08:01PM +0800, rongqing.li@windriver.com wrote:
> From: "Roy.Li" <rongqing.li@windriver.com>

Is it still needed for 1.12.1 version? If yes, please rebase (on
wireshark upgrade patch and resend.

> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../files/Do-not-set-CC_FOR_BUILD-flags.patch      |   46 ++++++++++++++=
++++++
>  .../recipes-support/wireshark/wireshark_1.12.0.bb  |    1 +
>  2 files changed, 47 insertions(+)
>  create mode 100644 meta-networking/recipes-support/wireshark/files/Do-no=
t-set-CC_FOR_BUILD-flags.patch
>=20
> diff --git a/meta-networking/recipes-support/wireshark/files/Do-not-set-C=
C_FOR_BUILD-flags.patch b/meta-networking/recipes-support/wireshark/files/D=
o-not-set-CC_FOR_BUILD-flags.patch
> new file mode 100644
> index 0000000..64a08ad
> --- /dev/null
> +++ b/meta-networking/recipes-support/wireshark/files/Do-not-set-CC_FOR_B=
UILD-flags.patch
> @@ -0,0 +1,46 @@
> +[PATCH] Do not set CC_FOR_BUILD flags
> +
> +Upstream-status: Pending
> +
> +AC_WIRESHARK_COMPILER_FLAGS_CHECK() is checking which options CC is supp=
orted,
> +and put the supported options into CFLAGS, but it should not put them in=
to=20
> +CFLAGS_FOR_BUILD. since CC and BUILD_CC can be different, CFLAGS_FOR_BUI=
LD is
> +used by BUILD_CC=20
> +
> +BUILD_CC is used to generated host tools, do not use the gcc's optimised=
 options,
> +do not effect the running of host tools. so do not set CC_FOR_BUILD flag=
s.
> +
> +Signed-off-by: Roy.Li <rongqing.li@windriver.com>
> +---
> + acinclude.m4 | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/acinclude.m4 b/acinclude.m4
> +index 136fc27..8d3d360 100644
> +--- a/acinclude.m4
> ++++ b/acinclude.m4
> +@@ -1755,10 +1755,6 @@ if test "x$ac_supports_gcc_flags" =3D "xyes" ; th=
en
> +               # just the new option.
> +               #
> +               CFLAGS=3D"$CFLAGS_saved $GCC_OPTION"
> +-              #
> +-              # Add it to the flags we use when building build tools.
> +-              #
> +-              CFLAGS_FOR_BUILD=3D"$CFLAGS_FOR_BUILD $GCC_OPTION"
> +             ],
> +             [
> +               AC_MSG_RESULT(yes)
> +@@ -1771,10 +1767,6 @@ if test "x$ac_supports_gcc_flags" =3D "xyes" ; th=
en
> +           # just the new option.
> +           #
> +           CFLAGS=3D"$CFLAGS_saved $GCC_OPTION"
> +-          #
> +-          # Add it to the flags we use when building build tools.
> +-          #
> +-          CFLAGS_FOR_BUILD=3D"$CFLAGS_FOR_BUILD $GCC_OPTION"
> +         fi
> +       ],
> +       [
> +--=20
> +1.9.1
> +
> diff --git a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.b=
b b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> index 39a24dc..675519b 100644
> --- a/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> +++ b/meta-networking/recipes-support/wireshark/wireshark_1.12.0.bb
> @@ -30,6 +30,7 @@ EXTRA_OECONF =3D "--with-qt=3Dno --enable-usr-local=3Dn=
o --enable-tshark --with-c-ares
>  LIC_FILES_CHKSUM =3D "file://README.linux;md5=3D631e077455b7972172eb1491=
95e065b0"
>  SRC_URI =3D " \
>      http://wiresharkdownloads.riverbed.com/wireshark/src/wireshark-1.12.=
0.tar.bz2 \
> +    file://Do-not-set-CC_FOR_BUILD-flags.patch \
>  "
> =20
>  PE =3D "1"
> --=20
> 1.7.10.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlQhpqgACgkQN1Ujt2V2gBzv0wCfUzSNne6SF5cooz1wucXM6CdX
u8MAn1dmAvdUrGdSDUSkuoCPgkvZ+ntg
=bRcu
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
