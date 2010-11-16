Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIV6K-0003kg-Bu
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 00:38:13 +0100
Received: by gyf3 with SMTP id 3so835833gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 15:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=U+w+QvYZUW7rWv6rq4ZwGDydYBrnAAUlOz7q8yAqUwc=;
	b=WVsVpSrPHNA6MMUUdM+vjwo7QrzNG3okPiVhlvAtf/npwFAaFDW3yJajSeTix+A6Lb
	TQy8Wxnlkz3iL5/FHzlZFZJ2U1WOgOzt+1nrSFbiL6jT1YxO0w6BL6M+wFb1de6SOwFr
	oQ48JLGo8P3tCBB8+LdQo+hxcLXgc1E2BAwqY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=NDRt6rPB2C5IVsxmYYQWi9Z1/GEGFwrOOUtbi11/3kqVFOcsjo2ojY82wnae+UOmo4
	YVRdvv8SqEW/CTogIiBE2O9weQgad8Z+wgeXJd3pFpEptYiizt90mYQXNoVzsysoo/i1
	ylpY34Fl+I2XeH/6BJsf1Yaaz7H1ocvrVBT+4=
Received: by 10.90.99.8 with SMTP id w8mr10493696agb.0.1289950625531; Tue, 16
	Nov 2010 15:37:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 16 Nov 2010 15:36:45 -0800 (PST)
In-Reply-To: <1289482655-20086-2-git-send-email-msmith@cbnco.com>
References: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
	<1289482655-20086-2-git-send-email-msmith@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Nov 2010 15:36:45 -0800
Message-ID: <AANLkTi=dDRvt57qZM4cZAvX_903AY9KTGe5+NjxCoNVr@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] usbutils 0.86: delete usb.ids if gzipped version is installed
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
X-List-Received-Date: Tue, 16 Nov 2010 23:38:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 11, 2010 at 5:37 AM, Michael Smith <msmith@cbnco.com> wrote:
> Also split update-usbids.sh to a separate package, and allow building
> when sbindir !=3D /sbin.
>
> Signed-off-by: Michael Smith <msmith@cbnco.com>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/usbutils/usbutils_0.86.bb | =C2=A0 17 +++++++++++++++--
> =C2=A01 files changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/usbutils/usbutils_0.86.bb b/recipes/usbutils/usbutil=
s_0.86.bb
> index 905ad53..000fcca 100644
> --- a/recipes/usbutils/usbutils_0.86.bb
> +++ b/recipes/usbutils/usbutils_0.86.bb
> @@ -4,19 +4,32 @@ DEPENDS +=3D "virtual/libusb0"
> =C2=A0LICENSE =3D "GPLv2"
> =C2=A0PRIORITY =3D "optional"
>
> +PR =3D "r1"
> +
> =C2=A0SRC_URI =3D "${SOURCEFORGE_MIRROR}/linux-usb/usbutils-${PV}.tar.gz =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> =C2=A0inherit autotools
>
> =C2=A0EXTRA_OECONF =3D "--program-prefix=3D"
> -sbindir =3D "/sbin"
> -bindir =3D "/bin"
> +sbindir =3D "${base_sbindir}"
> +bindir =3D "${base_bindir}"
> +
> +PACKAGES =3D+ "${PN}-update"
>
> =C2=A0FILES_${PN} +=3D "${datadir}/usb*"
> +FILES_${PN}-update =3D "${sbindir}/update-usbids.sh"
>
> =C2=A0do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -rf ${S}/libusb
> =C2=A0}
>
> +do_install_append() {
> + =C2=A0 =C2=A0 =C2=A0 # The 0.86 Makefile.am installs both usb.ids and u=
sb.ids.gz.
> + =C2=A0 =C2=A0 =C2=A0 if [ -f ${D}${datadir}/usb.ids.gz ]
> + =C2=A0 =C2=A0 =C2=A0 then
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -f ${D}${datadir}/u=
sb.ids
> + =C2=A0 =C2=A0 =C2=A0 fi
> +}
> +
> =C2=A0SRC_URI[md5sum] =3D "34979f675d2bcb3e1b45012fa830a53f"
> =C2=A0SRC_URI[sha256sum] =3D "b3b2bea6d2cd87660c8201a47071bf2a9889d8ed90c=
7203cc768b597799c12f4"
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


