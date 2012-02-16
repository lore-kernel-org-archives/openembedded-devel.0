Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyMk-0005GD-JZ
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:15:08 +0100
Received: by mail-vw0-f47.google.com with SMTP id ff1so1547320vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=GULT55Y5cMMkdAVOWHKXsirI1GLR2arjtvW7r3XwSYs=;
	b=buEiKDKCWskdt36Db70HQ2COa3iJpEM5vz74RoYjx4QIaJQzmRG+MdQn7ezB3oT11g
	iWaVMYuhBD1kClb5nHyDgWCF8YyB+DltjKJ7n1uzoub40Guk/HU5rPEB6+4m1BmvAuWB
	HIwsKVvQ3A0FcEeGxIgwVcIYybcqJJivEirC0=
MIME-Version: 1.0
Received: by 10.52.72.107 with SMTP id c11mr752333vdv.48.1329386815813; Thu,
	16 Feb 2012 02:06:55 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:06:55 -0800 (PST)
In-Reply-To: <1329357796-27398-13-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-13-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:06:55 -0200
X-Google-Sender-Auth: Pn4J8NOCjFSSF4q02b4vebLbYDA
Message-ID: <CAP9ODKpY-goTjRWRitKPRHkvQr5SQgktyDObdNfcm_G=7oUraQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 12/22] cronie: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:15:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-extended/cronie/cronie_1.4.8.bbappend  |   12 +-----------
>  1 files changed, 1 insertions(+), 11 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> b/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> index e0b9fb9..5aedb21 100644
> --- a/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> +++ b/meta-oe/recipes-extended/cronie/cronie_1.4.8.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in the layer first
>  FILESEXTRAPATHS :=3D "${THISDIR}/${PN}"
>
> -PRINC =3D "1"
> +PRINC =3D "2"
>
>  inherit systemd
>
> @@ -9,13 +9,3 @@ SYSTEMD_PACKAGES =3D "${PN}-systemd"
>  SYSTEMD_SERVICE_${PN}-systemd =3D "crond.service"
>
>  SRC_URI +=3D "file://crond.service"
> -
> -do_install_append() {
> -    install -d ${D}${base_libdir}/systemd/system
> -    install -m 644 ${WORKDIR}/crond.service
> ${D}${base_libdir}/systemd/system
> -}
> -
> -PACKAGES =3D+ "${PN}-systemd"
> -
> -FILES_${PN}-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_${PN}-systemd =3D "${PN}"
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

