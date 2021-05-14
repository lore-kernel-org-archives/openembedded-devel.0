Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web09.375.1621032191701709154
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 May 2021 15:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YLQBLcoF;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id l129so510498qke.8
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 May 2021 15:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OMDqpxW70DkGNdTgrXtInzT9WreD/IVFhO/P9DAWLQk=;
        b=YLQBLcoFHSHY2KjLobILQnIqI5KZKxXs3p9WmUQucOY33ffv6/04XtVN/2OFjQo3ei
         gksYwo8QRTNpD11+8UBxqC+YMq23fz4nNxeCU6CzMNDpJ9p9LF0gv+F/4BmuA3nYeaUv
         9P+ISlteLtrbEJdJ/k8skd3rteEIej6q4H2eK+yKVdHGtWH0fDpiDedc7m4vhHqqISqv
         5w/bPKvdV/X1WlDeexMa2ShKhmFtMPaGaLgXjXQhJJ2XINlMf6qHrNKmEiGTJ6VQwvWJ
         p/8ScDpljgoiAPIXNA/MUacHIW6+dihr++aqn0XuSKZyP38QPgcvkOrXNMxZaSAF1Xnq
         Rarw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OMDqpxW70DkGNdTgrXtInzT9WreD/IVFhO/P9DAWLQk=;
        b=EhvamFBNDUdoWYdwPiq1QgkXXJ/zidQ5VRqq8vhMbqyvPW2QBfzl4jZ/8IDFwHNUVp
         Bdix90NH09S2rIwvqrlL2cHPmF9dudb4bdgpCY4UTkoGwanersqimjYubof//4MOet/T
         jY5do/7NeGI4i2/fHNkSpds4BvW4O11Nmt99zqiST5TILDDVMRwq0H6Deijsw7phwNsY
         BqfvJtAKjvjEV1yqBgUEcsuGCfbR5JFzAwTCBVWmjWRkR1O/twVl5inaHiWia+EkHUAu
         +kXqNiCdMbhFQZCCsP5oBh3VjssRZsS8Pc237MagTQKMkRh+gWvUaaPksdQipPY7FX8O
         XPTA==
X-Gm-Message-State: AOAM531mDMblW+/zo4mu72JZkTctFCx3x2KttX/r8ASpFLu0QKXQTMg/
	YeuzCmKQGnQFHWQFe1fTrAIIIe9FFRzGi3U1PJY=
X-Google-Smtp-Source: ABdhPJx7h+gZx3m6slKKjaf0QX+FdCCoPLfbC1ztac9dIFU119sq65azofkTkPr1pRH+QKaKqRHqFASOxtyCHyDLNdE=
X-Received: by 2002:a37:444a:: with SMTP id r71mr8368439qka.381.1621032190840;
 Fri, 14 May 2021 15:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <CALvjPy0by0vAvNLTzJ4WyasGHpzhw4T8SKmWj-_k7v1gRzR=jg@mail.gmail.com>
 <13743e57-bcc5-46fe-7ccd-9add6f2332db@gmail.com>
In-Reply-To: <13743e57-bcc5-46fe-7ccd-9add6f2332db@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 14 May 2021 15:42:44 -0700
Message-ID: <CAMKF1sprVXWASfHo-hNvZ2CFiAv7wmPs_9R9wvT21gF_d=8PnQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd service installation
To: Armin Kuster <akuster808@gmail.com>
Cc: Adrian Thomasset <athomasset@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 14, 2021 at 3:15 PM Armin Kuster <akuster808@gmail.com> wrote:
>
>
>
> On 5/14/21 8:28 AM, Adrian Thomasset wrote:
> > From 84681a31cfd3f7aa8cc89181c2c87ffffcbc261b Mon Sep 17 00:00:00 2001
> > From: Mario Schuknecht <schuknecht@dresearch-fe.de
> > <mailto:schuknecht@dresearch-fe.de>>
> > Date: Thu, 15 Oct 2020 16:53:12 +0200
> > Subject: [meta-networking][dunfell][PATCH] wireguard-tools: Fix systemd
> >  service installation
> >
> > Install systemd configuration file wg-quick@.service into the proper
> > folder.
> > Use 'systemd_system_unitdir' instead of 'systemd_unitdir' as the
> > installation
> > path.
>
> I take it this will affect Hardknott and Gatesgarth. I will wait for
> Master to merge before propagating to those branches.

It's already in master for a long time. I think this patch should have
been marked with [stable] in the subject line to be clear that its a
backport request.

>
> -armin
> >
> > Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de
> > <mailto:mario.schuknecht@dresearch-fe.de>>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com <mailto:raj.khem@gmail.com>>
> > ---
> >  .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> > <http://wireguard-tools_1.0.20200513.bb>  | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git
> > a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> > <http://wireguard-tools_1.0.20200513.bb>
> > b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> > <http://wireguard-tools_1.0.20200513.bb>
> > index 31b33a045..3403fd943 100644
> > ---
> > a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> > <http://wireguard-tools_1.0.20200513.bb>
> > +++
> > b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> > <http://wireguard-tools_1.0.20200513.bb>
> > @@ -9,7 +9,7 @@ DEPENDS += "libmnl"
> >
> >  do_install () {
> >      oe_runmake DESTDIR="${D}" PREFIX="${prefix}"
> > SYSCONFDIR="${sysconfdir}" \
> > -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> > +        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
> >          WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> > 'systemd', 'yes', '', d)} \
> >          WITH_BASHCOMPLETION=yes \
> >          WITH_WGQUICK=yes \
> > @@ -18,7 +18,7 @@ do_install () {
> >
> >  FILES_${PN} = " \
> >      ${sysconfdir} \
> > -    ${systemd_unitdir} \
> > +    ${systemd_system_unitdir} \
> >      ${bindir} \
> >  "
> >
> > --
> > 2.25.1
> >
>
>
> 
>
