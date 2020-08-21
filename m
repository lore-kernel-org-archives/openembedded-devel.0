Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
 by mx.groups.io with SMTP id smtpd.web12.134509.1598020841381318464
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 21 Aug 2020 07:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=j0RX5H4s;
 spf=pass (domain: gmail.com, ip: 209.85.217.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f42.google.com with SMTP id i129so933726vsi.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 21 Aug 2020 07:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lTaIEYk/ior2ELNCJjt/7eTz4MJBtSP3sUummAO4m+g=;
        b=j0RX5H4sRU4P2s/gQWE2ADP3O5LDp6XX7Ddz4RpdlVwc7Ilji7KcXIqPTIrPV6/+hn
         hNulcp2YK1qZ58KsbYQviIJUzngBOcLO7RMjU6IApX7tPj2goBcrLufB2aBY9Qw9p8SB
         Wv1uSZ/vJoGi7NqGMoC4Xq7ANPnDi+EVSVmhBodzqsuxfKr9KWrjU4rUch4TqlhjsE8l
         mHslkgVkzxiz4xrlkpFCx37KvfDnu2K4bBLXF+YcU8AHIPsq3FMrVm8h88iyo/z8gqXK
         zWC+BySjHBegzb7EM++k5lmAIHf7jY3a1Xt7IDBjralpJ/jXxPY1KK5qjavAwDsQSJfE
         rw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lTaIEYk/ior2ELNCJjt/7eTz4MJBtSP3sUummAO4m+g=;
        b=L+HZthA8Vmt5YOFmF9PSHweH63MpO0hlkuGQuWh0818lode0n9/bHQvzLIz4xTYi51
         upcTes3Y0IuaDs4lqvYHh2LD75SAQm5nKqGeBQrKLLieXRdesAOCqnKkM8Rb8d8xniSS
         Q//mJIQVbTd2BLo5Dt182lCDuDRbbffVzFJeT+8Ca7HG6STF+hN4BwDpTM2suLDNjw26
         qUxof0dP38zCsp8843GQ/gpoHivu/nxjfzhkaztzPswC61g5kFba6IQUfY4/1PzGqCay
         dTLzPTDrHm5OdQfAXbkGylmPz1rnu9RTdlRzNEwEoDGNEK/OXX4RLcHks2jnbnYnvCm0
         k8+A==
X-Gm-Message-State: AOAM532Hck4UwcZTpzia/oVgp/hsJJfD7msDZ1MqajV851f0PUUC1LkX
	aQ7YRKIjla5orMI6XbuAdeNE2cAZc7VLrOkizH0=
X-Google-Smtp-Source: ABdhPJz2Mr9AOUPHBENrO3FfJHvmDrEANa0DDYQA1bWrR+tKCo+hm/dick4djbbNjw+EBbPrKxHnGpY424Z6KLNEwlM=
X-Received: by 2002:a67:f550:: with SMTP id z16mr2018046vsn.94.1598020840516;
 Fri, 21 Aug 2020 07:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
In-Reply-To: <CAE5diG1AoUDZrO=V7pMjvgv3Gu5cMk3dvPzM82Dem1Sc8X3Wvg@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Fri, 21 Aug 2020 16:40:26 +0200
Message-ID: <CANNYZj8dyU6LpUBiM--YNsF8of56SG4-+VxMsM2B9_SwY0+1dA@mail.gmail.com>
Subject: Re: [oe] Failed to fetch URL https://bitbucket.org/cacaovm/cacao-staging/get/2d6f6c14daf9.zip
To: Chencheng Zhang <chencheng@wittra.se>
Cc: Richard Leitner <richard.leitner@skidata.com>, ricardo@ribalda.com, 
	Alex Kiernan <alex.kiernan@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000008aefe805ad6438bf"

--0000000000008aefe805ad6438bf
Content-Type: text/plain; charset="UTF-8"

A fix should be arriving to meta-java shortly and a patch was already
posted here yesterday.

Alex

On Fri, 21 Aug 2020 at 16:32, Chencheng Zhang <chencheng@wittra.se> wrote:

> Hi,
>
> The source of cacao seems to be invalid which makes the repice falsified:
> https://layers.openembedded.org/layerindex/recipe/23632/
> And this prevents Yocto from building openjre.
>
> Could someone be kind enough to update the cacao recipe?
> Thanks & Regards,
> Chencheng
> 
>

--0000000000008aefe805ad6438bf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>A fix should be arriving to meta-java shortly and a p=
atch was already posted here yesterday.</div><div><br></div><div>Alex<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Fri, 21 Aug 2020 at 16:32, Chencheng Zhang &lt;<a href=3D"mailto:che=
ncheng@wittra.se">chencheng@wittra.se</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Hi,<div><br></div><di=
v>The source of cacao seems to be invalid which makes the repice falsified:=
 <a href=3D"https://layers.openembedded.org/layerindex/recipe/23632/" targe=
t=3D"_blank">https://layers.openembedded.org/layerindex/recipe/23632/</a></=
div><div>And this prevents Yocto from building openjre.</div><div><br></div=
><div>Could someone be kind enough to update the cacao recipe?</div><div>Th=
anks &amp;=C2=A0Regards,</div><div>Chencheng</div></div>
<br>
</blockquote></div>

--0000000000008aefe805ad6438bf--
