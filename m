Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6873C433FE
	for <webhook@archiver.kernel.org>; Tue,  5 Apr 2022 19:49:23 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web08.572.1649182122486354311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 11:08:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h/+kvx2y;
 spf=pass (domain: gmail.com, ip: 209.85.160.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id s11so12516137qtc.3
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Apr 2022 11:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPfQsT9G0H27M/mZfJqVWZ2XGp6RjrmY4vfoCF6CAGY=;
        b=h/+kvx2ynORLYPJRSJrePgEDhLIUO4/US6st0qGfOWbnYZBZikLqnTwbysZQsszmp3
         gOotxXBnUe4TjIWpnG1gUPyLtQUJLIg0yyj3VuWZJR742gHc+oHT5Xc/WEnZGVAl3lR5
         /CwDzhkJVuf80goNZcldR2LQRe7qCZylJOEKvNS4BZB7Acp/4bpTbAihjLYGacj56n/9
         QlpvUHk85PxWIjJ/PULyFaw5a18geOqIOi6eMivvPzAqjsOFmCovJMvKhtK8A6oDZOba
         lJvdWyLW1OOPt/KsdOGWm+DHvsWvlQXWV0GZ8aWyo9lEIJyld7xvtMyJy/w72hHFxrx9
         EmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPfQsT9G0H27M/mZfJqVWZ2XGp6RjrmY4vfoCF6CAGY=;
        b=3pcY5ikCzod1gXhvOQfwvWTTAdDiitIXbx8g1DSuFqAPl0lCObF0HRZE5qlFAw5OAB
         rZjgqEtFXwPN7Kf74Ki2caelWialVgWAuerFuFeJuSA2Vz1d1da+JB8po30U7djiMrwy
         ZzmssboGEW9+V5qYXZW7pfd7svyZF9fzqs4eOx7+Faq637UC+ZlcoPl+Mr5YsDr8925O
         6mZFjxjL63iNfDnQO48RJ9FzVmM0w53cs8IxQUHj9gm9njxiyzxNqknEgP695cEgx847
         +Ts3R5WMYQtTphu5ENb40B4fQr86273Zektt+dYLz+EcImx0RKEO6Skkbl730HDOReYJ
         O67g==
X-Gm-Message-State: AOAM5319OieywWVRfuPzSALuyDesTvv8Ne0n/zkgbhFkXcDzZ2nUYs3f
	JrzmlUKoLYPSEAIt5a3sJUtmytGxFmbtI4+CE0E=
X-Google-Smtp-Source: 
 ABdhPJwQZLLHd3iFJe+mCXSEYKbMFrwPRvC/CmohX6I8M9/ngGhJLw025k2MNtWB1a8gApWvr60OGRzBfBRCP0CJrcI=
X-Received: by 2002:a05:622a:1052:b0:2e1:fe6b:377d with SMTP id
 f18-20020a05622a105200b002e1fe6b377dmr4084703qte.229.1649182121495; Tue, 05
 Apr 2022 11:08:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220404130354.2131131-1-stefan@datenfreihafen.org>
 <20220404130354.2131131-2-stefan@datenfreihafen.org>
 <CAMKF1soas80msGDvw7zB7S=8rXuz2ni4L2FwbffXw=BJ1xNygA@mail.gmail.com>
 <0dffc397-22be-a6b1-0fb2-8792c6c93dd8@datenfreihafen.org>
In-Reply-To: <0dffc397-22be-a6b1-0fb2-8792c6c93dd8@datenfreihafen.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Apr 2022 14:08:30 -0400
Message-ID: 
 <CAMKF1spYaFswwHyzmQ+FoqU1AWmgDWqiaywpm6THWOcT8-k52A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/4] ot-daemon: add recipe for
 OpenThread daemon
To: Stefan Schmidt <stefan@datenfreihafen.org>
Cc: Stefan Schmidt <stefan.schmidt@huawei.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000085905d05dbec225d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Apr 2022 19:49:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96430

--00000000000085905d05dbec225d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 5, 2022 at 4:39 AM Stefan Schmidt <stefan@datenfreihafen.org>
wrote:

>
> Hello Khem.
>
> On 05.04.22 05:16, Khem Raj wrote:
> > fails on x86_64/glibc see
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1610
>
> Ah, its not x86_64/glibc (I tested this) but the fact that the
> autobuilder uses poky and I tested here without DISTRO in openembedded
> core.
>
> Seems the code base it not happy about the gcc changes to warn on the
> combination of _FORTIFY_SOURCE and non-optimized code:
>
> error: #warning _FORTIFY_SOURCE requires compiling with optimization
> (-O) [-Werror=3Dcpp]


Hmm so you are not using security flags ?
That=E2=80=99s not good :) you should inherit good defaults


>
> Will fix and resend.
>
> regards
> Stefan Schmidt
>

--00000000000085905d05dbec225d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Apr 5, 2022 at 4:39 AM Stefan Schmidt &lt;<a href=
=3D"mailto:stefan@datenfreihafen.org">stefan@datenfreihafen.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><br>
Hello Khem.<br>
<br>
On 05.04.22 05:16, Khem Raj wrote:<br>
&gt; fails on x86_64/glibc see<br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88/=
builds/1610" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yocto=
project.org/typhoon/#/builders/88/builds/1610</a><br>
<br>
Ah, its not x86_64/glibc (I tested this) but the fact that the <br>
autobuilder uses poky and I tested here without DISTRO in openembedded core=
.<br>
<br>
Seems the code base it not happy about the gcc changes to warn on the <br>
combination of _FORTIFY_SOURCE and non-optimized code:<br>
<br>
error: #warning _FORTIFY_SOURCE requires compiling with optimization <br>
(-O) [-Werror=3Dcpp]</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">Hmm so you are not using security flags ?=C2=A0</div><div dir=3D"auto">=
That=E2=80=99s not good :) you should inherit good defaults=C2=A0</div><div=
 dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Will fix and resend.<br>
<br>
regards<br>
Stefan Schmidt<br>
</blockquote></div></div>

--00000000000085905d05dbec225d--

