Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.101.1602688328872880953
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 08:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N3tLQXK4;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id 188so2923016qkk.12
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 08:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BGZEtqhbqTz70DewVP5+YEb4QzEe8757ZUbarArLcbo=;
        b=N3tLQXK49p2uZlSFEU9FO+lmmbMc9bs8/VRp0Q/5g3vVz2sHiBUBPv2KnVjRoGTYWy
         uW5B1w7UPqkIAUTbnzZHsMSu6mxjxZUlWFOR5UiBNftb7dcvbapJT5vdzWbW03khi7zU
         RHec1eq+cJ5J11t3hD0RgJw0RnQd1bGrWRL6gtDWS8vqwzrXXbfdncqJiEaOPVKEX58t
         Pxuri5Z4JRhNE0yiusSPrwBrSfGBAL3pyXgVIA0dV0erGXE3RFfn1Lr/Dbi0bQ7INmOo
         Zh/FTpYFBirgWxjCRe3wwF2bK+VpscCW4obbDDcC2Ku9K9AhVXSg6UCJRE8NZANTR0lE
         9r5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BGZEtqhbqTz70DewVP5+YEb4QzEe8757ZUbarArLcbo=;
        b=DQbunujHd7YsMbatiAA+JHrzhH11qcSmTRneXcX7az3gMn3FC/Ud/MB7EHlEc/Orxt
         FykHITj6NYnFw+yO/uMMptgygUhlK6y01d5n5Ns9Y91OACWwXH3bNFVFKVVTeSp8YWrv
         qbTkxo17XK5/x4n6T4Z22k2F28ZEVRRSfoaKShz79veK4dcbGBGnWwkrGzkjam/pCjSn
         epCYWtXOGX7n5zkO1z+dNdKccGkzol8OMEKKTuGYvPq4KmEALr/tl/gcH4pH9VzjMBXg
         zAaMobD3hH9HKjt25wtfnYgDxRFb5KBn6Qrh1XyMr2wXs8KM4187qfVNe0j+ZqOKResb
         0nrQ==
X-Gm-Message-State: AOAM533pvHrHNDiWAeSKJuxL5j9na86IFcJ9MMrLqty5tuNb83haD+5a
	ZSyo8SLOx/VyFF3psjmCc0kBYzUVXMZ7/cZ3PZo7VbzST2g=
X-Google-Smtp-Source: ABdhPJyXfRe0sTX0yGbL+vr90BhF9NNxfGNR/JlVNHHlDwV4hA8KWVNE4UXz2V8WmlwYatoKvzn8TbkUfruj5tz+wog=
X-Received: by 2002:a37:4015:: with SMTP id n21mr5524229qka.212.1602688327349;
 Wed, 14 Oct 2020 08:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
 <20201014010617.1086948-4-schnitzeltony@gmail.com> <CAMKF1spCYTg55rSRn39s1q230z86KQu9cvMpP5EpPxQ_OY4qqQ@mail.gmail.com>
 <CALbNGRTPfbD+PPfr4UwgTQNe=CDp5sKkb9nJBm6DP4KjGVjDiQ@mail.gmail.com>
In-Reply-To: <CALbNGRTPfbD+PPfr4UwgTQNe=CDp5sKkb9nJBm6DP4KjGVjDiQ@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 08:11:40 -0700
Message-ID: <CAMKF1so0A1Yww=nF0spamcziz_XXSbM=rQS+wBy1+cw7nub2Qg@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/8] wxwidgets: Add what's necessary so that consumers of wxwidgets_git can find it
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 1:19 AM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Oct 14, 2020 at 7:48 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Tue, Oct 13, 2020 at 6:06 PM Andreas M=C3=BCller <schnitzeltony@gmai=
l.com> wrote:
> > >
> > > When I created wxwidgets recipe I had no test case for consumers of w=
xwidgets.
> > > This changed now and it showed that wxwidgets is building fine but is
> > > completely useless: It is a collection of libraries that are impossib=
le to
> > > find for other recipes.
> > >
> > > To get rid wxwidgets now inherits binconfig: wxwidgets creates wx-con=
fig that
> > > at least cmake relies upon. wx-config content had to be adjusted:
> > >
> > > * As is it is a symlink to a useless file: Make it a file with usable=
 contents
> > > * To let wx-config report correct libraries a patch was added disabli=
ng cross
> > >   magic not working here.
> > > * Set full sysroot paths for includedir/libdir/bindir so that sstate =
can adjust
> > >   them when creating recipe-sysroot for recipes depending on wxwidget=
s
> > >
> >
> > is wx-config wrapping pkg-config? if so then perhaps it would be
> > better to make pkgconfig work here instead
>
> Thought about creating a pkg-config either but:
> * wx-config is a tailored script that reports way more than just standard=
 flags
> * cmake ships a module (and projects ship copies of this on their own)
> that does magic stuff with wx-config.
>
> Going that way is a minefield

OK thanks

>
> Andreas
