Received: from mail-yw0-f197.google.com ([209.85.211.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NxleS-00083H-OS
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 20:31:30 +0200
Received: by ywh35 with SMTP id 35so1375714ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Apr 2010 11:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=f1Lad/0WCXuSBWRo+4QFgBGG2W+s5PbnZJQWNRnW0Wo=;
	b=wcb9oBPluLvmxIgRMsU0dQnCQO+1fPQi0G1eVSeFQkZu4dCpD6TrpbalAFJitryJu1
	mIANVEDb+yEXI4JKtl0le/1zMvOxx9Ms3RE5uq+K7Dw1NUzikN3sNf6qw1r0AfK3Wkcu
	bdD88vd5lAZuA5UxG7+TSWekRhb+sCNDiP3NQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=PnFznce/FvC/4Feb4eV+Ln+526+ZKyzgpJlekg0HnVP3gO6tDFtoNsS74dfYx6YohJ
	lKs6goUWKi+xOe0W3V8Dv6fP0FW98L1EJ4SrnOgILBCEqSeYsSW78x/GSWW5vwZLzhzv
	RN7PJngp8n9fd3E+T2/cKoKC+rWlcZXlQnUs8=
MIME-Version: 1.0
Received: by 10.231.16.77 with HTTP; Fri, 2 Apr 2010 11:28:10 -0700 (PDT)
In-Reply-To: <1270223959.3873.29.camel@mattotaupa>
References: <1269796691.8018.74.camel@mattotaupa>
	<1269955259.4103.51.camel@mattotaupa>
	<1270223959.3873.29.camel@mattotaupa>
Date: Fri, 2 Apr 2010 11:28:10 -0700
Received: by 10.150.56.27 with SMTP id e27mr3556128yba.251.1270232890502; Fri, 
	02 Apr 2010 11:28:10 -0700 (PDT)
Message-ID: <l2s19c1b8a91004021128sa6116ab2p62cec8cd78c4db43@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.197
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v3] enna: Move to own recipe folder and update to new Enna hg repository.
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
X-List-Received-Date: Fri, 02 Apr 2010 18:31:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 2, 2010 at 8:59 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> 1. Create `enna.inc`.
> 2. Use `INC_PR`.
> 3. Move to new repository location.
> 4. Use `NOTQUITESRCREV` since `SRCREV` seems to get set to the one from t=
he EFL recipes.
> 5. Update license to LGPLv2.1+.
> 6. Build tested with GCC 4.4.3 and Binutils 2.20.1 for `MACHINE =3D "beag=
leboard".
> 7. Build tested with GCC 4.3.3 and Binuitls 2.18.50 for `MACHINE =3D "bea=
gleboard".
> 8. Remove `dbus` from `DEPEND` since `edbus` already depends an it.
> 9. `libmusicbrainz`, `lightmediascanner` and `taglib` are not needed anym=
ore as `DEPENDS`.
> 10. `do_configure_prepend()` fixes [1]. Thanks Koen.
> 11. libvalhalla 2.0.0 (`libvalhalla_hg.bb`) is needed for this version.
> 12. Works on BeagleBoard with libplayer patches sent to list.
>
> [1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-March/th=
read.html
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> # v1 =E2=86=92 v2
> =E2=80=A2 Use `NOTQUITESRCREV`. Manually =E2=80=9Cimproving=E2=80=9D thin=
gs during composing the message without testing is not a good idea.
> =E2=80=A2 Update revision. (Just because.)
> =E2=80=A2 Update commit message.
>
> # v2 =E2=86=92 v3
> =E2=80=A2 Update `SRCREV` which fixed `ERROR: QA Issue with enna:`.
> =E2=80=A2 New efl revisions fixed `enna: symbol lookup error: /usr/lib/li=
belementary-ver-pre-svn-05.so.0: undefined symbol: ECORE_X_ATOM_E_ILLUME_TO=
P_SHELF_GEOMETRY` [2].
>
> [2] https://geexbox.org/sympa/arc/devel/2010-03/msg00116.html
>
> Thanks for all your help!
> ---
> =C2=A0recipes/e17/enna_svn.bb | =C2=A0 15 ---------------
> =C2=A0recipes/enna/enna.inc =C2=A0 | =C2=A0 16 ++++++++++++++++
> =C2=A0recipes/enna/enna_hg.bb | =C2=A0 =C2=A09 +++++++++
> =C2=A03 files changed, 25 insertions(+), 15 deletions(-)
> =C2=A0delete mode 100644 recipes/e17/enna_svn.bb
> =C2=A0create mode 100644 recipes/enna/enna.inc
> =C2=A0create mode 100644 recipes/enna/enna_hg.bb
>
> diff --git a/recipes/e17/enna_svn.bb b/recipes/e17/enna_svn.bb
> deleted file mode 100644
> index f81990c..0000000
> --- a/recipes/e17/enna_svn.bb
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -DESCRIPTION =3D "Enna is a media center application based on EFL"
> -LICENSE =3D "GPL"
> -DEPENDS =3D "curl dbus eet evas edje ecore edbus emotion"
> -DEPENDS +=3D "libmusicbrainz lightmediascanner libxml2 taglib"
> -SECTION =3D "x11/multimedia"
> -PV =3D "0.2.0+svnr${SRCPV}"
> -PR =3D "r1"
> -SRCREV =3D "${EFL_SRCREV}"
> -
> -inherit e
> -
> -SRC_URI =3D "svn://svn.enlightenment.org/svn/e/trunk/MISC;module=3Denna;=
proto=3Dhttp"
> -S =3D "${WORKDIR}/enna"
> -
> -FILES_${PN}-dbg +=3D "${libdir}/${PN}/modules/.debug"
> diff --git a/recipes/enna/enna.inc b/recipes/enna/enna.inc
> new file mode 100644
> index 0000000..4cc5b48
> --- /dev/null
> +++ b/recipes/enna/enna.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION =3D "Enna is a media center application based on EFL."
> +HOMEPAGE =3D "http://${PN}.geexbox.org/"
> +SECTION =3D "x11/multimedia"
> +LICENSE =3D "LGPLv2.1+"
> +DEPENDS =3D "curl eet evas edje ecore edbus elementary emotion"
> +DEPENDS +=3D "libxml2 libvalhalla libplayer"
> +
> +INC_PR =3D "r1"
> +
> +SRC_URI =3D "http://${PN}.geexbox.org/releases/${P}.tar.bz2;name=3D${PN}=
"
> +
> +inherit autotools pkgconfig
> +
> +do_configure_prepend() {
> + =C2=A0 =C2=A0 =C2=A0 autopoint || touch config.rpath
> +}

empty config.rpath would build it wrongly isnt it. Probably this
should be removed

> diff --git a/recipes/enna/enna_hg.bb b/recipes/enna/enna_hg.bb
> new file mode 100644
> index 0000000..68f69ba
> --- /dev/null
> +++ b/recipes/enna/enna_hg.bb
> @@ -0,0 +1,9 @@
> +require enna.inc
> +PV =3D "0.4.0+hg"
> +PR =3D "${INC_PR}.0"
> +
> +NOTQUITESRCREV =3D "319d4702c427"
> +
> +SRC_URI =3D "hg://hg.geexbox.org;proto=3Dhttp;module=3D${PN};rev=3D${NOT=
QUITESRCREV}"
> +
> +S =3D "${WORKDIR}/${PN}"
> --
> 1.7.0.3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


