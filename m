Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C58FDC433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:46:12 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web09.28102.1658155571037915591
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:46:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WzwUo2Ad;
 spf=pass (domain: gmail.com, ip: 209.85.160.171,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id y9so5495972qtv.5
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QFCXufl4pJJQf+ZdeAqxM684WlTENe0hKsRQxwIKR0E=;
        b=WzwUo2AdimigMfZpYdJAG1IyVw9cY0vDl7b6Kxtdd6mJnHzPbUqRnU6ZSNPLZ9zYWl
         TYGyBJ06BHearenMiQzcJfVHM/56CxCgrosHtnNsN9uWM/1vpZr+27wpAa2YTmoj+dO+
         YnlHNzJg7nskuTnUklZK62AN+V7TzsvW+YSad8m7wF+AdMDRWGYEXmT9xnsJ3dl8IeXd
         MSaSuJjSTEDxejRsNKV2Ip0zHhbS+yymfCWx2Cc/o/tHsZGHJjsOceZJTJGafqpy/3KS
         UrGgt0Da4yG4QeQCwYhrdTxF1cCN/ZF/OpXcjL9kQ3NZhsZSrX18I+EN1BAvNhsoAQMF
         s9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QFCXufl4pJJQf+ZdeAqxM684WlTENe0hKsRQxwIKR0E=;
        b=U79GabgrTjYgrTiXCl9E82ulhfAcZbtMlLCLbEbXVzGIhiMIubF4hTtTYbztCHeDRI
         nS/voP+s8zE0QUJQoBEfirK2nyg+qHBnyA4TFlJ8ujMMOUee5oA5xEqN/wD+7Ncsb2x+
         eZPvIlDnubp0HsInXJwFTLYZjnMfvzuNN8n6vgLtwCF/7Cy+bvoN6tQXuUG/c+6auyZu
         +p1mU4OLSHX/hfS6eS1Ipc6EARqGw4176qyI1NbpSSO1bMF8/QVsiYeBNd8TFp7XV5Oa
         2lu6d7JeQh3iJ6JrJ/5HQ4xKEQIP75xsEKB2xG2SVeFTJPGXyQAEiMdH8p660hIRT7oK
         +hKg==
X-Gm-Message-State: AJIora97r4+n8kq6/ToR9fe5lndAVazrMnHNFCSHf0bHdkTCwTPI5xHI
	RXOn3pb8eTjg+M8HxY4WV+dAbsYA/raPCowEqm5UQMNm6Lw=
X-Google-Smtp-Source: 
 AGRyM1vWJHxgS+wQa6SaL+Eqnf0zl7N0yoj2xTMmCigfafIcyfG7Z/QLwY8725BCGDj1D3V8MM/nbBepjjxMrUrMs4s=
X-Received: by 2002:ac8:5e4f:0:b0:31e:d96f:a4e7 with SMTP id
 i15-20020ac85e4f000000b0031ed96fa4e7mr12764608qtx.634.1658155569981; Mon, 18
 Jul 2022 07:46:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220716031434.4021879-1-raj.khem@gmail.com>
 <20220716031434.4021879-3-raj.khem@gmail.com>
 <D981D817-D78E-4CEC-A685-7BABEF22530F@arm.com>
 <PA4PR08MB7411E748A14F4EBA9B9E132DE88C9@PA4PR08MB7411.eurprd08.prod.outlook.com>
In-Reply-To: 
 <PA4PR08MB7411E748A14F4EBA9B9E132DE88C9@PA4PR08MB7411.eurprd08.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Jul 2022 10:45:59 -0400
Message-ID: 
 <CAMKF1sqKO=B14tYy2MW1q+HOVf+Zawk0PBYeadWMP48GNMDFiw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] python3-pycups: Inherit setuptools3
 instead of python_setuptools_build_meta
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000bb2d2b05e4156d75"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Jul 2022 14:46:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97877

--000000000000bb2d2b05e4156d75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 18, 2022 at 8:09 AM Ross Burton <Ross.Burton@arm.com> wrote:

> *> *the picobuild 0.2 upgrade queued for oe-core improves =E2=80=9Clegacy=
=E2=80=9D
> setuptools builds too.
>
> I=E2=80=99ve just looked at the logs and this is the correct fix.  Don=E2=
=80=99t merge
> these, just wait for picobuild 0.2 to land.
>
>
Ah a bit late but we can apply the new fixes once it lands on core


>
> Ross
>

--000000000000bb2d2b05e4156d75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Jul 18, 2022 at 8:09 AM Ross Burton &lt;<a href=3D"=
mailto:Ross.Burton@arm.com">Ross.Burton@arm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #=
ccc solid;padding-left:1ex">





<div lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:b=
reak-word">
<div class=3D"m_-470380325719561422WordSection1">
<div>
<p class=3D"MsoNormal"><b><span style=3D"font-size:12.0pt">&gt; </span></b>=
<span style=3D"font-size:11.0pt">the picobuild 0.2 upgrade queued for oe-co=
re improves =E2=80=9Clegacy=E2=80=9D setuptools builds too.<br>
<br>
<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">I=E2=80=99ve just l=
ooked at the logs and this is the correct fix.=C2=A0 Don=E2=80=99t merge th=
ese, just wait for picobuild 0.2 to land.</span></p></div></div></div><div =
lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:break-=
word"><div class=3D"m_-470380325719561422WordSection1"><div><p class=3D"Mso=
Normal"><span style=3D"font-size:11.0pt"><u></u><u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><u></u></span></p><=
/div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Ah a bit late but we can apply the new fixes once it lands on core=C2=A0</=
div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div lang=3D=
"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:break-word"><=
div class=3D"m_-470380325719561422WordSection1"><div><p class=3D"MsoNormal"=
 dir=3D"auto"><span style=3D"font-size:11.0pt">=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Ross<u></u><u></u><=
/span></p>
</div>
</div>
</div>

</blockquote></div></div>

--000000000000bb2d2b05e4156d75--

