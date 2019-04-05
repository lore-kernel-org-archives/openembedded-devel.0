Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id D14D07D689
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:39:53 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id k14so9025834qtb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2019 13:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zzPt7S3yaAbtgBsXntDOp+lfGi/mZolpvfiJO6GQl4Q=;
	b=eqSTExopcEkvPuk9CVWzMZxWYcMcrH+l7nrQ2O9kuYVh3CTQp7CYNAEqJZ9el1JEaA
	UR/qUNzivhstOrsF1OFOQmg26xyfi9nwOmIzrLDd6JvI6hrboq5rWPgh8wLEr162TA59
	DiESM9vtZb7hTGkzEHLJRddqHkbnczcZzxegdWjtEydEKBHf8j1nP6j75RlGTyujyeEJ
	vbwvJlWSdjkVzt3Di0nLC9C2qKQHX0CI70RKOV95lMpCLceLx5IH1mEFwgmp5koYozbw
	YohWEHJxI7PifuUo+GFLHsTXr42ADkIKVmQOKiCgCrf9o8ghDCP5YqgAzwz+NI2ybGqE
	CE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zzPt7S3yaAbtgBsXntDOp+lfGi/mZolpvfiJO6GQl4Q=;
	b=goCI6JMTnQbHHdKlpXSju/MCLuG/OH3pRThzSlguHCDAM0S8HKRyLo/2Ft7Vivoay8
	/5ldlDHhhIqOYd7+vuaXGF903oYHa/BqnKe0d7RjjsRGrAkEK8k8/Vb/6YOY1+yNahPr
	13blCH7ap31+oReF5nzYLZMP/8tZu8Q9lzNZP2EJQUQGoip2M1qCy1O8w3USSIib8WXn
	9rNwaC2oOP+8vzkxK6sOT5/HX0HDutjMWoEmB+6fHez9+WJBxF9mjYXVx0JSc9GGHtsa
	rGqTukWoMcdGD9D9ilNxf4dqgb1wwETIuBgwYtlCdRZTqrcMi0kZYxjchGw15E5+AKTf
	5wDw==
X-Gm-Message-State: APjAAAVJSfdDzbMzqalLyB1qALCXJ32x4mb204eor3eZN0br110P9Vig
	1wfRHCNMssuJ4tt0k86iGUHQF9O+ZoOBSjARhcY=
X-Google-Smtp-Source: APXvYqw3rByDJ3XXbYTgRr1rG80ElFwCfR0z1WG2I/afwwap3/9+ii3l+mgGPLMJclGJsYaJS0YfAU9uI4H+CZG1244=
X-Received: by 2002:a0c:d1a7:: with SMTP id e36mr12341278qvh.127.1554496794567;
	Fri, 05 Apr 2019 13:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190403234608.20046-1-schnitzeltony@gmail.com>
In-Reply-To: <20190403234608.20046-1-schnitzeltony@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 5 Apr 2019 13:39:28 -0700
Message-ID: <CAMKF1sqZteXU-r2Fm9z=cKBcDg8hreVtHoN_46uRnShEEq2STw@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] gnome-desktop3: remove gconf from DEPENDS
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
X-List-Received-Date: Fri, 05 Apr 2019 20:39:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Andreas

I am seeing this

https://errors.yoctoproject.org/Errors/Details/235565/

Maybe turning libseccomp into packageconfig and disabling it by
default would be right thing here

On Wed, Apr 3, 2019 at 4:46 PM Andreas M=C3=BCller <schnitzeltony@gmail.com=
> wrote:
>
> Modern gnome does not use gconf anymore.
>
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> ---
>  meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0=
.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
> index 185a25359..c1a67bda9 100644
> --- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
> +++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
> @@ -15,7 +15,7 @@ SRC_URI[archive.sha256sum] =3D "a6393dc5fc29fc0652ac84c=
73b3da205d0b0168128c4cf6d27
>
>  SRC_URI +=3D "file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long=
.patch"
>
> -DEPENDS +=3D "itstool-native gsettings-desktop-schemas gconf virtual/lib=
x11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
> +DEPENDS +=3D "itstool-native gsettings-desktop-schemas virtual/libx11 gt=
k+3 startup-notification xkeyboard-config iso-codes udev"
>
>  inherit distro_features_check gtk-doc
>  REQUIRED_DISTRO_FEATURES =3D "x11"
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

