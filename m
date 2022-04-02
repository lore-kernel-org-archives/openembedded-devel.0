Return-Path: <schnitzeltony@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB224C636F8
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:45 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.10424.1648893401870543448
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Apr 2022 02:56:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYEFIE2a;
 spf=pass (domain: gmail.com, ip: 209.85.215.169,
 mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id c11so4212985pgu.11
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Apr 2022 02:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=aLLOe+Ja1rpkZ1/Q0FXk12ocs3hwZLquOyhRv4cBeoE=;
        b=UYEFIE2azqaV2UF33riLxeQpgXv3hzcooW6YQyLXu3suszHb7UqUJwsaPyFaJ9RLTD
         FqS70Uckw82nFWyt/kY5i1w7cCjJ8hFe+pPURBa/r18jqSgbFvsXVqyV4h3SL6wLk/T9
         hFTD3fim0pQ8yQvP27tdN3ClBYqlkUzFdbtM+RlMauP7O5C0X95JLJ6BWjBBZ3eQy/Oy
         TJbyHryzvf7F4iuQkkAfY2BssywjkKu3Oy121/kyaPW9kgavaSsVP8l06ETWnXLDFiwZ
         8v/xocZiwZQ0Z8XE/FFJvZfWmTwuZxWUhEguiISja4XaUIsdYs39nhGB9fcAQ0Jq6phS
         YaTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=aLLOe+Ja1rpkZ1/Q0FXk12ocs3hwZLquOyhRv4cBeoE=;
        b=dGidANnRKbGZGhXd0y2MqmWUOyJb5CaJHvhw2zfT4rBgE/20mODNllLOW/FEy2t7rg
         XJOZ3rsssTM2zCn9bd8FhArp6OJkfdJ36eHOHGRMig6aPEwYF3s5Rkt352wog745eLZz
         BRYtQjudwMpH49AtOQrt07vx+2BjJIiyIq1GdMpOqPz9zJS9EVGb+CJp7kOkecayWbg7
         28Dy1AMNEqXOxP7M0A7tQqZ5x2Dc257Vnj7oFxdZABDMn/X/KulJ/AVhyp7F8lQdyh3B
         6vg6tCplpgr9pf4mmNSBCuN4Hfdnie/tc6UvWExbTx9P3ApScX9xn0XtsjZ14ks2cGTV
         yflQ==
X-Gm-Message-State: AOAM533xqkiJ1kSLJtHQaoeihT+Nat16QenZnH/6JGDWR3FlLnyJinQF
	adLJa2PQifhoKbqT8ZZrhaTikxhwjc8p5scfRDM=
X-Google-Smtp-Source: 
 ABdhPJwBvNSWc+dOW6V0OcawvGfkUX8mwDm6cBEZFEqQCo5sc0ThMmr4umYnfDqDiqPGAfIlD/gMEUQah4LghjVl7+o=
X-Received: by 2002:a63:6e48:0:b0:397:fb23:794f with SMTP id
 j69-20020a636e48000000b00397fb23794fmr18200909pgc.338.1648893401324; Sat, 02
 Apr 2022 02:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220401223705.1818622-1-schnitzeltony@gmail.com>
 <20220401223705.1818622-5-schnitzeltony@gmail.com>
 <de5e673c-4c74-3223-f4c7-0216e0fa8ec5@gmail.com>
In-Reply-To: <de5e673c-4c74-3223-f4c7-0216e0fa8ec5@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 2 Apr 2022 11:56:29 +0200
Message-ID: 
 <CALbNGRRUbr6MoMWWwYW6io100=KfGGJe5Nce5nvRTR-MjqfE8g@mail.gmail.com>
Subject: Re: [oe] [PATCH 05/15] orage: enable notify PACKAGECONFIG by default
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Apr 2022 18:46:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96345

On Sat, Apr 2, 2022 at 2:30 AM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 4/1/22 3:36 PM, Andreas M=C3=BCller wrote:
> > Trying to eliminate libnotify does not make sense: XFCE images should c=
ontain
> > xfce4-notifyd which depend upon libnotify unconditionally
> >
> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
> > ---
> >   meta-xfce/recipes-apps/orage/orage_4.16.0.bb | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-xfce/recipes-apps/orage/orage_4.16.0.bb b/meta-xfce/r=
ecipes-apps/orage/orage_4.16.0.bb
> > index f56050018..d10cdaac4 100644
> > --- a/meta-xfce/recipes-apps/orage/orage_4.16.0.bb
> > +++ b/meta-xfce/recipes-apps/orage/orage_4.16.0.bb
> > @@ -8,7 +8,7 @@ inherit xfce-app mime-xdg
> >
> >   SRC_URI[sha256sum] =3D "26111a3b6a2007c82f1e0a1e0591b774a0b132f3a7f1c=
de53d9be661b2f11700"
> >
> > -PACKAGECONFIG ??=3D ""
> > +PACKAGECONFIG ??=3D "notify"
>
> If it is must have then does it make sense to have it as a packageconfig =
?
It is not a must have - users looking for minimalistic images can
override. It is just a default offering best out of the box experience

Andreas

