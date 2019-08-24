Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 00E297E1E7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 17:37:29 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id 201so11010840qkm.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2019 10:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Os0FfVfW2Mk77o4+yKzR2vm5RdYZEJGIpmnwL7aa1AI=;
	b=PKWNjDhiObAYzX0dHMoo7GpIGgTfnzIVLZcFE8iHdOO5QySFwXsJbuADlGkqwBq5Aw
	25PH91xIW0ezEMaufrFhgnDPDwwWNy8vezR7Ki606IyTTHomLWyYjzEDi+r9Jl8Zt7a7
	TVegVRCSsSO+zYeKqq6I7GYvy6bSbQcpCV1H2s0igd9vjOOHLmhhzrtYlHkBqS8RhuGj
	UE5od/x9awCwoJNLjhKbCMyJoUMvSHIN8k8wMVvTNiTer+Ys/yIL+yhiYyf8Bw+GJn+x
	qrUPzbAAODGm6TGYFIMpuJfyMhVTuqD9oYR/4yYRQuHWpYz5fh22N6p2PLJqUgJaWb7e
	NaLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Os0FfVfW2Mk77o4+yKzR2vm5RdYZEJGIpmnwL7aa1AI=;
	b=sUOvb55FVu6YGm0i3K1pV0hbidBzcq3H1sAM6UDXjZxCDU514SNlh/LePNIlpKzma+
	2IVclom2HpPRgcBxI52vCA3uIUPmlkoYjEJy2Ksfl559dzLdmrirzXC6yyFIDGAqY+Xf
	13wJ1VPBWdfoKFbEMZMlpS5eqzirTHHuK6UzKHEWgCdONv4pNJaOx+wD3Yv2OC0jMgOl
	3o8DPfDfxGV1sMEKbEWwbs5/iK3glexE8WfQD+4lwQiXiOhNv3wRfB1f387425QMsbd4
	R8/9CnoR/z9E4h42sZvBIv8zABwyUjvrqMq+FHSy2y07fMej2uQ0SXfaRGH2ixS97JLz
	LKMQ==
X-Gm-Message-State: APjAAAXg2S5E1VSnCTRRvrrOD3qexYvvnymjFxX+XvcBoCEJQFs4UbA8
	yTL2yvYJ9DGwGPR6Ied/gdgtE5/8PkGa7wOJGnLhWIm0
X-Google-Smtp-Source: APXvYqzhsj6pzKglVeGi324lQact3GCcrMPr0R+RgW0mgLC1ymBBsdlLmbpsmITlpWcgJg0PnaCTV7NI42vHjOiKiQk=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr9855645qke.212.1566668250582; 
	Sat, 24 Aug 2019 10:37:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190821123824.17831-1-bunk@stusta.de>
	<53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
In-Reply-To: <53f16418-c309-9809-969a-faf81fb0c0a9@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2019 10:37:04 -0700
Message-ID: <CAMKF1srz7wYH8AmV_38Nqb12jLDJN_mbd8PpfkGK-LY-5nE-oQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Adrian Bunk <bunk@stusta.de>
Subject: Re: [meta-networking][PATCH] networkmanager: Upgrade 1.18.0 -> 1.18.2
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
X-List-Received-Date: Sat, 24 Aug 2019 17:37:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2019 at 1:14 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> On 2019/8/21 =E4=B8=8B=E5=8D=888:38, Adrian Bunk wrote:
> > Remove a generated file with always changing hash from LIC_FILES_CHKSUM=
.
>
> Why not just upgrade to version 1.20.0 which is the latest major release?
>

this still is useful, if its a bugfix only release, as it could be
considered for backport to release branaches.

> Regards,
> Kai
>
> >
> > Signed-off-by: Adrian Bunk <bunk@stusta.de>
> > ---
> >   .../{networkmanager_1.18.0.bb =3D> networkmanager_1.18.2.bb}   | 5 ++=
---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >   rename meta-networking/recipes-connectivity/networkmanager/{networkma=
nager_1.18.0.bb =3D> networkmanager_1.18.2.bb} (95%)
> >
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_1.18.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.18.2.bb
> > similarity index 95%
> > rename from meta-networking/recipes-connectivity/networkmanager/network=
manager_1.18.0.bb
> > rename to meta-networking/recipes-connectivity/networkmanager/networkma=
nager_1.18.2.bb
> > index 9ce2d961d..b760a40c3 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.18.0.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.18.2.bb
> > @@ -5,7 +5,6 @@ SECTION =3D "net/misc"
> >   LICENSE =3D "GPLv2+"
> >   LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dcbbffd568227ada506640fe950=
a4823b \
> >                       file://libnm-util/COPYING;md5=3D1c4fa765d6eb3cd2f=
bd84344a1b816cd \
> > -                    file://docs/api/html/license.html;md5=3D233931303e=
f80eded167add1f60a50c1 \
> >   "
> >
> >   DEPENDS =3D " \
> > @@ -31,8 +30,8 @@ SRC_URI_append_libc-musl =3D " \
> >       file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
> >       file://musl/0002-Fix-build-with-musl.patch \
> >   "
> > -SRC_URI[md5sum] =3D "c8c27116a8083bab5d5fcca0d03e988a"
> > -SRC_URI[sha256sum] =3D "c6e8df25e5a3c7309bc17664be8971689314884cdd08af=
dd6b0847d29d2a8ba6"
> > +SRC_URI[md5sum] =3D "ca1e6175c6ba97ca1adf65a67861ccd9"
> > +SRC_URI[sha256sum] =3D "4dd97ca974cd1f97990746527258f551f4257cbf011fec=
d01d10b7d74a6fa5c3"
> >
> >   UPSTREAM_CHECK_URI =3D "${GNOME_MIRROR}/NetworkManager/1.16/"
> >   UPSTREAM_CHECK_REGEX =3D "NetworkManager\-(?P<pver>1\.10(\.\d+)+).tar=
.xz"
>
>
> --
> Kai Kang
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

