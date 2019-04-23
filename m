Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 52C1E71E5A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Apr 2019 00:07:13 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id i21so10481064iol.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Apr 2019 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=IO3DfdAV4FWEN9Dd3AuCbkn4w27npOiMmBBFKxYzVb8=;
	b=HXgsP/c8rseHf8bSUMmKuk9R8QhWUlNla9vQXROO5rwY0rRsOjZ28z/a3RvPsIaVcq
	CBMlEJumjeQx09OVpyEZQhaVBtnteD2tfLNUJczaoijwn+iBxVrsbU3BEKjaUm2QrTX8
	WiEe4rckjCEvlZzjkwT2Ff0NHg8C8Py1SyRl+4WHIUWApw/W2Buepkyy5R3I5G8O2PwC
	myOPsDv0onfLQ5tqyV3S02Ih4UlAas7docq4wl0lRB4IUiHJCAkOyC8gAU0ry2JOWndP
	oII7JELOD/yea+B6NCihJcCwZ59XPix7Seo7VXRA+79lMTZXij76sbM26VE48quhKHdk
	ln/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=IO3DfdAV4FWEN9Dd3AuCbkn4w27npOiMmBBFKxYzVb8=;
	b=Kmg7vIQQNFjv5ykvhoRd0rN0x07vgX5OkEPHJnzWA484hki+UdzQ3K6RqK30p1A0AN
	aRvqq8HBCzoEr6QT9dYaQt6nBOEKZe3qr68wE/NhcTH196fB54Khv3IR7e/zxvc2O7QC
	U3CgXuRVEagegGCChSdVMnP9XBxESEmsw+V2ywnl+W+mKqQwHr9fy8+WihgzTheGz6LZ
	q3YCyRHHgxyIJNPdxYqB5tgSNf88Ksu5408BNPKNWSGW5HX4/iQMRYvxGozmIDrCgsBr
	SC98PXmtQx36oL1Vy1FeLRblx6zCJFjylx7+1pzBIx4PM4XHGeosQAixHcn0oZFaF2ga
	AOtQ==
X-Gm-Message-State: APjAAAWyEV3vvfzJlhNo8YO3dav6ddxecHnkD7Dv62k8zeYUAx696nJC
	Xtn1L2sOeluono/XQXF0O1YDa4keANuM+4JXtyonJw==
X-Google-Smtp-Source: APXvYqxz86JEVXt9KAUomCwku0JuSgrAU6wu9WXF5uRxTbvA3ZrVMKF/iDviUp9e7mwRWyaqHBXHHM34m19wbwxiUk8=
X-Received: by 2002:a5d:8441:: with SMTP id w1mr2203043ior.99.1555978034320;
	Mon, 22 Apr 2019 17:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190422234617.5419-1-schnitzeltony@gmail.com>
	<e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
In-Reply-To: <e9587755-4b63-90cf-1738-930b808da883@betafive.co.uk>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 23 Apr 2019 02:07:02 +0200
Message-ID: <CALbNGRQdfS-xNdheKuj=AA1zaChsA_g1gb6kMkiU8jGXngfw0g@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] vlc: rework qt PACKAGECONFIG
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
X-List-Received-Date: Tue, 23 Apr 2019 00:07:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 23, 2019 at 1:55 AM Paul Barker <paul@betafive.co.uk> wrote:
>
> On 23/04/2019 00:46, Andreas M=C3=BCller wrote:
> > * qt4 support is gone -> move to qt5
> > * enable qt5 gui in case meta-qt5 is in layers (it is more or less usel=
ess
> >    without gui)
> > * while at it remove noop libtool copy
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> > V1 -> V2: Aargh again typo in commit messeage...
> >   .../recipes-multimedia/vlc/vlc.inc            | 25 ++++++++++++------=
-
> >   1 file changed, 16 insertions(+), 9 deletions(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-mult=
imedia/recipes-multimedia/vlc/vlc.inc
> > index 19ac8206c..6ba1444b5 100644
> > --- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
> > @@ -36,12 +36,18 @@ EXTRA_OECONF =3D "\
> >       --enable-realrtsp \
> >       --disable-libtar \
> >       --enable-avcodec \
> > -    ac_cv_path_MOC=3D${STAGING_BINDIR_NATIVE}/moc4 \
> > -    ac_cv_path_RCC=3D${STAGING_BINDIR_NATIVE}/rcc4 \
> > -    ac_cv_path_UIC=3D${STAGING_BINDIR_NATIVE}/uic4 \
> > +    ac_cv_path_MOC=3D${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/moc \
> > +    ac_cv_path_RCC=3D${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/rcc \
> > +    ac_cv_path_UIC=3D${STAGING_BINDIR_NATIVE}${QT_DIR_NAME}/uic \
> >   "
> >
> > -PACKAGECONFIG ?=3D " live555 dc1394 dv1394 notify fontconfig freetype =
dvdread png ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
> > +PACKAGECONFIG ?=3D " \
> > +    live555 dc1394 dv1394 notify fontconfig freetype dvdread png \
> > +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> > +    ${@bb.utils.contains('BBFILE_COLLECTIONS', 'qt5-layer', 'qt5', '',=
 d)} \
>
> I don't like this change based on BBFILE_COLLECTIONS, it's just a
> different way of having things change when you add an extra layer. We
> wouldn't want an unconditional bbappend in meta-qt5 to set this and so
> we don't want to set it here when that layer is added.
>
> Perhaps we should have qt5 as a distro feature instead?
Isn't that a different naming for the same thing not working properly
if you don't have meta-qt5 in layers?

Andreas

