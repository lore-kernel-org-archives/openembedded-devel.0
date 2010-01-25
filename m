Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1NZOC3-0006KJ-58
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Jan 2010 13:37:26 +0100
Received: by pxi9 with SMTP id 9so2479608pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Jan 2010 04:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=syYl9Ax2DkbPnckDg0vQiBhWrn0KJYinPItWepzmU34=;
	b=Ft4T9W3Rt5yWWbjQF7VzKv7FoH24UFtpX/iUBY6L8jAov9UFKVe1RUwtPKhHUwmVLU
	llX7XDGclblrI/pNljr6YOYLbdiDCEkrZfSSrJt084AXsTvx0D1KIBIRusFe+3td7xNF
	YsTgoIZq2XFyALUoqNneZlvWn3CzQEPV3hs5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=BMCKnIEBtF3nC2TZZCmk64K3PF/6Z1olV0yBM1a2n2qJmkVoJLRLXBCZEe5EuRKZrn
	MGPmRlEVe7S5QHTw6zJJ7Y2h/P9Qm6FNtnupH/G9i/tcxIuqvO5dt5YBnlsn9zo8W1Nv
	Fr9TvXY58QtjwlIN7VT39lh2CzMG7qEDqZ4jI=
MIME-Version: 1.0
Received: by 10.140.180.5 with SMTP id c5mr4648993rvf.270.1264422894708; Mon, 
	25 Jan 2010 04:34:54 -0800 (PST)
In-Reply-To: <1264422161-15538-1-git-send-email-michael.lippautz@gmail.com>
References: <1264422161-15538-1-git-send-email-michael.lippautz@gmail.com>
Date: Mon, 25 Jan 2010 13:34:54 +0100
Message-ID: <70c9a9111001250434t784988d1t430800038ce6bc2d@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] libertas-firmware: Add recipe for libertas firmware.
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
X-List-Received-Date: Mon, 25 Jan 2010 12:37:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello,

I think similar recipe exist yet
(recipes/firmwares/marvell-sdio-fw_9.70.3-p37.bb) so why not use this
?

Regards,

Enric

2010/1/25 Michael Lippautz <michael.lippautz@gmail.com>:
> * Libertas firmware is used by kernel module libertas_sdio, which
> =C2=A0enables wifi on IGEPv2 boards.
> ---
> =C2=A0.../libertas-firmware/libertas-firmware_9.70.3.bb =C2=A0| =C2=A0 18=
 ++++++++++++++++++
> =C2=A01 files changed, 18 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/libertas-firmware/libertas-firmware_9.70=
.3.bb
>
> diff --git a/recipes/libertas-firmware/libertas-firmware_9.70.3.bb b/reci=
pes/libertas-firmware/libertas-firmware_9.70.3.bb
> new file mode 100644
> index 0000000..022115d
> --- /dev/null
> +++ b/recipes/libertas-firmware/libertas-firmware_9.70.3.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION =3D "Firmware for the libertas_sdio kernel module used by IG=
EPv2 board"
> +LICENSE =3D "GPL"
> +PR =3D "r0"
> +
> +SRC_URI =3D "http://extranet.marvell.com/drivers/files/SD-8686-LINUX26-S=
YSKT-9.70.3.p24-26409.P45-GPL.zip;name=3Dfirmware"
> +SRC_URI[firmware.md5sum] =3D "f43e3f4d7fd913e3063309f4cdacc0f7"
> +SRC_URI[firmware.sha256sum] =3D "b1f954d6beef91ad1713e6fe505fa7fe66fb6bb=
cb8e6d18cf700b4374cb358b8"
> +
> +S =3D "${WORKDIR}"
> +
> +do_install() {
> + =C2=A0 =C2=A0tar -xvf ${S}/SD-8686-FEDORA26FC6-SYSKT-GPL-9.70.3.p24-264=
09.P45.tar
> + =C2=A0 =C2=A0install -d ${D}/${base_libdir}/firmware
> + =C2=A0 =C2=A0install -m 0644 ${S}/FwImage/sd8686.bin ${D}/${base_libdir=
}/firmware/
> + =C2=A0 =C2=A0install -m 0644 ${S}/FwImage/helper_sd.bin ${D}/${base_lib=
dir}/firmware/sd8686_helper.bin
> +}
> +
> +FILES_${PN} =3D "${base_libdir}/firmware/*"
> --
> 1.6.4.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


