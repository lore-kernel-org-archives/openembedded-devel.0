Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyOK-0005wx-KT
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:16:44 +0100
Received: by vbbff1 with SMTP id ff1so1548513vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=t+gYk9H7E09JJpG6RsEyXOumj5nfzifQJzz7pLXIicY=;
	b=i5cdhsaO80QhnR8cpxPXIxJLRe6IbTHrFoEypC7HHHLf0bIarTP+leUwPcqVYIfyti
	jEBpU0SShrwz+k1tp+eTA7MbVGb6YfOcPxBhknkT9gCvwLnF5CPHQl05kbrer2ejU8r5
	BAdFW+tGRv4O2HxXaO2TjgkP0eAEGwPFl/aE4=
MIME-Version: 1.0
Received: by 10.220.108.70 with SMTP id e6mr941593vcp.74.1329386910069; Thu,
	16 Feb 2012 02:08:30 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:08:30 -0800 (PST)
In-Reply-To: <1329357796-27398-19-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-19-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:08:30 -0200
X-Google-Sender-Auth: EgYt-hOHLknS-voVyG1MeJba_Sg
Message-ID: <CAP9ODKrPg+SBVJbXgm35TUQbo8f9BY-Uxgx4JFpseXhhW3xV2A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 18/22] dhcp: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:16:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../recipes-connectivity/dhcp/dhcp_4.2.0.bbappend  |   12 +-----------
>  1 files changed, 1 insertions(+), 11 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> index 4344eaa..829ad3c 100644
> --- a/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> +++ b/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.0.bbappend
> @@ -3,19 +3,9 @@ FILESEXTRAPATHS :=3D "${THISDIR}/files"
>
>  inherit systemd
>
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PRINC :=3D "${@int(PRINC) + 2}"
>
>  SYSTEMD_PACKAGES =3D "dhcp-server-systemd"
>  SYSTEMD_SERVICE_dhcp-server-systemd =3D "dhcpd.service"
>
>  SRC_URI +=3D "file://dhcpd.service"
> -
> -do_install_append() {
> -    install -d ${D}${base_libdir}/systemd/system
> -    install -m 644 ${WORKDIR}/dhcpd.service
> ${D}${base_libdir}/systemd/system
> -}
> -
> -PACKAGES =3D+ "dhcp-server-systemd"
> -
> -FILES_dhcp-server-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_dhcp-server-systemd +=3D "dhcp-server"
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

