Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61BF4C433FE
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 14:29:30 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.9554.1632925769691398351
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a57nKToX;
 spf=pass (domain: gmail.com, ip: 209.85.210.173,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id g14so2152221pfm.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Sep 2021 07:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=giclGISZFtmYbxUO0r/VJDeIx5S23iS6NGdWmEW5qLQ=;
        b=a57nKToXvZI9uvy2A+/vXQCrKDNWWVP7BhlpPPIfLWd/70PnB/yLa/c7CE3yGeCo6M
         KmdxsIjVDjDjIWne7vmJH6JtMxfmwu/7nyimZRut4Uze8zjquW1/iHYcXIn3FzXrc4dG
         2IvDtS6OX/qOhmjY45tNVkHBb2M0NiVjVjgMNd8XJKYFXxOC0IH6FqwaZwKIECXfSOFm
         dR7mBMGlGops7qBaAhKwkU+VJGBpNauq25PGDX8VhM6gTXxa/rbFHRJa9q7oBAoEgPDw
         td5q4BFl+GVCQnXOCNTsUkNsXoAB4Hvvz4WAY+scJcYQUViQiSiplcuqlkJd2DDVgRN0
         KXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=giclGISZFtmYbxUO0r/VJDeIx5S23iS6NGdWmEW5qLQ=;
        b=51ZYMLBoJRuGTgedAer1LhAPSfVjXHJ/w/WcZXkyC+2iGZv2XpcAoavUiwqAJM97sp
         pEx+LrH7zlVI8oFNpP6baLS43oaL7eDX9qAbUo4we6DoRuWKdbAUZBoEXH+qLk5CVl/1
         ijVsE7e3lnD/35VRdJS6A/sO5a7y6KWul8jkjyIeqLWUe1nSuiDSi6lMEF/d3OF8aTM8
         40NysvlJKlmbdmlJV9fKMbSpqsfN1Bdyvr/vmbG77vLyBaYl9NYoH2sT5soDeTtz5MLr
         OJus0iMjCI8OmKtvYOuDGucCxFszJPNBtNQapxC42DMKzW+2m49aHxqpuLFzZtWZxW4b
         mMCw==
X-Gm-Message-State: AOAM533pnKKTn1iozHtPIdVgFeupplMZGnsnhCem7/h4ICpoxGlN5SaU
	mQ905FPFT1dnW4L75uCA26b+rUCnjfr+aD4LwOc=
X-Google-Smtp-Source: 
 ABdhPJwQUc+bm7hoeUU/kC7gE3ijYFa0mHvw9iGhOAaxN1lyhXM54V4ywDWRfhEp5UqQG90diwWW7zWdIMluC70RdtA=
X-Received: by 2002:a63:ed03:: with SMTP id d3mr287361pgi.24.1632925769064;
 Wed, 29 Sep 2021 07:29:29 -0700 (PDT)
MIME-Version: 1.0
References: <1632407510-15664-1-git-send-email-zhengrq.fnst@fujitsu.com>
 <CA+chaQd=SMxM__MgS2fSEHo4-QHLo5ECikYuc1srRzbT4_hTxg@mail.gmail.com>
 <eb937949-2f47-dfb3-a91f-4984a9c7d452@gmail.com>
In-Reply-To: <eb937949-2f47-dfb3-a91f-4984a9c7d452@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 29 Sep 2021 16:29:18 +0200
Message-ID: 
 <CA+chaQf2j+7zKpQkOV+uq2+ACPgo+_ed+Yjj5++q-+DxAc4tzQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] protobuf: upgrade 3.17.3 -> 3.18.0
To: Khem Raj <raj.khem@gmail.com>
Cc: zhengruoqin <zhengrq.fnst@fujitsu.com>,
 openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000068e45205cd2328a6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Sep 2021 14:29:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93172

--00000000000068e45205cd2328a6
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 29, 2021 at 4:22 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 9/29/21 06:26, Martin Jansa wrote:
> > FYI: this breaks opencv build, I'll send fix shortly.
> >
>
> interesting, why dont we see the failure in OE world builds I wonder.
>

It happens only with dnn PACKAGECONFIG enabled, which isn't by default.

--00000000000068e45205cd2328a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Sep 29, 2021 at 4:22 PM Khem Raj =
&lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
<br>
On 9/29/21 06:26, Martin Jansa wrote:<br>
&gt; FYI: this breaks opencv build, I&#39;ll send fix shortly.<br>
&gt; <br>
<br>
interesting, why dont we see the failure in OE world builds I wonder.<br></=
blockquote><div><br></div><div>It happens only with dnn PACKAGECONFIG enabl=
ed, which isn&#39;t by default.=C2=A0</div></div></div>

--00000000000068e45205cd2328a6--

