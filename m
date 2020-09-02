Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
 by mx.groups.io with SMTP id smtpd.web10.3060.1599036637394745516
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 01:50:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ga9GNZjZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f46.google.com with SMTP id v20so1330866ual.4
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 01:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/QDPC8od7COzjTzimw8X+1CZqHXQ7fBR09aAY1L6S/8=;
        b=ga9GNZjZcAK39SDLBo288hIZhBL4UNKSYDqjK0+Ddox9EwbLpDqUqcpbElXv4mV16W
         nRAyx6FkSM4Bz+NLpGfnjj7eQyB5Y3iVB6RD6AY7uvQLV+c2K3+4EfyolZRgnUXMjpOS
         Ws8Y8Rmv9d2kdjTcpGw6b+ckhqeFHjo0Xv9hb3eIc5IwaSb9nmMGRZos0K3Iy4V3QjLa
         8MCj4532hUtJPGrYKcnEEgoWadlvs1XfrPuAOGMr6ua4nMIaoV3oH68O1NVYH1JjuHJW
         kb6uVoUYqIKYy1LT3YGOaY0jEFC5nbmoPw9meYU1mY8FunA3ngPJOIJa4i9+5ZDxqE1Z
         TPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/QDPC8od7COzjTzimw8X+1CZqHXQ7fBR09aAY1L6S/8=;
        b=RS4lRLSP/HSJbJOJJI80yabhemlnnRY9HKY3KbdE+T8gADIWwc8f30SrVyDifwwr/F
         bsxbSz4b24BSxlY1mI1bJl3jwBkKMxVwdm/V6xTB3QpMsWysBvpp5NwE0ADc9dm/dmCO
         41Hm+ilUmFfOC+asatfwT2yr1jbDYkgyL5jeRVpMVl7VN+6VqoSbwAGV2FDOBuXKZeOl
         lRHypN8XpXnpr8qcKT/D+4n1s9xcr5Gru2qaIJdgUd9y0QG2Jdn8bIFtfhD8Opr942pb
         iUMaVS9FLNH2ZkHCEhM62XApVJNU3gVpdkAmcc+PYGEZROX67rfA7pIRlzfgUzLhBKq4
         Y4Uw==
X-Gm-Message-State: AOAM531MkcG28jnk7ujVHTNZhVlFT5tFJipxPnEGT9elY7JtdvUrNvKP
	sDTPgrk1z/SrV1RdYb4a4kohQr4x5DE+C4Gy7KE=
X-Google-Smtp-Source: ABdhPJynPp3DmB9Y7bq0FuKBceZoCl/xB6E4YdGReORDkR8pP0gnzakEO2xEhpp4se2DOp151+ZeJIvBhuVn9uEgazk=
X-Received: by 2002:a9f:2c9a:: with SMTP id w26mr4185537uaj.89.1599036636493;
 Wed, 02 Sep 2020 01:50:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200824091401.GB2286@pcleri> <CANNYZj_+KTOwyvBhrDQ7NuecOBFe=Poh8Khc_ntDU4M5iGL=Gg@mail.gmail.com>
 <20200824093831.GC2286@pcleri> <CANNYZj_LT1m2gSbhL+Di1PaFGzSYGmPVYsEus0YnSx19sOZ8jw@mail.gmail.com>
 <162E2BC2BA50B6B6.12673@lists.openembedded.org> <CANNYZj8fWMk1Ya+G-HbC2VVbC4HWV6x=4T=ni_cdW5-qNG1YnA@mail.gmail.com>
 <20200825055800.GA37583@pcleri> <CANNYZj-n4T1bkX4k36B5LgG+7nJANO+sVKGXbyf1mFZTMx-t1Q@mail.gmail.com>
 <20200825110343.GE37583@pcleri> <CANNYZj-a5HeUKExws6KNoofbPy4EQmmzx=2-ZtsD+N8j70g-HQ@mail.gmail.com>
 <20200902084348.GB81961@pcleri>
In-Reply-To: <20200902084348.GB81961@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 2 Sep 2020 10:50:24 +0200
Message-ID: <CANNYZj8=uS8Bm62J+5QXc5KYo53uoANw0nvwdJe8j9fJzPY=6g@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000b37b9905ae50ba63"

--000000000000b37b9905ae50ba63
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sep 2020 at 10:43, Richard Leitner <richard.leitner@skidata.com>
wrote:

>
> > ping - I think dunfell is still at the old revision?
>
> Thanks for the reminder.
>
> dunfell and warrior should be up2date now.
>

Dunfell is fine, but warrior does not have any new commits, particularly
the cacao fix?

Alex

--000000000000b37b9905ae50ba63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 2 Sep 2020 at 10:43, Richard Leit=
ner &lt;<a href=3D"mailto:richard.leitner@skidata.com">richard.leitner@skid=
ata.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><br>
&gt; ping - I think dunfell is still at the old revision?<br>
<br>
Thanks for the reminder.<br>
<br>
dunfell and warrior should be up2date now.<br></blockquote><div><br></div><=
div>Dunfell is fine, but warrior does not have any new commits, particularl=
y the cacao fix?</div><div><br></div><div>Alex<br></div></div></div>

--000000000000b37b9905ae50ba63--
