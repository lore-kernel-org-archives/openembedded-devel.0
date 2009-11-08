Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N79ML-0001jq-1D
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 16:07:20 +0100
Received: by mail-bw0-f217.google.com with SMTP id 9so2497428bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 07:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=8c/rc8lQdc6g9nKAysYv04vb/ipnogGBUXj+CCVsUAY=;
	b=ISZzfU8L4APWY4gsmzZ3YO8aENBhrigl6sGPruMxL7Y2fwq2pN/blU7oyOaTV4JLmP
	ZwmzvHiADc4h5FIABwoFFmUzNa/drdGxhkaVZY9rx9djSvfaP9kh7ZKYw1w/Wbv3v9hN
	qe+ZL1fztOFALW1yMnhohbqvyX4sNEjZEno3A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=sR/HasGo96Sk1XFyJCFo7g+5Uz5/+XmczYbszO7r9JUhGmUMinYBSdYM2XMF6PCChQ
	LT8vuX4BaTOa3wKhzTy3xbjqtPuqu65dHvdK5S5pLZ6ViCNtOSX3wWNYGT+UizJ+dF8l
	EfvEgrZg88KCO5EySPWY2qpSKamecqwZLmMVU=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.94 with SMTP id c30mr602571hbg.159.1257692763325; Sun, 
	08 Nov 2009 07:06:03 -0800 (PST)
In-Reply-To: <1257689055-4508-3-git-send-email-ynezz@true.cz>
References: <1257689055-4508-1-git-send-email-ynezz@true.cz>
	<1257689055-4508-3-git-send-email-ynezz@true.cz>
Date: Sun, 8 Nov 2009 13:06:03 -0200
X-Google-Sender-Auth: dc82723a89cbb1bc
Message-ID: <be7a9f3d0911080706k4a024021y72cab5df77f83da4@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Machine configuration for IEI Nano GX-466
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
X-List-Received-Date: Sun, 08 Nov 2009 15:07:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

On Sun, Nov 8, 2009 at 12:04 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>
> ---
> =C2=A0conf/machine/iei-nanogx-466.conf | =C2=A0 30 ++++++++++++++++++++++=
++++++++
> =C2=A01 files changed, 30 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 conf/machine/iei-nanogx-466.conf
>
> diff --git a/conf/machine/iei-nanogx-466.conf b/conf/machine/iei-nanogx-4=
66.conf
> new file mode 100644
> index 0000000..3bab307
> --- /dev/null
> +++ b/conf/machine/iei-nanogx-466.conf
> @@ -0,0 +1,30 @@
> +# Copyright (C) 2009, Petr Stetiar
> +# Released under the MIT license (see packages/COPYING)
> +#@TYPE: Machine
> +#@NAME: IEI Nano GX-466
> +#@DESCRIPTION: Machine configuration for IEI Nano GX-466 - http://bit.ly=
/t9TOj
> +
> +TARGET_ARCH =3D =C2=A0"i586"
> +
> +require conf/machine/include/tune-geode.inc
> +
> +MACHINE_FEATURES =3D "kernel26 pci vfat ext2 keyboard usbhost sound touc=
hscreen screen serial ethernet"
> +
> +KERNEL_IMAGETYPE =3D "bzImage"
> +IMAGE_FSTYPES ?=3D "ext2 tar.bz2"
> +
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> +PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
> +XSERVER =3D "xserver-xorg \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-evdev \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-mouse \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-tslib \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-geode \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xerver-xorg-module-libint10 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xserver-xorg-module-xaa \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-keyboard"
> +
> +GUI_MACHINE_CLASS =3D "bigscreen"
> +
> +GLIBC_ADDONS =3D "nptl"
> +GLIBC_EXTRA_OECONF =3D "--with-tls --with-cpu=3Di586"
> --
> 1.5.6.3
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


