Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B65DC433F5
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 17:06:21 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web08.15132.1636477580436965950
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:06:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CedOhyBp;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id p18so21995159plf.13
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Nov 2021 09:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zYJA9pAADygpda0k+Luh6DftrtYK0BrXK29skOINWP8=;
        b=CedOhyBpnMNneD2ES6RVNGKWmiPK/5CnKh2CPEQVkbPu0W0noLAXgb5iR6/C53bRRJ
         QF7/BoW8rdAoYlD9VRaUoQDISeD36mVbYFZlpS2n+Qt4DqX9upkopXnL3ZZiy22pCdld
         quVyqAvnT5UO0krzdsuj7hNc2DleaNEqyY6BWXfAlJbgJE7RhfMzi9z0MBRhdan1hICd
         5xASLHyulsqi3bPPOmwBTqeTcR0N0pI8P6tnr12xe1L0iwdBTUW6iVWzvtRs1m9S56tv
         g5Tyom7ZGwrUMKnjzaZ2+Hp0JBpNwt4wIOTQW19AUOZr5kEsETnVUFoXdXnsCrOwHKY0
         LFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zYJA9pAADygpda0k+Luh6DftrtYK0BrXK29skOINWP8=;
        b=bCfQSXBiO8E0Cg9gPyd1STM3x+gQn5Fg+KqX9E4JLynHgMzTLdZfSJlwE/0Mo47The
         vDArKdwalMktV4Nw7h+ThoIKYgvHcDVRqJ2DNvMYhE64dHj/mYzVG3Yr2/EK1uqK7ejs
         63JxL7gr1uQnTZMqYo6ntAgk1FasQbLff3KLfKrsdrM0rSDHrLZvFDUT+L0r4fp5NhcX
         xA/DJzVAae9lilIHvlgP2y3oMl1aJuZSXLyF1SBiN4V3PSqaopi3L226oIu6dOXWv64F
         dF/YKIPNSg3YIybz/z6KqkFwhwOXzhO5ab59PncQz2b70YCQazDzR2B5VUfNbKbp4Uda
         /bvA==
X-Gm-Message-State: AOAM532E6rse/1Ae5Trb2WsT3KTANrKkbDnzuQv80iuoOq/+QlPtNsdO
	lvBic1grfp6ZxAiK6ZS0tlem5lCpPO+1UMj6t/X8gwKL6IQ=
X-Google-Smtp-Source: 
 ABdhPJzFv0VZW6gupnf/CnaOeBIXsOcNOM7s+NUzsF2Fl2dwX2DSe06hr8eP5cHcrsv8AKFP1mVItdkoPctL6oMp4+c=
X-Received: by 2002:a17:90a:c091:: with SMTP id
 o17mr8900804pjs.35.1636477579782;
 Tue, 09 Nov 2021 09:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20211109170140.40651-1-akuster808@gmail.com>
In-Reply-To: <20211109170140.40651-1-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 9 Nov 2021 18:06:08 +0100
Message-ID: 
 <CA+chaQeN2EH=nWrhH9eWH9hGs=U632ULx0WRa7Tz8wXharddNg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][v3][honister][PATCH]
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d36d6805d05e2005"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Nov 2021 17:06:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93889

--000000000000d36d6805d05e2005
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 9, 2021 at 6:01 PM Armin Kuster <akuster808@gmail.com> wrote:

> Missed tabs and spaces in the SRC_URI during
> 'Update SRC_URI branch and protocols' translation.
>
> [V2]
> Fix typo in imagemagick, change "gitk" to "git"
>
> [v3]
> Give a typo, fix a typo
>

[v4]
Give a commit summary (it was there in v2), but now there is only:
Subject: [oe] [meta-oe][v3][honister][PATCH]

--000000000000d36d6805d05e2005
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Nov 9, 2021 at 6:01 PM Armin Kust=
er &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt;=
 wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Missed tabs and spaces in the SRC_URI during<br>
&#39;Update SRC_URI branch and protocols&#39; translation.<br>
<br>
[V2]<br>
Fix typo in imagemagick, change &quot;gitk&quot; to &quot;git&quot;<br>
<br>
[v3]<br>
Give a typo, fix a typo<br></blockquote><div><br></div><div>[v4]</div><div>=
Give a commit summary (it was there in v2), but now there is only:</div><di=
v>Subject: [oe] [meta-oe][v3][honister][PATCH]<br></div><div><br></div></di=
v></div>

--000000000000d36d6805d05e2005--

