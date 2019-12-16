Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id D97837F7D4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 02:38:53 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id w47so4620208qtk.4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 18:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dQWm0KGZ1JrbIVoZdhgbVDxr5O9kXy5L0lA2nOU20GA=;
	b=jml+SPIm2uehoxP2jF2P2f9lShofQKjHeHSWSzFQfbv+gSwdhym5D9SkepZLQq4cL1
	X79ZCQBFZK43+YFalZj77lqlIlclZ6AoAWN7r9S6iIDzrGLxNoJRacFigxR0qkr24GjO
	lkHRiFlLM1dFi2XtL98zHnlmWnfxoeXQUFZXW50A1jDVhKh03qhcHPbjxcqW6HFxbKUx
	ONwIHaauZxj2ySmuhlh55Cgso71EYRpsUSNauN+FGap02eaFU2gATx82cN2VrYwaAbqK
	LC9noSbpuGaUqS6FoFwP6cOBotykBfV2AwK7AwTgBekLRkeU1Ukx/500cxcwFcMLMAY0
	ukWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dQWm0KGZ1JrbIVoZdhgbVDxr5O9kXy5L0lA2nOU20GA=;
	b=DjMubcPZgAKTH4w4vqsTr7/kU7MtkWgN43djHDmEtSgtBkePU6gID++QmxMPDCGySk
	3y1ZmD4HLPnW2mbAy1E6ybXCDYuHCrZGeZ3gNrrA4i5kw/a9j2+s0CYNXhmXnT1gxTAW
	TuHxmXo0OafU2aeddRvgq0LZnsPVA1Ng2p7gVFbMRvG/GHrdyvkKSABqtqRJu8PXDyEp
	cNpN7ANiBvWz0B4KDPGnfVyDeQDEUlA2Gn/6LkQvAjkHMFRUcNA14tt8zdCMtXuGNIgf
	bgKa9fPopRIJLB6fxV8YPf+jq5/iKfkAdNdppwzodQSvuUhqNZd9JJflnGGZIayEEIlY
	fU9g==
X-Gm-Message-State: APjAAAVRGWWi6JjV6uyhH+c3/qEf20wjskZzGhyHSd/mUnKR9o/UG9Yk
	Tlvj2p20t500s8k6g9LNDKRK8+J9+txpTzrNxeo=
X-Google-Smtp-Source: APXvYqxLP/gBgbmw9Rl0nuqemxQ6EJrLtAYuw8D20OWH82ehf6Tj3c27SL3IwmE6hxCIh+eiNU/PqXoLEnRRJT01mVk=
X-Received: by 2002:ac8:6ca:: with SMTP id j10mr19338571qth.378.1576463934569; 
	Sun, 15 Dec 2019 18:38:54 -0800 (PST)
MIME-Version: 1.0
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
In-Reply-To: <20191216012047.17312-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 Dec 2019 18:38:44 -0800
Message-ID: <CAMKF1srCPLK1a-230PZ-m_pQO0rOa8GiXNfVwihGJ8yAtU1AQA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/6] libxfce4ui: give up glade3 (=glade for gtk2) support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Dec 2019 02:38:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 15, 2019 at 5:21 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> index 053eb201b..348b685be 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.14.1.bb
> @@ -17,7 +17,6 @@ SRC_URI[sha256sum] =3D
> "c449075eaeae4d1138d22eeed3d2ad7032b87fb8878eada9b770325bed
>  EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
>
>  PACKAGECONFIG ??=3D ""
> -PACKAGECONFIG[gladeui] =3D "--enable-gladeui,--disable-gladeui,glade3"


Here it would now use defaults and since glade3 is gone from deps it will
disable it I guess
But could you explain why we want to remove this

>
>  PACKAGECONFIG[gladeui2] =3D "--enable-gladeui2,--disable-gladeui2,glade"
>  PACKAGECONFIG[startup-notification] =3D
> "--enable-startup-notification,--disable-startup-notification,startup-not=
ification"
>
> @@ -28,9 +27,7 @@ FILES_${PN}-gtk3 +=3D "${libdir}/libxfce4ui-2.so.*
> ${libdir}/libxfce4kbd-private-3
>  PACKAGES +=3D "${PN}-glade"
>  FILES_${PN}-glade =3D " \
>      ${libdir}/glade \
> -    ${libdir}/glade3 \
>      ${datadir}/glade \
> -    ${datadir}/glade3 \
>  "
>
>  RDEPENDS_${PN}-gtk2 =3D "${PN}"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

