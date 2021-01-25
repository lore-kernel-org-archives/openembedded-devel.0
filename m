Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web10.1777.1611594928083084708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Jan 2021 09:15:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MgTWVzhN;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id b17so1505460plz.6
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Jan 2021 09:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ljvg6HQ/AlsMPCK9Raffexb0Rf4aeQN/Zl+7wcUx/z4=;
        b=MgTWVzhNYvS0CKLcZCjwfV3sfheWanBbNcP18/aeWx+K6u1Su7W3glHcfrv3t/MTp5
         m7sQ6SQ7WLvd9mAyuJ+X854OZzG+OSyklfquUqoFH+5X++XXVr5OS7TwalPb6PVZVsjQ
         nVdtzbOAzeP1F8HwURhwYzXeT4VjiYfq2zJfrw05SHtyjmi+4dNwfYgTrZh7IM0eC5o8
         R0ilie7hFhQ/PffaJJ4R6ZiRZ9H2ncDP+gdyMk9z9387d85CEjrqqUPcqQchioBOKUYs
         q5toQuplK02qud8VjMkwTzXqp/XJkcisVgBYea0X1KVcpxMtGtdvOzIBB1nMmKN/Ca+h
         tHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ljvg6HQ/AlsMPCK9Raffexb0Rf4aeQN/Zl+7wcUx/z4=;
        b=jDWc96PY1vzekMcYnzfYng/zngkO33IciKwrviLUDqhvSEra5FHes91YHsQyoJRyHD
         aQOQZDHiAhhHutsWiBz06T5s5XAPbYitl8ujPqj84Iidh7yc2DkzmH7OJSlAgkfkd46v
         bXlFmh52PdbEvEgRinAucuclVs3EoEP5J8EATtwUnVSQN0V8p4lYpm97DaYvUvW+dZMo
         onPKXIhao/7CwsmwcEu6ZRgAqK8f103bUajeVIKIq7ywUnLu1U2HHvBhD+ohH3KGWB+W
         GHEIhxWhZDc+wqnKJK8oF9jQj0mNadez4B7hsk91y6u3fHEKBsXPEwpl5SVjYaT4Ic+M
         s1Lw==
X-Gm-Message-State: AOAM532q6k/i31ilGRpLhh+bK1Qii2aZAZQKLLyeFF0krDQKNm/+FTCw
	UlMkL1Enhl8L8/VfwAzqO0mG1+ak9qsiMu1OnSE=
X-Google-Smtp-Source: ABdhPJwsVFVdOYqpiRdUR2ojx7WZ/HXXfFvRwKrDupPFGqbx36NX2DDvRCHuB1VUzT6BjYDlHrZK8WKQ2OPjwbdOV2Y=
X-Received: by 2002:a17:902:c085:b029:de:ad05:8e90 with SMTP id
 j5-20020a170902c085b02900dead058e90mr1486571pld.42.1611594927560; Mon, 25 Jan
 2021 09:15:27 -0800 (PST)
MIME-Version: 1.0
References: <20210125163136.2497652-1-adrian.freihofer@siemens.com> <CALbNGRR2FXO1MRnfUpfND_N+rBrRZ9AO4fV0cGK1UWfPc=pU8g@mail.gmail.com>
In-Reply-To: <CALbNGRR2FXO1MRnfUpfND_N+rBrRZ9AO4fV0cGK1UWfPc=pU8g@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Mon, 25 Jan 2021 18:15:15 +0100
Message-ID: <CALbNGRR3G29swaE0kTVaNjobtwOt1tpX07XUJZcutt7jd40WRg@mail.gmail.com>
Subject: Re: [oe][meta-networking][PATCH] networkmanager: add missing readline depends
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2021 at 6:09 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Mon, Jan 25, 2021 at 5:31 PM Adrian Freihofer
> <adrian.freihofer@gmail.com> wrote:
> >
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> >  .../recipes-connectivity/networkmanager/networkmanager_1.28.0.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/ne=
tworkmanager_1.28.0.bb
> > index 1053bdd42..7338290e1 100644
> > --- a/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.28.0.bb
> > +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanage=
r_1.28.0.bb
> > @@ -17,6 +17,7 @@ DEPENDS =3D " \
> >      libnewt \
> >      jansson \
> >      curl \
> > +    readline \
> >  "
> >
Hi Adrian,

pressed 'send' accidentally...

readline is an optional dependency for nmcli. Since readline is GPLv3,
not everybody is happy having it in unconditionally, I suggest you
introduce a PACKAGECONFIG for that - default add or not is up to you
(or what do others think?)

Cheers

Andreas
