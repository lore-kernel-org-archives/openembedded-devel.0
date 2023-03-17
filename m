Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F8CC6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 19:05:50 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.28382.1679079941285130828
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Mar 2023 12:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Jlhs9ixv;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so5724861wmb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 12:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679079939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c54HNBLNjIGY3gTJWCDqmfKjZJUo71ZcWSS0lM5+E5c=;
        b=Jlhs9ixv9/neNUevb48Lp26PoD7r2HcZsDZrlXh69I2NB8IIWsqq56h4UxdgQo6xm8
         nfJdROiD2VO0/Ce0RGVzT+kJGqWnxbGxOJPlnSkRoEejWI4iugYChak/lkaMwx/wl14M
         p4fCtQbZlZuAPf9yKywANTgf+HAsEr/imGWHmfUTVIvNLb+Y3kp+jHW0MowIBl5HPcS1
         o97TM5bxHIu0ZvAwgaWmThlGerNw3MQoZ+W4xAHKzJl2WStT3stj4VDWaf7Da1VPnFWx
         XEtHyBbdGfL6S2SLxSXd22ccWK2BlfBV9r9VxSRI/4Z1tb1oz5dJ9LmuV6nJAab9/J+x
         pG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679079939;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c54HNBLNjIGY3gTJWCDqmfKjZJUo71ZcWSS0lM5+E5c=;
        b=BVU76QSPC47e3e4mW+WATCnAXmQWT0aFLgzVIFj6/HtlJ8IOsY+ZrwQrZgUUonqfGR
         wt9p7SkMxh3Dv2hZnXaJeUjFGqas9cXPpD0CZmiXl+bFbCx5lyLbantjxXIqvabwbO60
         LoJx3j4BFgsnlDUh+HVZpd+3f+71ayyQerIXrHdlFAPjyWfpWLVsME+hQCxkndZ1P+rz
         wL17IAUVQa+1h3iqCEn9VR10y/m6C0/LETMRXjSMAsgYif85+MQ9Mu1JXdsqBf1X+MGS
         V/Fi1W65Y/9c2VJXA4tvrQKgbPP0lg5d6wJSb/tHaG1PwuqZCRKNDiF3hLn7Ir2quERX
         Ve+w==
X-Gm-Message-State: AO0yUKVJKhc3YIiv5FicrzVea5RQY8vkEy4TH/Hi1d9iP4BWtjcr87TL
	5fa3UIiW7zDRA1qvXxlnqOcNeyyuarjLxBQFrk4=
X-Google-Smtp-Source: AK7set+FN1B9hY6qXrIiP1QZ4j6m0q/WUFiF1C0cJDvEqKVh6eQbgAn43uKQVHKJA0CZ0A7A6fOyI5O/R1CNk+rJlJc=
X-Received: by 2002:a05:600c:cc:b0:3ed:7bd5:a5b2 with SMTP id
 u12-20020a05600c00cc00b003ed7bd5a5b2mr971366wmm.3.1679079939523; Fri, 17 Mar
 2023 12:05:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114130.144008-1-f_l_k@t-online.de> <CA+chaQdB=DO7NRErQXJqiO9oDvyGjh8HJTJoYh7enfsci1-Cfg@mail.gmail.com>
 <NBFORR.MU3ZOWF0ZHV82@t-online.de>
In-Reply-To: <NBFORR.MU3ZOWF0ZHV82@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 Mar 2023 20:05:18 +0100
Message-ID: <CA+chaQeYvpP4onkMYaS81nqko0w=xmTKsEv=myMrEoNpwWJdWQ@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 0.3.66 -> 0.3.67
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000058473105f71d43ce"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Mar 2023 19:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101593

--00000000000058473105f71d43ce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've removed libcamera from default PACKAGECONFIG to work around the issue
in the end.

But now after your reply I've found that we have different libcamera recipe
in LuneOS:
https://github.com/webOS-ports/meta-webos-ports/commit/fa03dd3d5e3ce2e61b87=
cea8c2f41c32ce96f9fb
renaming this resolves the pipewire issue.

I'm sorry I didn't realize this sooner, I've used LuneOS just because I had
more up2date sstate there and forgot about this.

In the end gave-up on webrtc-audio-processing upgrade as well, in case
someone wants to start from my WIP changes (pulseaudio + gst-plugins-bad
from oe-core as well as pipewire from meta-oe would need more changes to be
compatible with webrtc-audio-processing-1):
https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/webrt=
c
https://git.openembedded.org/openembedded-core-contrib/log/?h=3Djansa/webrt=
c
we use this new API in some new pulseaudio module, that's why I was looking
at upgrading it everywhere, but the default 0.3.1 is probably better fit
for default webrtc-audio-processing version for now.

On Fri, Mar 17, 2023 at 6:59=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:

> Am Do, 16. M=C3=A4r 2023 um 15:55:54 +0100 schrieb Martin Jansa <
> Martin.Jansa@gmail.com>:
>
> | ../git/spa/meson.build:81:2: ERROR: Dependency "libcamera" not found,
> tried pkgconfig
>
>
> Unfortunately nothing rings a bell for me here. libcamera is found for my
> builds and I have not seen this problem yet. Is there a way to reproduce?
> what layer are you using?
>

--00000000000058473105f71d43ce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve removed libcamera from default PACKAGECONFIG to w=
ork around the issue in the end.<div><br></div><div>But now after your repl=
y I&#39;ve found that we have different libcamera recipe in LuneOS:</div><d=
iv><a href=3D"https://github.com/webOS-ports/meta-webos-ports/commit/fa03dd=
3d5e3ce2e61b87cea8c2f41c32ce96f9fb">https://github.com/webOS-ports/meta-web=
os-ports/commit/fa03dd3d5e3ce2e61b87cea8c2f41c32ce96f9fb</a></div><div>rena=
ming this resolves the pipewire issue.</div><div><br></div><div>I&#39;m sor=
ry I didn&#39;t realize this sooner, I&#39;ve used LuneOS just because I ha=
d more up2date sstate there and forgot about this.<br><div><br></div><div>I=
n the end gave-up on webrtc-audio-processing upgrade as well, in case someo=
ne wants to start from my WIP changes (pulseaudio + gst-plugins-bad from oe=
-core as well as pipewire from meta-oe would need more changes to be compat=
ible with=C2=A0webrtc-audio-processing-1):</div><div><a href=3D"https://git=
.openembedded.org/meta-openembedded-contrib/log/?h=3Djansa/webrtc" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Djansa/webrtc</a><br><a href=3D"https://git.openembedded.org/openembedded=
-core-contrib/log/?h=3Djansa/webrtc" target=3D"_blank">https://git.openembe=
dded.org/openembedded-core-contrib/log/?h=3Djansa/webrtc</a><br></div></div=
><div>we use this new API in some new pulseaudio module, that&#39;s why I w=
as looking at upgrading it everywhere, but the default 0.3.1 is probably be=
tter fit for default webrtc-audio-processing version for now.</div></div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, =
Mar 17, 2023 at 6:59=E2=80=AFPM Markus Volk &lt;<a href=3D"mailto:f_l_k@t-o=
nline.de" target=3D"_blank">f_l_k@t-online.de</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex"><div id=3D"m_-1878484190791604=
863m_5912981472093199351geary-body" dir=3D"auto">Am Do, 16. M=C3=A4r 2023 u=
m 15:55:54 +0100 schrieb Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gm=
ail.com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;:<br><blockquote t=
ype=3D"cite">| ../git/spa/meson.build:81:2: ERROR: Dependency &quot;libcame=
ra&quot; not found, tried pkgconfig</blockquote><div><br></div><div>Unfortu=
nately nothing rings a bell for me here. libcamera is found for my builds a=
nd I have not seen this problem yet. Is there a way to reproduce? what laye=
r are you using?</div></div></blockquote></div>

--00000000000058473105f71d43ce--

