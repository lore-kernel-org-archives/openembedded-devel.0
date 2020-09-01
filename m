Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web12.4973.1598929908663617879
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Aug 2020 20:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y+uen4aZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: sri.deep07@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id bo3so11221172ejb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 31 Aug 2020 20:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n3c4U6hvWKo7FN9ylS05TXZtNJgN4UEQowTkDCEF6bg=;
        b=Y+uen4aZILUuj5msRKK9yzLK40PFZY2k8THauSov+GhugCbLu/C8PmxNNCi7QOubS6
         gebfDKjFPMPDF0Luiq4OfDZueZPziPKb4L0KDibZSePtjpVbjDsgBM1bVgOPQCyj6tgy
         gZwCduNRm6duzSI0lWP7YOPtKWtaqOCa37vUYj0FXmrZNRkIObAjvTnFxxCSxbRPxeId
         58inCKOtUZZclPdDr7bdto95RoRygHb9KZEcXklAaiyqqdTxG05XKRFX017S30/9XOie
         keLhzTw5FB40cyGMSLqYXqGasTd+iCAD+61YZfzzWY8z86Z2DC1UJIxr/cLfGVNAGXCZ
         sezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n3c4U6hvWKo7FN9ylS05TXZtNJgN4UEQowTkDCEF6bg=;
        b=dP5F4y/dLhuXH/FR83C4KP79bJeHB52+4awNcMWBZWBa8ghIVTKYnXua71w5KJpr2l
         MsOnDZO0Pifs8edNyezz/dcLVww59InWx6XXa26/3EIUyFw8fzapBbYANQ8Sz71mMicG
         Oy+qpIHexL7kCwt37LSI+Mx/SAb4ffasz+xguAaZUmTezBH4Tr3Qlf7du6dZeiVJJ5Yn
         tOs6H8aE6YE8jHPKyZu1tHnQCNK+u5vdcU3vtxp0jeA90tmWIqqzwDAQnhu+82nTMJfA
         FWYRVDSSlg8lNAIXPAnIy6VkBbeyYgZ3uUhnM6twdEKsmC22Ep1V8O4mKo2UBozZ6v/D
         KUjA==
X-Gm-Message-State: AOAM531IqOycFSm2HOq/Gl5ZyURTQBaqHsjT8HWuzPMPgH6eMlIwKH2Q
	LPlZU1TK3HC4irkiz1L/2S+5i5n2DRnLq7qaAhg=
X-Google-Smtp-Source: ABdhPJxmTzPnfwisTXDeBNRQsxDIxE1skZw9MGGWDHzC7olvXregP/D3AxsKL3YwpFzJXpFWb3ONqOfMIMzofr8Reas=
X-Received: by 2002:a17:906:4ad5:: with SMTP id u21mr3948158ejt.468.1598929906885;
 Mon, 31 Aug 2020 20:11:46 -0700 (PDT)
MIME-Version: 1.0
References: <DU6o.1598926318374495688.aMm2@lists.openembedded.org> <CAMKF1sodAsUxSE6TDT61mTgG=PjdeOs9WDzVWE-aEp_3xvTRWg@mail.gmail.com>
In-Reply-To: <CAMKF1sodAsUxSE6TDT61mTgG=PjdeOs9WDzVWE-aEp_3xvTRWg@mail.gmail.com>
From: sri.deep07@gmail.com
Date: Mon, 31 Aug 2020 20:11:34 -0700
Message-ID: <CAPC6feebJHcUFQOuxm=KtR3+8yrDVFzMZYY-y1H3QKu15NGDnA@mail.gmail.com>
Subject: Re: [oe] Iperf3.7 SRCREV and License file MD5 #oe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001ee97705ae37e18a"

--0000000000001ee97705ae37e18a
Content-Type: text/plain; charset="UTF-8"

Thanks khem,  thats very helpful!

Do you know in general how I could get that srcrev and lic file check sum?
say If we would move to 3.8?


On Mon, Aug 31, 2020, 7:26 PM Khem Raj <raj.khem@gmail.com> wrote:

> Look at this from zeus release
>
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-benchmark/iperf3/iperf3_3.7.bb?h=zeus
>
> On Mon, Aug 31, 2020 at 7:12 PM <sri.deep07@gmail.com> wrote:
> >
> > Hi OE users ,
> >
> > how do I find SRCREV and LIC_FILES_CHKSUM from iper3.7 source? I would
> need to build it on OE using BB recipe.
> >
> > I would appreciate to know general procedures to find that out.
> >
> > https://github.com/esnet/iperf
> >
> > Thanks,
> > Anand.S 
>

--0000000000001ee97705ae37e18a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Thanks khem,=C2=A0 thats very helpful!</div><div dir=
=
=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">Do you know in gen=
eral how I could get that srcrev and lic file check sum? say If we would mo=
ve to 3.8?</div><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D=
"ltr" class=3D"gmail_attr">On Mon, Aug 31, 2020, 7:26 PM Khem Raj &lt;<a hr=
ef=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">Look at this from zeus release<br>
<br>
<a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/rec=
ipes-benchmark/iperf3/iperf3_3.7.bb?h=3Dzeus" rel=3D"noreferrer noreferrer"=
 target=3D"_blank">http://cgit.openembedded.org/meta-openembedded/tree/meta=
-oe/recipes-benchmark/iperf3/iperf3_3.7.bb?h=3Dzeus</a><br>
<br>
On Mon, Aug 31, 2020 at 7:12 PM &lt;<a href=3D"mailto:sri.deep07@gmail.com=
" target=3D"_blank" rel=3D"noreferrer">sri.deep07@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; Hi OE users ,<br>
&gt;<br>
&gt; how do I find SRCREV and LIC_FILES_CHKSUM from iper3.7 source? I woul=
d need to build it on OE using BB recipe.<br>
&gt;<br>
&gt; I would appreciate to know general procedures to find that out.<br>
&gt;<br>
&gt; <a href=3D"https://github.com/esnet/iperf" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://github.com/esnet/iperf</a><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Anand.S <br>
</blockquote></div></div></div>

--0000000000001ee97705ae37e18a--
