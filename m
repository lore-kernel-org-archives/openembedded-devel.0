Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyNG-0005gX-19
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:15:38 +0100
Received: by vcbfl15 with SMTP id fl15so1580189vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=jSkjVyfDcn98g/gh6vRkBxUwgOem7bNJc8BsDWbiKcc=;
	b=payL2gRll4pKPRNIVTh1QM2ewb1Jn/8LJH1WDJhJ6i4kZFLxb7XWepJaTS1MtXQZYg
	aXRV0LZSiCkgM8sfZS+dgVEJZgKJpR5CIUL4ntjjpQ3Edtzev82Zms5TrbH+HOD0dNXW
	c/dXBaAokvVWYokwc7JYCPNAxCWdeZcXvxA7w=
MIME-Version: 1.0
Received: by 10.220.116.2 with SMTP id k2mr974840vcq.44.1329386844755; Thu, 16
	Feb 2012 02:07:24 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:07:24 -0800 (PST)
In-Reply-To: <1329357796-27398-15-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-15-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:07:24 -0200
X-Google-Sender-Auth: lzPN-7nt7WevPMk8lTONdfSczM4
Message-ID: <CAP9ODKpriib5dqUWtQ6Ta+C9KPf0pQ5Wj_nX3MvkNNta7fagmg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 14/22] atftp: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:15:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-extended/atftp/atftp_0.7.bb |   10 ++--------
>  1 files changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/atftp/atftp_0.7.bbb/meta-oe/recipes=
-extended/atftp/
> atftp_0.7.bb
> index ab14a28..6bd44a0 100644
> --- a/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> +++ b/meta-oe/recipes-extended/atftp/atftp_0.7.bb
> @@ -3,7 +3,7 @@ SECTION =3D "network"
>  HOMEPAGE =3D "http://packages.debian.org/atftp"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D94d55d512a9ba36caa9b7df079bae=
19f"
> -PR =3D "r1"
> +PR =3D "r2"
>
>  SRC_URI =3D
> "${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg.orig.tar.gz;name=3Darchiv=
e \
>
>  ${DEBIAN_MIRROR}/main/a/atftp/atftp_${PV}.dfsg-11.diff.gz;name=3Dpatch \
> @@ -29,23 +29,17 @@ do_install_append() {
>     install -d ${D}${sysconfdir}/init.d
>     install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftp=
d
>
> -    install -d ${D}${base_libdir}/systemd/system
> -    install -m 644 ${WORKDIR}/atftpd.service
> ${D}${base_libdir}/systemd/system
> -
>     install -d ${D}/srv/tftp
>
>     rm ${D}${sbindir}/in.tftpd
>  }
>
> -PACKAGES =3D+ "atftpd-systemd atftpd"
> +PACKAGES =3D+ "atftpd"
>
>  FILES_${PN} =3D "${bindir}/*"
>
>  FILES_${PN}d =3D "${sbindir}/* ${sysconfdir}/init.d/* /srv/tftp"
>
> -FILES_atftpd-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_atftpd-systemd +=3D "atftpd"
> -
>  SRC_URI[archive.md5sum] =3D "aa269044a6f992eca78fee2f6119643c"
>  SRC_URI[archive.sha256sum] =3D
> "18815f5b67290fac087c6b9da28dfa5e0feb722096f5c5de52e59b46026da559"
>  SRC_URI[patch.md5sum] =3D "1636f199bf32c754a7bf34a5c647d138"
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

