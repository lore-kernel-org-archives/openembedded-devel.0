Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyN1-0005GD-GA
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:15:23 +0100
Received: by mail-vw0-f47.google.com with SMTP id ff1so1547320vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Wg7gWaOsTbqY1Kmp5fy8+yVVkdCtbyOkD0qk7sppQ34=;
	b=WbuSeaU9gqOpyzljodgsv9Pf6Lm6BDS3aODa1XlTwA1tmVbAQeVZFrezatWcYq4Z/j
	09HENMWj62sr4NZFjsBfmP7aTAotOcWJu2CkJdPqh7MFH+DGinCqpGGaVIaTifxx9LeO
	3tuSDyvk83RfWB8MBwUfiZeKrhjAtDUszxF8s=
MIME-Version: 1.0
Received: by 10.220.157.83 with SMTP id a19mr968978vcx.54.1329386832718; Thu,
	16 Feb 2012 02:07:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:07:12 -0800 (PST)
In-Reply-To: <1329357796-27398-14-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-14-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:07:12 -0200
X-Google-Sender-Auth: isz0w9zVTltbbCJbvxjX50LUJKE
Message-ID: <CAP9ODKpoikERXEnHuRNgRofUomrFKtGhhzGXJ9bsyUaC-gVv7w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 13/22] xserver-nodm-init: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:15:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../xserver-nodm-init/xserver-nodm-init_2.0.bb     |   10 +---------
>  1 files changed, 1 insertions(+), 9 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/xserver-nodm-init/
> xserver-nodm-init_2.0.bb b/meta-oe/recipes-graphics/xserver-nodm-init/
> xserver-nodm-init_2.0.bb
> index 2132eab..eec284e 100644
> --- a/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> +++ b/meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init_2.0.bb
> @@ -3,7 +3,7 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
>  SECTION =3D "x11"
>
> -PR =3D "r12"
> +PR =3D "r13"
>
>  SRC_URI =3D "file://xserver-nodm \
>            file://xserver-nodm.service \
> @@ -25,14 +25,6 @@ SYSTEMD_SERVICE_${PN}-systemd =3D "xserver-nodm.servic=
e"
>  do_install() {
>        install -d ${D}${sysconfdir}/init.d
>        install xserver-nodm ${D}${sysconfdir}/init.d
> -
> -       install -d ${D}${base_libdir}/systemd/system
> -       install -m 0644 xserver-nodm.service
> ${D}${base_libdir}/systemd/system/
>  }
>
> -PACKAGES +=3D "${PN}-systemd"
> -
>  RDEPENDS_${PN} =3D "xserver-common (>=3D 1.30) xinit"
> -
> -FILES_${PN}-systemd +=3D "${base_libdir}/systemd/system/"
> -RDEPENDS_${PN}-systemd +=3D "xserver-common (>=3D 1.30) xinit"
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

