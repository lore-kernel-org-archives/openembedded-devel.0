Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PisZe-0006LM-0V
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 18:57:30 +0100
Received: by ywi6 with SMTP id 6so1170371ywi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 09:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=Zt3PXQkrVXwNEGQHu7jDaHPUfU0W55Q04gDhUwurBFw=;
	b=TKxuUNJzhW3QPNRlArOfS1L/mxXkjSF21goE1gOQELjt/nzuh3xuDCsE3iiQCc7Wz/
	AdnJiu5xVlmTtcmh0MJtCGE+H4HBo+ilyP9jVmk4Q13wCuKMCIJDheMMd1Cgr0x1H7SN
	AE1ELppLUxkNihJkSeBk8Gq203NJefvFMO4kE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=yDmreIDZ8EHmtKwc/4vb2Pb2ZVRdr4VGaReJhDzwz3nX4J51Mv/JfCyxNk6fE0QVHm
	d0sL1vzxTfFXJZB2BJo90QkAR5d9758Qrly/jbOa6zEwMEYkKMDEscnZ0X1jjXL8nhZj
	AyW/ilwinTdL+J9ptpSOIf0o4CDSeigyqEIDc=
Received: by 10.90.81.19 with SMTP id e19mr5199889agb.7.1296237399439; Fri, 28
	Jan 2011 09:56:39 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.32.12 with HTTP; Fri, 28 Jan 2011 09:50:42 -0800 (PST)
In-Reply-To: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
References: <1296219611-14580-1-git-send-email-sujak.marek@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Jan 2011 09:50:42 -0800
Message-ID: <AANLkTim0qsgQExvKhTQtPAyZz8cPos4osWFDDmxfEhjx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] VMX25: Add machine support for vmx25
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
X-List-Received-Date: Fri, 28 Jan 2011 17:57:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 28, 2011 at 5:00 AM, sujak.marek <sujak.marek@gmail.com> wrote:
> * Add config file for http://voipac.com/#X25-DKT-265
>
> Signed-off-by: sujak.marek <sujak.marek@gmail.com>
> ---
> =C2=A0conf/machine/vmx25.conf | =C2=A0 38 +++++++++++++++++++++++++++++++=
+++++++
> =C2=A01 files changed, 38 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 conf/machine/vmx25.conf
>
> diff --git a/conf/machine/vmx25.conf b/conf/machine/vmx25.conf
> new file mode 100644
> index 0000000..8ba7197
> --- /dev/null
> +++ b/conf/machine/vmx25.conf
> @@ -0,0 +1,38 @@
> +#@TYPE: Machine
> +#@Name: Voipac vmx25 module
> +#@DESCRIPTION: Machine configuration for Voipac vmx25 module & baseboard
> +#@Homepage: http://voipac.com/#X25-DKT-265
> +
> +TARGET_ARCH =3D "arm"
> +
> +PREFERRED_PROVIDER_virtual/bootloader =3D "barebox"
> +PREFERRED_PROVIDER_virtual/kernel =3D "linux"
> +PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"

what xserver is chosen is s distro choice do not lock it here.

> +
> +PREFERRED_VERSION_linux =3D "2.6.35"

kernel should not be pinned in conf file but in the kernel recipe itself
you should add PREFERRRED_PROVIDER_yourmacine =3D ...

> +
> +MACHINE_FEATURES =3D "kernel26 alsa ext2 usbhost usbgadget touchscreen k=
eyboard"
> +
> +GUI_MACHINE_CLASS =3D "bigscreen"
> +XSERVER ?=3D "xserver-xorg \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-tslib \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-evdev \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-mouse \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-input-keyboard \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 xf86-video-fbdev \
> +"

this two defines should be part of distros to pin not machines.

> +# Data Image FG0700K6DSSWBG01 TFT lcd
> +#MACHINE_DISPLAY_WIDTH_PIXELS =3D "800"
> +#MACHINE_DISPLAY_HEIGHT_PIXELS =3D "480"
> +#MACHINE_DISPLAY_PPI =3D "133"
> +
> +# ubi fs args
> +MKUBIFS_ARGS =3D "-m 2KiB -e 126KiB -c 989"
> +UBINIZE_ARGS =3D "-m 2KiB -p 128KiB -s 512"
> +
> +IMAGE_FSTYPES +=3D "tar.gz ubi"
> +
> +require conf/machine/include/tune-arm926ejs.inc
> +
> +# used by sysvinit_2
> +SERIAL_CONSOLE =3D "115200 ttymxc0"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


