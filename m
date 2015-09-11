Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id D25C973CBD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 07:34:03 +0000 (UTC)
Received: by ioiz6 with SMTP id z6so88542469ioi.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Sep 2015 00:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=KY6YCa874FWdBSpFc33skwEzh15U9Q9jGpteqih71Yg=;
	b=q+W+9Nf9QJzPr9mS8O9HOy8PafIu2pevAHLDvU7ZzKKoTMrV+gQ24XkViNwFJkiDmb
	qR23CFiqFrDN4sDKuGARj1gFLOZ+hZIPLPLjul/SA/cwMZJ5QjhkR76gWV9JC8d39561
	avtUyW9drI+v9T/crk8MFQmOHGW283YVETCiJNl5G9V/aRIGcrMYRiu/EnLXzBwodalb
	ZKiEraHVZFZ7wFkyZGiNpYHr//jGhTZsmOhouOYZq+vD4tBKdxH4rbTUicckRT08T90E
	BJRfjhbWisg18XmKFqflnDzz03Kw3F/il7wTuoLlp8rq+g0jejVPFEMwQT6WOA7DaiDv
	vSng==
MIME-Version: 1.0
X-Received: by 10.107.10.79 with SMTP id u76mr1196222ioi.99.1441956843659;
	Fri, 11 Sep 2015 00:34:03 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Fri, 11 Sep 2015 00:34:03 -0700 (PDT)
In-Reply-To: <1441956129-8191-1-git-send-email-jackie.huang@windriver.com>
References: <1441956129-8191-1-git-send-email-jackie.huang@windriver.com>
Date: Fri, 11 Sep 2015 09:34:03 +0200
Message-ID: <CALbNGRSDKb=ax=pQpRKDH4k+gEPFESoSsEvWpZNjoM7M7Gxwug@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] libxfce4ui: add RDEPENDS on PN for PN-gtk2 and PN-gtk3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Sep 2015 07:34:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2015 at 9:22 AM,  <jackie.huang@windriver.com> wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
> gtk libs was separated into PN-gtk after commit:
> d4e5b33 libxfce4ui: build gtk3 libs and pack gtk2/gtk3 libs in separate p=
ackages
>
> but config files such as xfce4-keyboard-shortcuts.xml
> is in PN, it works without this, but there no any keyboard
> shortcut, add the RDEPENDS so that the libs and config
> files will be both installed.
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
> index 26d21c1..723c20d 100644
> --- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
> +++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.12.1.bb
> @@ -28,3 +28,6 @@ FILES_${PN}-dev +=3D "${libdir}/glade3/modules/*.la \
>  PACKAGES +=3D "${PN}-glade"
>  FILES_${PN}-glade =3D "${libdir}/glade3 \
>                       ${datadir}/glade3"
> +
> +RDEPENDS_${PN}-gtk2 =3D "${PN}"
> +RDEPENDS_${PN}-gtk3 =3D "${PN}"
> --
> 1.9.1
>
Acked-By: Andreas M=C3=BCller <schnitzeltony@goolglemail.com>

