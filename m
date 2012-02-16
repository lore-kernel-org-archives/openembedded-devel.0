Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RxyM7-0005GD-Mq
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Feb 2012 11:14:27 +0100
Received: by mail-vw0-f47.google.com with SMTP id ff1so1547320vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Feb 2012 02:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=KKw2vZh30aMHSzpCksdSH22eSKLHoE4ZC/CBCG2LKlA=;
	b=DbgIblrixHx7ugp3/JjXFvTyJqpuIpuXOuxjVH2M7SZlkHXzqKSJy//oTEknfwLezj
	plx8VixGUda8Py3klzAD+1Rv9zvciimD+6Nmc+d8GnHEMDGa7YQhaMqUwlHyLE+nLc0/
	IebEd5zncgkF1c16RowPaZH8qkuSKUsIojaJ0=
MIME-Version: 1.0
Received: by 10.52.67.229 with SMTP id q5mr768355vdt.14.1329386775402; Thu, 16
	Feb 2012 02:06:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.220.3.84 with HTTP; Thu, 16 Feb 2012 02:06:15 -0800 (PST)
In-Reply-To: <1329357796-27398-11-git-send-email-schnitzeltony@googlemail.com>
References: <1329357796-27398-1-git-send-email-schnitzeltony@googlemail.com>
	<1329357796-27398-11-git-send-email-schnitzeltony@googlemail.com>
Date: Thu, 16 Feb 2012 08:06:15 -0200
X-Google-Sender-Auth: BqCRLlS7H89_RVo7FFWegbAh0co
Message-ID: <CAP9ODKoYHsA9YBsZCUuB8KhnyxVBxzVYmW8+ESE0n1K7KPLRLQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][v2] 10/22] openssh: remove unneeded systemd code
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
X-List-Received-Date: Thu, 16 Feb 2012 10:14:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Feb 16, 2012 at 00:03, Andreas M=FCller
<schnitzeltony@googlemail.com>wrote:

>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../openssh/openssh_5.9p1.bbappend                 |   14 +-------------
>  1 files changed, 1 insertions(+), 13 deletions(-)
>
> diff --git a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
> b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
> index 3f68e09..de7668f 100644
> --- a/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
> +++ b/meta-oe/recipes-connectivity/openssh/openssh_5.9p1.bbappend
> @@ -1,6 +1,6 @@
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PRINC :=3D "${@int(PRINC) + 2}"
>
>  SYSTEMD_PACKAGES =3D "openssh-sshd-systemd"
>  SYSTEMD_SERVICE =3D "sshd.socket"
> @@ -8,15 +8,3 @@ SYSTEMD_SERVICE =3D "sshd.socket"
>  inherit systemd
>
>  SRC_URI +=3D "file://sshd.socket file://sshd@.service
> file://sshdgenkeys.service"
> -
> -do_install_append() {
> -       install -d ${D}${base_libdir}/systemd/system
> -       install -m 644 ${WORKDIR}/sshd.socket
> ${D}${base_libdir}/systemd/system
> -       install -m 644 ${WORKDIR}/sshd@.service
> ${D}${base_libdir}/systemd/system
> -       install -m 644 ${WORKDIR}/sshdgenkeys.service
> ${D}${base_libdir}/systemd/system
> -}
> -
> -PACKAGES =3D+ "openssh-sshd-systemd"
> -
> -FILES_openssh-sshd-systemd +=3D "${base_libdir}/systemd"
> -RDEPENDS_openssh-sshd-systemd +=3D "openssh-sshd"
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

