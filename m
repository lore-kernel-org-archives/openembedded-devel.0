Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyPT-0006Cj-0f
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:17:55 +0100
Received: by vbbff1 with SMTP id ff1so1549128vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=m+1uB4gZSThyFf2v9N+w7H4DGCa1M/bCyuZenadmRkc=;
	b=NXGrOsOoCuCOlwDq3ylCtwhMoPP2L7r6HhNwZNjvVAfXpDqYP13/aB4xtgJDJjlrxN
	FSekOYIeHQ7pFc2G5vaPvAw4yyaBvHK41bM+urielPhZnG8/l2JQ0MjVjaUVqeT4q7ek
	NhlmEI2UT/RBKztpYgLuD8N9QBuL76zSyaZhc=
MIME-Version: 1.0
Received: by 10.220.108.70 with SMTP id e6mr943640vcp.74.1329386981547; Thu,
	16 Feb 2012 02:09:41 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:09:41 -0800 (PST)
In-Reply-To: <1329357796-27398-17-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-17-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:09:41 -0200
X-Google-Sender-Auth: OG5acNjDo3SdjBY9C9ji3krCi88
Message-ID: <CAP9ODKrxacqL9wPwVux4QJ8w2LHQfntkgoJiXV3DPHZARrDNAQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 16/22] rsyslog: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:17:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog.inc |    7 +------
>  1 files changed, 1 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> index ea7fa22..d4552cf 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog.inc
> @@ -4,7 +4,7 @@ HOMEPAGE =3D "http://www.rsyslog.com/"
>  LICENSE =3D "GPLv3"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D51d9635e646fb75e1b74c074f788e=
973"
>
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>
>  SRC_URI =3D "
> http://www.rsyslog.com/files/download/rsyslog/${PN}-${PV}.tar.gz \
>            file://rsyslog.conf"
> @@ -20,9 +20,4 @@ do_install_append() {
>         install ${WORKDIR}/rsyslog.conf ${D}${sysconfdir}/rsyslog.conf
>  }
>
> -PACKAGES =3D+ "${PN}-systemd"
> -
>  CONFFILES_${PN} =3D "${sysconfdir}/rsyslog.conf"
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

