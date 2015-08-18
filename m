Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 810A975F44
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:35:16 +0000 (UTC)
Received: by wibhh20 with SMTP id hh20so104533116wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O2bYRRw/5Ptm1OsBsuDiA61OCH32YiuX/1a1TO+675g=;
	b=Hduvq0KKFej1ncSbLXHvYZN89YUqrhsThJ8iuLUTz5Ogo2zph3CwpsYf0cbg0rzsJW
	/7YRHhVp8V4BB/6fZ6bFPgkmSb9IDstlWfdPIULwCHDxmmfi8VP5lWDDktlRW+Z8xVmN
	ZpRrgCnDDdQIaCRts8jYGZ46cOKH+1eXvdd1+TQ/I4J29WBco0eErS+QJLo5+A/MImyy
	jZnMMRVxCIzz9b19F35F9uIyamlgo4P3WtKcTrMeeB66nW4176MOzwEpfSFrH9ExgE0D
	oUnZ8Lh+ZzqQnLF0JDWyqWFMRNh5suaLSLMSKVM0W4XWNGjDY47ZqK0yneitUUqy45Ey
	tdkQ==
X-Received: by 10.194.83.70 with SMTP id o6mr12113179wjy.44.1439894116350;
	Tue, 18 Aug 2015 03:35:16 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	kb1sm25858746wjc.24.2015.08.18.03.35.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 03:35:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 12:35:19 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150818103519.GA13732@jama>
References: <1439110446-22189-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <1439110446-22189-1-git-send-email-koen@dominion.thruhere.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-oe][RFC][PATCH 1/3] heimdal 1.6rc2: add buildtool for samba4
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
X-List-Received-Date: Tue, 18 Aug 2015 10:35:24 -0000
X-Groupsio-MsgNum: 56766
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2015 at 10:54:04AM +0200, Koen Kooi wrote:
> Samba4 uses ans1_compile and compile_et to build itself, so we need a
> -native version of it. Heimdal is the external upstream  variant of the t=
ools
> samba bundles.

Can you please compare with implementation from Bian:
http://lists.openembedded.org/pipermail/openembedded-devel/2015-August/1025=
71.html

and consolidate into one patchsets which will work for both?

Thanks,

>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  ...dm5-fix-race-in-Makefile-with-kadm5_err.h.patch | 34 ++++++++++++++++
>  .../recipes-connectivity/samba/heimdal_1.6rc2.bb   | 45 ++++++++++++++++=
++++++
>  2 files changed, 79 insertions(+)
>  create mode 100644 meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5=
-fix-race-in-Makefile-with-kadm5_err.h.patch
>  create mode 100644 meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
>=20
> diff --git a/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-ra=
ce-in-Makefile-with-kadm5_err.h.patch b/meta-oe/recipes-connectivity/samba/=
heimdal/0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch
> new file mode 100644
> index 0000000..bab933c
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/samba/heimdal/0002-kadm5-fix-race-in-M=
akefile-with-kadm5_err.h.patch
> @@ -0,0 +1,34 @@
> +From 18fe7d300f133c2b9eb93bb4bd81e4644979a74b Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Jakub=3D20=3DC4=3D8Cajka?=3D <jcajka@redhat.com>
> +Date: Tue, 1 Jul 2014 13:13:43 -0600
> +Subject: [PATCH] kadm5: fix race in Makefile with kadm5_err.h
> +
> +When running make with -j4, occasionally kadm5 fails due to a missing
> +header file kadm5_err.h. Fix the race condition.
> +
> +Reported at https://bugzilla.redhat.com/1115164
> +
> +Reviewed-by: Ken Dreyer <ktdreyer@ktdreyer.com>
> +
> +Upstream-status: Backport [upstream commit 6affa4cceceaa1369dd895f8acdd7=
a883ee65674]
> +
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> +---
> + lib/kadm5/Makefile.am | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/lib/kadm5/Makefile.am b/lib/kadm5/Makefile.am
> +index f8be3b1..1b399b1 100644
> +--- a/lib/kadm5/Makefile.am
> ++++ b/lib/kadm5/Makefile.am
> +@@ -155,6 +155,7 @@ iprop-commands.c iprop-commands.h: iprop-commands.in
> + 	$(SLC) $(srcdir)/iprop-commands.in
> +=20
> + $(libkadm5srv_la_OBJECTS): kadm5_err.h
> ++$(libkadm5clnt_la_OBJECTS): kadm5_err.h
> + $(iprop_log_OBJECTS): iprop-commands.h
> +=20
> + client_glue.lo server_glue.lo: $(srcdir)/common_glue.c
> +--=20
> +2.4.5
> +
> diff --git a/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb b/meta-=
oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
> new file mode 100644
> index 0000000..7245d14
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/samba/heimdal_1.6rc2.bb
> @@ -0,0 +1,45 @@
> +SUMMARY =3D "The Heimdal Kerberos 5, PKIX, CMS, GSS-API, SPNEGO, NTLM, D=
igest-MD5 and, SASL implementation."
> +
> +DEPENDS =3D "e2fsprogs ncurses"
> +
> +LICENSE =3D "BSD-3"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2c6f8cfe82d4fdd74355866f0c14=
d3f"
> +
> +PV =3D "1.5+1.6rc2"
> +
> +SRC_URI =3D "http://www.h5l.org/dist/src/heimdal-1.6rc2.tar.gz \
> +           file://0002-kadm5-fix-race-in-Makefile-with-kadm5_err.h.patch=
 \
> +          "
> +S =3D "${WORKDIR}/heimdal-1.6rc2"
> +SRC_URI[md5sum] =3D "152ca82660864acf7f712ae1a57e6795"
> +SRC_URI[sha256sum] =3D "8fe19e0f12ff0d0c2f20a6cf56727deaabd89db9c1972880=
22fb489e103b730d"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OECONF =3D " \
> +	--disable-shared \
> +	--enable-static \
> +	--without-openldap \
> +	--without-capng \
> +	--without-sqlite3 \
> +	--without-libintl \
> +	--without-openssl \
> +	--without-berkeley-db \
> +	--without-readline \
> +	--without-libedit \
> +	--without-hesiod \
> +	--without-x \
> +	--disable-heimdal-documentation \
> +       "
> +
> +# Even with the makefile patch parallel make fails 8 out of 10 times wit=
h -j8=20
> +PARALLEL_MAKE =3D ""
> +
> +# Put both compile tools together in $PATH and libexecdir in order to bu=
ild samba4
> +do_install_append() {
> +    ln -sf ${libexecdir}/heimdal/asn1_compile ${D}${bindir}/
> +    ln -sf ${bindir}/compile_et ${D}${libexecdir}/heimdal/
> +}
> +
> +BBCLASSEXTEND =3D "native"
> +
> --=20
> 2.0.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXTCmYACgkQN1Ujt2V2gBzDeQCglYd5L5EHZjkBdrK9508T2xE0
LtUAoKr0R5d2D0wx3kaY/1tJyrfuoZpi
=kzoz
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
