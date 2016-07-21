Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 44DA770031
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 13:51:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id x83so2538758wma.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jul 2016 06:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/2K9tzA8Y/emMjIU0WmfCG9KU/GgFN4SyuLZB+BDchI=;
	b=ceAuuLa6GJPjA++Xla65b5rRG9lRpm2yfLRt9bcVOQOWSTiyqLMiL9z399HHdZIzHN
	jOXeRUr6IB2Z8oz6rWTnGihPuL9P3A1Fgs6nSKh0RmxbVeygcq8iHWHP9HSYALgANvVk
	AiMRpddkU/ZCxBaiIW6U83pSEnF7I3Jx17bEOJdH8Mndl2RE/vSOgmSSRrKZxN1t6NHw
	Frk5rkBfPIAZAZ3evaKAfX3a+lFTJ2m0/O5x+pp+TkP0HmL3yeo6oTBanoraWgZjBh00
	ZhBZSDKEHMJVqNY6y8hGuf/CyEFzspW61Iqfwdgbwj5aIBAEWo/BCRpTGVKYTQaCkQwt
	tLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/2K9tzA8Y/emMjIU0WmfCG9KU/GgFN4SyuLZB+BDchI=;
	b=IhgCMcfcG4T28d1klFaqX7/EM4jfw5qe9Svw2ckxTdcjqz5LI+X5UjMxbmgpxefvml
	SgfYa+af5Tp/HFeRBRGo8YXRNj1EyAvUG0svoJUMSkOL3e4b9gjP6didTKokJJTp91oi
	rS5Tg/zU/L4OxiPVM5gtB0MJi3aaBoRM4dTbQo5zQszKaYaGzF5tWXoK5rZJKGRSnEkc
	QwPTOEC+7COgRrRn8gJDyMmV9qkptSrMEuu/misZKS+yeNrzqqcVzKYp/RXzW3Ges4qc
	TKbi7CaDAr8TqhDR1jLP+D/+xdob0pIdBu0Uv1N1oqI3ZjRokNQySJtan1NSk4E3e3Pf
	4KJA==
X-Gm-Message-State: ALyK8tKO6n8t+kwmBAEMrOzbcfIVqxRdd/NC2Pgm4MIs7ldGVmDk5s0tio7fjPtwci8qWQ==
X-Received: by 10.28.13.211 with SMTP id 202mr17764937wmn.47.1469109077049;
	Thu, 21 Jul 2016 06:51:17 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169])
	by smtp.gmail.com with ESMTPSA id p23sm4269285wme.8.2016.07.21.06.51.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jul 2016 06:51:14 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 21 Jul 2016 15:51:23 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160721135123.g6m5towwtvdfqyob@jama>
References: <1468587261-18160-1-git-send-email-git@andred.net>
	<1468587261-18160-2-git-send-email-git@andred.net>
MIME-Version: 1.0
In-Reply-To: <1468587261-18160-2-git-send-email-git@andred.net>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-networking][PATCH 2/2] meta-networking: override SECURITY_CFLAGS for c-ares
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
X-List-Received-Date: Thu, 21 Jul 2016 13:51:19 -0000
X-Groupsio-MsgNum: 62296
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fhio7vgxx3lhpecv"
Content-Disposition: inline

--fhio7vgxx3lhpecv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 15, 2016 at 01:54:21PM +0100, git@andred.net wrote:
> From: Andr=E9 Draszik <adraszik@tycoint.com>
>=20
> c-ares doesn't build if the distro has enabled usage of the
> security_flags.inc file as it is picky about what is placed
> into CPPFLAGS and CFLAGS. It complains and errors out if any
> preprocessor options appear in CFLAGS.
>=20
> Fix this by providing an additional include file that is
> require'd from conf/layer.conf.
>=20
> Signed-off-by: Andr=E9 Draszik <adraszik@tycoint.com>
> ---
>  .../conf/distro/include/meta_networking_security_flags.inc          | 6 =
++++++
>  meta-networking/conf/layer.conf                                     | 3 =
+++
>  2 files changed, 9 insertions(+)
>  create mode 100644 meta-networking/conf/distro/include/meta_networking_s=
ecurity_flags.inc
>=20
> diff --git a/meta-networking/conf/distro/include/meta_networking_security=
_flags.inc b/meta-networking/conf/distro/include/meta_networking_security_f=
lags.inc
> new file mode 100644
> index 0000000..06802d6
> --- /dev/null
> +++ b/meta-networking/conf/distro/include/meta_networking_security_flags.=
inc
> @@ -0,0 +1,6 @@
> +# configure righteously complains:
> +# | configure:3479: using CFLAGS:  -O2 -pipe -g -feliminate-unused-debug=
-types -fstack-protector-strong -pie -fpie -D_FORTIFY_SOURCE=3D2
> +# | configure:3485: CFLAGS error: CFLAGS may only be used to specify C c=
ompiler flags, not macro definitions. Use CPPFLAGS for: -D_FORTIFY_SOURCE=
=3D2
> +# | configure:3516: error: Can not continue. Fix errors mentioned immedi=
ately above this line.
> +TARGET_CFLAGS_remove_pn-c-ares =3D "${lcl_maybe_fortify}"
> +TARGET_CPPFLAGS_append_pn-c-ares =3D "${lcl_maybe_fortify}"

This actually breaks builds which don't include
conf/distro/include/security_flags.inc
with:
lcl_maybe_fortify =3D "${@base_conditional('DEBUG_BUILD','1','','-D_FORTIFY=
_SOURCE=3D2',d)}"

because then lcl_maybe_fortify isn't defined and gcc in c-ares
do_configure gets it unexpaned and fails:

configure:3926: checking whether the C compiler works
configure:3948: arm-oe-linux-gnueabi-gcc -march=3Darmv7-a -mthumb -mfpu=3Dn=
eon -mfloat-abi=3Dsoftfp -mcpu=3Dcortex-a9 -mtune=3Dcortex-a9 -funwind-tabl=
es -rdynamic -Os --sysroot=3D/OE/sysroots/MACHINE -O2 -pipe -g -feliminate-=
unused-debug-types -fdebug-prefix-map=3D/OE/work/MACHINE-oe-linux-gnueabi/c=
-ares/1.10.0-r0=3D/usr/src/debug/c-ares/1.10.0-r0 -fdebug-prefix-map=3D/OE/=
sysroots/x86_64-linux=3D -fdebug-prefix-map=3D/OE/sysroots/MACHINE=3D -Os $=
{lcl_maybe_fortify} -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed conftest=
=2Ec  >&5
arm-oe-linux-gnueabi-gcc: error: ${lcl_maybe_fortify}: No such file or dire=
ctory

I'll send a patch to add weak assignment before using lcl_maybe_fortify

> diff --git a/meta-networking/conf/layer.conf b/meta-networking/conf/layer=
=2Econf
> index 5fd636a..c09ba4a 100644
> --- a/meta-networking/conf/layer.conf
> +++ b/meta-networking/conf/layer.conf
> @@ -21,3 +21,6 @@ LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> =20
>  # used by waf-samba.bbclass
>  WAF_CROSS_ANSWERS_PATH =3D "${LAYERDIR}/files/waf-cross-answers"
> +
> +# Override security flags
> +require conf/distro/include/meta_networking_security_flags.inc
> --=20
> 2.8.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fhio7vgxx3lhpecv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleQ01oACgkQN1Ujt2V2gBykCwCeJDTL2HfMoQ6rqfoCIoOKbK//
f8oAnivDWUb2oiSWD876zDx3lXw6fuwm
=C7SF
-----END PGP SIGNATURE-----

--fhio7vgxx3lhpecv--
