Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1O9G4i-0008Jv-E4
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 May 2010 13:14:04 +0200
Received: by fxm11 with SMTP id 11so2949466fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 May 2010 04:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=9kqStuSHlUszqMueR+BoGbbwfIZ7w/VNl2SAgROSpFU=;
	b=iT04GnmSzCd+xSLMBkiTdoGX4SnHCXr7TB+rNBP72r5c4l5tPzTbaHqdF9OofcMzPZ
	1HP9R+ZgqLl++DM9gYYU5YKwsq0Nwvz0iFdWFJ2EHvHlMmgQJO5cRgluIOc8+BL2gZZT
	RcehR8j+DQbYJFCywk/YIme3ba/CA9GMYNnN0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=LEuS9kH1v1hV/wrwq4vk73NF4vRbC4A6u8YGVuVeOzxzhVwBu1jJ7TglzI/3u8mGQK
	W9aJe3O1El4x8DJ+pYBywmnDZHExvMlmcmFFJZvjG9LOeTBvJvwaEzllkBqw8FEeiS5Z
	K5Nw0Gdv9YJ+JtHjZJfj8vvaSlrblH0QP1EAE=
MIME-Version: 1.0
Received: by 10.239.133.130 with SMTP id 2mr63947hbv.18.1272971417809; Tue, 04 
	May 2010 04:10:17 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Tue, 4 May 2010 04:10:17 -0700 (PDT)
In-Reply-To: <4BCF22C6.6090109@eric-weiss.de>
References: <4BCF22C6.6090109@eric-weiss.de>
Date: Tue, 4 May 2010 13:10:17 +0200
Message-ID: <h2xd1b08f941005040410n9a14bb94i2c2f5c82f0996d3c@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Support for SHARP Netwalker -PCZ1
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
X-List-Received-Date: Tue, 04 May 2010 11:14:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

+1 from me if you promise you'll be the maintainer ;)

Andrea


On Wed, Apr 21, 2010 at 6:07 PM, eric weiss <eric@eric-weiss.de> wrote:
> hi
>
> My netwalker arrived.
> So i created a new MACHINE for supporting it with OE.
>
> conf/machine/netwinder.conf
> --------------------
> #@TYPE: Machine
> #@NAME: netwinder
> #@DESCRIPTION: Machine configuration for the sharp-z1
> TARGET_ARCH =3D "arm"
>
> PREFERRED_PROVIDER_virtual/xserver =3D "xserver-xorg"
> XSERVER =3D "xserver-xorg \
> =A0 =A0 =A0 =A0 xf86-input-evdev \
> =A0 =A0 =A0 =A0 xf86-input-mouse \
> =A0 =A0 =A0 =A0 xf86-input-keyboard"
>
> GUI_MACHINE_CLASS =3D "bigscreen"
>
> require conf/machine/include/tune-cortexa8.inc
> IMAGE_FSTYPES +=3D "tar.bz2 ubi"
> EXTRA_IMAGECMD_jffs2 =3D "-lnp "
>
> # Guesswork
> SERIAL_CONSOLE =3D "115200 ttyS2"
> MACHINE_KERNEL_VERSION =3D "2.6"
>
> PREFERRED_PROVIDER_virtual/kernel =3D "linux-netwalker"
> MKUBIFS_ARGS =3D "-m 8192 -e 1032192 -c 4085"
> UBINIZE_ARGS =3D "-m 8192 -p 1024KiB"
>
> MACHINE_FEATURES =3D "kernel26 screen apm usbgadget usbhost vfat alsa"
> --------------------
>
> i created successfully an ubi image by hand with these UBI =A0parameters
> but did not tested is for OE.
>
>
>
> greetings
>
> eric
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


