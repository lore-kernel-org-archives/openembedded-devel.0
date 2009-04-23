Received: from [74.125.44.152] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LwyCn-0004pf-5Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Apr 2009 14:39:05 +0200
Received: by yx-out-1718.google.com with SMTP id 36so323976yxh.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Apr 2009 05:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=LZI2wfly+128jFwHZ45j6f0u8eszz4D2HWxg7O+469k=;
	b=gMVzcioqw5DlhJIB0WfQL6YyEoz7ZjgIflwEsW4pBfrnHB6Ug1HGPgnRlof31pi2R3
	mVpKYqIDSscciCGXMT7/F9RZLA2ZDqq9wjfkAXNoDIKAkC/weNRmaSb7KWBYUnD6JS/t
	FHHgClmRziVGgFvE+MUEcSvqBU91b7PTe/k5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=Ss/Ilatb5KIUK+dXIjE6Rx52wK9mt9jy3aytHR/Qav8haLdopy725Sx2cXkycKNkeG
	CGmTf6CxEJB/3VeIZ+ti35sAH9ujmtLz9gv0HQ9WFeIBEmNK1bhl6RRj7dXT1x13StWA
	D9cNsqXyViX4dogfTAwpkKY6QkbDnfaKNzbDQ=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.205.15 with SMTP id c15mr1430459ang.89.1240490067330; Thu, 
	23 Apr 2009 05:34:27 -0700 (PDT)
In-Reply-To: <1240488138-32232-1-git-send-email-khimov@altell.ru>
References: <1240488138-32232-1-git-send-email-khimov@altell.ru>
Date: Thu, 23 Apr 2009 09:34:27 -0300
X-Google-Sender-Auth: 31878d9cf9d70cf6
Message-ID: <be7a9f3d0904230534u5b877883l99f7036b473a72db@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: use rootfs.${PN} for IMAGE_ROOTFS
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
X-List-Received-Date: Thu, 23 Apr 2009 12:39:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Thu, Apr 23, 2009 at 9:02 AM, Roman I Khimov <khimov@altell.ru> wrote:
> Allows parallel build for different images.
> ---
> =A0conf/bitbake.conf | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index f53f7d6..15bdf56 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -329,7 +329,7 @@ STAGING_KERNEL_DIR =3D "${STAGING_DIR}/${MULTIMACH_TA=
RGET_SYS}/kernel"
> =A0# Specific image creation and rootfs population info.
> =A0##################################################################
>
> -IMAGE_ROOTFS =3D "${TMPDIR}/rootfs"
> +IMAGE_ROOTFS =3D "${TMPDIR}/rootfs.${PN}"
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


