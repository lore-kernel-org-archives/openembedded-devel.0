Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.7785.1621696697185942929
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 May 2021 08:18:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iLjZxgW2;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id t9so4021704ply.6
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 May 2021 08:18:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LWh3gRGLJTRXR2OLTIRw9uQXrlx+P9LTtaaLpika5Cg=;
        b=iLjZxgW2MhqdxwZjea90zwy2+d69EqyPqmr+cO8jRfJ4vENUbcmzyvoMm1IQfpGaTc
         OaitaG61VXpnYLpyDBTWXlDaeTJz43HOKxz5V8N4XArOD/xrWlOV0pODCMtENT0L4ubu
         ssK2dUXEq1nIy7xau/51YAXtWcl6u5ESqI56U4VL6zsIrdt2Wxd+VKHtV0WRQmMSOwLg
         nDeikH7Nc3Nhbch7lfDa/Rq5w56D/a/zcDEBXkPS/NPXGMm8uT5RynAEgH1l1bczMt0J
         V6PuXHN04JQwZUqvvVaUXApV+vYGIQWzuymZ0M+7QU2fEHvREUG9oKke/adL8wBBGw+S
         JfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LWh3gRGLJTRXR2OLTIRw9uQXrlx+P9LTtaaLpika5Cg=;
        b=e7m17TMCWobP46GGJOLeVVQRtzf+HrEgS+ed8OM/bWLRqmddfqpCp3Q2BbgJ0vBNcK
         5Y661jKpWTyUK0F//XQfkKtsJubrQQWwhLzfACUhZSPsc9/Yq+/Vgxu78Q+Jl4eHqxZN
         rtkhPLLvzIn4Wh3c3+SDuZbEWo22SZhu+ZzjjN6mvtYyrGRAV+U39aMp0/+2Y3PYY89B
         DkrKMZBLbPwRNWTAQnPjAtbcSHUM2podZmUeCSlSLwvAVbG3E+5xDSIViRakGcZ5kT0M
         e11R/AZ565LScXckFYvQfX7JiA7PEBAn7hlWAaQI+9QBH4JMT9hhyboptExHls9wwlLU
         lWHw==
X-Gm-Message-State: AOAM532x4jHp2H9EKqlQ7WZ7WI+fQs1VIFOSeOJp0RrfbYhid0pQ4eak
	rb9TyACOoiCs9RlqhmzSwptXVLZoWa4/rh8tjaE=
X-Google-Smtp-Source: ABdhPJyeKMlNOmk949MtDTijsR/8NrvLeSwBGhuBf91IM0A3+jq4sc9XkWXT+leuZ7nArkBUtHZ5AsjSgUN69geB+1g=
X-Received: by 2002:a17:90b:2397:: with SMTP id mr23mr15621505pjb.77.1621696696762;
 Sat, 22 May 2021 08:18:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210522082605.16975-1-schnitzeltony@gmail.com> <CAMKF1spxUhja3kvLhyW_hSLFTXwXoFApC558-un3Sc2xAsdP=g@mail.gmail.com>
In-Reply-To: <CAMKF1spxUhja3kvLhyW_hSLFTXwXoFApC558-un3Sc2xAsdP=g@mail.gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Sat, 22 May 2021 17:18:04 +0200
Message-ID: <CALbNGRRNfkKaHxYWajHBoyeh75CpsPKJ4sQkhw+wR90vEMvWSQ@mail.gmail.com>
Subject: Re: [oe] [PATCH][v2] giflib: upgrade 5.1.4 -> 5.2.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 22, 2021 at 2:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, May 22, 2021 at 1:26 AM Andreas M=C3=BCller <schnitzeltony@gmail.=
com> wrote:
> >
> > * Project removed autotools configuration files. So it is now a pure Ma=
kefile
> >   build which requires autotools-brokensep
>
> if autotools support is removed then I wonder if using any of
> autotools classes is the right thing to do
Correct - the only helpful task could be do_install but that is
overriden here anyway. V3 comes in a few hours...

Cheers

Andreas
