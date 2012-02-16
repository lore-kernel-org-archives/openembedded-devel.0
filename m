Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyNr-0005lx-Ks
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:16:16 +0100
Received: by vcbfl15 with SMTP id fl15so1580489vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=QsPV5Ywnq25UQ8PI0YoHEngU+xne+7ZXn1vCiu5waec=;
	b=aX3FaFieqhKdDsrMISEodQ/dh79kWQJ//+EfUG9kRnhhjMIvKIkAtyt7ncM/25pwt0
	cWHg1Q3uoUrmNJc8aYSO9YfH/GoDVuCyQy/JStOeEE3jfQswCYw4G313HdRIIeG6IrRt
	s2QpKmWBR4w7jLPvUZaJGbgapeyW+Knp5t1uU=
MIME-Version: 1.0
Received: by 10.220.157.83 with SMTP id a19mr970372vcx.54.1329386882016; Thu,
	16 Feb 2012 02:08:02 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:08:01 -0800 (PST)
In-Reply-To: <1329357796-27398-16-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-16-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:08:01 -0200
X-Google-Sender-Auth: YEy4_-15LxMxFhe_6ZsV656SkEg
Message-ID: <CAP9ODKoOWtL3-s1jBvRKYkUQ-3fgD7pKnuVUzQ81zS7J3238PA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 15/22] udisks: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:16:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-support/udisks/udisks_1.0.4.bb |    9 +--------
>  1 files changed, 1 insertions(+), 8 deletions(-)
>
> diff --git a/meta-oe/recipes-support/udisks/udisks_1.0.4.bbb/meta-oe/reci=
pes-support/udisks/
> udisks_1.0.4.bb
> index 55b115e..96b6086 100644
> --- a/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> +++ b/meta-oe/recipes-support/udisks/udisks_1.0.4.bb
> @@ -12,7 +12,7 @@ SRC_URI =3D "
> http://hal.freedesktop.org/releases/${BPN}-${PV}.tar.gz;name=3D${BPN} \
>  SRC_URI[udisks.md5sum] =3D "86c63b2b5484f2060499a052b5b6256b"
>  SRC_URI[udisks.sha256sum] =3D
> "854b89368733b9c3a577101b761ad5397ae75a05110c8698ac5b29de9a8bf8f5"
>
> -PR =3D "r2"
> +PR =3D "r3"
>
>  inherit autotools systemd
>
> @@ -21,11 +21,6 @@ SYSTEMD_SERVICE_${PN}-systemd =3D "udisks-daemon.servi=
ce"
>
>  EXTRA_OECONF =3D "--disable-man-pages"
>
> -PACKAGES =3D+ "${PN}-systemd"
> -
> -FILES_${PN}-systemd =3D "${base_libdir}/systemd/system/"
> -RDEPENDS_${PN}-systemd =3D "${PN}"
> -
>  FILES_${PN} +=3D "${libdir}/polkit-1/extensions/*.so \
>                 ${datadir}/dbus-1/ \
>                 ${datadir}/polkit-1 \
> @@ -33,5 +28,3 @@ FILES_${PN} +=3D "${libdir}/polkit-1/extensions/*.so \
>  "
>
>  FILES_${PN}-dbg +=3D "${base_libdir}/udev/.debug"
> -
> -
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

