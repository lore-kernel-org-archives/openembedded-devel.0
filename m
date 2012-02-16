Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyMT-0005GD-UO
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:14:50 +0100
Received: by mail-vw0-f47.google.com with SMTP id ff1so1547320vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=h/NgxZbf01S9gensTBM46MCdIcDJ6Y5//4/mOGgv2Ww=;
	b=n0xyPLCn044qmPlyHF3o3N9brpyVZpUgjeJ+pKKCmvqTq9LXIHcYdqEjU4ZGsW1Muo
	Vu5dQ456cbByDSPsz/CPei/NPe0LHGjgTYD3Azj347R9pT+yb0ALOKGsJGxo9I8DGGJs
	gTFK5XY4m3FFRgP+A2kWZGUWK+hbnfxtBLaJs=
MIME-Version: 1.0
Received: by 10.52.173.79 with SMTP id bi15mr759740vdc.31.1329386799155; Thu,
	16 Feb 2012 02:06:39 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:06:39 -0800 (PST)
In-Reply-To: <1329357796-27398-12-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-12-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:06:39 -0200
X-Google-Sender-Auth: tCWn4t5T8Cx6QsOhnvlTGe6938c
Message-ID: <CAP9ODKqO-1D=ga+JN-xQoWTRy7g92byrzLGJA36_qQbc9OEg5w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 11/22] elsa: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:14:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-efl/recipes-efl/efl/elsa_svn.bb |   11 +----------
>  1 files changed, 1 insertions(+), 10 deletions(-)
>
> diff --git a/meta-efl/recipes-efl/efl/elsa_svn.bbb/meta-efl/recipes-efl/e=
fl/
> elsa_svn.bb
> index a079ec0..70b56bd 100644
> --- a/meta-efl/recipes-efl/efl/elsa_svn.bb
> +++ b/meta-efl/recipes-efl/efl/elsa_svn.bb
> @@ -13,23 +13,14 @@ S =3D "${WORKDIR}/${SRCNAME}"
>
>  EXTRA_OECONF =3D "--with-edje-cc=3D${STAGING_BINDIR_NATIVE}/edje_cc
> ${@base_contains('DISTRO_FEATURES', 'pam', '', '--disable-pam', d)}"
>
> -PR =3D "r4"
> +PR =3D "r5"
>  PV =3D "0.0.4+svnr${SRCPV}"
>  SRCREV =3D "${EFL_SRCREV}"
>
> -do_install_append() {
> -        install -d ${D}${base_libdir}/systemd/system/
> -        install -m 0644 ${WORKDIR}/xserver-nodm.service
> ${D}${base_libdir}/systemd/system/xserver-nodm.service
> -}
> -
>  inherit systemd
>  SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE =3D "xserver-nodm.service"
>
> -PACKAGES =3D+ "${PN}-systemd"
> -FILES_${PN}-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_${PN}-systemd +=3D "${PN}"
> -
>  RDEPENDS_${PN} +=3D "${PN}-themes sessreg xauth"
>  CONFFILES_${PN} +=3D "${sysconfdir}/elsa.conf"
>  RCONFLICTS_${PN} +=3D "xserver-nodm-init"
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

