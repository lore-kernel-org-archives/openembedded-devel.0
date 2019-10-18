Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 04E4E6C3A9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Oct 2019 02:12:32 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id w2so3930160qkf.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 19:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zDgqjE2cnKs93RTT0G5Ru+hN4QMqoklMhf+9Y3IOWuc=;
	b=sohxykSwM3Kgyte1JPhSh90WWtFNMlfJSNx/Uj8CTknGl30UFkDiMTJNtONqljE925
	mwIitmKgg+RIYAAn/BN/sVBT6ptMbQm1QxB7bk4AgerpZXeD93CHiTMW9cwgkELl1jpz
	UHvyuYdxh+DHPG0ojB5T8M7Az1Nb9qhgKmr9vK/LhaHNuUAN2oE3niTCp/YlNK9goj0r
	m9ShXeGwVyoOjwaouKAMijiohAO+WPM12/16rse2P9SfcEWEs9u15YF9J5egSvocwhOQ
	gmf8lv90Ezuer3/2MAZq21J99/+5vYPmfS+KxbxCiGyC5XJikHgX9rtfeeqyPCgGl2hR
	a/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zDgqjE2cnKs93RTT0G5Ru+hN4QMqoklMhf+9Y3IOWuc=;
	b=k6lgfKyh0zozJdsfTydnfybgjRwqu9ZGxbRMN43KjOrN2/CZZF22iMse7A8/hLR/ZC
	MWtLj709zsTv4fP4EJVHJBGNLJoYnbYXElg6TLKfVVaSIRVlWpLPeQZ9ZZIZefDCqw1B
	d5b5Dqnt75yzb4l43LxEkQhzzZfkiKr3jS69EihjlXGIh4WlWzP6GEC2tBQtwDOMw+3l
	gqQzbt5c+velRE46WP9v8Gh8L1J/0rCJfsq1c79fwBAxW/D5NHE2nCDZhFHmBflUuHDX
	sfrtAoOLI4gK6X3aCzm4XuSRmVUM4rEbehU3OcNAeQ/H5zyT+SfqHMCYQFupMtbQGH/X
	ge6w==
X-Gm-Message-State: APjAAAX6bYqZQFlAVI7vfOuMKhXsN+7EX55qNwCm2Tf1lOwJJI93Eg0V
	K92pk8QkBw86kTTfQY9xXlnM1H8Kvy95ubBmHGI=
X-Google-Smtp-Source: APXvYqwiMgKCdGO6oqXPUymzQnAjmkmecSrms1EmM/KKjQHGfPVL7IgOFRIn/M63C4TffldkIBA+jn93gtZ9ojKtsKo=
X-Received: by 2002:a05:620a:14b9:: with SMTP id
	x25mr6677420qkj.9.1571364753355; 
	Thu, 17 Oct 2019 19:12:33 -0700 (PDT)
MIME-Version: 1.0
References: <20191017130318.1978280-1-raj.khem@gmail.com>
	<20191017130318.1978280-2-raj.khem@gmail.com>
	<CALbNGRTVOM5_svEfSdcWQ65ZiBUj_Vqr8ZfqBpTYPQky52_aTw@mail.gmail.com>
In-Reply-To: <CALbNGRTVOM5_svEfSdcWQ65ZiBUj_Vqr8ZfqBpTYPQky52_aTw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Oct 2019 07:42:22 +0530
Message-ID: <CAMKF1sqvB7E7JzhfJTk_i-=6+7fWhEm_Roq2vJYwY+HsohBq-g@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-gnome][PATCH 2/2] dconf: Upgrade to 0.34.0
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
X-List-Received-Date: Fri, 18 Oct 2019 02:12:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

No, it doesn't. But it did fine with older meson

On Thu, Oct 17, 2019 at 8:10 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m>
wrote:

> On Thu, Oct 17, 2019 at 3:03 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  .../recipes-gnome/dconf/{dconf_0.32.0.bb =3D> dconf_0.34.0.bb}  | 4 ++=
--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta-gnome/recipes-gnome/dconf/{dconf_0.32.0.bb =3D>
> dconf_0.34.0.bb} (76%)
> >
> > diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
> b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
> > similarity index 76%
> > rename from meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
> > rename to meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
> > index 8d1bbdfd1a..a1996a1a37 100644
> > --- a/meta-gnome/recipes-gnome/dconf/dconf_0.32.0.bb
> > +++ b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
> > @@ -3,8 +3,8 @@ LICENSE =3D "LGPLv2.1"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495befef8f17206a=
5b0a1"
> >  SECTION =3D "x11/gnome"
> >
> > -SRC_URI[archive.md5sum] =3D "e1ac0b6285abefeed69ca9e380e44f5a"
> > -SRC_URI[archive.sha256sum] =3D
> "68bce78b19bc94cb2c3bb8587e37f9e5e338568c3a674f86edde9c9f1624ffab"
> > +SRC_URI[archive.md5sum] =3D "a3ab18ed51a0494a1c8436fef20cc1b0"
> > +SRC_URI[archive.sha256sum] =3D
> "943a94ab16121de5580ceaed2605b87444d1bca1c6cd8beefb778bcb0aa2da52"
> >
> >  DEPENDS =3D "dbus glib-2.0 intltool-native"
> >
> Have same here: Does it build for you with meson 0.52.0?
>
> Andreas
>

