Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1RaPsy-0004qN-2m
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Dec 2011 11:47:00 +0100
Received: by faaa20 with SMTP id a20so26600faa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2011 02:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=fzVWj1XYPnQdy6yfHbMKArHgracaT0lWmxZq9s8TI20=;
	b=FOyDhQR2P6pjOtEJnIpsbB9/LQdspdKyPiEkyxw5pgCTzWag1VAuR58KLFbkwSskzQ
	a66fzw4zOx15E4s5HsAIpeBONScisp6C2aX5GucJxRUyD2/L/F8tM7zUJUathLj7MQO3
	MlM2x4dGIwTmB9Y5vPtrSrZgeH9oT/KN9+2rE=
MIME-Version: 1.0
Received: by 10.180.104.41 with SMTP id gb9mr33177735wib.9.1323772796712; Tue,
	13 Dec 2011 02:39:56 -0800 (PST)
Received: by 10.223.69.133 with HTTP; Tue, 13 Dec 2011 02:39:56 -0800 (PST)
In-Reply-To: <1323706089-31836-1-git-send-email-s.stirtzel@googlemail.com>
References: <1323706089-31836-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 13 Dec 2011 11:39:56 +0100
Message-ID: <CAGiJk9ey7_apoBb1nKTi_3G77CCGTb2FDvPYw4Ui1Z_FShHNMw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH v2] florence: Initial recipe added
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
X-List-Received-Date: Tue, 13 Dec 2011 10:47:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2011/12/12 Samuel Stirtzel <s.stirtzel@googlemail.com>:
> Florence is a virtual keyboard used to input text with a touchscreen.
>
> Tests:
> * Run tested on Overo Gumstix with xfce-nm-image
> * Build tested for Qemuarm
>
> NOTICE:
> If florence can't find its gconf settings,
> you need to start florence with --config and save the configuration once.
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
> =C2=A0meta-oe/recipes-support/florence/florence_0.5.1.bb | =C2=A0 23 ++++=
++++++++++++++++
> =C2=A01 files changed, 23 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 meta-oe/recipes-support/florence/florence_0.5.1.=
bb
>
> diff --git a/meta-oe/recipes-support/florence/florence_0.5.1.bb b/meta-oe=
/recipes-support/florence/florence_0.5.1.bb
> new file mode 100644
> index 0000000..1f1d7ef
> --- /dev/null
> +++ b/meta-oe/recipes-support/florence/florence_0.5.1.bb
> @@ -0,0 +1,23 @@
> +DESCRIPTION =3D "Florence is a virtual keyboard (also called on-screen-k=
eyboard), which allows the user to input text through a touchscreen."
> +HOMEPAGE =3D "http://florence.sourceforge.net/english.html"
> +
> +#NOTICE: If florence can't find its gconf settings, you need to start fl=
orence with --config for one time and save the configuration once.
> +
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D59530bdf33659b29e73d4adb9f9f6=
552"
> +
> +
> +DEPENDS =3D "gtk+ libxml2 libglade librsvg libxtst gconf cairo gettext-n=
ative intltool-native"
> +
> +
> +SRC_URI =3D "http://switch.dl.sourceforge.net/project/florence/florence/=
0.5.1/florence-0.5.1.tar.bz2 \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
> +
> +SRC_URI[md5sum] =3D "56d12e5b47c100d9df172aa5ddc0f609"
> +SRC_URI[sha1sum] =3D "a3f1c29dd436150002ec14ce9a63de1d72bd1f91"
> +
> +
> +inherit autotools
> +inherit gconf
> +
> +EXTRA_OECONF =3D "--disable-scrollkeeper --without-docs --without-at-spi=
 --without-panelapplet"
> --
> 1.7.5.4
>

Tested it with a fresh rootfs where florence was in IMAGE_INSTALL,
everything worked fine.


--=20
Regards
Samuel


