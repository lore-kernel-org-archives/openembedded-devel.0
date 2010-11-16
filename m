Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIV4v-0003f4-4j
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:36:45 +0100
Received: by yxd5 with SMTP id 5so855632yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=Px3whpkyEdfw9sOkjAXySMWV+dg3fods7xQJ/dTTvHg=;
	b=QOy5/forPhccpgqAwGGWwtEeThocWaxfcJHPa0wcxB1v6FQQjajylnaTFgwlN3Thf7
	grWPF8LKQsCM+t9uRCcIQTcOJw/2pW679uV/bbGm9Euenz0DkCNIkhChigDWnNx7ROUa
	hHmCMEzli6WzPW7djBaFR1wTZaqTid2gjzZTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=KKo0v3tWE/WHlo2Sb/ETTiP/i824+VonOuhc88gzzOxYAbk4oagyauIlxTTImLqtuS
	Z507+XK6fmzgmct7Nmg4GUPyuOvCQdTSKBlU+/ODhnu4hcli1VUlTn9WyECbJPYxxq5i
	LbDfC8L6On9Xsdv7d0ccfnxBX6MVhngOx0HiI=
Received: by 10.91.51.19 with SMTP id d19mr10446156agk.183.1289950537942; Tue,
	16 Nov 2010 15:35:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:35:17 -0800 (PST)
In-Reply-To: <1289414144-18181-2-git-send-email-msmith@cbnco.com>
References: <1289414144-18181-1-git-send-email-msmith@cbnco.com>
	<1289414144-18181-2-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:35:17 -0800
Message-ID: <AANLkTinUSpYzmuhaGmN23m8ahMdSCVLnjnwr=N=+13Nr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] smpeg: configure with --disable-rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Nov 2010 23:36:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 10, 2010 at 10:35 AM, Michael Smith <msmith@cbnco.com> wrote:
> Otherwise libtool and ld try to link against ${libdir}/libdl.so.2 on the
> host system.
>


Does it happen with libtool 2.4 as well ?

> Signed-off-by: Michael Smith <msmith@cbnco.com>
> ---
> =C2=A0.../smpeg-0.4.5+svnr387/add-disable-rpath.patch =C2=A0 =C2=A0| =C2=
=A0 47 ++++++++++++++++++++
> =C2=A0recipes/smpeg/smpeg_svn.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A06 ++-
> =C2=A02 files changed, 51 insertions(+), 2 deletions(-)
> =C2=A0create mode 100644 recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rp=
ath.patch
>
> diff --git a/recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch b/=
recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch
> new file mode 100644
> index 0000000..e1de0ea
> --- /dev/null
> +++ b/recipes/smpeg/smpeg-0.4.5+svnr387/add-disable-rpath.patch
> @@ -0,0 +1,47 @@
> +Upstream: http://icculus.org/pipermail/smpeg/2010-November/000183.html
> +
> +Add --disable-rpath to fix build in OE.
> +
> +--- trunk/configure.in.orig =C2=A0 =C2=A02010-11-07 09:00:19.000000000 -=
0500
> ++++ trunk/configure.in 2010-11-10 13:02:06.000000000 -0500
> +@@ -84,19 +84,27 @@
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;
> + esac
> +
> +-# Set runtime shared library paths as needed
> +-
> +-case "$target" in
> +- =C2=A0 =C2=A0*-*-linux*)
> +- =C2=A0 =C2=A0 =C2=A0SMPEG_RLD_FLAGS=3D"-Wl,-rpath,\${exec_prefix}/lib"
> +- =C2=A0 =C2=A0 =C2=A0;;
> +- =C2=A0 =C2=A0*-*-freebsd*)
> +- =C2=A0 =C2=A0 =C2=A0SMPEG_RLD_FLAGS=3D"-Wl,-rpath,\${exec_prefix}/lib"
> +- =C2=A0 =C2=A0 =C2=A0;;
> +- =C2=A0 =C2=A0*-*-solaris*)
> +- =C2=A0 =C2=A0 =C2=A0SMPEG_RLD_FLAGS=3D"-R\${exec_prefix}/lib"
> +- =C2=A0 =C2=A0 =C2=A0;;
> +-esac
> ++dnl Set runtime shared library paths as needed
> ++AC_ARG_ENABLE(rpath,
> ++ =C2=A0 =C2=A0 =C2=A0AC_HELP_STRING([--enable-rpath],
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[use an rpath when lin=
king SDL [[default=3Dyes]]]),,
> ++ =C2=A0 =C2=A0 =C2=A0enable_rpath=3Dyes)
> ++
> ++if test "x$enable_rpath" =3D "xyes"; then
> ++ =C2=A0case "$target" in
> ++ =C2=A0 =C2=A0 =C2=A0*-*-linux*)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0SMPEG_RLD_FLAGS=3D"-Wl,-rpath,\${exec_prefi=
x}/lib"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> ++ =C2=A0 =C2=A0 =C2=A0*-*-freebsd*)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0SMPEG_RLD_FLAGS=3D"-Wl,-rpath,\${exec_prefi=
x}/lib"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> ++ =C2=A0 =C2=A0 =C2=A0*-*-solaris*)
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0SMPEG_RLD_FLAGS=3D"-R\${exec_prefix}/lib"
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0;;
> ++ =C2=A0esac
> ++else
> ++ =C2=A0SMPEG_RLD_FLAGS=3D""
> ++fi
> +
> + AC_SUBST(SMPEG_RLD_FLAGS)
> +
> diff --git a/recipes/smpeg/smpeg_svn.bb b/recipes/smpeg/smpeg_svn.bb
> index 394270d..6fea95d 100644
> --- a/recipes/smpeg/smpeg_svn.bb
> +++ b/recipes/smpeg/smpeg_svn.bb
> @@ -7,15 +7,17 @@ PROVIDES =3D "smpeg"
> =C2=A0PV =3D "0.4.5+svnr${SRCPV}"
> =C2=A0PE =3D "2"
> =C2=A0SRCREV =3D "387"
> +PR =3D "r1"
>
> -SRC_URI =3D "svn://svn.icculus.org/smpeg/;module=3Dtrunk"
> +SRC_URI =3D "svn://svn.icculus.org/smpeg/;module=3Dtrunk \
> + =C2=A0 =C2=A0 =C2=A0 file://add-disable-rpath.patch;apply=3Dyes"
>
> =C2=A0S =3D "${WORKDIR}/trunk"
>
> =C2=A0inherit autotools binconfig
>
> =C2=A0EXTRA_OECONF =3D "--disable-gtktest --disable-opengl-player --witho=
ut-x \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-gtk --disabl=
e-gtk-player"
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --without-gtk --disabl=
e-gtk-player --disable-rpath"
>
> =C2=A0do_configure_prepend () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0touch NEWS AUTHORS ChangeLog
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


