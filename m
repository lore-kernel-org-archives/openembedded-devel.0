Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
 by mx.groups.io with SMTP id smtpd.web10.9676.1607054994318929810
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 20:09:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fXxzFuX5;
 spf=pass (domain: gmail.com, ip: 209.85.166.48, mailfrom: twoerner@gmail.com)
Received: by mail-io1-f48.google.com with SMTP id n14so4422058iom.10
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 20:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=weIBe5cs1yyK1WfNVqHTOCbi2eNrb/R9JbQf71L2g+g=;
        b=fXxzFuX5trE6L0BqvWxmBnyFLGZ/LrAuMjBVyYZlDeOsIV+SMIzADD/4MkGptBeiEN
         J/MaxDazzrKJ6PP5ZBh+Vdo6OOCG0e5T722i2LaG+PPjClOPaH0OqHWtI5UE3FinH0SH
         c5VwhpYjBbPJBcYbZBjuPPuRK3l2pHxu7Avq8nHiKdhVnEsA5EVXZpjf0R1JatzLejBW
         Wo2HAwZ891rfQ80IUMfSKSagK9s7lwjgaJI79Kv+PFu1fTYNBkzAm3dcfRi1nGL9HG0M
         KhpqyQUwWm8PyiMT2mc5PnIX+9R0CurWJ6VRPxRZ54QI8g0SDyU4J57x8K3huK95sds2
         9xVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=weIBe5cs1yyK1WfNVqHTOCbi2eNrb/R9JbQf71L2g+g=;
        b=YotyzR0dhMt8jcSTTf+vVNNf5qUnRiv9Y5tY5b8WnlhEBOrjMRMt0kRk3Ky52+0RY3
         jM1h43lbZrlzpEerif1YMpT5M0v/Nk5wN2BaK8J+i6UwbJ1GWYFOx4o+kRpgvk+7LsFT
         vsSqrKD4CiYZVFl1BX/M64ZQErAON4oR6rWIh/QzUTfysjYPfZDDB6Fa92ZBMgs+v+LK
         f3Ik4WrLvMWwOFxdumz9Rj3NU1qocbRUQretQh45btL0XTGkqHILIpUj8SVPklId70Gp
         IE8mQvz9RvXwPf4CC7gWm+oCprFBNa5l5mrlp4OD19NQ0CjNpFfICrjuisSSxMWN04Z0
         Nc+A==
X-Gm-Message-State: AOAM531tn7n9EBwnsMT3+cl27gxt1KK8tbrkin84DhXAg9lyE8mUpK9j
	xVSft4jKZbmX21L/kr786Y72gIWfPUzMubcrj0s=
X-Google-Smtp-Source: ABdhPJz19ORFP74W89dK61m40VWl96twFU9hGJMrf64lRQktb59naDN5gXiwjKipc+soB4tAk5VX9QXQiwnmwSuxy3U=
X-Received: by 2002:a6b:fd03:: with SMTP id c3mr3531109ioi.64.1607054993833;
 Thu, 03 Dec 2020 20:09:53 -0800 (PST)
MIME-Version: 1.0
References: <20201203142407.4865-1-twoerner@gmail.com> <20201203142407.4865-2-twoerner@gmail.com>
 <CAMKF1so4Kr1v5mXQ0S0JdeX29JNPC2bxvqWQo_h32HbknQnD+g@mail.gmail.com>
In-Reply-To: <CAMKF1so4Kr1v5mXQ0S0JdeX29JNPC2bxvqWQo_h32HbknQnD+g@mail.gmail.com>
From: "Trevor Woerner" <twoerner@gmail.com>
Date: Thu, 3 Dec 2020 23:09:42 -0500
Message-ID: <CAHUNapQ+nspppj72Z+n5PL--A8tey0=irM1Z55+Xq0DHOpf17A@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/3] glmark2: update to latest
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000ac4e605b59ba6e8"

--0000000000000ac4e605b59ba6e8
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 3, 2020 at 5:48 PM Khem Raj <raj.khem@gmail.com> wrote:

> I am seeing this error
>
> https://errors.yoctoproject.org/Errors/Details/539076/
>
> all across machines. Perhaps it needs to depend on wayland-scanner
>

Excellent, thanks for testing. Sorry, I hadn't tried building for wayland.
Please see V3

--0000000000000ac4e605b59ba6e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Dec 3, 2020 at 5:48 PM Khem Raj &=
lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<=
br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">I am seeing this error<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/539076/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/539076/</a><br>
<br>
all across machines. Perhaps it needs to depend on wayland-scanner<br></blo=
ckquote><div><br></div><div>Excellent, thanks for testing. Sorry, I hadn&#3=
9;t tried building for wayland.</div><div>Please see V3=C2=A0</div></div></=
div>

--0000000000000ac4e605b59ba6e8--
