Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web09.287.1630125317490899932
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Aug 2021 21:35:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=emAyvf16;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id y144so9519899qkb.6
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Aug 2021 21:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DZ9c2AHpTy8+fFDSoKhp0orChP4Eu4L7SuUpgiKKMc8=;
        b=emAyvf16qBMEK0e8pLxbM8lkRM7LigTnVHc43i5cjN3eHjyvDa21DPzREwPcfPzDVv
         fGtEKF+/H3xba9EGToQ3vbC+wLSdLbro9By731IR0XJ4yCMPFvKHs7e/D0fm2KfHFlo3
         s9RV2r+VgpT7uep5GgJ3NkSAJxnsyX6pWnPDo+Jt5zJ0HBQY6MRtjOGl3jJ4VC2DhVCO
         iL93TdcJ2OGhGOacKMTQnpuxkA3goN769B9y5QSiy305orJEwIv0d6Me0/1Mblh/jxLb
         qDAMaXhrtzOAAtcX3YYWawj3I2oe9X8/UrM1Yz0AEXZX2N+zLkqaUSZp+mmKDYsKk2xv
         A6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DZ9c2AHpTy8+fFDSoKhp0orChP4Eu4L7SuUpgiKKMc8=;
        b=YFUeO2VpC6vx0NJN1bjYXve4T7+vqqws9RC57ng/lq/6QKKKOIGxrcMlt4DL0FCPaC
         1M4MHhrQe2gOhy5sOtqhf4XUAOLJ1e5Ce8n76sTNbwHmpL4gvWYJnUahW8v08SjDlUcj
         vatJ4PKsAWuEOZgDawtjEK8mgStAmGJBYZotkr0FL1I3KUkfbXonhrMMrD+fS2wXrr42
         vihu3zJDKBpkZBQtNrTS8xMkhFznc2zYU3Cth6sZIilKUKid+WfUhkwhFAVZwpL0gpqZ
         JZQUVKLVll4mw4joSkA0SqJz7a65E/MIrmGlePJnAPLHl762lBbv01ygiaa7umGGl5Xv
         BMhw==
X-Gm-Message-State: AOAM530RBgg9jUuGQztjvOoRP3bU9lJcUNkeSvwuE6tMW7qvAHZH5y4E
	DyfqZRelqWBEZ7DC+7dGrkEedvoNKcY/Cx+kEaQ=
X-Google-Smtp-Source: ABdhPJx558dgVasMEcjMj5r1b4db0SxX08A3B7QgdZOYDyN/3VA/nJlmX1OFUoIL0NMKpZGw2pzLGDXjdDEPcE9aS9c=
X-Received: by 2002:a37:bc8:: with SMTP id 191mr12730308qkl.25.1630125316555;
 Fri, 27 Aug 2021 21:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210827084346.2770947-1-zboszor@pr.hu> <f0a92ad5-1cc1-c383-7ca2-31825762c761@gmail.com>
 <32da7686-4098-2025-bbf4-43aab27c9f4c@pr.hu> <CAMKF1sqPuFD9FiDKOZLKGxZ_adC2D0=ps48crffTtx0oG01jBg@mail.gmail.com>
 <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
In-Reply-To: <ef6e4f5b-044e-0649-ae59-aa25ecba95dd@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 27 Aug 2021 21:34:50 -0700
Message-ID: <CAMKF1sr8H+DSu-w1irXb51cZLAjp5uzXjxs3ex4gTJw2Le1aDQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] metacity: Use autotools-brokensep
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

this patch is better, perhaps worth sharing with metacirty upstream as well=
.

On Fri, Aug 27, 2021 at 9:16 PM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@pr.hu> wrote:
>
> (Resending from the subscriber email.)
>
> 2021. 08. 27. 19:11 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Fri, Aug 27, 2021 at 10:04 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n=
 <zboszor@pr.hu> wrote:
> >>
> >> 2021. 08. 27. 18:49 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> >>>
> >>>
> >>> On 8/27/21 1:43 AM, Zoltan Boszormenyi via lists.openembedded.org wro=
te:
> >>>> From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >>>>
> >>>> The split build directory causes a make error because
> >>>> build/src/core is not created during the build but generated
> >>>> sources are moved to it which fails.
> >>>>
> >>>> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail=
.com>
> >>>> ---
> >>>>    meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb | 2 ++
> >>>>    1 file changed, 2 insertions(+)
> >>>>
> >>>> diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >>>> b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >>>> index a5c704740..969fe13dd 100644
> >>>> --- a/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >>>> +++ b/meta-gnome/recipes-gnome/metacity/metacity_3.40.0.bb
> >>>> @@ -21,6 +21,8 @@ DEPENDS =3D " \
> >>>>    # depends on startup-notification which depends on virtual/libx11
> >>>>    REQUIRED_DISTRO_FEATURES =3D "x11"
> >>>> +GNOMEBASEBUILDCLASS =3D "autotools-brokensep"
> >>>> +
> >>>
> >>> this does not fail on jenkins so I wonder what are the conditions to =
reproduce it.
> >>
> >> Fedora 33 build host, master branches of oe-core and meta-oe.
> >> I also use meta-clang and meta-intel.
> >>
> >> The commit message says it all. metacity-3.40.0/src/core exists
> >> because it was there in the tarball, but build/src/core does
> >> not get created automatically for some reason here.
> >
> > the builders are ubuntu 18.04 and I wonder if there is some race
> > condition here in creating these dirs
> > Does it happen all the time?
>
> For me, it's 3 failures out of 3 attempts.
>
> >
> >>
> >> I can carry this assignment or the equivalent B =3D "${S}" in my local=
 bbappend.
> >>
> >
> > I think if we can understand the underlying problem we can fix it in
> > code itself.
>
> The attached proof of concept patch helps.
> (Only not attaching this time, sending a properly signed patch to the lis=
t instead.)
>
> >
> >> Best regards,
> >> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
> >>
> >>>
> >>>>    inherit gnomebase gsettings gettext upstream-version-is-even feat=
ures_check
> >>>>    SRC_URI[archive.sha256sum] =3D
> >>>> "224c1f65487eac21f0c1d9856152343768ee726c48b1a8a2835a46a8ad9015b5"
> >>>>
> >>>>
> >>>>
> >>>>
> >>>>
> >>>
> >>>
> >>>=20
> >>>
> >>
>
