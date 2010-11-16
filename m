Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIVFb-0004Kj-VG
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:47:49 +0100
Received: by ywg8 with SMTP id 8so375953ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=mQ8cZEP3KqTA5oOg2U2C+aAD7XL4fzNmHMtC3KnL4i4=;
	b=eWfDJYMOC2TAX1iRhclOCpq/JbRXWrqVXd2A5hBvwa4pCVGvaBfjp61squHDyh+kdQ
	jiqbDKs/NX0kdDgVT+xMA2C3OgT1aOvDZOeBqUKDlmfL7ZCRvzjkb/bYxgmS6maLr60V
	pBwgvqOxYDaY3mkT0RgmVhOmlrSy0psklTxYY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=x+ngUwi3GubbMGkex3BBKxoRwUI4WmctxRjQgvAW7Zcqivr1za4tYnImgLEdQWw6E5
	VU3C907E54v9yRNkg4cZcqXQBtjxY6ch8r5IwX8h0cjCGSV62mS9moY6VzrA+Niona//
	SrUNJlFMQnwJCcYQ8fogH7udle0ChPTAje2Mg=
Received: by 10.91.10.21 with SMTP id n21mr10560276agi.75.1289951201633; Tue,
	16 Nov 2010 15:46:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:46:21 -0800 (PST)
In-Reply-To: <1289064813-20133-1-git-send-email-moncelier@devlife.org>
References: <1289064813-20133-1-git-send-email-moncelier@devlife.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:46:21 -0800
Message-ID: <AANLkTikATzziF9bZZo++rnFD3tnARRYtyTF0pcnb1YJZ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Camille Moncelier <moncelier@devlife.org>
Subject: Re: [PATCH 10/11] pcsc-lite: Add support for ccid 1.4.0
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
X-List-Received-Date: Tue, 16 Nov 2010 23:47:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 6, 2010 at 10:33 AM, Camille Moncelier
<moncelier@devlife.org> wrote:
> Signed-off-by: Camille Moncelier <moncelier@devlife.org>
> ---
> =C2=A0recipes/pcsc-lite/pcsc-lite_1.6.4.bb | =C2=A0 35 ++++++++++++++++++=
++++++++++++++++
> =C2=A01 files changed, 35 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 recipes/pcsc-lite/pcsc-lite_1.6.4.bb
>
> diff --git a/recipes/pcsc-lite/pcsc-lite_1.6.4.bb b/recipes/pcsc-lite/pcs=
c-lite_1.6.4.bb
> new file mode 100644
> index 0000000..4c74573
> --- /dev/null
> +++ b/recipes/pcsc-lite/pcsc-lite_1.6.4.bb
> @@ -0,0 +1,35 @@
> +DESCRIPTION =3D "PC/SC Lite smart card framework and applications"
> +HOMEPAGE =3D "http://pcsclite.alioth.debian.org/"
> +LICENSE =3D "BSD"
> +
> +DEPENDS =3D "hal"
> +RDEPENDS_${PN} =3D "hal"
> +

why is RDEPNDS_${PN} needed ?

> +SRC_URI =3D "https://alioth.debian.org/frs/download.php/2795/pcsc-lite-$=
{PV}.tar.bz2 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://pcscd.init "
> +
> +inherit autotools update-rc.d
> +
> +INITSCRIPT_NAME =3D "pcscd"
> +INITSCRIPT_PARAMS =3D "defaults"
> +
> +EXTRA_OECONF =3D " \
> + =C2=A0 =C2=A0 =C2=A0 --enable-libhal \
> + =C2=A0 =C2=A0 =C2=A0 --disable-libusb \
> + =C2=A0 =C2=A0 =C2=A0 --enable-usbdropdir=3D${libdir}/pcsc/drivers \
> + =C2=A0 =C2=A0 =C2=A0 "
> +
> +do_install() {
> + =C2=A0 =C2=A0 =C2=A0 oe_runmake DESTDIR=3D"${D}" install
> + =C2=A0 =C2=A0 =C2=A0 install -d "${D}/etc/init.d"
> + =C2=A0 =C2=A0 =C2=A0 install -m 755 "${WORKDIR}/pcscd.init" "${D}/etc/i=
nit.d/pcscd"
> +}
> +
> +PACKAGES =3D+ "libpcsclite"
> +
> +FILES_libpcsclite =3D "${libdir}/libpcsclite.so.* ${libdir}/libpcsclite.=
so"
> +
> +SRC_URI[md5sum] =3D "d2106e881803784fe2f27922d2d73bc0"
> +SRC_URI[sha256sum] =3D "f5011a7167ad00e312958eace65f14e4cfd20655b02e80f7=
de1438828c7f730a"
> +
> +DEFAULT_PREFERENCE =3D "-1"

why would you want it to be in repo and let no one use it by default.
IOW it would be better if its used by default


> --
> 1.7.3.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


