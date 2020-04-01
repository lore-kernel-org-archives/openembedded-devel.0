Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
 by mx.groups.io with SMTP id smtpd.web10.5929.1585746090419017569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2020 06:01:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GlQS4umF;
 spf=pass (domain: gmail.com, ip: 209.85.221.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f171.google.com with SMTP id r129so6666579vkr.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Apr 2020 06:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FCqwKSencs/B8bCqRrSsAxELlfWHlC0BjEXO1/nPG4M=;
        b=GlQS4umFenh6eKEGAFgBa0BxISbCtOCF4ndfKK79+HVDW3Z3f4NiPE0K95azsWcXXg
         pak87ur2VumXkTflj9ZFiKtw0IeLjzHz6Z8kdWie6rxYA/B7BqczjoZFQdG8Ic314z2E
         ZowlG4xJJLIR5mQ9vgQZcaunMYVXqoy1ZeTF5zGLAdl/O3RizjXDsNJPcDoCEtJr0/Bb
         zKHk8Y8IOg9zz1KPkdKZ0J2oTqTsNrGTl/RW+BfFS2hfRBDi2ybi10bKsahOxyxN5fHw
         NCQiQk8FB3l6Ldw28MJjWQwrBt9xIchB3N4zbhXPuUWEDqUEo3FX7t/WiiCECCDHh9Gn
         KX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FCqwKSencs/B8bCqRrSsAxELlfWHlC0BjEXO1/nPG4M=;
        b=NhVYI6yC4j6j2Eo/tFlxUmtGT2070Q518Hy/djqpGZYKHlT00Vqk4FOiGxkAHGvB+I
         9zDUkFw4bJLROfKjcf+Fg9scHH7l13j8QPQKMy4plGRb/GLTMyAI6ojZW7OiBkPaT4IO
         CtaxpgwUHj/hN60PDNVof6hiABpTS9k7ZXLsfnrMFXRC1dIjNxHVcCIeBu2SR07+Q4rp
         hYP5GTpnu7GExzUuoZ0lSmj4J3eNjbKgYNTmpTa7+QkAftJGoqixu+MIbDZeVDIDDlXd
         6JDIVOCFwjsIcuQG+mlZZ/MLYmntN9fPBS841hJWPmqt04BBLPK+Jxul+HLmKks5hEUH
         1Tcg==
X-Gm-Message-State: AGi0PubZHDIzd5kX8QqTl9cw6XPC0X4ZYA8t7fdnGbRSXnBvnU89GG8f
	O2kVK3xXQS2c7UUFW4TdrDQM24ljlsYrgvTyu1Y=
X-Google-Smtp-Source: APiQypJdOdMK8HxGXE31sLDlXgra0XGTxIpTtI3i66TNFZ8eY4uCpz3QNRex4lkhG+3MIlSoEa4h/Fe3hxtUQcl+EFU=
X-Received: by 2002:a1f:bf95:: with SMTP id p143mr16266152vkf.29.1585746089449;
 Wed, 01 Apr 2020 06:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <0lSA.1585309548597994059.HtCB@lists.openembedded.org>
In-Reply-To: <0lSA.1585309548597994059.HtCB@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 1 Apr 2020 15:01:18 +0200
Message-ID: <CANNYZj9pKtUwiAmWNB=O1Py-q0jUckfheAc+Sxe9nou17ok12g@mail.gmail.com>
Subject: Re: [oe] #oe [meta-python] python 3.7 runtime with sumo
To: Fawad Mazhar <fawadmazhar@hotmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005da61c05a23a48a6"

--0000000000005da61c05a23a48a6
Content-Type: text/plain; charset="UTF-8"

You should upgrade to a yocto release that already has 3.7. Backporting is
difficult at best, and probably impossible.

Alex

On Wed, 1 Apr 2020 at 14:47, Fawad Mazhar <fawadmazhar@hotmail.com> wrote:

> Hi guys!
>
> Is it possible to have python 3.7 runtime for the target while baking
> image using sumo branch. I would like to overwrite the default 3.5.5 by 3.7
> somehow. Can anyone guide me here?
>
> Thanks!
>
> BR,
> Fawad 
>

--0000000000005da61c05a23a48a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>You should upgrade to a yocto release that already ha=
s 3.7. Backporting is difficult at best, and probably impossible.</div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Wed, 1 Apr 2020 at 14:47, Fawad Mazhar &l=
t;<a href=3D"mailto:fawadmazhar@hotmail.com">fawadmazhar@hotmail.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi guys=
!=C2=A0<br><br>Is it possible to have python 3.7 runtime for the target whi=
le baking image using sumo branch. I would like to overwrite the default=C2=
=
=A03.5.5 by 3.7 somehow. Can anyone guide me here?=C2=A0<br><br>Thanks!<br=
><br>BR,<br>Fawad
<br>
</blockquote></div>

--0000000000005da61c05a23a48a6--
