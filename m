Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.249.1589836484737296597
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 14:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=auVppSRo;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id x20so9999410ejb.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 May 2020 14:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IDbTo2/GP8cmhjpbouATeIiFE1xgzJtWrtMoImCDPdE=;
        b=auVppSRo2CBWQImL+BPvYwCoDju+UCI3dIv+Fw0LhB5SOdyZUbn/OsjgHWTqswBJUC
         GRelXGtH9wMjxvAcf60vhBpj8Afx2dB1mgPUySXflwzA6K4Sh8i7hsiVEEhwaU72EYqK
         +I/+I2PYincg0G2MNpCViN7buNckskubn1d17y+N3eVdrbg3Rmsxyv1w60wZJjLeRG5h
         JBxtbe7HLejx0frbvLfZWEYCYJBCL1cIOZ69/rnBc8AqTFGV/+Km2rbO9fMRIX2UMgDQ
         cPnm43h6j9qB9ycFVKfObIxMkwH68saAb/rghTVXNeeYxA3gdofhrxt17fKFyPJLm76s
         DHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IDbTo2/GP8cmhjpbouATeIiFE1xgzJtWrtMoImCDPdE=;
        b=BKY3alyFx2kd+8mqLHS68FZKzPg6wkZ9uXVIp3PYqSuV4OiHH6xJ1P6koTgSsSKljT
         YKAdI0tIdM2uRaFuocOCZ+26LG1tSFQvueCpUN5taJs+Jr/gUxp8VQEH0zrPYHUYa2t2
         tnKNeNdWzoTdJvTYlUJpia2UPWsmYBbWGhvKOJXC9mTcZAa2Kv0Q8EpmqvKqDVnyuLZ/
         CeUDngu/llXaRTRKffW3pYETvgY19zSfIviz62rvCJXEKtw6R0U4tDyBZDtTFAAkkXYI
         kgVhAe5jOy28rPWvfdjVy3u0fIk6PZaeBX2VJQ2NVG63XtckA5jBa7FSq76HuE2t1ES8
         Jf+Q==
X-Gm-Message-State: AOAM532VdBi3BXHwANFKjpZm1F7g3fbISaaEWZZi31uQiYdplz3e0yFh
	kMrLNgzma+s1HEJZMq1hsyTESTjOs1JEEKo5q0g=
X-Google-Smtp-Source: ABdhPJwq7ryGyA0/2UzjaY8Zud5qy8oUMcwX7RNcw0k/p2flEgV0qnFTt0AYkx0WmBjO5WMdDcJwSn9PEZ/RGmpX/80=
X-Received: by 2002:a17:907:4096:: with SMTP id nm6mr17179052ejb.30.1589836483252;
 Mon, 18 May 2020 14:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <CAB=WuyaS00Sp1KdA-O-2OMQdwPcx=6p-f03+ZAXVkh-MA9nO2w@mail.gmail.com>
In-Reply-To: <CAB=WuyaS00Sp1KdA-O-2OMQdwPcx=6p-f03+ZAXVkh-MA9nO2w@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 18 May 2020 23:14:31 +0200
Message-ID: <CA+chaQcZvRO0UqeHPc4q2njLav0A8nnaNHnARpoRGROzHxsSmQ@mail.gmail.com>
Subject: Re: [oe] Should meta-python2 include python-numpy?
To: David Banks <david.banks.engineer@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000d5d45105a5f2a674"

--000000000000d5d45105a5f2a674
Content-Type: text/plain; charset="UTF-8"

I've asked the same in December, see:
https://www.openembedded.org/pipermail/openembedded-devel/2019-December/203618.html

I've also included them in my layer:
https://github.com/ros/meta-ros/commit/630d755319c2bb5d33e2f5910877e153eaebc47d
because I don't want to include meta-python2/zeus branch into my builds,
I'm using meta-python2 in dunfell based builds (because that's where
python2 was removed from oe-core and meta-oe) for zeus it's still unclear
to me what meta-python2/zeus is supposed to be used for.

On Mon, May 18, 2020 at 10:26 PM David Banks <david.banks.engineer@gmail.com>
wrote:

> Hi,
>
> I have a layer the requires python-numpy (specifically python2's numpy).
> When upgrading to zeus, it no longer works because oe-core no longer
> provides the python2 version of numpy. For now I just added numpy to my
> broken layer, but I am wondering if it makes sense to add python2 numpy to
> meta-python2.
>
> Thanks,
> David
> 
>

--000000000000d5d45105a5f2a674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve asked the same in December, see:<div><a href=3D"h=
ttps://www.openembedded.org/pipermail/openembedded-devel/2019-December/2036=
18.html">https://www.openembedded.org/pipermail/openembedded-devel/2019-Dec=
ember/203618.html</a><br></div><div><br></div><div>I&#39;ve also included t=
hem in my layer:</div><div><a href=3D"https://github.com/ros/meta-ros/commi=
t/630d755319c2bb5d33e2f5910877e153eaebc47d">https://github.com/ros/meta-ros=
/commit/630d755319c2bb5d33e2f5910877e153eaebc47d</a><br></div><div>because =
I don&#39;t want to include meta-python2/zeus branch into my builds, I&#39;=
m using meta-python2 in dunfell based builds (because that&#39;s where pyth=
on2 was removed from oe-core and meta-oe) for zeus it&#39;s still unclear t=
o me what meta-python2/zeus is supposed to be used for.</div></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 18=
, 2020 at 10:26 PM David Banks &lt;<a href=3D"mailto:david.banks.engineer@g=
mail.com">david.banks.engineer@gmail.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div><div=
><br></div><div>I have a layer the requires python-numpy (specifically pyth=
on2&#39;s numpy). When upgrading to zeus, it no longer works because oe-cor=
e no longer provides the python2 version of numpy. For now I just added num=
py to my broken layer, but I am wondering if it makes sense to add python2 =
numpy to meta-python2.</div><div><br></div><div>Thanks,</div><div>David<br>=
</div></div>
<br>
</blockquote></div>

--000000000000d5d45105a5f2a674--
