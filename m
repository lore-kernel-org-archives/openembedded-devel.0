Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyOh-0005wx-HR
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:17:07 +0100
Received: by mail-vw0-f47.google.com with SMTP id ff1so1548513vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=PAnHxPHHYHaJiFGbuPRAaaDCGsqew4UJUqFcd5YLNig=;
	b=cg9qhxOzMqoq9B+RBCDWgmjvdf3I7G9wHeFF3NIsSw5Q5JSfwdabY6r367uArxaxaE
	ri8F6AkAmji/Okr3GaQuEMEZmcPwbTiMfl/OrDZzBAykl6R7nUy7yEPLNzT969LzmZE7
	dF/ZRD3UODp4WMZwev2wLoWnudrl07cgnXTa0=
MIME-Version: 1.0
Received: by 10.220.108.70 with SMTP id e6mr942320vcp.74.1329386936468; Thu,
	16 Feb 2012 02:08:56 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:08:56 -0800 (PST)
In-Reply-To: <1329357796-27398-21-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-21-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:08:56 -0200
X-Google-Sender-Auth: AdMj3uWJrF9FgR12zVld8DqprIE
Message-ID: <CAP9ODKqFh_XDtQksEB5vvmM+gACJfTw2DB2qMdpk51o+AE-gwg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 20/22] busybox: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:17:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-core/busybox/busybox_1.19.3.bbappend   |    8 ++------
>  1 files changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> index 7e72a43..6b62bd7 100644
> --- a/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> +++ b/meta-oe/recipes-core/busybox/busybox_1.19.3.bbappend
> @@ -1,6 +1,6 @@
>  inherit systemd
>
> -PRINC :=3D "${@int(PRINC) + 2}"
> +PRINC :=3D "${@int(PRINC) + 3}"
>
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
> @@ -15,7 +15,6 @@ SYSTEMD_SERVICE_${PN}-syslog-systemd =3D
> "busybox-syslog.service"
>  do_install_append() {
>        install -m 0644 ${WORKDIR}/busybox-syslog.default
> ${D}${sysconfdir}/default/busybox-syslog
>
> -       install -d ${D}${base_libdir}/systemd/system
>        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/
> busybox-syslog.service.in \
>             > ${D}${base_libdir}/systemd/system/busybox-syslog.service
>        sed 's,@base_sbindir@,${base_sbindir},g' < ${WORKDIR}/
> busybox-klogd.service.in \
> @@ -24,7 +23,4 @@ do_install_append() {
>        ln -sf /dev/null ${D}${base_libdir}/systemd/system/syslog.service
>  }
>
> -PACKAGES +=3D "${PN}-syslog-systemd"
> -
> -RDEPENDS_${PN}-syslog-systemd +=3D "${PN}-syslog"
> -FILES_${PN}-syslog-systemd =3D "${base_libdir}/systemd"
> +FILES_${PN}-syslog-systemd +=3D
> "${base_libdir}/systemd/system/syslog.service"
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

