Received: from [209.85.221.175] (helo=mail-qy0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjEHW-0008Kl-PI
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 17:31:27 +0200
Received: by qyk5 with SMTP id 5so628537qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=snNnkk3/oyxrF17VH62Qto4pG+X5u8q0XoiMi6l31O4=;
	b=WTcHpRthleF4anTT5BxD8gRbuSGXYAZ1oEEsIFOOOolKiRMfpj23kiHSJU9tFNTwBe
	SyV5c4A9xZhWek12Tt55W2qhEk4NiU+NGukKoimbOH8ODueI21zU53J3RfGkWcMiwvPv
	x37/CCzKTOAnvhjv/WtP2m3x45r3wtdVcBRSk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=mfrCS8VImb5fNog8Hw9t7sEh8KJdLahAYZSFVyxq9ZRG8aTsbxfmTNmJaJ2cL1vRBK
	0II6PXYA5KEI6t+PBP/PKy9YAoFGRB+Y9XwwMV6dkJ7yQMOpt9tNYNroNjV+etpWMcBh
	7bZaDdGuptS3/WEm3ZXysQov6lU7Hi/rfbWtg=
MIME-Version: 1.0
Received: by 10.229.129.133 with SMTP id o5mr2882496qcs.45.1251990751976; Thu, 
	03 Sep 2009 08:12:31 -0700 (PDT)
In-Reply-To: <1251813967-16058-1-git-send-email-k.kooi@student.utwente.nl>
References: <1251813967-16058-1-git-send-email-k.kooi@student.utwente.nl>
Date: Thu, 3 Sep 2009 08:12:31 -0700
Message-ID: <19c1b8a90909030812p53103786l3c2a8c8f4c2192c9@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [STABLE][PATCH] xscreensaver: fix packaging and QA
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
X-List-Received-Date: Thu, 03 Sep 2009 15:31:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2009 at 7:06 AM, Koen Kooi<koen.kooi@gmail.com> wrote:
> From: Koen Kooi <koen@openembedded.org>
>
>
> Signed-off-by: Koen Kooi <koen@openembedded.org>

Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0recipes/xscreensaver/xscreensaver.inc =C2=A0 =C2=A0 | =C2=A0 =C2=A0=
3 ++-
> =C2=A0recipes/xscreensaver/xscreensaver_5.07.bb | =C2=A0 =C2=A02 +-
> =C2=A02 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/xscreensaver/xscreensaver.inc b/recipes/xscreensaver=
/xscreensaver.inc
> index a4925ac..5f8cdc0 100644
> --- a/recipes/xscreensaver/xscreensaver.inc
> +++ b/recipes/xscreensaver/xscreensaver.inc
> @@ -10,6 +10,7 @@ DEPENDS =3D "intltool mesa freeglut virtual/libx11 gtk+=
 libxml2 libglade"
>
> =C2=A0# xscreensaver-demo is a glade app
> =C2=A0LDFLAGS_append =3D " -Wl,--export-dynamic"
> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>
> =C2=A0inherit autotools
>
> @@ -30,7 +31,7 @@ EXTRA_OECONF=3D" --with-xml \
>
> =C2=A0PACKAGES =3D+ =C2=A0" xscreensaver-demo xscreensaver-extra"
>
> -FILES_${PN}=3D "${bindir}/xscreensaver ${bindir}/xscreensaver-command ${=
datadir}/applications \
> +FILES_${PN}=3D "${bindir}/xscreensaver ${bindir}/xscreensaver-text ${bin=
dir}/xscreensaver-command ${datadir}/applications \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0${libdir}/X11/"
>
> =C2=A0FILES_${PN}-dbg +=3D "${libexecdir}/xscreensaver/.debug"
> diff --git a/recipes/xscreensaver/xscreensaver_5.07.bb b/recipes/xscreens=
aver/xscreensaver_5.07.bb
> index 8932b6f..cfe5ccc 100644
> --- a/recipes/xscreensaver/xscreensaver_5.07.bb
> +++ b/recipes/xscreensaver/xscreensaver_5.07.bb
> @@ -1,5 +1,5 @@
> =C2=A0require xscreensaver.inc
> -PR =3D "r2"
> +PR =3D "r3"
>
> =C2=A0SRC_URI =3D "http://www.jwz.org/xscreensaver/xscreensaver-${PV}.tar=
.gz \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://configure.in.patch;patch=
=3D1 \
> --
> 1.6.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


