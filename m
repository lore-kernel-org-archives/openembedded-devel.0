Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id D72AD65C8A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Sep 2015 15:07:34 +0000 (UTC)
Received: by wicgb1 with SMTP id gb1so82097559wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Sep 2015 08:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1+sweKSlfgYzW3lOZg8iow4MR4qSHT2QUr59IN+KTlg=;
	b=H9t5G5L/BLEolCvh+N4MmLe5bqJzRJ20Wx2At1gn3fJdRBq7Q3VbfwC2Tex0JR/PgM
	KWzAJclVHaOm8F9c7ka+9a7wiGTN/Sc2Sj3pvZFHv2vXDLMM+h+YoZuuKq4Gw/62u4b7
	tvOgcejuRnKRZyJZj5SfEQIs6QI6BzvJb3SjBUSgpPNnkcbzIbonTcMVEFnO+d7lfm3j
	xEWpcusFPvMPVKO8DNCB0RZl0DW6gHKdx956fZ0k+AGOwfgH+gTsrcUR6qknOUpWoPNg
	gApsgrXE/kNgX18tgZA0PwM8YQ0SQ5zx8Gv5sLt9V73rShpA4GsumpoGO4Odsep8UdoT
	pQDA==
X-Received: by 10.194.134.98 with SMTP id pj2mr49880433wjb.30.1441724853895;
	Tue, 08 Sep 2015 08:07:33 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	yu4sm5299334wjc.43.2015.09.08.08.07.32
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 08 Sep 2015 08:07:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 8 Sep 2015 17:08:20 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150908150820.GB2381@jama>
References: <1440683598-4642-1-git-send-email-TicoTimo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1440683598-4642-1-git-send-email-TicoTimo@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-multimedia][PATCH v2] vlc: fix for libtool error
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
X-List-Received-Date: Tue, 08 Sep 2015 15:07:37 -0000
X-Groupsio-MsgNum: 57252
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oC1+HKm2/end4ao3"
Content-Disposition: inline

--oC1+HKm2/end4ao3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2015 at 06:53:18AM -0700, Tim Orling wrote:
> Changes since v1:
>   typo caught by Andreas Oberritter
>=20
> Patch recommended by:
>   Rafa=EBl Carr=E9 funman@videolan.org
>=20
> Signed-off-by: Tim Orling <TicoTimo@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multim=
edia/recipes-multimedia/vlc/vlc.inc
> index bf7ce0c..401bfa1 100644
> --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> @@ -63,7 +63,7 @@ do_configure_prepend() {
> =20
>  do_configure_append() {
>      sed -i -e s:'$(MOC) $(DEFS) $(CPPFLAGS)':'$(MOC) $(DEFS)'\ -I${B}/in=
clude\ -DSYS_LINUX:g ${B}/modules/gui/qt4/Makefile
> -    sed -i -e s:'${top_builddir_slash}libtool':${TARGET_SYS}-libtool:g $=
{B}/doltlibtool
> +    sed -i -e s:'${top_builddir_slash}libtool':'${top_builddir_slash}'${=
TARGET_SYS}-libtool:g ${B}/doltlibtool
>  }
> =20
>  # This recipe packages vlc as a library as well, so qt4 dependencies

We got a bit further, now it fails for qemuarm somewhere else:

http://errors.yoctoproject.org/Errors/Details/16535/
=2E/ui/open.h:14:25: fatal error: QtGui/QAction: No such file or directory

Can we add PACKAGECONFIG for qt5? It depends on qt4-x11-free but maybe
new version is now searching for qt5 as well?

> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oC1+HKm2/end4ao3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXu+eMACgkQN1Ujt2V2gBxIyACghcDHSXL4bG2roNKRtpB0vx3/
W7gAn34AlkZ/GcSIRKwMvpykMjFtKj9n
=EeaQ
-----END PGP SIGNATURE-----

--oC1+HKm2/end4ao3--
