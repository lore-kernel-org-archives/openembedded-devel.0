Return-Path: <beniaminsandu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FD2CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 11:13:19 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.36014.1697195592450073874
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 13 Oct 2023 04:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NWcrRQBn;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: beniaminsandu@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-27ce05a23e5so2441812a91.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 04:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697195592; x=1697800392; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=16sCAeA3BCdjIVjBoCz/jAsUlz0+165zkXlaFicSNKU=;
        b=NWcrRQBnyKoqsfThQHU4ucVAxH1VjLsx4ateV0NjAVtQDlNfiwMZqkT0cNLjfGDHW0
         FuUo3I8DOBen+/oPYchuP4cqYgjr4WZrCmbca+MorsyiGTAHYt16tDz6YvTmymbG7uhr
         jnnpsaJHc9VxJul0v5lG/XkKjqIqQMcuCuZc/xxdblq1DWGfCpeycJuKErxyWOIv8tCq
         nkv/SJacDbDJtYnX6CPqNapXVLMFkIPsHkDINsxEFWkUoDtMmBWjKVWqOVw1zS2AQw+w
         qk34v6h9GUXu/ER+GBOS17xHuqzbYU1pKCF1dQaB3eVsdWFcvE+v+hXdc1aGAuNqv/Hy
         3okg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697195592; x=1697800392;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=16sCAeA3BCdjIVjBoCz/jAsUlz0+165zkXlaFicSNKU=;
        b=Id0rraJHPn102jJHKkHpTlpYXPMD/h3ic2oJwX9XdJNus/XE4k32CAQArKBv0tK6k7
         EXgZ2g7uPEplGCTelEVzdQpOMCZC3RJ8xvp5cZzqGnjdKrYHn+MiQMCNlIGAv4/jfnxL
         01WNhhyjd5LFD+o/9FKxm3AG3valGMiBd/HIKAC/f5X9ZHzXPN+SStmKbfAxwLoI+d8f
         gS+hITbICIgO9mH6hfYEGEU7N6YMPhu5ET6Pj1beIEFjLTZ/8Yw+Ptn//IuoTli8iPkZ
         rfSultbW5qNC1Dm2bthHfHzE3iALJsAocnZTbsKqotCd0avOS/icCXzqUu9dsVRWccq9
         UXAQ==
X-Gm-Message-State: AOJu0YxXTQvP7ACxe2M7+DP078g16v6/4I1ScpLd7fMP/MLgr9MUaXmW
	jY4QTr5eCd0G9CTUexAe57cSf0O1QZu/od8zdmo=
X-Google-Smtp-Source: AGHT+IE5jlIz3HOp9yh1zmP0KPgH4P5vFq8TwXnCMKHBcxisuPv4Pj4I3CdtpQN+ZvUzeHwq0lC18JjJyv+As1CrgAI=
X-Received: by 2002:a17:90b:1d04:b0:268:808:8e82 with SMTP id
 on4-20020a17090b1d0400b0026808088e82mr37336292pjb.1.1697195591776; Fri, 13
 Oct 2023 04:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231013091644.314001-1-beniaminsandu@gmail.com> <ZSkjB9xdaORRYM_6@nuoska>
In-Reply-To: <ZSkjB9xdaORRYM_6@nuoska>
From: Beniamin Sandu <beniaminsandu@gmail.com>
Date: Fri, 13 Oct 2023 12:13:00 +0100
Message-ID: <CABQJdOFYUjjUStqaG56aSe1yL7uFejdTKi-_rPtRt=HOZFk4ZQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] mbedtls: upgrade 3.4.1 -> 3.5.0
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005cbe0c0607972456"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 13 Oct 2023 11:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105465

--0000000000005cbe0c0607972456
Content-Type: text/plain; charset="UTF-8"

On Fri, 13 Oct 2023, 11:59 Mikko Rapeli, <mikko.rapeli@linaro.org> wrote:

> Hi,
>
> On Fri, Oct 13, 2023 at 10:16:44AM +0100, Beniamin Sandu wrote:
> > Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
>
> Would be nice to have some kind of change log entry here. For example that
> this fixes https://nvd.nist.gov/vuln/detail/CVE-2023-43615
> and that there are some API behavior changes noted in
> ChangeLog.
>

Good idea, will do that from now on.

Thanks,
Beni


> Cheers,
>
> -Mikko
>

--0000000000005cbe0c0607972456
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Fri, 13 Oct 2023, 11:59 Mikko Rapeli, &lt;<a href=3D"mailto=
:mikko.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">Hi,<br>
<br>
On Fri, Oct 13, 2023 at 10:16:44AM +0100, Beniamin Sandu wrote:<br>
&gt; Signed-off-by: Beniamin Sandu &lt;<a href=3D"mailto:beniaminsandu@gmai=
l.com" target=3D"_blank" rel=3D"noreferrer">beniaminsandu@gmail.com</a>&gt;=
<br>
<br>
Would be nice to have some kind of change log entry here. For example that<=
br>
this fixes <a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2023-43615" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://nvd.nist.gov/vuln/deta=
il/CVE-2023-43615</a><br>
and that there are some API behavior changes noted in<br>
ChangeLog.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Good idea, will do that from now on.</div><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Thanks,</div><div dir=3D"auto">Beni</div><div dir=3D=
"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">
<br>
Cheers,<br>
<br>
-Mikko<br>
</blockquote></div></div></div>

--0000000000005cbe0c0607972456--

