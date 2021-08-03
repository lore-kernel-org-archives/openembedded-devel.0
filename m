Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web08.311.1628006987132190140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Aug 2021 09:09:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FREAaeZP;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: b.hutchman@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id k4-20020a17090a5144b02901731c776526so4507518pjm.4
        for <openembedded-devel@lists.openembedded.org>; Tue, 03 Aug 2021 09:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=e8DntmBKqr99smQyDZGx3WicyhBxTWYm4GTHEB9F644=;
        b=FREAaeZPURHu1SRzPOleETKRPlIrj6NAQi/FXcCJmzuUAh7jwIbD8+qbFqsCyiAh1F
         7sj67nkM8UjxJDvx1aCNj6VpFIyVeJG3oOLnjV8LIolGIEsvCmbMiDjtzErjioqYYWRU
         zRW7Mh0Sz6FwzdQAyJlZVv4dcWjmvVgQL6g7LVNoe6iN8GJykorW94MJnA3/UAZMx24i
         GJ70fvBm4HhiZEZBF2qLA5YsiF0oEvL7N9+u3K9X3dcm0+qW3sZobIiwfwEBTcWqFWlH
         pn8noXfGPD/80M9nggJfqRQ6FvYxme3kjNSd7nItj5+tbcUwzzcoLZ6RUUCz8HXTmfJl
         8wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=e8DntmBKqr99smQyDZGx3WicyhBxTWYm4GTHEB9F644=;
        b=NpIwB04IliXb3UG5aAj+RsJEW6u9KKM7xq1tTWWg42G41/24LM0KIPw+GHXgq3+JEm
         SKyK+hEssYghmlczt7CGTafSFY/h5DwmRs8YW578bJegN5lrHs6ZwRElojPZqVkB/68q
         rJA970O0Lj868VQwhh3NtS60+VfW0nrnx412cQhN2AYdaaqI4fTTZ1vTt+BUGW3n4i44
         I7spA6mgZHXp+gpPLloT8vD7DyvjfZWvh3Nh3XRau3gSpTPtK1viEAGzUm/mFqARln6P
         gQ1Wly0Q5iOmTaaZzQP1JJranSn0ugg0r8jftkG5mUMxDj92ELb6YvOWDI/YHPHKC7my
         s00g==
X-Gm-Message-State: AOAM532gxGAvudLEhiOPvkRvIaj74Qfzq7TYGowGpCNxKrMjF2VehZAd
	YBVamIXVebXv903jZZv39HE8/yDpeWACMrXH+No=
X-Google-Smtp-Source: ABdhPJwgoADpQCIXGBK0/3sjut+fcI9G62Tj6s8BbzsCIQ9cLJhHnDxaUmiZw6gSu/849jjhdHdOvHpxCvq9Df9yNH0=
X-Received: by 2002:a17:90a:7f04:: with SMTP id k4mr24162726pjl.32.1628006986548;
 Tue, 03 Aug 2021 09:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
 <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com> <CAFZh4h8r3XOuNWA-3h9yraUZ+U7PLnPd7hxDLcyEQGiVM6EqrA@mail.gmail.com>
 <CAMKF1sosZLX7Ha7N23c+x=coBbzaavajL=+vmiXFXmZ86oDZTQ@mail.gmail.com>
 <CAFZh4h-oyyAdWC-vceBEJuUgZMEL7h7f5CRRO3f6yx6iY-zs7Q@mail.gmail.com>
 <CAMKF1so85_HpSoqt=ZBvgf_jYoJJnnBtVXUjPZfsJdupHa6_zA@mail.gmail.com> <CAAQYJAsZCm3=Vo-R_26FhVH3CeD0PmeJmA4fuXUO1FQghkKqdg@mail.gmail.com>
In-Reply-To: <CAAQYJAsZCm3=Vo-R_26FhVH3CeD0PmeJmA4fuXUO1FQghkKqdg@mail.gmail.com>
From: "Brian Hutchinson" <b.hutchman@gmail.com>
Date: Tue, 3 Aug 2021 12:09:35 -0400
Message-ID: <CAFZh4h-8z5TfTh23+iA0R55zxxUiN126CcQYdR=adSoM0Pae=g@mail.gmail.com>
Subject: Re: [oe] Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: Andrea Adami <andrea.adami@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000020075005c8a9ea83"

--00000000000020075005c8a9ea83
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 3, 2021, 10:00 AM Andrea Adami <andrea.adami@gmail.com> wrote:

> Brian,
>
> wow, I think we are the last NOR users here in OE.
> I gave the collie to Marcin: let see if another OpenZaurus arises :)
>
> Cheers
> A.A.
>

Ha, ha,  yes, and I even hardware partitioned my MLC eMMC converting much
of it to SLC (or whatever the soft SLC is called these days).

I still have two Sharp SL-5500's ... don't get much free time to play with
them.  IMX8MM taking up all my time.

Fighting Linux bloat .. getting as bad as Windoze.

Regards,

Brian

>

--00000000000020075005c8a9ea83
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 3, 2021, 10:00 AM Andrea Adami &l=
t;<a href=3D"mailto:andrea.adami@gmail.com">andrea.adami@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">Brian,<br>
<br>
wow, I think we are the last NOR users here in OE.<br>
I gave the collie to Marcin: let see if another OpenZaurus arises :)<br>
<br>
Cheers<br>
A.A.<br></blockquote></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ha=
, ha,=C2=A0 yes, and I even hardware partitioned my MLC eMMC converting muc=
h of it to SLC (or whatever the soft SLC is called these days).</div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">I still have two Sharp SL-5500&#39;=
s ... don&#39;t get much free time to play with them.=C2=A0 IMX8MM taking u=
p all my time.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Fighting =
Linux bloat .. getting as bad as Windoze.</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Regards,</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Brian</div><div class=3D"gmail_quote" dir=3D"auto"><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex"></blockquote></div></div>

--00000000000020075005c8a9ea83--
