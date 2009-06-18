Received: from [209.85.220.220] (helo=mail-fx0-f220.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MHNuI-0003Jp-QJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Jun 2009 22:08:24 +0200
Received: by fxm20 with SMTP id 20so1346126fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Jun 2009 12:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=rcXy8hAstLGEQAI7ga8oIlib839l/0hMlYI4T7hWpwk=;
	b=Lsd5nrWJouLHInDvV392X+jewUvvy1OLirM4T1tztYlztvoRxSJCOH7vdx/Z8EMbLo
	E6xLkmYU2ZWo4iak5HO0ap5kr9q+lWLuu2GMOunwfLlbOz1jEebSQ3rM18s5kD8msGgq
	ladmF9OXhbNeJ8jWRPZ9HrjXKjS19UhzHI6O0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ZMyuZzOmPoST1TaeWvCm43jTKlEv/zziSS4KsNAweyHqCq4lqUo63zLQAQ/2ppTgyj
	pzFgK73cPNjFsdJ7SKeYoCYN2txesOYsBzSIkPtQr6a80dNcdnlRsYWroRwTo4WULQhV
	3SFW45Zeo9RW7v+lmKuiegL2xiPZaCLHJZcHg=
MIME-Version: 1.0
Received: by 10.103.24.17 with SMTP id b17mr1277627muj.71.1245355066859; Thu, 
	18 Jun 2009 12:57:46 -0700 (PDT)
In-Reply-To: <1245344614-22213-2-git-send-email-valentin.longchamp@epfl.ch>
References: <1245344614-22213-1-git-send-email-valentin.longchamp@epfl.ch>
	<1245344614-22213-2-git-send-email-valentin.longchamp@epfl.ch>
Date: Thu, 18 Jun 2009 22:57:46 +0300
Message-ID: <fce2a370906181257h659a4259wff2c00e1d66ff667@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] change qmake2 to qmake4 for consistency
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
X-List-Received-Date: Thu, 18 Jun 2009 20:08:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2009 at 8:03 PM, Valentin
Longchamp<valentin.longchamp@epfl.ch> wrote:
>
> Signed-off-by: Valentin Longchamp <valentin.longchamp@epfl.ch>
> ---
> =C2=A0classes/qmake2.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
21 ---------------------
> =C2=A0classes/qmake4.bbclass =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
21 +++++++++++++++++++++
> =C2=A0recipes/qt4/qt4-tools-native.inc | =C2=A0 =C2=A03 +--
> =C2=A03 files changed, 22 insertions(+), 23 deletions(-)
> =C2=A0delete mode 100644 classes/qmake2.bbclass
> =C2=A0create mode 100644 classes/qmake4.bbclass
>
> diff --git a/classes/qmake2.bbclass b/classes/qmake2.bbclass
> deleted file mode 100644
> index 26e813a..0000000
> --- a/classes/qmake2.bbclass
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -#
> -# QMake variables for Qt4
> -#
> -inherit qmake_base
> -
> -DEPENDS_prepend =3D "qt4-tools-native "
> -
> -export QMAKESPEC =3D "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++=
"
> -export OE_QMAKE_UIC =3D "${STAGING_BINDIR_NATIVE}/uic4"
> -export OE_QMAKE_UIC3 =3D "${STAGING_BINDIR_NATIVE}/uic34"
> -export OE_QMAKE_MOC =3D "${STAGING_BINDIR_NATIVE}/moc4"
> -export OE_QMAKE_RCC =3D "${STAGING_BINDIR_NATIVE}/rcc4"
> -export OE_QMAKE_QDBUSCPP2XML =3D "${STAGING_BINDIR_NATIVE}/qdbuscpp2xml4=
"
> -export OE_QMAKE_QDBUSXML2CPP =3D "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4=
"
> -export OE_QMAKE_QMAKE =3D "${STAGING_BINDIR_NATIVE}/qmake2"
> -export OE_QMAKE_LINK =3D "${CXX}"
> -export OE_QMAKE_CXXFLAGS =3D "${CXXFLAGS}"
> -export OE_QMAKE_INCDIR_QT =3D "${STAGING_INCDIR}/qt4"
> -export OE_QMAKE_LIBDIR_QT =3D "${STAGING_LIBDIR}"
> -export OE_QMAKE_LIBS_QT =3D "qt"
> -export OE_QMAKE_LIBS_X11 =3D "-lXext -lX11 -lm"
> diff --git a/classes/qmake4.bbclass b/classes/qmake4.bbclass
> new file mode 100644
> index 0000000..c5ce100
> --- /dev/null
> +++ b/classes/qmake4.bbclass
> @@ -0,0 +1,21 @@
> +#
> +# QMake variables for Qt4
> +#
> +inherit qmake_base
> +
> +DEPENDS_prepend =3D "qt4-tools-native "
> +
> +export QMAKESPEC =3D "${STAGING_DATADIR}/qt4/mkspecs/${TARGET_OS}-oe-g++=
"
> +export OE_QMAKE_UIC =3D "${STAGING_BINDIR_NATIVE}/uic4"
> +export OE_QMAKE_UIC3 =3D "${STAGING_BINDIR_NATIVE}/uic34"
> +export OE_QMAKE_MOC =3D "${STAGING_BINDIR_NATIVE}/moc4"
> +export OE_QMAKE_RCC =3D "${STAGING_BINDIR_NATIVE}/rcc4"
> +export OE_QMAKE_QDBUSCPP2XML =3D "${STAGING_BINDIR_NATIVE}/qdbuscpp2xml4=
"
> +export OE_QMAKE_QDBUSXML2CPP =3D "${STAGING_BINDIR_NATIVE}/qdbusxml2cpp4=
"
> +export OE_QMAKE_QMAKE =3D "${STAGING_BINDIR_NATIVE}/qmake4"
> +export OE_QMAKE_LINK =3D "${CXX}"
> +export OE_QMAKE_CXXFLAGS =3D "${CXXFLAGS}"
> +export OE_QMAKE_INCDIR_QT =3D "${STAGING_INCDIR}/qt4"
> +export OE_QMAKE_LIBDIR_QT =3D "${STAGING_LIBDIR}"
> +export OE_QMAKE_LIBS_QT =3D "qt"
> +export OE_QMAKE_LIBS_X11 =3D "-lXext -lX11 -lm"
> diff --git a/recipes/qt4/qt4-tools-native.inc b/recipes/qt4/qt4-tools-nat=
ive.inc
> index 0fd4f92..5d1a781 100644
> --- a/recipes/qt4/qt4-tools-native.inc
> +++ b/recipes/qt4/qt4-tools-native.inc
> @@ -60,8 +60,7 @@ do_compile() {
>
> =C2=A0do_stage() {
> =C2=A0 =C2=A0 install -d ${STAGING_BINDIR_NATIVE}/
> - =C2=A0 =C2=A0install -m 0755 bin/qmake ${STAGING_BINDIR_NATIVE}/qmake2
> - =C2=A0 =C2=A0for i in moc uic uic3 rcc lrelease lupdate qdbuscpp2xml qd=
busxml2cpp; do
> + =C2=A0 =C2=A0for i in qmake moc uic uic3 rcc lrelease lupdate qdbuscpp2=
xml qdbusxml2cpp; do
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0755 bin/${i} ${STAGING_BINDIR_NAT=
IVE}/${i}4
> =C2=A0 =C2=A0 done

1) qmake name should be changed for qt4-tools-sdk too.
2) no inherit qmake2 -> inherit qmake4 changes done.

If this is fixed I'll vote for the change.

>
> --
> 1.6.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


