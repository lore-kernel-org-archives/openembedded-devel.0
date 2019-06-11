Return-Path: <schnitzeltony@gmail.com>
Received: from mail-it1-f194.google.com (mail-it1-f194.google.com
	[209.85.166.194])
	by mail.openembedded.org (Postfix) with ESMTP id DE8EF7D6A2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 09:14:24 +0000 (UTC)
Received: by mail-it1-f194.google.com with SMTP id m187so3666098ite.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2019 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bghbKh9OkGse6jTsGsS3lY1yApMADIap48X2dVMHXOI=;
	b=m+Gbx8LtEdA5+fVkQYDI4VpRSs9+PTVODNQGrgzeJhceLH3nvC7bYCaPRXIyamnJ9J
	KTdOR0DOhBc+y7RLoL4Ix5+s4G94snZREDVKJ+xus5ysDCvA+Cj9IC9s8/yzCbHUQ4si
	3AnDn5S49Z5gZ5qFFwHKTtQHXWDlXCM1ijWRuxRWq8IxjSNCToSy+ma/z/MeYmGzdjmK
	AH2XttGNrLIi0eeLVzuFx9PRx62UO0VH38wKDjwSss1YI40KtLLGxHiSVUu0+lG3rjLu
	KlV5w48cKFCheu5dsB3zp3oNLDZvn+T5G08sfa+/F/q2bit8bJcq62ZI6irZMaNLz+Ao
	onFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bghbKh9OkGse6jTsGsS3lY1yApMADIap48X2dVMHXOI=;
	b=Kso+3pcPeSlw4FRSKj/z5qXgxxk9+MsNpGaS9E7+gfOCZQ1eMyyfNKRiFK4auEMDdY
	EW8RyjORcfq9o2X8Kq0KFCr/G+emkVR0xreQMZfhC3zcH9GavDijWMojYIHNf1IdjVXT
	CP43ayHOJ1ubnX5uDwnoXaS1Mteihyou93m7zx/GXO4bPt3qp3XhIO+SHbcUYW3aZZ9O
	cIdvB5xz3yeEMHCoG3+gAJ4seZTS4I3Dt2Vr1iFdIjQwW27surXsAWj5cq7Qupdvmi0Y
	1egx++XO0BsCCr5y+6EbHge1OFyC6PdVaDEFgCKSt+W/PTipBRh5lj3au+euCFoRD509
	dcKw==
X-Gm-Message-State: APjAAAVAyrbNXJHVOW6RPS0tpvddZIPKJsNv4KuN0GJkczB0bAW4/RnW
	pAamuQlVkHr/gjagz57jXsi8QbJ1j9LD2uik+df+njhb
X-Google-Smtp-Source: APXvYqyxpstUfz0ifFfthI06LyTQS3Dpljsk0Uacq9A1gz0vF2xnaoplUgrKQc27w1xFjyBVnujxbSs0aLdH0VS7V4I=
X-Received: by 2002:a05:660c:a4d:: with SMTP id
	j13mr18666373itl.116.1560244465767; 
	Tue, 11 Jun 2019 02:14:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190611081516.169741-1-kai.kang@windriver.com>
In-Reply-To: <20190611081516.169741-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 11 Jun 2019 11:14:14 +0200
Message-ID: <CALbNGRT2+nH9of=cw0LyZE9nszeQie-LDiCfa1H2h=2HbRjqMQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-settings: set default theme Adwaita
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
X-List-Received-Date: Tue, 11 Jun 2019 09:14:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2019 at 10:15 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> The pre-configured default theme Xfce doesn't work as expected. For
> example, no layout in start menu and applications' menu bar. And
> GtkColorButton is blank in config tab page from xfce4-terminal -> Edit
> -> Preference -> Colors.
>
> So set Adwaita as default theme instead.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Had other issues and worked around by shipping a default
configuration. Had forgotten the patch added in 2012.

Thanks

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  .../files/0001-xsettings.xml-Set-default-themes.patch  | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.x=
ml-Set-default-themes.patch b/meta-xfce/recipes-xfce/xfce4-settings/files/0=
001-xsettings.xml-Set-default-themes.patch
> index 67df05a79..0463d2ebd 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-=
default-themes.patch
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/files/0001-xsettings.xml-Set-=
default-themes.patch
> @@ -9,6 +9,14 @@ Content-Transfer-Encoding: 8bit
>  Upstram status:  Inappropriate [configuration]
>
>  Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> +
> +Theme Xfce doesn't work as expected. For example, no layout in start
> +menu and applications' menu bar. And GtkColorButton is blank in config
> +tab page from xfce4-terminal -> Edit -> Preference -> Colors.
> +
> +So use Adwaita as default theme instead.
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
>  ---
>   xfsettingsd/xsettings.xml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> @@ -23,7 +31,7 @@ index 65ba1ee..9efb3cd 100644
>     <property name=3D"Net" type=3D"empty">
>  -    <property name=3D"ThemeName" type=3D"empty"/>
>  -    <property name=3D"IconThemeName" type=3D"empty"/>
> -+    <property name=3D"ThemeName" type=3D"string" value=3D"Xfce"/>
> ++    <property name=3D"ThemeName" type=3D"string" value=3D"Adwaita"/>
>  +    <property name=3D"IconThemeName" type=3D"string" value=3D"Adwaita"/=
>
>       <property name=3D"DoubleClickTime" type=3D"int" value=3D"400"/>
>       <property name=3D"DoubleClickDistance" type=3D"int" value=3D"5"/>
> --
> 2.20.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

