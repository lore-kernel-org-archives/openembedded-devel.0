Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.33188.1623054076331626350
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 01:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WRFBkAF3;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id i13so19274273edb.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 01:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dhW42yQex2PUKnw3c8clp/KmlhEpZaZWkMs4wBe3ikI=;
        b=WRFBkAF3M48mBLZ21D75wGgNZ/X3tIjVyws2opFhftthZP0S7OvcvY7omdPRyfZKQR
         klxJMenCgOJpbtdWYtsq805uJfTepo2cU+Hhd2hqJZjU3aSPaBK/S7mVr4Ejxw6OKzyU
         AU7jUJE0dxaLYuSniISi4K5n6gUO/9K70I9HFBY4W1G7ctXFTp5Q7eJx6YhSNNW9idb5
         A3fhmP+N46CHzL0bllerZicIxlwH8BcICVaaNlp1WDakhtjFPclJ4/Qgtgz2iegnKOO8
         y7orj7BBAxKfbD5WMjsDF/N1BO7rkAN3LM8OooT3Mw65GRDhMPPqZMsORZXPOKpz9Glx
         M4KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dhW42yQex2PUKnw3c8clp/KmlhEpZaZWkMs4wBe3ikI=;
        b=TwDfys895QmWmObnNSH4iwOfZQF/KMVpmxN/aSk9YYHlQSuTJg0p5DB6KMAp2RvDbE
         c0azk/dh+AjG4T0Oc5pvYVdkdCGfnX25J5kBdoNGkY9F590AwEFioc+EnoBwu6i45wL/
         PT6HzJenDPtJE4owJyw8a8kU1Dw8JFcDU4XdYibeVU4e292ecWkfvwKsKzgcocDFv/+k
         biE4kQ+Df9ILqKEzZwYL6TnnU8JaY/RMtGc5RnyzyqpxqIOWxGlWzrpZojUSYSkSOYMv
         d2lQnsAo/us/B+bmyShaYRstV6L9mP+P9uRKHb0jPefSgKYmXsFoEu6lv2uhwbGl7vI/
         TYpQ==
X-Gm-Message-State: AOAM531vK0lJ2A62HV7oDQiERZtYjibGBtsC1fGyfsTyjS9/UagKg34Z
	L/j82I2xjgS1SX9TuS4WsT66qQ1Q0kCf2yVg6EM=
X-Google-Smtp-Source: ABdhPJzb6Y/Xn7Dbz4/ZuqVPnFSkp/gDcj5A5MjfVxDWPA1jkd4hglmjhBQodg67XWV8Jv0KZjpR25cQTFa4jVozD1I=
X-Received: by 2002:a05:6402:754:: with SMTP id p20mr18320020edy.311.1623054074710;
 Mon, 07 Jun 2021 01:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210604014438.33958-1-kai.kang@windriver.com>
 <CA+chaQf3SGiUJSg57umnwTQ8gMtAmrFLTSsTw=xeB2GYzaRSpQ@mail.gmail.com> <b47a52f7-6946-9be0-a22c-8526047215a5@windriver.com>
In-Reply-To: <b47a52f7-6946-9be0-a22c-8526047215a5@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 7 Jun 2021 10:21:02 +0200
Message-ID: <CA+chaQcxyMhVhHrnfEJjp0iKcrT7EpLUdy0E3vM5xRDHiiqADg@mail.gmail.com>
Subject: Re: [oe] [PATCH] layers: set LAYERSERIES_COMPAT with honister
To: Kai <kai.kang@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000930ee405c428b9d5"

--000000000000930ee405c428b9d5
Content-Type: text/plain; charset="UTF-8"

Then I believe layer index should be fixed to support longer values, there
are layers which are compatible with multiple releases and it works fine
with bitbake/oe-core, layer index parsing shouldn't be more strict than the
mechanism which is using these variables.

On Fri, Jun 4, 2021 at 11:26 AM Kai <kai.kang@windriver.com> wrote:

> On 6/4/21 4:52 PM, Martin Jansa wrote:
>
> On Fri, Jun 4, 2021 at 3:44 AM kai <kai.kang@windriver.com> wrote:
>
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Set LAYERSERIES_COMPAT with 'honister' which align with oe-core.
>>
>>
> I think it's bad practice to claim honister support this early in its
> development cycle. It won't happen with well-maintained layers like
> meta-oe, but if some less frequently updated layer sets the compatibility
> with honister now and then doesn't get necessary updates to stay compatible
> with honister in next 4 months, then whole purpose of LAYERSERIES_COMPAT
> will get broken just by claiming the compatibility too soon (without even
> knowing what final honister will contain).
>
> Changing it after release freeze in oe-core seems much better time to do
> it.
>
> The same does apply on the meta-qt5 PR you've sent today
> https://github.com/meta-qt5/meta-qt5/pull/416/commits
> <https://urldefense.com/v3/__https://github.com/meta-qt5/meta-qt5/pull/416/commits__;!!AjveYdw8EvQ!Kd76LvM-JcgNBu85RB8Bu2U6MF7jgfI31fh0o1hXL0VPVFMaEEBpol_tM3o5gwAD5A$>
>
> Cheers,
>
> Got it. Thanks very much.
>
> I've comment on the meta-qt5 PR that too long strings in
> LAYERSERIES_COMPAT will cause layer index complains:
>
> WARNING: YPCompatibleVersion.name: dunfell gatesgarth hardknott: length 28
> exceeds maximum (25), truncating
>
> So what is policy to keep old codenames in LAYERSERIES_COMPAT? Is  that ok
> to keep latest 2(hardknott and honister), please?
>
> Regards,
>
> --
> Kai Kang
> Wind River Linux
>
>

--000000000000930ee405c428b9d5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Then I believe layer index should be fixed to support long=
er values, there are layers which are compatible with multiple releases and=
 it works fine with bitbake/oe-core, layer index parsing shouldn&#39;t be m=
ore strict than the mechanism which is using these variables.<br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Ju=
n 4, 2021 at 11:26 AM Kai &lt;<a href=3D"mailto:kai.kang@windriver.com">kai=
.kang@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">

 =20
  <div>
    <div>On 6/4/21 4:52 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">On Fri, Jun 4, 2021 at 3:44 AM kai &lt;<a href=3D"=
mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>=
&gt;
          wrote:<br>
        </div>
        <div class=3D"gmail_quote">
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang =
&lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@wi=
ndriver.com</a>&gt;<br>
            <br>
            Set LAYERSERIES_COMPAT with &#39;honister&#39; which align with
            oe-core.<br>
            <br>
          </blockquote>
          <div><br>
          </div>
          <div>I think it&#39;s bad practice to claim honister support this
            early in its development cycle. It won&#39;t happen with
            well-maintained layers like meta-oe, but if some less
            frequently updated layer sets the compatibility with
            honister now and then doesn&#39;t get necessary updates to stay
            compatible with honister in next 4 months, then whole
            purpose of LAYERSERIES_COMPAT will get broken just by
            claiming the compatibility too soon (without even knowing
            what final honister will contain).</div>
          <div><br>
          </div>
          <div>Changing it after release freeze in oe-core seems much
            better time to do it.</div>
          <div><br>
          </div>
          <div>The same does apply on the meta-qt5 PR you&#39;ve sent today=
=C2=A0<a href=3D"https://urldefense.com/v3/__https://github.com/meta-qt5/me=
ta-qt5/pull/416/commits__;!!AjveYdw8EvQ!Kd76LvM-JcgNBu85RB8Bu2U6MF7jgfI31fh=
0o1hXL0VPVFMaEEBpol_tM3o5gwAD5A$" target=3D"_blank">https://github.com/meta=
-qt5/meta-qt5/pull/416/commits</a></div>
          <div><br>
          </div>
          <div>Cheers,</div>
        </div>
      </div>
    </blockquote>
    <p>Got it. Thanks very much.</p>
    <p>I&#39;ve comment on the meta-qt5 PR that too long strings in
      LAYERSERIES_COMPAT will cause layer index complains:</p>
    <p>WARNING: YPCompatibleVersion.name: dunfell gatesgarth hardknott:
      length 28 exceeds maximum (25), truncating</p>
    <p>So what is policy to keep old codenames in LAYERSERIES_COMPAT?
      Is=C2=A0 that ok to keep latest 2(hardknott and honister), please?</p=
>
    <p>Regards,<br>
    </p>
    <pre cols=3D"72">--=20
Kai Kang
Wind River Linux</pre>
  </div>

</blockquote></div>

--000000000000930ee405c428b9d5--
