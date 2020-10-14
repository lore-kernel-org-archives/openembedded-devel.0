Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com [209.85.215.195])
 by mx.groups.io with SMTP id smtpd.web12.7135.1602663563626273514
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 01:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Yy9do0/b;
 spf=pass (domain: gmail.com, ip: 209.85.215.195, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f195.google.com with SMTP id n9so1485843pgt.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 01:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Y0VWCX6AyKp5Q9cMXE477ZZcROFpBc7EfJ8Nigpns0o=;
        b=Yy9do0/bXzDwd8gYzYnmMCiDUS5mDjxu4ohvuUWgnQL94oo4p9D2c1aJAZDa3HFZ5F
         u1jOXPK2Nvyv7ZCrRSlrTcS6MSIOxVmExcHbCtol4u0G/2tv/ezR1ZYynoKX2rceADMt
         BDYbfcAuUD4ivdmn+EL7uACKnvQSujZp1llyJoTtGzMcK5q3xu+mgsKsmy35GwEZgehr
         qRiu2A3uEyhNTUVby5Pjyksfb3rQXMi5FtG5LE87j6+0/25jZCedXX6KqO1Q+NscPqW6
         TRHZZhjxQBFmNgSP0xJRybJ2hOXcjceExTSSho4k2kTLwRQ+vNwhwC/dvcdo4pfnFanh
         3tzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Y0VWCX6AyKp5Q9cMXE477ZZcROFpBc7EfJ8Nigpns0o=;
        b=cYi0sMn+sMF8rvoPLrNmZTEGjTjxRdxTvRoR4+W7xQNySDvOOge8kEp9JoWEzPhthD
         ZX/E/Nz86VrHt5GF4LNbJAXDoO7P3phggBnAXMbJCR3ehiX+K6m7qqljHqZVaIIOWrJw
         tdWkFN5MOyrdF7w9AIMDCtbOIiDMqkowOZ6g1NUtHWTwtWC7Z3rRpkqmn7lM2D55s8HH
         hTqzD2M6GKKqxYmniuL5ogAoclXKJf61MuPEUk6yWKVB7ikmabjBJIGWORmsj6OJz46K
         VFMUqjfAJDau3bqfIrtX5Ed9//L7X4P8BZwsYorUiN8xrOZe3ZeoomxLzecEQlIUf2UF
         eo8Q==
X-Gm-Message-State: AOAM530pnXmPbZnva8Fbh3IR+OfSVqnn+9+G8Qr2gVjcKgrRASfN57tM
	dYGSfZiFnWuERPe/WAOrxZzKmb5Vu/UuhMLkO58=
X-Google-Smtp-Source: ABdhPJyBdtFlS1rT1saZKSiKjNvSdJwGORxCebKyPTs6gXMlwrBKDGzfea/E0UfWq7oFCwTC2baJOJ6UiTxYUTkgLwE=
X-Received: by 2002:aa7:9492:0:b029:152:545f:90d with SMTP id
 z18-20020aa794920000b0290152545f090dmr3269968pfk.9.1602663563012; Wed, 14 Oct
 2020 01:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20201014010617.1086948-1-schnitzeltony@gmail.com>
 <20201014010617.1086948-4-schnitzeltony@gmail.com> <CAMKF1spCYTg55rSRn39s1q230z86KQu9cvMpP5EpPxQ_OY4qqQ@mail.gmail.com>
In-Reply-To: <CAMKF1spCYTg55rSRn39s1q230z86KQu9cvMpP5EpPxQ_OY4qqQ@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 14 Oct 2020 10:19:10 +0200
Message-ID: <CALbNGRTPfbD+PPfr4UwgTQNe=CDp5sKkb9nJBm6DP4KjGVjDiQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 4/8] wxwidgets: Add what's necessary so that consumers of wxwidgets_git can find it
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 7:48 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Oct 13, 2020 at 6:06 PM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > When I created wxwidgets recipe I had no test case for consumers of wxw=
idgets.
> > This changed now and it showed that wxwidgets is building fine but is
> > completely useless: It is a collection of libraries that are impossible=
 to
> > find for other recipes.
> >
> > To get rid wxwidgets now inherits binconfig: wxwidgets creates wx-confi=
g that
> > at least cmake relies upon. wx-config content had to be adjusted:
> >
> > * As is it is a symlink to a useless file: Make it a file with usable c=
ontents
> > * To let wx-config report correct libraries a patch was added disabling=
 cross
> >   magic not working here.
> > * Set full sysroot paths for includedir/libdir/bindir so that sstate ca=
n adjust
> >   them when creating recipe-sysroot for recipes depending on wxwidgets
> >
>
> is wx-config wrapping pkg-config? if so then perhaps it would be
> better to make pkgconfig work here instead

Thought about creating a pkg-config either but:
* wx-config is a tailored script that reports way more than just standard f=
lags
* cmake ships a module (and projects ship copies of this on their own)
that does magic stuff with wx-config.

Going that way is a minefield

Andreas
