Received: from [209.85.132.240] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lwz8w-0004I8-RQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 15:39:10 +0200
Received: by an-out-0708.google.com with SMTP id b6so337941ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=AchuBO/k6wW3IdqzPVO1YCfrv3T0t6yN81fHxOXsEqA=;
	b=HrbJGJKKdE/Yg4mJFWJsB1NVan7qjEuHZp1hLNLhL/PbV4ZsskFOmYed9jf1bUOjDN
	1ZYdzaBaTTSdYrRDAOMNedSa2kFSPmZimf6U4nO40QNgXHrOJcsmkX2igy4vQTNyKt3M
	Iu/6OwJmGgq116ARV/vltw5TyFqGU0JH5X4+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=FJzyYK4EtNhOCjTnFm8BrZf12HLzRBOowGT92ZfOaOsSOxSjuKzemTpgwjyvZlQL9f
	kA6/uH1HIGdCnh0sNzNIbYTeK3eIyI4mIAjK5L0ecaqTEkKc3iOro88eBsgHL9f1iWiQ
	OzxdgMo1Jn9bWKEr8VxFOFPNLNs0Jza1Gc9pc=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.101.71.3 with SMTP id y3mr1550306ank.62.1240493672891; Thu, 23 
	Apr 2009 06:34:32 -0700 (PDT)
In-Reply-To: <1240492625-24311-1-git-send-email-khimov@altell.ru>
References: <200904231503.30272.marcin@juszkiewicz.com.pl>
	<1240492625-24311-1-git-send-email-khimov@altell.ru>
Date: Thu, 23 Apr 2009 10:34:32 -0300
X-Google-Sender-Auth: 90899efa37fb7db7
Message-ID: <be7a9f3d0904230634y40f84eeaie95cebfa778acb96@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: use rootfs/${PN} for IMAGE_ROOTFS
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
X-List-Received-Date: Thu, 23 Apr 2009 13:39:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Much nicer then first one :-)

On Thu, Apr 23, 2009 at 10:17 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Allows parallel build for different images.
> ---
> =A0classes/image.bbclass | =A0 =A01 -
> =A0conf/bitbake.conf =A0 =A0 | =A0 =A02 +-
> =A02 files changed, 1 insertions(+), 2 deletions(-)
>
> diff --git a/classes/image.bbclass b/classes/image.bbclass
> index cbbbbd1..89d2712 100644
> --- a/classes/image.bbclass
> +++ b/classes/image.bbclass
> @@ -104,7 +104,6 @@ LINGUAS_INSTALL =3D "${@" ".join(map(lambda s: "local=
e-base-%s" % s, bb.data.getVa
>
> =A0do_rootfs[nostamp] =3D "1"
> =A0do_rootfs[dirs] =3D "${TOPDIR}"
> -do_rootfs[lockfiles] =3D "${IMAGE_ROOTFS}.lock"
> =A0do_build[nostamp] =3D "1"
> =A0do_install[nostamp] =3D "1"
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f53f7d6..9e026e4 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -329,7 +329,7 @@ STAGING_KERNEL_DIR =3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}/kernel"
> =A0# Specific image creation and rootfs population info.
> =A0##################################################################
>
> -IMAGE_ROOTFS =3D "${TMPDIR}/rootfs"
> +IMAGE_ROOTFS =3D "${TMPDIR}/rootfs/${PN}"
> =A0IMAGE_BASENAME =3D "${PN}"
> =A0IMAGE_NAME =3D "${IMAGE_BASENAME}-${MACHINE}-${DATETIME}"
> =A0IMAGE_LINK_NAME =3D "${IMAGE_BASENAME}-${MACHINE}"
> --
> 1.6.2.3
>
>
> --
> This message has been scanned for viruses and
> dangerous content by MailScanner, and is
> believed to be clean.
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


