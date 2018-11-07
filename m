Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4C27079CE4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 20:00:54 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id p18-v6so4872717ywg.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 12:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ZWvM9+FbrVppOUhUKDbGNowa3euPFrUGGlrrHBpZjBc=;
	b=rHW2D8C+9oLNNkJ7VGQ/3Zw6x6D/85CtvGWwBIqhmEQ/4IvNRn/uE1d9DHW5F0LEe4
	Otg3A5cCzekCnkoIHeUlEAvoUnsOkdTgL9YbCnL2EmMYiXo3tYcNvqyJq1Kzb2Jm/Itj
	LsuO9PnlQpmJxkCmNxsHWZfXwJMMM6csd6X8C8Upf1KCOWu5/fJjg17bq6X7US6CA3Hs
	cj6fw6+i82JfJO/POICccdk8RIeI1ve2JtS3ANHmCfbI263eJNdMPA7TN8XIfyhVlAsh
	WJsAGNwnGgdy1yn961gGefcBHiBXD+FBXUWt3QmUuPDnve4zSJTARjR8MQwIEvWo81EC
	XGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ZWvM9+FbrVppOUhUKDbGNowa3euPFrUGGlrrHBpZjBc=;
	b=XELizmZv992TRTm5pqetWg90/2Z/eXA7R0DvjnP9GEyDKhZrF1X6kMVMqPxDIASMSA
	B1nPR/r/lsAO7WUwAUAd03RKrrtZ31tDb9D0z93ZpTOgYejOOJD1xv6/sMBvyN4rDzRA
	Weu7bevMLd18QO7Rt+Z5lvtj8qGPDIrKthThYZeuKZEx5L1+ZXkvxu1OJA2RjgAi/Jeq
	ZEg9dD6MdQbCR2C8gNav9UfX8fKk6RNsJRkp+MhlsKaV9QPAvQjF2SAbJE6JuWX4eQ5F
	wrA0m10Ga2QBLi55TBStATXM6bZHUaCJnqpWeZjZBJlSNwB5lhCJfZfceXLV3BGc5PtP
	aPdA==
X-Gm-Message-State: AGRZ1gLYAAvMypNv31M2OMRDASBafdftTneomR6jshOosjHAxymsu4pU
	35fMlBPFEI7lTq0Rp8LwbgDqrex4v9EeHLZJPDI=
X-Google-Smtp-Source: AJdET5duzDuDvimX5veZ3oQXrqEi0+wGWYeIY19+q0I6Ffj95Pr5KPlEmfLxRrM7Pj5MIV6PYLgP2aiUYZyUBWgH5JQ=
X-Received: by 2002:a0d:ed82:: with SMTP id
	w124-v6mr1624709ywe.447.1541620855218; 
	Wed, 07 Nov 2018 12:00:55 -0800 (PST)
MIME-Version: 1.0
References: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
	<CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
	<fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
In-Reply-To: <fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 7 Nov 2018 21:00:42 +0100
Message-ID: <CALbNGRRcvvXc5zMABsmkXH25cJNyuu5+fgRoXGKNEuin+aE5hw@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Nov 2018 20:00:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 7, 2018 at 8:40 PM akuster808 <akuster808@gmail.com> wrote:
>
>
> On 11/7/18 11:22 AM, Andreas M=C3=BCller wrote:
> > On Wed, Nov 7, 2018 at 8:12 PM Armin Kuster <akuster808@gmail.com> wrot=
e:
> >> fixes
> >> ERROR: Required build target 'blueman' has no buildable providers.
> >> Missing or unbuildable dependency chain was: ['blueman', 'thunar']
> >>
> >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> >> ---
> >>  meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++--
> >>  1 file changed, 3 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.=
bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> index 8eb99ed..06a11b7 100644
> >> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> +++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> >> @@ -27,9 +27,10 @@ RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
> >>  RDEPENDS_${PN} +=3D " \
> >>      python3-dbus \
> >>      packagegroup-tools-bluetooth \
> >> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)} =
\
> >>  "
> >> -
> >> -PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-se=
ndto,,thunar"
> >> +PACKAGECONGIG ??=3D ""
> >> +PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-se=
ndto,,"
> >>
> >>  FILES_${PN} +=3D " \
> >>      ${datadir}/dbus-1 \
> >> --
> >> 2.7.4
> >>
> > This is not right: How shall this happen if meta-xfce is not in your
> > layers - I suggest you run a cleansstate after changing layer
> > configuration
>
>
> I am running the yocto-check-layer.
> Should this recipe really be in
> meta-xfce? .. I am out of options on how to get this to pass. Maybe no
> one cares if it ever does???
Put it to meta-xfce to make script happy - what a waste of time...

Andreas

