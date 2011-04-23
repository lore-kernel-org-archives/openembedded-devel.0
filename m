Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QDkSo-0004EM-TG
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Apr 2011 23:34:02 +0200
Received: by ewy5 with SMTP id 5so404287ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Apr 2011 14:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=pHFyZ1wDhsRAnDil8UcPJtjJRFc8ltoOmxRlhY+7dhY=;
	b=JPUmyrrXSds5hbLHxfsjZAJ5TP+6VADYtdBNAPUObSUm7CdICIOBtEJPsmidAwTLNH
	QHCXnxALOMjXevuBNRSreDCC8eEczNWMTiODPD5MzCChO5JLuiWiWwYuof8b3l3G0HRf
	yNd2gn2CJV0h3PzuLycXs5mZgsXR/0TZJfFEI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=qw6RoNPL5o1fEhl4hN3/ZZskaTWCLUrGTFQ/3rbtBfc+kJLLpVTNNW7PP4wB9z/zBI
	xPp4yH4dnQ7DeoeGN2Gpip2IQDAkY+eWN9LP4nQePMbeCGzqKopAfGxmkwx95QbpySZL
	ziofYvOst10D6zKuv01+8nk/LAiMaS0ORuevA=
Received: by 10.14.44.151 with SMTP id n23mr863364eeb.124.1303594295404; Sat,
	23 Apr 2011 14:31:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.119.196 with HTTP; Sat, 23 Apr 2011 14:31:05 -0700 (PDT)
In-Reply-To: <1301955176-14829-1-git-send-email-ynezz@true.cz>
References: <1301955176-14829-1-git-send-email-ynezz@true.cz>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 23 Apr 2011 14:31:05 -0700
Message-ID: <BANLkTik92_-9VB08Rfgx-ewWscrbCyspnQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH RFC] modutils-initscripts: fix wrong order of module loading happening in udev
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
X-List-Received-Date: Sat, 23 Apr 2011 21:34:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 4, 2011 at 3:12 PM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> In the current state, udev init script is loaded as 3rd and modutils.sh a=
s
> 20th, so udevadm called in udev init script loads all kernel modules in s=
ome
> unpredictable order, not honoring in any way specified order of modules i=
n
> /etc/modules. This causes some troubles mainly in the first boot. So to f=
ix
> this we now move loading of the kernel modules just before we exec udev i=
nit
> script. Example of the current state:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting udev
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc-m48t86 rtc-m48t86: rtc core: registered m4=
8t86 as rtc0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc-m48t86 rtc-m48t86: battery ok
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ep93xx-rtc ep93xx-rtc: rtc core: registered ep=
93xx-rtc as rtc1
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0root@ts72xx:~# cat /etc/modules
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc-ep93xx
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ohci-hcd
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ts72xx_sbcinfo
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc-m48t86
>
> As you can guess, this is really wrong behaviour, because I've rtc1 as th=
e
> main time source for my system.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0root@ts72xx:~# cat /etc/default/hwclock
> =C2=A0 =C2=A0 =C2=A0 =C2=A0HWCLOCKACCESS=3Dyes
> =C2=A0 =C2=A0 =C2=A0 =C2=A0HWCLOCKDEVICE=3D/dev/rtc1
>
> Expected behaviour with this patch applied:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Please wait: booting...
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ep93xx-rtc ep93xx-rtc: rtc core: registered ep=
93xx-rtc as rtc0
> =C2=A0 =C2=A0 =C2=A0 =C2=A0usbcore: registered new device driver usb
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ohci_hcd: USB 1.1 'Open' Host Controller (OHCI=
) Driver
> =C2=A0 =C2=A0 =C2=A0 =C2=A0...
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc-m48t86 rtc-m48t86: rtc core: registered m4=
8t86 as rtc1
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc-m48t86 rtc-m48t86: battery ok
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Starting udev
>
> Signed-off-by: Petr =C5=A0tetiar <ynezz@true.cz>

Looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =C2=A0recipes/modutils/modutils-initscripts.bb | =C2=A0 =C2=A04 ++--
> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/modutils/modutils-initscripts.bb b/recipes/modutils/=
modutils-initscripts.bb
> index 07f4810..797acb3 100644
> --- a/recipes/modutils/modutils-initscripts.bb
> +++ b/recipes/modutils/modutils-initscripts.bb
> @@ -2,10 +2,10 @@ SECTION =3D "base"
> =C2=A0DESCRIPTION =3D "modutils configuration files"
> =C2=A0LICENSE =3D "PD"
> =C2=A0SRC_URI =3D "file://modutils.sh"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =C2=A0INITSCRIPT_NAME =3D "modutils.sh"
> -INITSCRIPT_PARAMS =3D "start 20 S ."
> +INITSCRIPT_PARAMS =3D "start 2 S ."
>
> =C2=A0inherit update-rc.d
>
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


