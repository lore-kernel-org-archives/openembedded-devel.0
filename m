Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web11.4626.1631217292678528285
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Sep 2021 12:54:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BoCKoQ6B;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 93so1938206qva.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Sep 2021 12:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0hPrLILlNCCy8fcjfUS5yYCKU5zHS/pf5/CsY/mtkuA=;
        b=BoCKoQ6BcCCli/e5z/Xo1hAa6qdlirEPEPVDBrr6kSL8M3/mVOzAZlRKNDApWOMP1x
         rlh5JidoQg24RPesVrgsMlbXO2QebQwJq4Au1myTFJRc5E1HyAThGbnku6cpxCkxi7ur
         zjZ4X1T9SQNcfXIzswOxIsfqKWUT0IxvkVrzalhIBf+L+0FALSFnZI87VkPxRx8GDFSE
         1i9G6K5FyyRjhpoJb4l8hqQkSAheSKVrbDlb0uyh/UAtk6RLXI6Nu7y9gbTN1yvUvwGY
         m18MGoeewzTHiECLJIHq/Y8YrhwqCxiAqQV8jWu7UB+L2KvnPGt4HrrFQGXCVG3NqgVm
         gnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0hPrLILlNCCy8fcjfUS5yYCKU5zHS/pf5/CsY/mtkuA=;
        b=Dv8ELG7Qy5T061TiyJ8hffUsoyyOVJlu1XW0i647L/TUdv6Cp/jsKNid6XtBIpwb3j
         h4wJN0gvv0256kdy9eeOykGWiAs+ZxIpXzzk/dx7x2jm0KFF9sSDKx8q4B0PwDBevsNs
         pj1zXJlu2QtdUIN3MpPyGT9GJvN0Bq7JnXrkKnAhTpST9yiwyHzADPbJ1hS69jIZf/GP
         FuPX1BAxHMbLV12/znaOKqNk5H9s9FqWaB1welO5Hczw2lLV+Oy8h3CBpQAmzLD3MzDb
         uRZMPcT84zrHj5UrUfDc/sacwvsOc5YWttHesfYg5VzPFtr1lwaLBzRKjd1wR6r+jtlP
         v5wA==
X-Gm-Message-State: AOAM530JcpQPt3A/MW+dq8qzRSSl5C3oj9xoxf4QjF2C7hgx/q2Sr+Rs
	1renb7IjBiTw4/3tNAyE+SCQsg9dOPgLWb50ba8=
X-Google-Smtp-Source: ABdhPJwuV1553TkoEv3XmkMccDOmRYj8yiKwse9FWxoVlYPatD9QxUzm3yJXfosejnyxJfjYg114gmk0+NyrhrRPQcc=
X-Received: by 2002:a0c:fca2:: with SMTP id h2mr4797709qvq.5.1631217291700;
 Thu, 09 Sep 2021 12:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210903112308.4288-1-f_l_k@t-online.de> <82c9dfbc-85e1-2349-dca6-c10185558cdf@gmail.com>
 <301b5ec1-5fe8-dc43-541a-18d4311a14f7@t-online.de>
In-Reply-To: <301b5ec1-5fe8-dc43-541a-18d4311a14f7@t-online.de>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Sep 2021 12:54:41 -0700
Message-ID: <CAMKF1soqox3i7tC7WroX5WX8_S1Z2jwNNHU=PceC80MfsMKxHg@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH v2] gimp: add recipe for current developement version
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000392b8e05cb955f77"

--000000000000392b8e05cb955f77
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 12:49 PM Markus Volk <f_l_k@t-online.de> wrote:

> sure, the dev version shouldn't be the default. Do i need to send
> another patch for that?


Just make the change on this recipe and send a v2

>
>
> Am 09.09.21 um 18:37 schrieb Khem Raj:
> > seems ok, can we also add DEFAULT_PREFERENCE = "-1" since we do not
> > want this to be picked as default.
>

--000000000000392b8e05cb955f77
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Sep 9, 2021 at 12:49 PM Markus Volk &lt;<a href=3D"=
mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">sure, the dev version shouldn&#39;t be the default.=
 Do i need to send <br>
another patch for that?</blockquote><div dir=3D"auto"><br></div><div dir=3D=
"auto">Just make the change on this recipe and send a v2=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex" dir=3D"auto"><br>
<br>
Am 09.09.21 um 18:37 schrieb Khem Raj:<br>
&gt; seems ok, can we also add DEFAULT_PREFERENCE =3D &quot;-1&quot; since =
we do not <br>
&gt; want this to be picked as default. <br>
</blockquote></div></div>

--000000000000392b8e05cb955f77--
