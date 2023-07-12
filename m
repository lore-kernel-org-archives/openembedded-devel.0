Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93E7BEB64D9
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 05:48:40 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.1226.1689140910632018411
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 22:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YInOjm/G;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-c1aad78d5b2so590736276.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 22:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689140910; x=1691732910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2d2SkSrxG1ruULuhGPmTTLZrI0Fdrgrm928wvUP22js=;
        b=YInOjm/GLSG06syuh+mxpBVxZSJwt9q/mV+fl7SxJp5Vr5WPH+EjWfCIrTnMwvKJK4
         kA3WNxwkmDJ+OePELezYeKlyliwV5L/RrO9YBrrenE2NkYB3I2TYRhKSaQ+QgPjZD0nI
         l7GQLjz/gxutqo/LiSG4uMfAmslruVK3ra717GC2cFbDTheB7i9Mi/qEJBNoxbCMIdVf
         YH4UsLxQDJhoNqWdqUXZA/rTgY1Wkd56nKN6F/77ioEQJ8Lma1NE2/o0VJiFe2oHxi9k
         pE+gbyjcnt/E4qgYpjcOMZBMA+ZzP9GQZ3DGo5WXMVwkrl1EOfuIy+p8uvU1SQMYdYN6
         WFaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689140910; x=1691732910;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d2SkSrxG1ruULuhGPmTTLZrI0Fdrgrm928wvUP22js=;
        b=NQTKcYAbkBW2jBrV242fAfwLdQ4bHBn1WGKWleinaAo1Ntwc/F4Df1a25r27z1iXGI
         5pGumAzyguO0NBHbBZ6xWrmrDOTUcBALCipKvlbbRtlcJZcdYkXzwV/01jIM5TP/oLFE
         mVqws35BwzS2FGGaxlfPi1FrGo1e2+TwCF3hC/Z3d92xtsp6HR6utwShO1GxMWB02Cq3
         h4BMlb817AUBdKcJUP5QeEmP15vyZQW5MZ06Od5SIoXwMNxcvI0MFzdAshs5H5cmD5Ao
         bWM6DyRw+DMTJ4wtX4yktYqFEKXxaYV5BXP7P1kJ5MLd0WKhLQbYtv5UKpMoqzAszxWz
         GrXQ==
X-Gm-Message-State: ABy/qLYyFfYCVivLDwBYnqis2VypwDktxwhRm77EaGX1VKFRp1InI/k9
	Ju+XzxJuzL3ZcMJ6MC+SL6Jjsae47FU+kdJDcnbgwfU3ZTIs1w==
X-Google-Smtp-Source: APBJJlG8kJhjtytkDdoTyyAwhMErx3LhNYqlNVYpzxESK1Kdr52uWrR/851uzMopbO8XxlXDPu4NfMCMPukrSjeqR50=
X-Received: by 2002:a81:46c3:0:b0:56c:e480:2b2b with SMTP id
 t186-20020a8146c3000000b0056ce4802b2bmr1058292ywa.12.1689140909506; Tue, 11
 Jul 2023 22:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <MADEUP.1771085C12D25550.32196@lists.openembedded.org>
In-Reply-To: <MADEUP.1771085C12D25550.32196@lists.openembedded.org>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 12 Jul 2023 07:48:16 +0200
Message-ID: <CANx9H-AypG02PzWaUPOFYuq0_tshhHR8itTGPKejUXomuRHh4A@mail.gmail.com>
Subject: Re: [oe] [AUH] Upgrade status meta-perl: 2023-07-12
To: auh@moto-timo.dev
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e305e2060043c345"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 05:48:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103824

--000000000000e305e2060043c345
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This run is missing several recipes that are in need of upgrades. I'll
check on the reason and re-run.

On Wed, Jul 12, 2023 at 7:42=E2=80=AFAM <auh@moto-timo.dev> wrote:

> Recipe upgrade statistics:
>
>     * Failed (devtool error): 2
>         libcurses-perl, 1.44
>         libxml-libxml-perl, 2.0208
>
>     TOTAL: attempted=3D2 succeeded=3D0(0.00%) failed=3D2(100.00%)
>
> Recipe upgrade statistics per Maintainer:
>
>     Maintainerless: attempted=3D2 succeeded=3D0(0.00%) failed=3D2(100.00%=
)
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103823):
> https://lists.openembedded.org/g/openembedded-devel/message/103823
> Mute This Topic: https://lists.openembedded.org/mt/100094758/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e305e2060043c345
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This run is missing several recipes that are in need =
of upgrades. I&#39;ll check on the reason and re-run.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 12, 2023=
 at 7:42=E2=80=AFAM &lt;<a href=3D"mailto:auh@moto-timo.dev">auh@moto-timo.=
dev</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Recipe upgrade statistics:<br>
<br>
=C2=A0 =C2=A0 * Failed (devtool error): 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libcurses-perl, 1.44<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 libxml-libxml-perl, 2.0208<br>
<br>
=C2=A0 =C2=A0 TOTAL: attempted=3D2 succeeded=3D0(0.00%) failed=3D2(100.00%)=
<br>
<br>
Recipe upgrade statistics per Maintainer:<br>
<br>
=C2=A0 =C2=A0 Maintainerless: attempted=3D2 succeeded=3D0(0.00%) failed=3D2=
(100.00%)<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#103823): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/103823" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/103823</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100094758/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100094758/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e305e2060043c345--

