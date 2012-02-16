Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyO0-0005lx-I2
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:16:24 +0100
Received: by mail-vx0-f175.google.com with SMTP id fl15so1580489vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=J3c1+w0RvTxHAvBbrW4n7I9KPWNXVuxGLCin4YR2utg=;
	b=pS+B5ckHXrGpUwIk5d1New+KfVb12nS/ReOchG/Utfi2X3Q7y1ryP9g2TXqH1evQ+S
	rPBnrj3dcbyWKzehQWU+lL73ou/tWV+L8hwKafVq7IX+QHDUnvMJB9yr2lIy82Jthku/
	K5acI/7nuz95PYuqKloUo8tuQuq1MB9PSFGAw=
MIME-Version: 1.0
Received: by 10.52.72.107 with SMTP id c11mr754062vdv.48.1329386893778; Thu,
	16 Feb 2012 02:08:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:08:13 -0800 (PST)
In-Reply-To: <1329357796-27398-18-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-18-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:08:13 -0200
X-Google-Sender-Auth: Ec-Ih06qS6xvKDTc_0d6POKOquU
Message-ID: <CAP9ODKo8Vd41+UHi1qTWhDQ-GBimahpV60zVcnGfnRramBgvRg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 17/22] syslog-ng: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:16:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/syslog-ng/syslog-ng.inc |    7 +------
>  1 files changed, 1 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> index 3bbebec..a284e6d 100644
> --- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> +++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D7ec1bcc46f28b11f4722e20d9b7dd4d5"
>  # update-rc.d and update-alternatives is important
>  RDEPENDS_${PN} +=3D " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT",
> "none", "", "update-rc.d", d)}"
>
> -INC_PR =3D "r6"
> +INC_PR =3D "r7"
>
>  inherit autotools systemd
>
> @@ -47,11 +47,6 @@ do_install_append() {
>  SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE =3D "${PN}.service"
>
> -PACKAGES =3D+ "${PN}-systemd"
> -
> -FILES_${PN}-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_${PN}-systemd +=3D "${PN}"
> -
>  FILES_${PN} =3D "${bindir}/* ${sbindir}/* ${libexecdir}/*
> ${libdir}/lib*${SOLIBS} \
>             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
>             ${base_bindir}/* ${base_sbindir}/* \
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

