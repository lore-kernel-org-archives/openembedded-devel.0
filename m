Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIVGj-0004Q9-5D
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:48:58 +0100
Received: by yxd5 with SMTP id 5so860446yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=AGSssA5OHetUEmx1VcdXI9mnUV4I2uZnyztJ6q9Zvvg=;
	b=aK4EOeO0AkAelEjI6QeCyH0ijsgWCbBv16+ApZLrn0oF86EO2J9kpSlHM5MlgIyJsK
	6LQookqUbQZCM/FGXhRQzn0b8pLN7mvLUzpEt4LGBCSHgSFL1lav7LyqRE1i7V3Jz/wN
	I8ckqOIXUu/osqbPn2X7PYiNEkNwuz7txv1Yk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=hTmRUcTXbBjA9DFCU1Qo78zmL5XDD9Q/kRxH30kftmgMIUYWYLFw54kP+yzz5Ys3pF
	vxcMtuUgiCEg9lMkZFPFnOsVex4xSAZAkr5WabzOXVsaedxdE5H0zTXtqNiJycDZ+nhE
	Ih14NknL47QyGcN4ual3vybGxVcCsjDVG7KE0=
Received: by 10.91.51.19 with SMTP id d19mr10462315agk.183.1289951271007; Tue,
	16 Nov 2010 15:47:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:47:28 -0800 (PST)
In-Reply-To: <1289064813-20133-2-git-send-email-moncelier@devlife.org>
References: <1289064813-20133-1-git-send-email-moncelier@devlife.org>
	<1289064813-20133-2-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:47:28 -0800
Message-ID: <AANLkTimSDzH7C9po2dpps3xpLw59cjpue24w8O7eDe18@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 11/11] ccid: Bump version to 1.4.0 (Needs pcsc-lite > 1.6.2)
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
X-List-Received-Date: Tue, 16 Nov 2010 23:48:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:33 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> ---
> =C2=A0recipes/ccid/ccid_1.4.0.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 28 ++++++++++++++++++++++++++++
> =C2=A0recipes/ccid/files/no-cardman-5321.diff | =C2=A0 10 ++++++++++
> =C2=A02 files changed, 38 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/ccid/ccid_1.4.0.bb
> =C2=A0create mode 100644 recipes/ccid/files/no-cardman-5321.diff
>
> diff --git a/recipes/ccid/ccid_1.4.0.bb b/recipes/ccid/ccid_1.4.0.bb
> new file mode 100644
> index 0000000..b104374
> --- /dev/null
> +++ b/recipes/ccid/ccid_1.4.0.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION =3D "Generic USB CCID smart card reader driver"
> +HOMEPAGE =3D "http://pcsclite.alioth.debian.org/ccid.html"
> +LICENSE =3D "GPL"

be specific on GPL version

> +PR =3D "r1"

should be r0

> +
> +DEPENDS =3D "virtual/libusb0 pcsc-lite"
> +RDEPENDS_${PN} =3D "pcsc-lite"
> +
> +SRC_URI =3D "http://alioth.debian.org/download.php/3333/ccid-${PV}.tar.b=
z2 \
> + =C2=A0file://no-cardman-5321.diff;apply=3Dyes \
> +"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--enable-udev"
> +
> +do_install_append () {
> + =C2=A0 =C2=A0 =C2=A0 install -d "${D}/etc/udev/rules.d"
> + =C2=A0 =C2=A0 =C2=A0 install -m 644 "${S}/src/pcscd_ccid.rules" "${D}/e=
tc/udev/rules.d/85-pcscd_ccid.rules"
> +}
> +
> +FILES_${PN} +=3D "${libdir}/pcsc/"
> +FILES_${PN}-dbg +=3D "${libdir}/pcsc/drivers/*/*/*/.debug"
> +
> +SRC_URI[md5sum] =3D "745d681bed2e17579fa6144e19bcb01d"
> +SRC_URI[sha256sum] =3D "a0b6e56c54f311c4cb39eef0f362e4e6d388bf815a15532e=
4524d2be1723b4ff"
> +
> +DEFAULT_PREFERENCE =3D "-1"

try to make it usable for all.

> diff --git a/recipes/ccid/files/no-cardman-5321.diff b/recipes/ccid/files=
/no-cardman-5321.diff
> new file mode 100644
> index 0000000..504c061
> --- /dev/null
> +++ b/recipes/ccid/files/no-cardman-5321.diff
> @@ -0,0 +1,10 @@
> +--- ccid-1.3.11/readers/supported_readers.txt.old =C2=A0 =C2=A0 =C2=A020=
09-09-28 18:12:42.000000000 +0200
> ++++ ccid-1.3.11/readers/supported_readers.txt =C2=A02009-09-28 18:12:53.=
000000000 +0200
> +@@ -43,7 +43,6 @@
> + 0x076B:0x4321:OmniKey CardMan 4321
> + 0x076B:0x5121:OmniKey CardMan 5121
> + 0x076B:0x5125:OmniKey CardMan 5125
> +-0x076B:0x5321:OmniKey CardMan 5321
> + 0x076B:0x6622:OmniKey CardMan 6121
> + 0x076B:0xA021:Smart Card Reader
> + 0x076B:0xA022:Teo by Xiring
> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


