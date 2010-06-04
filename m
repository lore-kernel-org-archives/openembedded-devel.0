Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRba-0002lq-LQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:48:24 +0200
Received: by fxm9 with SMTP id 9so593204fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n7+8VDiydRjgh7UNp4XVhXpyEsDdF2kBPi61fAt3sqc=;
	b=Wesu6t+UpadOG35Gs9K/eIwj6XkziWACIk2EtpRXdL77rU9U0OcM/fT+67HPFgTVVT
	XlX0EVpL61rRLtKleX3mQt1ATgr9IjmMIhtuF9aSNnMMhvxOaNeP3Psyk8eFn35OaqZz
	jlK86QvGMUS/Ew9nRO3/MIuMIReyxrzJJBgFg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=AW2olMndEYJBZUzyqFoetaZPIQXAVosxWShph7j1DE8OfXDHgbskN51IQTT9HMLpRA
	x3AaWailGN42CRctofXxJN78yvLq8pY3uNjd2ZGok+Ko4J7ztsKeddFDhlJ2lsKc0hJW
	X/2GkPe793w+K0+yQdbb12jCXQUE/2JZXGbsQ=
MIME-Version: 1.0
Received: by 10.223.24.5 with SMTP id t5mr11372862fab.72.1275637318292; Fri, 
	04 Jun 2010 00:41:58 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:41:58 -0700 (PDT)
In-Reply-To: <1275510896-30845-14-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-14-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:41:58 +0200
Message-ID: <AANLkTimZa6Y9sn8BB5MmsBysFlZ9si8Os4t3UPoWSVs0@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 13/16] ncurses: Add -fforward-propagate on arm.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:48:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * Needed on -O1 compile. Generally we use -Os where
> =A0this option is already enabled. But we enable is anyway
> =A0so it gets picked at -O1 too which we use with DEBUG builds.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/ncurses/ncurses.inc =A0 =A0| =A0 11 ++++++-----
> =A0recipes/ncurses/ncurses_5.4.bb | =A0 =A02 +-
> =A02 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/recipes/ncurses/ncurses.inc b/recipes/ncurses/ncurses.inc
> index bfecfff..337d670 100644
> --- a/recipes/ncurses/ncurses.inc
> +++ b/recipes/ncurses/ncurses.inc
> @@ -30,6 +30,12 @@ export BUILD_CCFLAGS =3D "-I${S}/ncurses -I${S}/includ=
e ${BUILD_CFLAGS}"
> =A0export BUILD_LDFLAGS =3D ""
> =A0export EXTRA_OEMAKE =3D '"BUILD_LDFLAGS=3D" "BUILD_CCFLAGS=3D${BUILD_C=
CFLAGS}"'
>
> +# Below option is added to overcome the GCC bug on ARM
> +# see http://gcc.gnu.org/PR42981 for further details.
> +# We could potentially take it off when its fixed in gcc 4.5
> +
> +CFLAGS_append_arm =3D " -fforward-propagate "
> +
> =A0# This is necessary so that the "tic" command executed during the inst=
all can
> =A0# link with the correct libary in staging.
> =A0export LD_LIBRARY_PATH =3D "${STAGING_LIBDIR_NATIVE}"
> @@ -70,16 +76,12 @@ do_install() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mv ${D}${bindir}/reset ${D}${bindir}/reset=
.${PN}
> =A0 =A0 =A0 =A0fi
> =A0}
> -
> -
> =A0pkg_postinst_ncurses-tools () {
> =A0 =A0 =A0 =A0if [ "${PN}" =3D "ncurses" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0update-alternatives --install ${bindir}/cl=
ear clear clear.${PN} 100
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0update-alternatives --install ${bindir}/re=
set reset reset.${PN} 100
> =A0 =A0 =A0 =A0fi
> =A0}
> -
> -
> =A0pkg_prerm_ncurses-tools () {
> =A0 =A0 =A0 =A0if [ "${PN}" =3D "ncurses" ]; then
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0update-alternatives --remove clear clear.$=
{PN}
> @@ -110,7 +112,6 @@ FILES_${PN}-tools =3D "\
> =A0FILES_${PN}-terminfo =3D "\
> =A0 ${datadir}/terminfo \
> =A0"
> -
> =A0RSUGGESTS_${PN} =3D "ncurses-terminfo"
> =A0RPROVIDES_${PN} =3D "libncurses5"
> =A0RCONFLICTS_${PN} =3D "libncurses5"
> diff --git a/recipes/ncurses/ncurses_5.4.bb b/recipes/ncurses/ncurses_5.4=
.bb
> index a6aed6d..8c0f62c 100644
> --- a/recipes/ncurses/ncurses_5.4.bb
> +++ b/recipes/ncurses/ncurses_5.4.bb
> @@ -1,4 +1,4 @@
> -PR =3D "r19"
> +PR =3D "r20"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz \
> =A0 =A0 =A0 =A0 =A0 =A0file://makefile_tweak.patch \
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


