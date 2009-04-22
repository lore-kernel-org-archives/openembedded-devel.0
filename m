Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwfIo-0006Ov-Vs
	for openembedded-devel@lists.openembedded.org;
	Wed, 22 Apr 2009 18:28:03 +0200
Received: by yw-out-1718.google.com with SMTP id 9so30457ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Apr 2009 09:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=g17O7FuRoMy8fNBtZOBOgz35D1hj4kMKBJvHQlbKAG0=;
	b=aXZJFIcsBySUZkGRaM67UkpUIO7QJ6HhomMsRH9fXm8yWXlPFrQWi5EOMfE7njUrvH
	v7R+KmEtsWPyJchT4NY/pdcfFsIm8PweEKcgKISFcD9OevjN3tqL8NKkito5WS8kvy+I
	wUMHnanRgJJ7pxGpcYB0m/GF2TlhxVDSvTZzo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=D/RN2dbNmcdRGLz+0GOZ2vdAWEp6VipsPlDlexhH6HeU/n1NP1R4f8dPla8U/dIbn1
	klveouNXUI0UMQ4+JmBggC2x/f3rLBoFlUcWehT8SgDsN1V4Q+m7qwZZDUFo50Z2s6Pt
	GsrmAPvxsnEXUbUxKH0zGGf+iC00C6zvFCzzw=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.232.15 with SMTP id e15mr11618797anh.129.1240417410691; 
	Wed, 22 Apr 2009 09:23:30 -0700 (PDT)
In-Reply-To: <1240409577-12275-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1240409577-12275-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Wed, 22 Apr 2009 13:23:29 -0300
X-Google-Sender-Auth: 6afc786f34c6ef10
Message-ID: <be7a9f3d0904220923s13d4eaa5ld4ae0e8492be4812@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] linux.inc: unset CONFIG_LOCALVERSION_AUTO to not get 2.6.27.2-svn8826-dirty26 like names
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
X-List-Received-Date: Wed, 22 Apr 2009 16:28:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Please after it gets into dev, propose it to stable since it is quite usefu=
l.

On Wed, Apr 22, 2009 at 11:12 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Year ago we removed CONFIG_LOCALVERSION from .config to get more sane nam=
es of
> kernels. Today with 2.6.27.2 I got 2.6.27.2-svn8826-dirty26 kernel which =
was
> 2.6.27.2-svn8826-dirty9 on device so no modules ;(
>
> This patch changes this by unsetting CONFIG_LOCALVERSION_AUTO variable.
>
> Signed-off-by: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
> Acked-by: Koen Kooi <koen@openembedded.org>
> ---
> =A0recipes/linux/linux.inc | =A0 =A03 +++
> =A01 files changed, 3 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/linux/linux.inc b/recipes/linux/linux.inc
> index 984efac..5a4a11f 100644
> --- a/recipes/linux/linux.inc
> +++ b/recipes/linux/linux.inc
> @@ -98,8 +98,11 @@ do_configure_prepend() {
> =A0 =A0 =A0 =A0 =A0 =A0 -e '/CONFIG_LOGO=3D/d' \
> =A0 =A0 =A0 =A0 =A0 =A0 -e '/CONFIG_LOGO_LINUX_CLUT224=3D/d' \
> =A0 =A0 =A0 =A0 =A0 =A0 -e '/CONFIG_LOCALVERSION/d' \
> + =A0 =A0 =A0 =A0 =A0 =A0-e '/CONFIG_LOCALVERSION_AUTO/d' \
> =A0 =A0 =A0 =A0 =A0 =A0< '${WORKDIR}/defconfig' >>'${S}/.config'
>
> + =A0 =A0 =A0 =A0echo 'CONFIG_LOCALVERSION=3D""' >>${S}/.config
> + =A0 =A0 =A0 =A0echo '# CONFIG_LOCALVERSION_AUTO is not set' >>${S}/.con=
fig
> =A0 =A0 =A0 =A0 #
> =A0 =A0 =A0 =A0 # root-over-nfs-over-usb-eth support. Limited, but should=
 cover some cases.
> =A0 =A0 =A0 =A0 # Enable this by setting a proper CMDLINE_NFSROOT_USB.
> --
> 1.6.3.rc0
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


