Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.1677.1615248942872638255
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Mar 2021 16:15:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ve7Ef1TO;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id b130so11332362qkc.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 08 Mar 2021 16:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rPw5tu0WCohfBPvo6mfm8+2TL3WoMWFeeqtTKWP6t3Y=;
        b=Ve7Ef1TO7K7aB4cly7v1Hasyb2W0lTQzKoa3y0HgGmWXm+5zPhkdC1znsCN+XsT9IU
         O/pgxdcSZwukAp6FiYPZBRq63ASifEQZP7cX6/w2317M8RLZ6hgfMvmTLEK1wwqyhcNb
         lGdQKsWXSsAlBHZxzTWhKLwWZ0ZoMRc2ZfgFASv6rrAZOZEXiZPXb39++nD9fagA/V80
         E8SLCweOTAqiZl2bKVCdCcNZo9Yd01e1HnWMFHCuj8ViLitWf0O5i7B01WvlYIciR7ro
         FOSbirVOTJdQa/5MgOg+oBzvO5Jb7+4HnwQ9pOto4P95L5XBERRQwIr93sdfjQAhS9C1
         DZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rPw5tu0WCohfBPvo6mfm8+2TL3WoMWFeeqtTKWP6t3Y=;
        b=cwuOBGAljs39r4zNychY4fO9QWvqudJt8bgrY6fgGA3qaWbqzvB1ZQFD9AjcAQJax7
         EIonVVdAIj3AeDLP0Yp4pSDTRQxhh2OIFh0XPb0hDM38u+OcBpkGAqVeaa9qfQa1/VWT
         0An+lTelYLCFpsG8T16OsZdWqlR/XQfsgPpb8jl8ORthtHsZnwu1ro6RyqG7rgxUVZLT
         9wHjTd1JOnMKfYjbVQiaX5ijZk32ozj2N7uLKwH00s1dBURMULqu17US+srIf1XYQ5oq
         s3PiVb+I3XCQhCEtHgiDNG+o1i53Xnjf+P/Hi6IC5mjyKkdjjIxWnVeJMDZmWMRusnMj
         d2RA==
X-Gm-Message-State: AOAM531rczE7qjniC+0z3g8mshV4ybxlRC6rTRWjQBRtPuswsYUZHfir
	0Syz20yXol7Zpfbak5s/+wUjuXsJhjcpsFTtg5g=
X-Google-Smtp-Source: ABdhPJwelKJ+EMP5rdBaimPElkqsTYq8jgQdf9o85I4uFbf/izKU49tbBcdDDaT1GGvZ+jpHNgm2ET7bw2xMnFfbSGk=
X-Received: by 2002:a37:a350:: with SMTP id m77mr22876064qke.146.1615248941848;
 Mon, 08 Mar 2021 16:15:41 -0800 (PST)
MIME-Version: 1.0
References: <20210308135318.1651724-1-dwagenknecht@emlix.com> <CALbNGRS=1CtvfApuUURtrt1CEiGjW9GD+1P0qey+cwtEGh2p0w@mail.gmail.com>
In-Reply-To: <CALbNGRS=1CtvfApuUURtrt1CEiGjW9GD+1P0qey+cwtEGh2p0w@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 8 Mar 2021 16:15:15 -0800
Message-ID: <CAMKF1sowJo0vzoHhqxXiSn0Qh6cPKnzy+cmizQhPhzym_mv_rA@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-keyring: set file capabilities in pkg_postinst
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: Daniel Wagenknecht <dwagenknecht@emlix.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 8, 2021 at 11:23 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Mar 8, 2021 at 2:55 PM Daniel Wagenknecht
> <dwagenknecht@emlix.com> wrote:
> >
> > file capabilities need to be set on gnome-keyring-daemon. This is now
> > possible using pkg_postinst function on the build host. Previous
> > workarounds are not needed anymore.
> >
> > Signed-off-by: Daniel Wagenknecht <dwagenknecht@emlix.com>
> > ---
> >  .../recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb   | 8 +++----=
-
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34=
.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
> > index 52c254b28..be6d922bc 100644
> > --- a/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-keyring/gnome-keyring_3.34.0.bb
> > @@ -43,9 +43,7 @@ FILES_${PN} +=3D " \
> >      ${libdir}/pkcs11/gnome-keyring-pkcs11.so \
> >  "
> >
> > -# fix | gnome-keyring-daemon: insufficient process capabilities, unse=
cure memory might get used
> ^ Please leave this part of the comment - it is still valid and
> explaining why setcap is necessary

right, since its a comment I have edited the patch and staged it in master=
-next.

> > -# This does not make it through pseudo so perform on-target - sigh
> > -pkg_postinst_ontarget_${PN} () {
> > -    setcap cap_ipc_lock+ep `which gnome-keyring-daemon`
> > +pkg_postinst_${PN} () {
> > +    setcap cap_ipc_lock+ep $D/${bindir}/gnome-keyring-daemon
> >  }
> > -RDEPENDS_${PN} +=3D "libcap-bin"
> > +PACKAGE_WRITE_DEPS +=3D "libcap-native"
> > --
> Cheers
>
> Andreas
>
>=20
>
