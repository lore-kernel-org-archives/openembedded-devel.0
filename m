Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id E6F5575794
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 06:51:46 +0000 (UTC)
Received: by padfo6 with SMTP id fo6so14046816pad.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 23:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=1NyjN5YOaTOIVfgSUnbX9qLuzO0KFYGQfv2ZJjZ9B9M=;
	b=xDq6j1/s0KlNn9tgZrtKDviVhZGfUdvyOkJN8aXNhPjZ+0jtZLtH9NDf9U4mvGlF25
	73WanPCfEdP7A+nmBIGyrof45F/CRTsIBc8002sxzET49uGqYtKXCduIFaMIdlJLKux9
	GhHrndNWZKWZzw3lcPzUPCFxaQhq2WkliZGayBqwpxV1DuKRpEA+f7IuaORDCxIPSQVH
	p7DSFqqQZ06+u1Jv5YlUi9ny1Tp7Po6ggmeHydUYhXlkPz7YWOkv+Cet3BKDoy8jyVJT
	JKyCKWpvp09loFB9HbP5Z2NY44Dq7Q64mTr61kXo7i2Rh02bmpVJHDTw+tNlW/eM7Ewl
	QdSA==
X-Received: by 10.68.68.198 with SMTP id y6mr13226173pbt.30.1440744706460;
	Thu, 27 Aug 2015 23:51:46 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:e943:4351:71e0:b332?
	([2601:646:8601:4580:e943:4351:71e0:b332])
	by smtp.gmail.com with ESMTPSA id
	uk6sm4586310pac.27.2015.08.27.23.51.45
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Aug 2015 23:51:45 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1440584445-1731-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Thu, 27 Aug 2015 23:51:44 -0700
Message-Id: <B7D0F32E-EE42-4C5C-8AEF-85D1FA5165EB@gmail.com>
References: <1440584445-1731-1-git-send-email-lixin.fnst@cn.fujitsu.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [meta-networking][PATCH] postfix: Add Linux 4.0 Support
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
X-List-Received-Date: Fri, 28 Aug 2015 06:51:49 -0000
X-Groupsio-MsgNum: 57099
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A9CE605A-CC08-448C-AF4C-2593876E18B5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A9CE605A-CC08-448C-AF4C-2593876E18B5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 26, 2015, at 3:20 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
>=20
> Modify makedefs.patch to make it compilable on 4.0 kernel.


can you instead update the recipe to 3.0.2 ?
>=20
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
> .../recipes-daemons/postfix/files/makedefs.patch          | 15 =
++++++++++-----
> 1 file changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git =
a/meta-networking/recipes-daemons/postfix/files/makedefs.patch =
b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
> index 98d5f7e..c537441 100644
> --- a/meta-networking/recipes-daemons/postfix/files/makedefs.patch
> +++ b/meta-networking/recipes-daemons/postfix/files/makedefs.patch
> @@ -1,4 +1,4 @@
> -=46rom 4f49e2ce420fb3c17415937530493158ef312733 Mon Sep 17 00:00:00 =
2001
> +=46rom 44cb626e218bf68647994e94b598d5f45d473411 Mon Sep 17 00:00:00 =
2001
> From: Li xin <lixin.fnst@cn.fujitsu.com>
> Date: Fri, 19 Jun 2015 16:45:54 +0900
> Subject: [PATCH] 1)remove RANLIB, SYSLIBS, AR and get them from env.
> @@ -14,11 +14,11 @@ Upstreamstatus: Inappropriate [embedded specific]
>=20
> Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
> ---
> - makedefs | 27 +++++++++++----------------
> - 1 file changed, 11 insertions(+), 16 deletions(-)
> + makedefs | 29 ++++++++++++-----------------
> + 1 file changed, 12 insertions(+), 17 deletions(-)
>=20
> diff --git a/makedefs b/makedefs
> -index 8b84e47..893fb0d 100644
> +index 8b84e47..5c12206 100644
> --- a/makedefs
> +++ b/makedefs
> @@ -170,9 +170,6 @@ echo "# pie=3D$pie"
> @@ -80,7 +80,12 @@ index 8b84e47..893fb0d 100644
>  			   rm -f makedefs.test makedefs.test.[co]
>  		       fi;;
>  		esac
> -@@ -504,12 +499,12 @@ EOF
> +@@ -500,16 +495,16 @@ EOF
> + 		: ${SHLIB_ENV=3D"LD_LIBRARY_PATH=3D`pwd`/lib"}
> + 		: ${PLUGIN_LD=3D"${CC-gcc} -shared"}
> + 		;;
> +-    Linux.3*)	SYSTYPE=3DLINUX3
> ++    Linux.3*|Linux.4*) SYSTYPE=3DLINUX3

this should be LINUX4 for Linux-4.x

>  		case "$CCARGS" in
>  		 *-DNO_DB*) ;;
>  		 *-DHAS_DB*) ;;
> --
> 1.8.4.2
>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_A9CE605A-CC08-448C-AF4C-2593876E18B5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXgBQAACgkQuwUzVZGdMxTBWACeNL3Hw/C6yyGrUhsSnzRGtz0v
IV8AnRRJ7L3DuVSNs3A0Rfe7fMK4cWuf
=nbtc
-----END PGP SIGNATURE-----

--Apple-Mail=_A9CE605A-CC08-448C-AF4C-2593876E18B5--
