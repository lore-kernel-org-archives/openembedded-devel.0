Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyPh-00067k-FR
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:18:10 +0100
Received: by mail-vx0-f175.google.com with SMTP id fl15so1581180vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:09:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=FZqaw0PzmVXK3LVSAOwDsYMx009IkCXFVtJNmOckiyk=;
	b=FVGz1XmvPfCUVIPSCs96DKPMF4FFziE4gef2MFyg7x8n9qgkuvcxXaG3V379G7hsfl
	t8/t1p0J0GKuKgA3HEvwHRE0neiXNc7f56oJW0ho5CZKaOPEdHnLbQzS/ppWWLLDiRIr
	Eg2lm/sqSaWj1MBPqdO0pkK/qwt3yposx8mV4=
MIME-Version: 1.0
Received: by 10.220.116.2 with SMTP id k2mr979005vcq.44.1329386998665; Thu, 16
	Feb 2012 02:09:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:09:58 -0800 (PST)
In-Reply-To: <1329357796-27398-20-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-20-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:09:58 -0200
X-Google-Sender-Auth: 6SpV5PeK7gLTYfS_8apaeZje5NM
Message-ID: <CAP9ODKpCj8a9Tz4evKnstYR3gSNqt31cN6ruA2xBH-8be10Rug@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 19/22] gpsd: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb |   12 ++----------
>  1 files changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bbb/meta-oe/recipe=
s-navigation/gpsd/
> gpsd_2.96.bb
> index ce2ab02..927107a 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd217a23f408e91c94359447735bc1800"
>  DEPENDS =3D "dbus-glib ncurses python libusb1"
>  PROVIDES =3D "virtual/gpsd"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
>  EXTRA_OECONF =3D "--x-includes=3D${STAGING_INCDIR}/X11 \
>                 --x-libraries=3D${STAGING_LIBDIR} \
> @@ -68,11 +68,6 @@ do_install_append() {
>     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
>     install -d ${D}${base_libdir}/udev/
>     install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
> -
> -    #support for systemd
> -    install -d ${D}${base_libdir}/systemd/system
> -    install -m 644 ${WORKDIR}/${PN}.socket
> ${D}${base_libdir}/systemd/system
> -    install -m 644 ${WORKDIR}/${PN}.service
> ${D}${base_libdir}/systemd/system
>  }
>
>  pkg_postinst_${PN}-conf() {
> @@ -83,7 +78,7 @@ pkg_postrm_${PN}-conf() {
>        update-alternatives --remove gpsd-defaults
> ${sysconfdir}/default/gpsd.default
>  }
>
> -PACKAGES =3D+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev
> gpsd-conf gpsd-gpsctl gps-utils ${PN}-systemd"
> +PACKAGES =3D+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev
> gpsd-conf gpsd-gpsctl gps-utils"
>
>  FILES_python-pygps-dbg +=3D " ${libdir}/python*/site-packages/gps/.debug=
"
>
> @@ -113,6 +108,3 @@ RDEPENDS_gps-utils =3D "python-pygps"
>  DESCRIPTION_python-pygps =3D "Python bindings to gpsd"
>  FILES_python-pygps =3D "${PYTHON_SITEPACKAGES_DIR}/*"
>  RDEPENDS_python-pygps =3D "python-core python-curses gpsd python-json"
> -
> -FILES_${PN}-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_${PN}-systemd +=3D "${PN}"
> --
> 1.7.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

