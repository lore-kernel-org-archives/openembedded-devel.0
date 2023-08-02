Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D446C001E0
	for <webhook@archiver.kernel.org>; Wed,  2 Aug 2023 18:26:47 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
 by mx.groups.io with SMTP id smtpd.web11.3889.1691000800551975253
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 11:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=U+It0PH9;
 spf=pass (domain: gmail.com, ip: 209.85.161.49, mailfrom: ticotimo@gmail.com)
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-56cb1e602e7so28444eaf.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691000800; x=1691605600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=awCnwNK8WZI7iZhsLQTVSufXlyKWSqykINQZXYuUQVE=;
        b=U+It0PH9pcWybSaqQ+uuBqOU+mb9PStOjgi9UJJdomhl58hqhI9b5cBaGzBTrZ7GOw
         3qlhJxWSMrp4aAlyI80Yn/E2D+spszUDYFcRVNCP2JzrV9j/oRT8esvcAJVrj8cOjM11
         urEZF9BcQBm8y6JeOCNVbiexvHC/fD/IIP7LH8CUGl2ULWd6Kn2YBpUcSfpK42rEfPCw
         lALy+NALDyz6d0XK0Naxj0djFF0jPk8gCrhkgiCP38zfevu3tL4D7smARtfgrK/oNzrJ
         wlFnqWRBuk46/lI7BIsBzaT2O9LqsYUuXTrq9zAKus9VUXu/xrO84BX/LPOSICzfzZ+d
         DiPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691000800; x=1691605600;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=awCnwNK8WZI7iZhsLQTVSufXlyKWSqykINQZXYuUQVE=;
        b=csyREt3R3nDBqS+iYddpkvsOrJiIE/9hR5YxUE3Yu23m6N/nvGn+6w6w4mEQdTqDHh
         FnZRGBv9HuHUIL9NjuqR29bYTqxbe80jJQWNsVDTjhsMUCZNG2Y6unjHTJy8k957+Wzr
         CGnDUqWieFrYyyEXeOxEZ9GOZWxdPAQeACZFe35bhBaomFZOU5X9etPdis3D3VILawc5
         XnS/g/RW0D9PApVOzcsTxmDMJbEvVhvgyMfhptYoTnOYu1qY2exsvCeCST7aYe2Eu04j
         6F3yP4DBCwvMK4MPGlfiqLoxHC/xkpSn847F/CNe18qTHokwYNAGJ26WMshugUwlIIfa
         RcGQ==
X-Gm-Message-State: ABy/qLYwSkxIt6pMXv25jfJAXpi3Za4WrxmhK7dlY/pyXSPDw3nPUxHA
	HMEee4yLo2AvCM+WMaugHdvshDKT8IJvt9SORbw=
X-Google-Smtp-Source: APBJJlHuwFaGGG+VZYbAkhDTQU4kaYz1A3QuvTkPGSgzRcuoXaPDZy5BIXP2HVkFaH1MclX1oxsHbrQLOT1UcfxIbfc=
X-Received: by 2002:a05:6358:7213:b0:139:a45c:32b2 with SMTP id
 h19-20020a056358721300b00139a45c32b2mr8725626rwa.11.1691000799422; Wed, 02
 Aug 2023 11:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230802170036.9288-1-Robert.Berger@ReliableEmbeddedSystems.com>
 <CA+chaQc-bPFrjQTgJifGf7KF3wo=Uf6V9ibKrDYQeTFi72sJ3w@mail.gmail.com> <5b3a1c91-c013-bfab-d8f8-c7500cfd6c6c@gmail.com>
In-Reply-To: <5b3a1c91-c013-bfab-d8f8-c7500cfd6c6c@gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Wed, 2 Aug 2023 11:26:28 -0700
Message-ID: <CANx9H-C4v_Qb_O03-=w_=J9DBQ9F8OCHUXpj7FGzUgx4reSHVg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] replace /usr/bin/env python -> python3
To: Robert Berger <robert.berger.oe.devel@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, Robert Berger <oecore.mailinglist@gmail.com>, 
	openembedded-devel@lists.openembedded.org, 
	Robert Berger <Robert.Berger@reliableembeddedsystems.com>
Content-Type: multipart/alternative; boundary="000000000000f6eb600601f4cde6"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Aug 2023 18:26:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104207

--000000000000f6eb600601f4cde6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 2, 2023 at 10:17=E2=80=AFAM Robert Berger <
robert.berger.oe.devel@gmail.com> wrote:

> Hi,
>
> On 02/08/2023 19:07, Martin Jansa wrote:
> > Does it work when you re-execute do_configure or do you get python33? I
> > think you should anchor the regexp with '$'.
>
> I think you are right - Let me play around a bit and I'll send v2.
>
> You can also use '1s' to only change the first line.

NOTE: the subject should include the package being fixed, otherwise it
sounds global which it is not
" uftrace: replace /usr/bin/env python -> python3"

--=20
> Robert Berger
> Embedded Software Evangelist
>
> Reliable Embedded Systems
> Consulting Training Engineering
> URL: https://www.reliableembeddedsystems.com
>
> Schedule a web meeting:
> https://calendly.com/reliableembeddedsystems/
> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
> --
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104206):
> https://lists.openembedded.org/g/openembedded-devel/message/104206
> Mute This Topic: https://lists.openembedded.org/mt/100509860/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000f6eb600601f4cde6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Aug 2, 2023 at 10:17=E2=80=AF=
AM Robert Berger &lt;<a href=3D"mailto:robert.berger.oe.devel@gmail.com">ro=
bert.berger.oe.devel@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">Hi,<br>
<br>
On 02/08/2023 19:07, Martin Jansa wrote:<br>
&gt; Does it work when you re-execute do_configure or do you get python33? =
I <br>
&gt; think you should anchor the regexp with &#39;$&#39;.<br>
<br>
I think you are right - Let me play around a bit and I&#39;ll send v2.<br>
<br></blockquote><div>You can also use &#39;1s&#39; to only change the firs=
t line.</div><div><br></div><div>NOTE: the subject should include the packa=
ge being fixed, otherwise it sounds global which it is not</div><div>&quot;=
 uftrace: replace /usr/bin/env python -&gt; python3&quot;</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
-- <br>
Robert Berger<br>
Embedded Software Evangelist<br>
<br>
Reliable Embedded Systems<br>
Consulting Training Engineering<br>
URL: <a href=3D"https://www.reliableembeddedsystems.com" rel=3D"noreferrer"=
 target=3D"_blank">https://www.reliableembeddedsystems.com</a><br>
<br>
Schedule a web meeting:<br>
<a href=3D"https://calendly.com/reliableembeddedsystems/" rel=3D"noreferrer=
" target=3D"_blank">https://calendly.com/reliableembeddedsystems/</a><br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
<br>
--<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#104206): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104206" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/104206</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100509860/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/100509860/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000f6eb600601f4cde6--

